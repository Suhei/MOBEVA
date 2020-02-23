package com.web.mobeva.service.auth.impl;

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

import com.web.mobeva.dao.auth.AuthinfoDao;
import com.web.mobeva.model.auth.AuthLoginBean;
import com.web.mobeva.model.auth.AuthinfoBean;
import com.web.mobeva.service.auth.AuthinfoService;



@Service
public class AuthinfoServiceImpl implements AuthinfoService {

	AuthinfoDao dao;
	
	@Autowired
	public void setDao(AuthinfoDao dao) {
		this.dao = dao;
	}

	@Transactional
	@Override
	public AuthinfoBean getAuthinfoBeanByaccpwd(String a_account, String a_password) {
		return dao.getAuthinfoBeanByaccpwd(a_account, a_password);
	}

	@Transactional
	@Override
	public void insertAuthLoginBean(AuthLoginBean authLoginBean) {
		dao.insertAuthLoginBean(authLoginBean);
	}
	@Transactional
	@Override
	public AuthLoginBean getAuthLoginBeanbyId(int al_id) {
		return dao.getAuthLoginBeanbyId(al_id);
	}

	@Transactional
	@Override
	public AuthinfoBean getAuthinfoBeanbyaccount(String account) {
		return dao.getAuthinfoBeanbyaccount(account);
	}

	@Transactional
	@Override
	public long getAuthLoginLastTimebyaId(int a_id) {
		return dao.getAuthLoginLastTimebyaId(a_id);
	}

	@Transactional
	@Override
	public void upadtetAuthinfo(AuthinfoBean authinfoBean) {
		dao.upadtetAuthinfo(authinfoBean);
	}

	@Transactional
	@Override
	public List<AuthinfoBean> getAuthinfos() {
		return dao.getAuthinfos();
	}
	
	//----------------------------仕杰開始--------------------------------

	@Transactional
	@Override
	public AuthinfoBean getAuthinfoByID(int a_id) {
		return dao.getAuthinfoByID(a_id);
	}
	
	@Transactional
	@Override
	public void saveAuthinfo(AuthinfoBean aib) {
		 dao.saveAuthinfo(aib);
	}
	
	@Transactional
	@Override
	public boolean checkAccountExist(String a_account) {
		return dao.checkAccountExist(a_account);
	}
	
	//後台登入失敗寄信異常登入
		@Transactional
		@Override
		public void sendAdminLoginError(String name, String toemail, String mailsubject, String mailmessage, String ip) {
				// <a href=''>重置密碼</a>
				String user = "eeit11034@gmail.com";// user
				String pwd = "Do!ng123";// password
				String to = toemail;
				String from = "eeit11034@gmail.com";// 寄件人的email
				/*
				 * host yahoo:"smtp.mail.yahoo.com" outlook:"smtp-mail.outlook.com"
				 */
				String host = "smtp.gmail.com";

				String subject = mailsubject;
				String body = "你好，此帳號嘗試登入MOBEVA後臺系統失敗，IP為" + ip + "\n" + "請本人查驗，如非本人請與我們MOBEVA反映";

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
//				            BodyPart fileBodyPart = new MimeBodyPart(); //宣告一個BodyPart用以夾帶附加檔案
//				            String filename = "要送的檔案路徑";  //要夾帶的檔案名稱  
//				            DataSource source = new FileDataSource(filename);//讀取檔案
//				            fileBodyPart.setDataHandler(new DataHandler(source));
//				            fileBodyPart.setFileName("要顯示的檔案名稱"); //設定附加檔案顯示的名稱
//				            multipart.addBodyPart(fileBodyPart);//把BodyPart加入Multipart（這個part夾帶檔案）

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
		
	
	//----------------------------仕杰結束--------------------------------

}
