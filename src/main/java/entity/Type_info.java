package entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="type_info")
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
public class Type_info implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)  
	private int id;
	
	private String name;
	
	
	private int parentid;
	
	
public Type_info() {
	// TODO Auto-generated constructor stub
}


	public Type_info(int id, String name, int parentid) {
	super();
	this.id = id;
	this.name = name;
	this.parentid = parentid;
}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getParentid() {
		return parentid;
	}

	public void setParentid(int parentid) {
		this.parentid = parentid;
	}

}
