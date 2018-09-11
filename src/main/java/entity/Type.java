package entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.LazyToOne;
import org.hibernate.annotations.LazyToOneOption;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
@Table(name="type")
@JsonIgnoreProperties(value = { "hibernateLazyInitializer", "handler" })
public class Type implements Serializable{
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)  
	private int id;
	
	@Column(name="name")
	private String name;
	
	
	private int parentid;
	
	  @JoinColumn(name = "parentid", insertable = false, updatable = false,nullable=true)
      @ManyToOne
	private Type_info info;
	
	
	
	
public Type_info getInfo() {
		return info;
	}


	public void setInfo(Type_info info) {
		this.info = info;
	}


public Type() {
	// TODO Auto-generated constructor stub
}


	public Type(int id, String name, int parentid) {
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
