package com.vti.entity;

public class student {
	private int id;
	private String name;
	private String hometown;
	private float point;
	
	public student() {
		super();
	}

	public student(int id, String name, String hometown, float point) {
		super();
		this.id = id;
		this.name = name;
		this.hometown = hometown;
		this.point = 0;
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

	public String getHometown() {
		return hometown;
	}

	public void setHometown(String hometown) {
		this.hometown = hometown;
	}

	public float getPoint() {
		return point;
	}

	public void setPoint(float point) {
		this.point = point;
		
	}
	public void setPoint1(float point) {
		this.point = this.point + point;
	}
	public String getPoint2() {
		String hanhkiem;
		if (point < 4.0) {
		hanhkiem = "Yếu";
		} else if (point < 6.0) {
			hanhkiem = "trung bình";
		} else if (point < 8.0) {
			hanhkiem = "khá";
		} else {
			hanhkiem = "giỏi";
		}
		return "student [id=" + id + ", name=" + name + ", hometown=" + hometown + ", point=" + point + ", xeploai = " + hanhkiem +"]" ;
				
	}

	@Override
	public String toString() {
		return "student [id=" + id + ", name=" + name + ", hometown=" + hometown + ", point=" + point + ",]";
	}
	
	
}
