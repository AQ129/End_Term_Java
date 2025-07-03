package Java.Final.Exam.repository;

import java.util.List;

import Java.Final.Exam.model.OrderItem;
import org.springframework.data.jpa.repository.JpaRepository;


public interface OrderItemRepository extends JpaRepository<OrderItem, Integer> {
	public List<OrderItem> findByMemberId(int id);
}
