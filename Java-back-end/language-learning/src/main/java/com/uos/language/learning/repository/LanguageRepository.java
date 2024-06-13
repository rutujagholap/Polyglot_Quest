package com.uos.language.learning.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.uos.language.learning.entity.Language;

@Repository
public interface LanguageRepository extends JpaRepository<Language, Integer> {
	
	@Query("Select l from Language l where l.langName = :language")
	Language findByLanguageName(String language);

}
