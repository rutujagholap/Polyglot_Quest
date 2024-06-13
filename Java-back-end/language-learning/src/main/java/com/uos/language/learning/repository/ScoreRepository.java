package com.uos.language.learning.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.uos.language.learning.entity.Score;

@Repository
public interface ScoreRepository extends JpaRepository<Score, Integer> {

	@Query("Select s from Score s where s.userLanguage.user.userName = :userName and s.userLanguage.language.langName = :language order by s.highestScore desc")
	List<Score> findHighestScoreByEmailAndLanguage(String userName, String language);

	@Query("Select s from Score s where s.userLanguage.user.userName = :userName and s.userLanguage.language.langName = :language order by s.scoreId desc")
	List<Score> findLatestScoreByUserLangId(String userName, String language);

}
