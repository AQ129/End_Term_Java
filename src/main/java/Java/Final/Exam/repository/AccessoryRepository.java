package Java.Final.Exam.repository;

import java.util.List;

import Java.Final.Exam.model.Accessory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface AccessoryRepository extends JpaRepository<Accessory, Integer>{

	@Query("SELECT a.name, a.sold FROM Accessory a")
    List<Object[]> findAccessorySoldCounts();
}
