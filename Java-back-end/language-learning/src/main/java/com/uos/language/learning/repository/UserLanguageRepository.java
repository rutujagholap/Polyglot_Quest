package com.uos.language.learning.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.uos.language.learning.entity.UserLanguage;

@Repository
public interface UserLanguageRepository extends JpaRepository<UserLanguage, Integer> {
	
	@Query("Select ul from UserLanguage ul where ul.user.userName = :userName and ul.language.langName = :language")
	Optional<UserLanguage> findByUserNameAndLanguage(String userName, String language);

}
