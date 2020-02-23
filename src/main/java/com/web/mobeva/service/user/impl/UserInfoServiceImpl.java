package com.web.mobeva.service.user.impl;

import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.mobeva.dao.user.UserInfoDao;
import com.web.mobeva.model.user.UserInfoBean;
import com.web.mobeva.model.user.UserLoginBean;
import com.web.mobeva.model.user.UserQuizBean;
import com.web.mobeva.service.user.UserInfoService;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	UserInfoDao dao;

	@Autowired
	public void setDao(UserInfoDao dao) {
		this.dao = dao;
	}

//------------------------------小米哥開始------------------------	
	// ------------------------------------前台開始----------------------------------

	// 測試撈所有會員資料
	@Transactional
	@Override
	public List<UserInfoBean> getAllUser() {
		return dao.getAllUser();
	}

	// 查詢會員資料 by u_id
	@Transactional
	@Override
	public UserInfoBean getUser(int u_id) {
		return dao.getUser(u_id);
	}

	// 更新會員資料
	@Transactional
	@Override
	public int updateUserInfo(UserInfoBean userInfoBean) {
		int n = dao.updateUserInfo(userInfoBean);
		return n;
	}

	// openid 綁定帳號時，檢查帳號是否存在
	@Transactional
	@Override
	public boolean checkAccountExist(String u_account) {
		return dao.checkAccountExist(u_account);
	}

	// 新增安全問題(名字重複)
//	@Transactional
//	@Override
//	public void insertQuiz(UserQuizBean uqb) {
//		dao.insertQuiz(uqb);
//
//	}

	// ------------------------------------前台結束----------------------------------
//------------------------------小米哥結束------------------------	

//------------------------------小黑開始------------------------
	// ------------------------------------前台開始----------------------------------

	@Transactional
	@Override
	public void insertUserinfo(UserInfoBean userinfoBean) {
		dao.insertUserinfo(userinfoBean);
	}

	@Transactional
	@Override
	public UserInfoBean getUserInfoBeanbyaccpwd(String account, String password) {
		return dao.getUserInfoBeanbyaccpwd(account, password);
	}

	@Transactional
	@Override
	public UserInfoBean getUserInfoBeanbyaccount(String account) {
		return dao.getUserInfoBeanbyaccount(account);
	}

	@Transactional
	@Override
	public UserLoginBean getUserLoginBeanbyId(int ul_id) {
		return dao.getUserLoginBeanbyId(ul_id);
	}

	@Transactional
	@Override
	public void insertUserLoginBean(UserLoginBean userLoginBean) {
		dao.insertUserLoginBean(userLoginBean);
	}

	@Transactional
	@Override
	public long getUserLoginLastTimebyuId(int u_id) {
		long n = dao.getUserLoginLastTimebyuId(u_id);
		return n;
	}

	@Transactional
	@Override
	public void upadtetUserInfo(UserInfoBean userinfoBean) {
		dao.upadtetUserInfo(userinfoBean);
	}

	// 後台取出會員全部資料
	@Transactional
	@Override
	public List<UserInfoBean> getUserInfoBeans() {
		return dao.getUserInfoBeans();
	}

	// 後台取出會員單筆資料
	@Transactional
	@Override
	public UserInfoBean getUserInfoBeanById(int u_id) {
		return dao.getUserInfoBeanById(u_id);
	}

	// 後台更新會員資料
	@Transactional
	@Override
	public void updatebUserInfoBeanById(int u_id, String u_name, String u_email, String u_mobile, String u_address,
			String u_block, String u_modifieddate, int u_status) {
		dao.updatebUserInfoBeanById(u_id, u_name, u_email, u_mobile, u_address, u_block, u_modifieddate, u_status);
	}

	// 後台刪除會員資料(更新狀態為註銷)
	@Transactional
	@Override
	public void deletebUserInfoBeanById(int u_id, int u_status, String u_modifieddate) {
		dao.deletebUserInfoBeanById(u_id, u_status, u_modifieddate);
	}

	// 後台解鎖黑名單
	@Transactional
	@Override
	public void passbUserInfoblockById(int u_id, int u_block, String u_modifieddate) {
		dao.deletebUserInfoBeanById(u_id, u_block, u_modifieddate);
	}

	// 前台註冊新增安全問題
	@Transactional
	@Override
	public void insertQuiz(UserQuizBean userQuizBean) {
		dao.insertQuiz(userQuizBean);
	}

	// 前台忘記密碼導出安全問題
	@Transactional
	@Override
	public UserQuizBean getUserQuizBeanByUid(int u_id) {
		return dao.getUserQuizBeanByUid(u_id);
	}

