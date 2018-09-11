package hibernate_test;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import entity.Type;
import service.Type_Service;

public class test1 extends BaseTest {

	@Autowired
	SessionFactory f;

	@Test
	public void t1() {
		 String hql= "from Type where name=?";
         Query query = f.openSession().createQuery(hql);
         Object[] values= {"werge"};
         
         for(int i=0;i<values.length;i++)
             query.setParameter(i, values[i]);
             
             
         List list= query.list();
		System.out.println(list.size());
		  
	}

}
