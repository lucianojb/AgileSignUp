package com.agile.signup.models;

import java.util.Date;

public class Course {
	private int courseID;
	private Date courseDate;
	
	
	public Course() {
		super();
	}
	
	public Course(Date courseDate) {
		super();
		this.courseDate = courseDate;
	}
	
	public Course(int courseID, Date courseDate) {
		super();
		this.courseID = courseID;
		this.courseDate = courseDate;
	}

	@Override
	public String toString() {
		return "Course [courseID=" + courseID + ", courseDate=" + courseDate + "]";
	}
	
	public int getCourseID() {
		return courseID;
	}
	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
	public Date getCourseDate() {
		return courseDate;
	}
	public void setCourseDate(Date courseDate) {
		this.courseDate = courseDate;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((courseDate == null) ? 0 : courseDate.hashCode());
		return result;
	}
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Course other = (Course) obj;
		if (courseDate == null) {
			if (other.courseDate != null)
				return false;
		} else if (!courseDate.equals(other.courseDate))
			return false;
		return true;
	}
	
	
	
}
