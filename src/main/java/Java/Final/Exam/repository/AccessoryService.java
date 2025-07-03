package Java.Final.Exam.repository;

import Java.Final.Exam.model.Accessory;

import java.util.Comparator;
import java.util.List;
import static java.lang.Double.parseDouble;

public class AccessoryService {
    public static void sortBy(List<Accessory> products, String sortBy){
        if(sortBy.equalsIgnoreCase("Desc")){
            products.sort(Comparator.comparing(Accessory::getSold).reversed());
        }
        else{
            products.sort(Comparator.comparing(Accessory::getSold));
        }
    }

    public static void filterByCategory(List<Accessory> products, String category) {
        for(int i = 0; i<products.size();i++){
            if(products.get(i).getCategory().getId() != Integer.parseInt(category)){
                products.remove(i);
                i--;
            }
        }
    }

    public static void filterByName(List<Accessory> products, String name){
        for(int i = 0; i<products.size();i++){
            if(!products.get(i).getName().toLowerCase().contains(name.toLowerCase())){
                products.remove(i);
                i--;
            }
        }
    }

    public static void filterByMaterial(List<Accessory> products, String material){
        for(int i = 0; i<products.size();i++){
            if(!products.get(i).getMaterial().toLowerCase().contains(material.toLowerCase())){
                products.remove(i);
                i--;
            }
        }
    }

    public static void filterByMaxPrice(List<Accessory> products, String maxPrice){
        for(int i = 0; i<products.size();i++){
            if(products.get(i).getPrice()>parseDouble(maxPrice)){
                products.remove(i);
                i--;
            }
        }
    }

    public static void filterByMinPrice(List<Accessory> products, String minPrice){
        for(int i = 0; i<products.size();i++){
            if(products.get(i).getPrice()<parseDouble(minPrice)){
                products.remove(i);
                i--;
            }
        }
    }
}