//	寄密碼重置驗證信
	@Transactional
	@Override
	public void sendPwd(String name, String toemail, String mailsubject, String mailmessage, String password) {
		// <a href=''>重置密碼</a>
		String user = "eeit11034@gmail.com";// user
		String pwd = "Do!ng123";// password
		String to = toemail;
		String from = "eeit11034@gmail.com";// 寄件人的email
		/*
		 * host yahoo:"smtp.mail.yahoo.com" outlook:"smtp-mail.outlook.com"
		 */
		String host = "smtp.gmail.com";

		String subject = "密碼重置";
		String body = "你好，MOBEVA密碼已重置，重置密碼為:" + password + "\n" + "請回MOBEVA網頁重新輸入新密碼修改";

		// 建立一個Properties來設定Properties
		Properties properties = System.getProperties();
		// 設定傳輸協定為smtp
		properties.setProperty("mail.transport.protocol", "smtp");
		// 設定mail Server
		properties.setProperty("mail.smtp.host", host);
		properties.setProperty("mail.smtp.port", "465");

		properties.put("mail.smtp.auth", "true");// 需要驗證帳號密碼
		// SSL authentication
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.starttls.enable", "true");

		// 建立一個Session物件，並把properties傳進去
		Session mailSession = Session.getInstance(properties, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, pwd);
			}
		});

		try {
			// 建立一個 MimeMessage object.
			MimeMessage message = new MimeMessage(mailSession);
			// 設定郵件
			message.setFrom(new InternetAddress(from)); // 設定寄件人
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); // 設定收件人
			message.setSubject(subject); // 設定主旨

			// 宣告一個multipart , 它可以使內文有不同的段落，
			// 使其可以用用來夾帶內文及檔案
			Multipart multipart = new MimeMultipart();
			// 第一個段落
			BodyPart messageBodyPart = new MimeBodyPart(); // 宣告一個BodyPart用以夾帶內文
			messageBodyPart.setText(body);// 設定內文
			multipart.addBodyPart(messageBodyPart); // 把BodyPart加入Multipart
			// 第二個段落
//		            BodyPart fileBodyPart = new MimeBodyPart(); //宣告一個BodyPart用以夾帶附加檔案
//		            String filename = "要送的檔案路徑";  //要夾帶的檔案名稱  
//		            DataSource source = new FileDataSource(filename);//讀取檔案
//		            fileBodyPart.setDataHandler(new DataHandler(source));
//		            fileBodyPart.setFileName("要顯示的檔案名稱"); //設定附加檔案顯示的名稱
//		            multipart.addBodyPart(fileBodyPart);//把BodyPart加入Multipart（這個part夾帶檔案）

			message.setContent(multipart); // 設定eMultipart為messag的Content
			Transport transport = mailSession.getTransport("smtp");
			transport.connect(host, user, pwd);
			// 傳送信件
			transport.sendMessage(message, message.getAllRecipients());

			System.out.println("發送成功");
			// 關閉連線
			transport.close();

		} catch (MessagingException mex) {
			mex.printStackTrace();
		}

	}

	// 登入超過3次順便寄信異常登入
	@Transactional
	@Override
	public void sendloginerror(String name, String toemail, String mailsubject, String mailmessage, String ip) {
		// <a href=''>重置密碼</a>
		String user = "eeit11034@gmail.com";// user
		String pwd = "Do!ng123";// password
		String to = toemail;
		String from = "eeit11034@gmail.com";// 寄件人的email
		/*
		 * host yahoo:"smtp.mail.yahoo.com" outlook:"smtp-mail.outlook.com"
		 */
		String host = "smtp.gmail.com";

		String subject = "MOBEVA異常登入失敗";
		String body = "你好，此帳號嘗試登入MOBEVA超過3次失敗，IP為" + ip + "\n" + "請本人查驗，如非本人請與我們MOBEVA反映";

		// 建立一個Properties來設定Properties
		Properties properties = System.getProperties();
		// 設定傳輸協定為smtp
		properties.setProperty("mail.transport.protocol", "smtp");
		// 設定mail Server
		properties.setProperty("mail.smtp.host", host);
		properties.setProperty("mail.smtp.port", "465");

		properties.put("mail.smtp.auth", "true");// 需要驗證帳號密碼
		// SSL authentication
		properties.put("mail.smtp.ssl.enable", "true");
		properties.put("mail.smtp.starttls.enable", "true");

		// 建立一個Session物件，並把properties傳進去
		Session mailSession = Session.getInstance(properties, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, pwd);
			}
		});

		try {
			// 建立一個 MimeMessage object.
			MimeMessage message = new MimeMessage(mailSession);
			// 設定郵件
			message.setFrom(new InternetAddress(from)); // 設定寄件人
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); // 設定收件人
			message.setSubject(subject); // 設定主旨

			// 宣告一個multipart , 它可以使內文有不同的段落，
			// 使其可以用用來夾帶內文及檔案
			Multipart multipart = new MimeMultipart();
			// 第一個段落
			BodyPart messageBodyPart = new MimeBodyPart(); // 宣告一個BodyPart用以夾帶內文
			messageBodyPart.setText(body);// 設定內文
			multipart.addBodyPart(messageBodyPart); // 把BodyPart加入Multipart
			// 第二個段落
