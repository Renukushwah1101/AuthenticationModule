package org.renu.hibernate.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "user")
@Table(name = "user")
public class Files {

	@Id
	@Column(name = "id")
	int id;
	@Column(name = "mobile_no")
	String mobile_no;
	@Column(name = "email")
	String email;
	@Column(name = "password")
	String password;
	@Column(name = "name")
	String name;

	public Files(String mobile_no, String email, String password, String name) {

		this.mobile_no = mobile_no;
		this.email = email;
		this.password = password;
		this.name = name;
	}

	@Override
	public String toString() {
		return "Files [id=" + id + ", mobile_no=" + mobile_no + ", email=" + email + ", password=" + password
				+ ", name=" + name + "]";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMobile_no() {
		return mobile_no;
	}

	public Files() {
		super();
	}

	public void setMobile_no(String mobile_no) {
		this.mobile_no = mobile_no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
