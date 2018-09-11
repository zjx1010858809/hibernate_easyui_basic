package serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Type_Dao;
import entity.Type;
import service.Type_Service;

@Service
public class Type_ServiceImpl extends Basic_ServiceImpl<Type> implements Type_Service{
@Autowired
Type_Dao dao;
	
}
