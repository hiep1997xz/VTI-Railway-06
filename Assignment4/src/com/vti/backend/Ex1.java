package com.vti.backend;

import java.time.LocalDate;

import com.vti.entity.account;
import com.vti.entity.department;
import com.vti.entity.group;
import com.vti.entity.position;

public class Ex1 {
	public void Qs1() {
		department Department = new department(1, "Sale");
		System.out.println(Department.getDepartment_id());
		System.out.println(Department.getDepartment_name());

}
	public void Qs2() {
		account account = new account();
		System.out.println(account);
		
		account account1 = new account(1, "vti@gmail.com", "vti", "vti1", "vti12");
		System.out.println(account1);
		
		position position1 = new position(1, "Dev" );

		account account2 = new account(2, "vti1@gmail.com", "hip", "ha tien hiep", "ha", "tien",position1, null);
		System.out.println(account2);
		
	}
		public void Qs3() {
			group group1 = new group();
			System.out.println(group1);
			
			account account1 = new account(1, "vti@gmail.com", "vti", "vti1", "vti12");
			account account2 = new account(2, "vti1@gmail.com", "vti2", "vti", "vti12");
			account account3 = new account(3, "vti1@gmail.com", "vti3", "vti1", "vti12");
			
			account[] abc = {account1,account2,account3};
			
			group group2 = new group("con duy", null , abc);
			System.out.println(group2);
			
			String[] duml = {
					"binh", "liem", "hiep"
			};
			group group3 = new group("con duy du", null , null , abc, duml);
			System.out.println(group3);
		}
			
}
 