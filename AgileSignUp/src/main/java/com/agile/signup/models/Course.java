package com.agile.signup.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="courses")
public class Course {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="courseid")
	private int courseID;
	
	@Column(name="coursedate")
	private String courseDate;
	
	@Column(name="numberattendees")
	private int numberAttendees;
	
	@Column(name="isavailable")
	private boolean isAvailable;
	
	public Course() {
		super();
	}
	
	public Course(String courseDate) {
		super();
		this.courseDate = courseDate;
		this.numberAttendees = 0;
		this.isAvailable = true;
	}
	
	public Course(int courseID, String courseDate) {
		super();
		this.courseID = courseID;
		this.courseDate = courseDate;
		this.numberAttendees = 0;
		this.isAvailable = true;
	}

	@Override
	public String toString() {
		return "Course [courseID=" + courseID + ", courseDate=" + courseDate + ", numberAttendees=" + numberAttendees
				+", isAvailable=" + isAvailable + "]";
	}
	
	public int getCourseID() {
		return courseID;
	}
	
	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
	
	public String getCourseDate() {
		return courseDate;
	}
	
	public void setCourseDate(String courseDate) {
		this.courseDate = courseDate;
	}
	
	public int getNumberAttendees() {
		return numberAttendees;
	}

	public void setNumberAttendees(int numberAttendees) {
		this.numberAttendees = numberAttendees;
	}

	public boolean isAvailable() {
		return isAvailable;
	}
	
	public boolean getIsAvailable() {
		return isAvailable;
	}

	public void setAvailable(boolean isAvailable) {
		this.isAvailable = isAvailable;
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
