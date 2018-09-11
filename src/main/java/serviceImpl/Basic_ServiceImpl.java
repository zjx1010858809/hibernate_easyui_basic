package serviceImpl;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import dao.Basic_Dao;
import service.Basic_Service;


public class Basic_ServiceImpl<T> {
	@Autowired
	Basic_Dao<T> dao1;
	private void initDao() throws Exception {
		if(dao1!=null)return;
		Field mapperf = this.getClass().getDeclaredField("dao");
		mapperf.setAccessible(true);
		dao1 = (Basic_Dao<T>) mapperf.get(this);
	}
	

	public List<T> select(int page, String where, Object... values) {
		return dao1.select(page,where,values);
	}

	public List<T> select(String where, Object... values) {
		return dao1.select(where,values);
	}

	public List<T> select() {
		return dao1.select();
	}

	public void insert(T o) {
		dao1.insert(o);
	}

	public void delete(T o) {
		dao1.delete(o);
	}

	public void update(T o) {
		dao1.update(o);
	}

	public T ById(int id) {
		return dao1.ById(id);
	}

}
