package com.uos.language.learning.service.impl;

import static com.uos.language.learning.constant.Constant.USER_ALREADY_EXISTS;
import static com.uos.language.learning.constant.Constant.USER_CREATED;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uos.language.learning.entity.Language;
import com.uos.language.learning.entity.User;
import com.uos.language.learning.entity.UserLanguage;
import com.uos.language.learning.model.UserRegisterationBean;
import com.uos.language.learning.repository.LanguageRepository;
import com.uos.language.learning.repository.UserLanguageRepository;
import com.uos.language.learning.repository.UserRepository;
import com.uos.language.learning.service.UserRegistrationService;;

@Service
public class UserRegistrationServiceImpl implements UserRegistrationService {

	@Autowired
	private LanguageRepository languageRepository;

	@Autowired
	private UserRepository userRepository;

	@Autowired
	private UserLanguageRepository userLanguageRepository;

	@Override
	public List<String> findAllLanguages() {
		return languageRepository.findAll().stream().map(language -> language.getLangName())
				.collect(Collectors.toList());
	}

	@Override
	public String registerUser(UserRegisterationBean userRegisterationBean) {
		UserLanguage userLanguage = new UserLanguage();

		User user = userRepository.findByEmail(userRegisterationBean.getEmail());
		Language language = languageRepository.findByLanguageName(userRegisterationBean.getLanguage());

		if (Objects.isNull(user)) {
			User newUser = new User();
			newUser.setUserName(userRegisterationBean.getUserName());
			newUser.setEmail(userRegisterationBean.getEmail());
			userLanguage.setUser(newUser);
			userLanguage.setLanguage(language);
			userRepository.save(newUser);
			userLanguageRepository.save(userLanguage);
			return USER_CREATED;
		}
		return USER_ALREADY_EXISTS;
	}
}
