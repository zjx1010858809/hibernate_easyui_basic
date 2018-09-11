package daoImpl;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;



public  class Basic_DaoImpl <T> extends HibernateDaoSupport  {
	 
	
	@Resource(name="sessionFactory")//为父类HibernateDaoSupport注入sessionFactory的值
	public void setSuperSessionFactory(SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}

	
	public static int pageSize=6;
	
	
	public String getType() {
		Class<T> clazz = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
		return clazz.getSimpleName();
	}
	public Class getTypeClass() {
		Class<T> clazz = (Class<T>) ((ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[0];
		return clazz;
	}
	
	public List<T> select(int page,String where, Object... values) {
		 String hql= "from "+getType()+where;
         Query query = getSessionFactory().openSession().createQuery(hql);
         
         for(int i=0;i<values.length;i++)
         query.setParameter(i, values[i]);
         if(page>0) {
         int begin = (page-1)*pageSize;
         query.setFirstResult(begin);
         query.setMaxResults(pageSize);
         }
         return query.list();
	}
	
	public List<T> select(String where, Object... values) {
		return select(0, where, values);
	}
	
	public List<T> select() {
		return select(0, "");
	}
	
	public void insert(T o) {
		Session s=getSessionFactory().openSession();
		s.beginTransaction();
		s.save(o);
		s.getTransaction().commit();
	}
	
	public void delete(T o) {
		Session s=getSessionFactory().openSession();
		s.beginTransaction();
		s.delete(o);
		s.getTransaction().commit();
	}
	
	public void update(T o) {
		Session s=getSessionFactory().openSession();
		s.beginTransaction();
		s.update(o);
		s.getTransaction().commit();
	}
	
	public T ById(int id) {
		return (T) getSessionFactory().openSession().load(getTypeClass(), id);
	}
	

}
