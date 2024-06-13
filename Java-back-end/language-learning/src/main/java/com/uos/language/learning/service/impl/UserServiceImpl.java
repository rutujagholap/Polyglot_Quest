package com.uos.language.learning.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uos.language.learning.entity.User;
import com.uos.language.learning.repository.UserRepository;
import com.uos.language.learning.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository userRepository;

	@Override
	public List<User> findAllUsers() {
		return userRepository.findAll();
	}

}
