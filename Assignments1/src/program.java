import java.time.LocalDate;

public class program {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
// create department
		department Department1 = new department();
		Department1.department_id = 1;
		Department1.department_name = "sale";
		
		System.out.println("information of department 1");
		System.out.println("id: " + Department1.department_id);
		System.out.println("name: " + Department1.department_name);
		
		department Department2 = new department();
		Department2.department_id = 2;
		Department2.department_name = "CEO";
		
		System.out.println("information of department 2");
		System.out.println("id: " + Department2.department_id);
		System.out.println("name: " + Department2.department_name);
		
		department Department3 = new department();
		Department3.department_id = 3;
		Department3.department_name = "THU KI";
		
		System.out.println("information of department 3");
		System.out.println("id: " + Department3.department_id);
		System.out.println("name: " + Department3.department_name);
		
// create position
		position Position1 = new position();
		Position1.position_id = 1;
		Position1.position_name = "Dev";
		
		System.out.println("information of position 1");
		System.out.println("id: " + Position1.position_id);
		System.out.println("name: " + Position1.position_name);
		
		position Position2 = new position();
		Position2.position_id = 2;
		Position2.position_name = "Test";
		
		System.out.println("information of position 2");
		System.out.println("id: " + Position2.position_id);
		System.out.println("name: " + Position2.position_name);
		
		position Position3 = new position();
		Position3.position_id = 3;
		Position3.position_name = "Scrum_Master";
		
		System.out.println("information of position 3");
		System.out.println("id: " + Position3.position_id);
		System.out.println("name: " + Position3.position_name);
		
		position Position4 = new position();
		Position4.position_id = 4;
		Position4.position_name = "PM";
		
		System.out.println("information of position4");
		System.out.println("id: " + Position4.position_id);
		System.out.println("name: " + Position4.position_name);

// create account
		account Account1 = new account();
		Account1.account_id = 1;
		Account1.email = "vti1@gmail.com";
		Account1.user_name = "vti1";
		Account1.full_name = "Le Van Bien";
		Account1.create_date = LocalDate.of(2020, 6, 20);
		
		account Account2 = new account();
		Account2.account_id = 2;
		Account2.email = "vti2@gmail.com";
		Account2.user_name = "vti2";
		Account2.full_name = "Ha Tien Hiep";
		Account2.create_date = LocalDate.of(2020, 6, 22);
		
		account Account3 = new account();
		Account3.account_id = 3;
		Account3.email = "vti3@gmail.com";
		Account3.user_name = "vti3";
		Account3.full_name = "Tran Van Binh";
		Account3.create_date = LocalDate.of(2020, 6, 23);
		
//		group group1;
//		group group2;
//		group group3;
//		group[] groupsOfAccount1 = {group1, group2};
//		Account1.group = groupsOfAccount1;
//		
//		group[] groupsOfAccount2 = {group2, group3};
//		Account2.group = groupsOfAccount2;
//		
//		group[] groupsOfAccount3 = {group1, group3};
//		Account3.group = groupsOfAccount3;
//		
//		account[] accountsOfGroup1 = {Account1, Account3};
//		group1.account = accountsOfGroup1;
//		
//		account[] accountsOfGroup2 = {Account1, Account2};
//		group2.account = accountsOfGroup2;
//		
//		account[] accountsOfGroup3 = {Account2, Account3};
//		group3.account = accountsOfGroup3;
		
		System.out.println("information of Account1");
		System.out.println("id: " + Account1.account_id);
		System.out.println("email: " + Account1.email);
		System.out.println("username: " + Account1.user_name);
		System.out.println("fullname: " + Account1.full_name);
		System.out.println("createdate: " + Account1.create_date);
//		System.out.println("Positionname: " + Account1.position.position_name);
//		System.out.println("Departmentname: " + Account1.Department.Department_name);
		System.out.println("\n");
		

	}

}
