package com.agile.signup.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.springframework.beans.factory.annotation.Required;

@Entity
@Table(name="users")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="userid")
	private int userID;
	
	@Column(name="firstname")
	@Size(min=1, message="First name cannot be empty")
	private String firstName;
	
	@Column(name="lastname")
	@Size(min=1, message="Last name cannot be empty")
	private String lastName;
	
	@Column(name="email")
	@Size(min=1, message="Email cannot be empty")
	@Email(message="Not a valid email address")
	private String email;
	
	@Column(name="federal")
	private boolean federal;
	
	@Column(name="division")
	private Division division;
	
	@Column(name="courseid")
	private Integer courseID;
	
	@Column(name="preferredcourse")
	private Integer preferredCourseID;

	
	public User(){
		super();
		this.courseID = null;
	}
	
	public User(String firstName, String lastName, String email, boolean federal, Division division) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.federal = federal;
		this.division = division;
		this.courseID = null;
		this.preferredCourseID = null;
	}
	
	public User(int userID, String firstName, String lastName, String email, boolean federal, Division division) {
		super();
		this.userID = userID;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.federal = federal;
		this.division = division;
		this.courseID = null;
		this.preferredCourseID = null;
	}
	
	@Override
	public String toString() {
		return "User [firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", federal=" + federal
				+ ", division=" + division + ", courseID=" + courseID + "]";
	}
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isFederal() {
		return federal;
	}
	public void setFederal(boolean federal) {
		this.federal = federal;
	}
	public Division getDivision() {
		return division;
	}
	public void setDivision(Division division) {
		this.division = division;
	}
	
	public Integer getCourseID() {
		return courseID;
	}

	public void setCourseID(Integer courseID) {
		this.courseID = courseID;
	}
	
	public Integer getPreferredCourseID() {
		return preferredCourseID;
	}

	public void setPreferredCourseID(Integer preferredCourseID) {
		this.preferredCourseID = preferredCourseID;
	}
	
	public int getUserID() {
		return userID;
	}
	
	public void setUserID(int userID){
		this.userID = userID;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((division == null) ? 0 : division.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + (federal ? 1231 : 1237);
		result = prime * result + ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result + ((lastName == null) ? 0 : lastName.hashCode());
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
		User other = (User) obj;
		if (division != other.division)
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (federal != other.federal)
			return false;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		return true;
	}
}
