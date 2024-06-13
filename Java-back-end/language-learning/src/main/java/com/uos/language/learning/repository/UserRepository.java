package com.uos.language.learning.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.uos.language.learning.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	
	@Query("Select u from User u where u.email = :email")
	User findByEmail(String email);

}
