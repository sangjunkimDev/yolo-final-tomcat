package com.yolo.dao.chat;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.yolo.dao.chat.inf.DutchDaoInf;

public class DutchDao implements DutchDaoInf{
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sessionTemplate;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
}
