package com.vti.entity;

public class department {

	int department_id;
	String department_name;
	public department() {
	
	}
	public department( int department_id,String department_name) {
		this.department_name = department_name;
		this.department_id = 0;
		
	}
	public int getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	
	

}
