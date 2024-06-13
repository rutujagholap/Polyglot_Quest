package com.uos.language.learning.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.uos.language.learning.entity.Word;

@Repository
public interface WordRepository extends JpaRepository<Word, Integer>{

}
