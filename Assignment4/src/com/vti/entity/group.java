package com.vti.entity;
import java.time.LocalDate;
import java.util.Arrays;

public class group {
	
	int group_id;
	String group_name;
	account creator_id;
	LocalDate creater_date;
	account[] account;
	public group() {
		super();
	}
	public group(String group_name, account creator_id, com.vti.entity.account[] account) {
		super();
		this.group_name = group_name;
		this.creator_id = creator_id;
		this.account = account;
	}
	public group(String group_name, account creator_id, LocalDate creater_date,
			account[] account,String[] usernames) {
		super();
		this.group_name = group_name;
		this.creator_id = creator_id;
		this.creater_date = creater_date;
		this.account = account;
		account[] account1 = new account[usernames.length];
		for (int i = 0; i < usernames.length; i++) {
			account1[i] = new account(usernames[i]);
		}
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public account getCreator_id() {
		return creator_id;
	}
	public void setCreator_id(account creator_id) {
		this.creator_id = creator_id;
	}
	public LocalDate getCreater_date() {
		return creater_date;
	}
	public void setCreater_date(LocalDate creater_date) {
		this.creater_date = creater_date;
	}
	public account[] getAccount() {
		return account;
	}
	public void setAccount(account[] account) {
		this.account = account;
	}
	@Override
	public String toString() {
		return "group [group_id=" + group_id + ", group_name=" + group_name + ", creator_id=" + creator_id
				+ ", creater_date=" + creater_date + ", account=" + Arrays.toString(account) + "]";
	}

	
	
}
