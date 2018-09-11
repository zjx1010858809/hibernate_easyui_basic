package serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.Type_Dao;
import entity.Type_info;
import service.Type_info_Service;

@Service
public class Type_info_ServiceImpl extends Basic_ServiceImpl<Type_info> implements Type_info_Service{
@Autowired
Type_Dao dao;
	
}
