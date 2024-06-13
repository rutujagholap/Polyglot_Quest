package com.uos.language.learning.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.uos.language.learning.entity.Translation;

@Repository
public interface TranslationRepository extends JpaRepository<Translation, Integer> {
	
	@Query("Select t from Translation t where t.language.langName = :language")
	List<Translation> findTranslationWords(String language);

}
