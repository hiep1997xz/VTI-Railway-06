package com.vti.entity;

public class circle {
	private double radius;
	private String color;
	private final double PI = 3.14;
	public circle() {
		super();
	}

	public circle(double radius) {
		super();
		this.radius = radius;
	}

	public circle(double radius, String color) {
		super();
		this.radius = radius;
		this.color = color;
	}

	public double getRadius() {
		return radius;
	}

	public void setRadius(double radius) {
		this.radius = radius;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
	public double getArea() {
		return PI * Math.pow(radius, 2.0);
	}

	@Override
	public String toString() {
		return "circle [radius=" + radius + ", color=" + color + ", PI=" + PI + "]";
	}
	
}
