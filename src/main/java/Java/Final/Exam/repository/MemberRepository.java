package Java.Final.Exam.repository;

import Java.Final.Exam.model.Member;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MemberRepository extends JpaRepository<Member, Integer> {
	
	public Member findByUsername(String username);
	
}