package com.vti.entity;
import java.time.LocalDate;
import java.util.Arrays;

public class account {

	private int account_id;
	private String email;
	private String user_name;
	private String full_name;
	private department Department;
	private position	position;
	private LocalDate create_date;
	private account[] group;

	public account(String user_name) {
		super();
		this.user_name = user_name;
	}
	public account() {
	
	}
	public account(int account_id, String email, String user_name, String firstname,
			String lastname) {
		super();
		this.account_id = account_id;
		this.email = email;
		this.user_name = user_name;
		this.full_name = firstname + lastname;
	}
	public account(int account_id, String email, String user_name, String full_name, String firstname, String lastname,
		position position, LocalDate create_date) {
		super();
		this.account_id = account_id;
		this.email = email;
		this.user_name = user_name;
		this.full_name = firstname + lastname;
		this.position = position;
		this.create_date = LocalDate.now();
	}
	public int getAccount_id() {
		return account_id;
	}
	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getFull_name() {
		return full_name;
	}
	public void setFull_name(String full_name) {
		this.full_name = full_name;
	}
	public department getDepartment() {
		return Department;
	}
	public void setDepartment(department department) {
		Department = department;
	}
	public position getPosition() {
		return position;
	}
	public void setPosition(position position) {
		this.position = position;
	}
	public LocalDate getCreate_date() {
		return create_date;
	}
	public void setCreate_date(LocalDate create_date) {
		this.create_date = create_date;
	}
	public account[] getGroup() {
		return group;
	}
	public void setGroup(account[] group) {
		this.group = group;
	}
	@Override
	public String toString() {
		return "account [account_id=" + account_id + ", email=" + email + ", user_name=" + user_name + ", full_name="
				+ full_name + ", Department=" + Department + ", position=" + position + ", create_date=" + create_date
				+ ", group=" + Arrays.toString(group) + "]";
	}
	
}

