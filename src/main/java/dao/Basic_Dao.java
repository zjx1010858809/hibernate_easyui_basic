package dao;

import java.util.List;


public interface Basic_Dao<T> {
	
	public List<T> select(int page,String where, Object... values);
	
	public List<T> select(String where, Object... values);
	
	public List<T> select();
	
	public void insert(T o) ;
	
	public void delete(T o) ;
	
	public void update(T o) ;
	
	public T ById(int id) ;
}