//		            BodyPart fileBodyPart = new MimeBodyPart(); //宣告一個BodyPart用以夾帶附加檔案
//		            String filename = "要送的檔案路徑";  //要夾帶的檔案名稱  
//		            DataSource source = new FileDataSource(filename);//讀取檔案
//		            fileBodyPart.setDataHandler(new DataHandler(source));
//		            fileBodyPart.setFileName("要顯示的檔案名稱"); //設定附加檔案顯示的名稱
//		            multipart.addBodyPart(fileBodyPart);//把BodyPart加入Multipart（這個part夾帶檔案）

			message.setContent(multipart); // 設定eMultipart為messag的Content
			Transport transport = mailSession.getTransport("smtp");
			transport.connect(host, user, pwd);
			// 傳送信件
			transport.sendMessage(message, message.getAllRecipients());

			System.out.println("發送成功");
			// 關閉連線
			transport.close();

		} catch (MessagingException mex) {
			mex.printStackTrace();
		}

	}
	// -----------------------------------

	// 後台取得所有會員登入資訊
	@Transactional
	@Override
	public List<UserLoginBean> getUserLoginDatas() {
		return dao.getUserLoginDatas();
	}

	// 後台模糊查詢時間登入資訊
	@Transactional
	@Override
	public List<UserLoginBean> getUserLoginDatasByDate(String startdate, String enddate, int ul_status) {
		return dao.getUserLoginDatasByDate(startdate, enddate, ul_status);
	}

	// 後台登入資訊模糊查詢依帳號日期
	@Transactional
	@Override
	public List<UserLoginBean> getUserLoginDatasByUidDate(int u_id, String startdate, String enddate, int ul_status) {
		return dao.getUserLoginDatasByUidDate(u_id, startdate, enddate, ul_status);
	}

	// 後台登入資訊模糊查詢依帳號
	@Transactional
	@Override
	public List<UserLoginBean> getUserLoginDatasByUid(int u_id) {
		return dao.getUserLoginDatasByUid(u_id);
	}

	// 後台登入資訊模糊查詢依Ip
	@Transactional
	@Override
	public List<UserLoginBean> getUserLoginDatasByIPDate(String ul_ip, String startdate, String enddate,
			int ul_status) {
		return dao.getUserLoginDatasByIPDate(ul_ip, startdate, enddate, ul_status);
	}

	// ------------------------------------前台結束----------------------------------
//------------------------------小黑結束------------------------	

//------------------------------仕杰開始------------------------
	// ------------------------------------前台開始----------------------------------

	@Transactional
	@Override
	public UserInfoBean saveOpenID(String u_openid, String u_name, String u_email) {
		UserInfoBean uib = dao.saveOpenID(u_openid, u_name, u_email);
		return uib;
	}

	// ------------------------------------前台結束----------------------------------
	
	
	
	
	
//------------------------------仕杰結束------------------------

}
