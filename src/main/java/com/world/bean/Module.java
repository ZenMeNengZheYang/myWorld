package com.world.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Module {
	
	@Id
	@GeneratedValue
	private int id;
	private String name;
	private String moduleUrl;
	private int moduleClass;
	private int rank;
	private int higherUp;
	
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
	public String getModuleUrl() {
		return moduleUrl;
	}
	public void setModuleUrl(String moduleUrl) {
		this.moduleUrl = moduleUrl;
	}
	public int getModuleClass() {
		return moduleClass;
	}
	public void setModuleClass(int moduleClass) {
		this.moduleClass = moduleClass;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getHigherUp() {
		return higherUp;
	}
	public void setHigherUp(int higherUp) {
		this.higherUp = higherUp;
	}
	
}
