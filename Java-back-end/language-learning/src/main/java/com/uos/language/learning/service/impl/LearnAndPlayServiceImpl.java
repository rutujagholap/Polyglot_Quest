package com.uos.language.learning.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uos.language.learning.entity.Translation;
import com.uos.language.learning.model.LearnResponseBean;
import com.uos.language.learning.model.PlayResponseBean;
import com.uos.language.learning.repository.TranslationRepository;
import com.uos.language.learning.service.LearnAndPlayService;

@Service
public class LearnAndPlayServiceImpl implements LearnAndPlayService {

	@Autowired
	private TranslationRepository translationRepository;

	@Override
	public List<LearnResponseBean> learnNewLanguage(String language) {
		List<LearnResponseBean> learnResponseBeans = new ArrayList<>();
		List<Translation> translations = translationRepository.findTranslationWords(language);
		translations.forEach(translation -> {
			LearnResponseBean learnResponseBean = new LearnResponseBean();
			learnResponseBean.setEnglishWord(translation.getWord().getWordName());
			learnResponseBean.setTranslatedWord(translation.getTranslationWord());
			learnResponseBeans.add(learnResponseBean);
		});
		return learnResponseBeans;
	}

	@Override
	public List<PlayResponseBean> playGame(String language) {
		List<PlayResponseBean> playResponseBeans = new ArrayList<>();
		List<Translation> translations = translationRepository.findAll();
		List<String> wordNames = translations.stream().map(translation -> translation.getWord().getWordName())
				.distinct().collect(Collectors.toList());
		wordNames.forEach(wordName -> {
			PlayResponseBean playResponseBean = new PlayResponseBean();
			List<String> allLangWords = new ArrayList<>();
			playResponseBean.setEnglishWord(wordName);
			allLangWords = translations.stream()
					.filter(translation -> translation.getWord().getWordName().equals(wordName))
					.collect(Collectors.toList()).stream().map(translation -> translation.getTranslationWord())
					.collect(Collectors.toList());
			Optional<Translation> correctAnswerOptional = translations.stream()
					.filter(translation -> (translation.getWord().getWordName().equals(wordName)
							&& translation.getLanguage().getLangName().equals(language)))
					.findFirst();
			playResponseBean.setAllLangTranslationWords(allLangWords);
			playResponseBean.setCorrectAnswer(
					correctAnswerOptional.isPresent() ? correctAnswerOptional.get().getTranslationWord() : null);
			playResponseBeans.add(playResponseBean);
		});
		return playResponseBeans;
	}

}
