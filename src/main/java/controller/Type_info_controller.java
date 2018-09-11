package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import entity.Type;
import service.Type_Service;
import service.Type_info_Service;
import utils.SearchInfo;

@Controller
@RequestMapping("Type_info")
public class Type_info_controller extends Basic_Controller<Type>{
	@Autowired
	Type_info_Service service;
	

}
