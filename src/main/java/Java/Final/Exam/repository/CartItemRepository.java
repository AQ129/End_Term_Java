package Java.Final.Exam.repository;

import java.util.List;

import Java.Final.Exam.model.CartItem;
import org.springframework.data.jpa.repository.JpaRepository;


public interface CartItemRepository extends JpaRepository<CartItem, Integer> {
	public List<CartItem> findByMemberId(int id);
	public CartItem findByMemberIdAndAccessoryId(int memberId, int accessoryId);
}
