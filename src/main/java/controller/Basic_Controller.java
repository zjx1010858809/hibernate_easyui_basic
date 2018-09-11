package controller;

import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import service.Basic_Service;
import utils.JsonInfo;
import utils.SearchInfo;

public class Basic_Controller<T> {
	
	Basic_Service<T> ss;
	@ModelAttribute
	public void initService() throws Exception {
		if(ss!=null)return;
		Field mapperf = this.getClass().getDeclaredField("service");
		mapperf.setAccessible(true);
		ss = (Basic_Service) mapperf.get(this);
	}
	public Class getTempalteType() {
		Class<T> clazz = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
		return Object.class;
	}
	public String getName() {
		Class<T> clazz = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
		return clazz.getSimpleName();
	}
	@ExceptionHandler
	public void ex(Exception e) {
		e.printStackTrace();
	}

	@RequestMapping("index")
	public void index(SearchInfo info, ModelMap m, HttpServletRequest req) throws Exception {
		if(info.getPage()==-1&&info.getWhere().length()==0) m.put("list",ss.select());
		else if(info.getPage()==-1)m.put("list",ss.select(info.getWhere(),info.getObjs()));
		else m.put("list",ss.select(info.getPage(),info.getWhere(),info.getObjs()));
	}
	
	@RequestMapping("delete")
	public String delete(int id, ModelMap m, HttpServletRequest req) throws Exception {
		ss.delete(ss.ById(id));
		return "redirect:index";
	}
	
	@RequestMapping("update")
	public String update(T o, ModelMap m, HttpServletRequest req) throws Exception {
		ss.update(o);
		return "redirect:index";
	}
	
	@RequestMapping("insert")
	public String insert(T o, ModelMap m, HttpServletRequest req) throws Exception {
		ss.insert(o);
		
		return "redirect:index";
	}
	
	@RequestMapping("add")
	public String add( ModelMap m, HttpServletRequest req) throws Exception {
		return getName()+"/edit";	
	}
	
	@RequestMapping("edit")
	public String edit(int id, ModelMap m, HttpServletRequest req) throws Exception {
		m.put("info", ss.ById(id));
		return add(m, req);
	}
	
	
	
	
	
	@RequestMapping("index_json")
	public @ResponseBody List<T> index_json(SearchInfo info, ModelMap m, HttpServletRequest req) throws Exception {
		
		if(info.getPage()==-1&&info.getWhere().length()==0) return  (List<T>) ss.select();
		else if(info.getPage()==-1)return  (List<T>) ss.select(info.getWhere(),info.getObjs());
		else return  (List<T>) ss.select(info.getPage(),info.getWhere(),info.getObjs());
	}
	@RequestMapping("delete_json")
	public @ResponseBody JsonInfo delete_json(T t, ModelMap m, HttpServletRequest req) throws Exception {
		ss.delete(t);
		return new JsonInfo(1, "");
	}
	@RequestMapping("insert_json")
	public @ResponseBody JsonInfo insert_json(T o, ModelMap m, HttpServletRequest req) throws Exception {
		ss.insert(o);
		return new JsonInfo(1, "");
	}
	@RequestMapping("update_json")
	public @ResponseBody JsonInfo update_json(T o, ModelMap m, HttpServletRequest req) throws Exception {
		ss.update(o);
		return new JsonInfo(1, "");
	}
	@RequestMapping("edit_json")
	public @ResponseBody T edit_json(int id, ModelMap m, HttpServletRequest req) throws Exception {
		return   (T) ss.ById(id);
	}
}
