package com.test.project01.users.Dto;

public class UsersDto {
	private String userId;
	private String userPass;
	private String PassQuiz;
	private String QuizAnswer;
	private String userName;
	private String userPhone;
	private String email;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private String regiDate;
	private String birthday;
	private int mileage;
	private int verify;
	private String newPass;
	
		
	public UsersDto() {}


	public UsersDto(String userId, String userPass, String passQuiz, String quizAnswer, String userName,
			String userPhone, String email, String userAddr1, String userAddr2, String userAddr3, String regiDate,
			String birthday, int mileage, int verify, String newPass) {
		super();
		this.userId = userId;
		this.userPass = userPass;
		this.PassQuiz = passQuiz;
		this.QuizAnswer = quizAnswer;
		this.userName = userName;
		this.userPhone = userPhone;
		this.email = email;
		this.userAddr1 = userAddr1;
		this.userAddr2 = userAddr2;
		this.userAddr3 = userAddr3;
		this.regiDate = regiDate;
		this.birthday = birthday;
		this.mileage = mileage;
		this.verify = verify;
		this.newPass = newPass;
	}

	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPass() {
		return userPass;
	}


	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}


	public String getPassQuiz() {
		return PassQuiz;
	}


	public void setPassQuiz(String passQuiz) {
		PassQuiz = passQuiz;
	}


	public String getQuizAnswer() {
		return QuizAnswer;
	}


	public void setQuizAnswer(String quizAnswer) {
		QuizAnswer = quizAnswer;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserPhone() {
		return userPhone;
	}


	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getUserAddr1() {
		return userAddr1;
	}


	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}


	public String getUserAddr2() {
		return userAddr2;
	}


	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}


	public String getUserAddr3() {
		return userAddr3;
	}


	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}


	public String getRegiDate() {
		return regiDate;
	}


	public void setRegiDate(String regiDate) {
		this.regiDate = regiDate;
	}


	public String getBirthday() {
		return birthday;
	}


	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}


	public int getMileage() {
		return mileage;
	}


	public void setMileage(int mileage) {
		this.mileage = mileage;
	}


	public int getVerify() {
		return verify;
	}


	public void setVerify(int verify) {
		this.verify = verify;
	}


	public String getNewPass() {
		return newPass;
	}


	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}
	
	
	
	
	
	
}
