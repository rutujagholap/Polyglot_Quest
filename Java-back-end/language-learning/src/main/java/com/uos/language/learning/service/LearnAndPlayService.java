package com.uos.language.learning.service;

import java.util.List;

import com.uos.language.learning.model.LearnResponseBean;
import com.uos.language.learning.model.PlayResponseBean;

public interface LearnAndPlayService {
	
	List<LearnResponseBean> learnNewLanguage(String language);
	
	List<PlayResponseBean> playGame(String language);

}
