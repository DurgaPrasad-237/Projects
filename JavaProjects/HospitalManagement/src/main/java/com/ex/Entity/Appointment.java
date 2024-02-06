package com.ex.Entity;

public class Appointment {
	private int id;
	private String fullname;
	private String gender;
	private int age;
	private String appointmentdate;
	private String email;
	private String phoneno;
	private String disease;
	private int userID;
	private int doctorID;

	private String address;
	private String status;
	/**
	 * @param id
	 * @param fullname
	 * @param gender
	 * @param age
	 * @param appointmentdate
	 * @param email
	 * @param phoneno
	 * @param disease
	 * @param userID
	 * @param doctorID
	 * @param address
	 * @param status
	 */
	public Appointment(int id, String fullname, String gender, int age, String appointmentdate, String email,
			String phoneno, String disease, int userID, int doctorID, String address, String status) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.gender = gender;
		this.age = age;
		this.appointmentdate = appointmentdate;
		this.email = email;
		this.phoneno = phoneno;
		this.disease = disease;
		this.userID = userID;
		this.doctorID = doctorID;
		this.address = address;
		this.status = status;
	}
	
	public Appointment(String fullname, String gender, int age, String appointmentdate, String email, String phoneno,
			String disease, int userID, int doctorID, String address, String status) {
		super();
		this.fullname = fullname;
		this.gender = gender;
		this.age = age;
		this.appointmentdate = appointmentdate;
		this.email = email;
		this.phoneno = phoneno;
		this.disease = disease;
		this.userID = userID;
		this.doctorID = doctorID;
		this.address = address;
		this.status = status;
	}
	/**
	 * 
	 */
	public Appointment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAppointmentdate() {
		return appointmentdate;
	}
	public void setAppointmentdate(String appointmentdate) {
		this.appointmentdate = appointmentdate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public String getDisease() {
		return disease;
	}
	public void setDisease(String disease) {
		this.disease = disease;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getDoctorID() {
		return doctorID;
	}
	public void setDoctorID(int doctorID) {
		this.doctorID = doctorID;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	
	
	
}