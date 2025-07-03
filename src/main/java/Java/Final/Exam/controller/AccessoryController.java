package Java.Final.Exam.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Optional;

import Java.Final.Exam.repository.AccessoryService;
import Java.Final.Exam.repository.CategoryRepository;
import Java.Final.Exam.model.Accessory;
import Java.Final.Exam.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AccessoryController {

	@Autowired
	private Java.Final.Exam.repository.AccessoryRepository AccessoryRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;

	@Autowired
	private HttpServletRequest request;
	
	@GetMapping("/")
	public String view(@RequestParam(name = "page", defaultValue = "0") int page, Model model) {
		int pageSize = 8;
		Page<Accessory> productPage = AccessoryRepository.findAll(PageRequest.of(page, pageSize));
		model.addAttribute("listAccessory", productPage.getContent());
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", productPage.getTotalPages());
//		List<Accessory> accessory = AccessoryRepository.findAll();
//		model.addAttribute("listAccessory", accessory);
		return "home";
	}

	@GetMapping("/about")
	public String about(Model model){
		return "about";
	}

	@GetMapping("/filter")
	public String viewFilter(@RequestParam(name = "name", required = false) String name,
							 @RequestParam(name = "material", required = false) String material,
							 @RequestParam(name = "category", required = false) String category,
							 @RequestParam(name = "maxPrice", required = false) String maxPrice,
							 @RequestParam(name = "minPrice", required = false) String minPrice,
							 @RequestParam(name = "sortBy", required = false) String sortBy,
							 @RequestParam(name = "page", defaultValue = "0") int page,
							 Model model)

	{
		List<Accessory> accessory = AccessoryRepository.findAll();
		if(!name.equalsIgnoreCase("")){
			AccessoryService.filterByName(accessory,name);
		}
		if(!material.equalsIgnoreCase("")){
			AccessoryService.filterByMaterial(accessory,material);
		}
		if(!category.equalsIgnoreCase("")){
			AccessoryService.filterByCategory(accessory,category);
		}
		if(!maxPrice.equalsIgnoreCase("")){
			AccessoryService.filterByMaxPrice(accessory,maxPrice);
		}
		if(!minPrice.equalsIgnoreCase("")){
			AccessoryService.filterByMinPrice(accessory,minPrice);
		}
		if(!sortBy.equalsIgnoreCase("")){
			AccessoryService.sortBy(accessory ,sortBy);
		}
		int pageSize = 8;
		int totalProducts = accessory.size();
		int totalPages = (int) Math.ceil((double) totalProducts / pageSize);
		int startIndex = page * pageSize;
		int endIndex = Math.min(startIndex + pageSize, totalProducts);
		List<Accessory> currentPageProducts =accessory.subList(startIndex, endIndex);
		model.addAttribute("request", request);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("listAccessory", currentPageProducts);
		return "home";
	}

	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/403")
	public String error403() {
		return "403";
	}
	
	@GetMapping("/accessories")
	public String ga(Model model) {
		List<Accessory> accessory = AccessoryRepository.findAll();
		model.addAttribute("listAccessory", accessory);
		return "view_accessory";
	}
	
	@GetMapping("/accessories/add")
	public String addAccessory(Model model) {
		model.addAttribute("accessory", new Accessory());
		List<Category> categoryList = categoryRepository.findAll();
		model.addAttribute("categoryList", categoryList);
		return "add_accessory";
	}
	
	@PostMapping("/accessories/save")
	public String saveAccessory(Accessory accessory, @RequestParam("itemImage") MultipartFile imgFile, RedirectAttributes redirectAttribute){
		String imageName = imgFile.getOriginalFilename();
		accessory.setImgName(imageName);
		Accessory savedItem = AccessoryRepository.save(accessory);

		try {
			String uploadDir = "uploads/items/" + savedItem.getId();

			Path uploadPath = Paths.get(uploadDir);
			System.out.println("Directory Path:" + uploadPath);

			if (!Files.exists(uploadPath)) {
				Files.createDirectories(uploadPath);
			}
			Path fileToCreatePath= uploadPath.resolve(imageName);
			System.out.println("File path: " + fileToCreatePath);

			Files.copy(imgFile.getInputStream(), fileToCreatePath, StandardCopyOption.REPLACE_EXISTING);
			
		} catch (IOException io) {
			io.printStackTrace();
		}
		redirectAttribute.addFlashAttribute("success","Item added!");
		return "redirect:/accessories";
	}
	
	@GetMapping("/accessories/{id}")
	public String viewSingleItem(@PathVariable("id") Integer id, Model model) {
		Accessory accessory = AccessoryRepository.getById(id);
		model.addAttribute("accessory", accessory);
		return "view_single_accessory";
	}
	
	@GetMapping("/accessories/edit/{id}")
	public String editItem(@PathVariable("id") Integer id, Model model) {
		Accessory accessory = AccessoryRepository.getById(id);
		model.addAttribute("accessory", accessory);
		List<Category> categoryList = categoryRepository.findAll();
		model.addAttribute("categoryList", categoryList);
		return "edit_accessory";
	}
	
	@PostMapping("/accessories/edit/{id}")
	public String saveUpdatedItems(@PathVariable("id") Integer id, Accessory accessory, @RequestParam("itemImage") MultipartFile imgFile, RedirectAttributes redirectAttribute) {
		String imageName = imgFile.getOriginalFilename();
		Optional<Accessory> temp = AccessoryRepository.findById(id);
		if(!imageName.equals("")) {
			accessory.setImgName(imageName);
		}
		else{
			accessory.setImgName(temp.get().getImgName());
		}
			Accessory savedItem = AccessoryRepository.save(accessory);

			try {
				String uploadDir = "uploads/items/" + savedItem.getId();
				Path uploadPath = Paths.get(uploadDir);
				System.out.println("Directory path: " + uploadPath);

				if (!Files.exists(uploadPath)) {
					Files.createDirectories(uploadPath);
				}

				Path fileToCreatePath = uploadPath.resolve(imageName);
				System.out.println("File path: " + fileToCreatePath);

				Files.copy(imgFile.getInputStream(), fileToCreatePath, StandardCopyOption.REPLACE_EXISTING);

			} catch (Exception io) {
				io.printStackTrace();
			}
		redirectAttribute.addFlashAttribute("success","Item details changed!");
		return "redirect:/accessories";
	}
	
	@GetMapping("/accessories/delete/{id}")
	public String editCategory(@PathVariable("id") Integer id, RedirectAttributes redirectAttribute) {
		AccessoryRepository.deleteById(id);
		redirectAttribute.addFlashAttribute("success","Item deleted!");
		return "redirect:/accessories";
	}
}
