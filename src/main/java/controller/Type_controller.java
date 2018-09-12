package controller;

import java.util.List;

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
@RequestMapping("Type")
public class Type_controller extends Basic_Controller<Type>{
	@Autowired
	Type_Service service;
	@Autowired
	Type_info_Service tservice;
	

	@Override
	public List<Type> index_json(SearchInfo info, ModelMap m, HttpServletRequest req) throws Exception {
		System.out.println(info.getPage());
		System.out.println(req.getParameter("rows"));
		String txt=req.getParameter("txt");
		if(txt!=null&&txt.length()>0) {
			info.setObjs(" where name like '%"+txt+"%'");
		}
		return super.index_json(info, m, req);
	}
	
	@Override
	public String add(ModelMap m, HttpServletRequest req) throws Exception {
		m.put("sublist", tservice.select());
		return super.add(m, req);
	}
	@Override
	public String edit(int id, ModelMap m, HttpServletRequest req) throws Exception {
		add(m, req);
		return super.edit(id, m, req);
	}
}
