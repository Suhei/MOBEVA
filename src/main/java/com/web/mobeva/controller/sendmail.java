package com.web.mobeva.controller;

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

public class sendmail {
	/*
	 * 需要 javamail.jar session.jar 如果import是使用Ctrl
	 * shift+O，↓這兩個import要修改成這樣，不然它會import到別的 import javax.mail.Authenticator;
	 * import javax.mail.PasswordAuthentication;
	 */

	public static void send(String name, String email, String tel, String review) {

		String user = "eeit11034@gmail.com";// user
		String pwd = "Do!ng123";// password
		String to = "eeit11034@gmail.com";
		String from = "eeit11034@gmail.com";// 寄件人的email
		/*
		 * host yahoo:"smtp.mail.yahoo.com" outlook:"smtp-mail.outlook.com"
		 */
		String host = "smtp.gmail.com";

		String subject = "聯絡問題";
		String body = "姓名:" + name + "\n" + "Email:" + email + "\n" + "電話:" +tel + "\n" + "問題:" + review;

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
//            BodyPart fileBodyPart = new MimeBodyPart(); //宣告一個BodyPart用以夾帶附加檔案
//            String filename = "要送的檔案路徑";  //要夾帶的檔案名稱  
//            DataSource source = new FileDataSource(filename);//讀取檔案
//            fileBodyPart.setDataHandler(new DataHandler(source));
//            fileBodyPart.setFileName("要顯示的檔案名稱"); //設定附加檔案顯示的名稱
//            multipart.addBodyPart(fileBodyPart);//把BodyPart加入Multipart（這個part夾帶檔案）

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

//	public static void sendPwd(String name, String toemail, String mailsubject, String url, String mailmessage) {
//		// <a href=''>重置密碼</a>
//		String user = "eeit11019@gmail.com";// user
//		String pwd = "Do!ng123";// password
//		String to = toemail;
//		String from = "eeit11019@gmail.com";// 寄件人的email
//		/*
//		 * host yahoo:"smtp.mail.yahoo.com" outlook:"smtp-mail.outlook.com"
//		 */
//		String host = "smtp.gmail.com";
//
//		String subject = "密碼重置";
//		String body = "你好 請點擊下列網址以重置密碼" + "\n" + url;
//
//		// 建立一個Properties來設定Properties
//		Properties properties = System.getProperties();
//		// 設定傳輸協定為smtp
//		properties.setProperty("mail.transport.protocol", "smtp");
//		// 設定mail Server
//		properties.setProperty("mail.smtp.host", host);
//		properties.setProperty("mail.smtp.port", "465");
//
//		properties.put("mail.smtp.auth", "true");// 需要驗證帳號密碼
//		// SSL authentication
//		properties.put("mail.smtp.ssl.enable", "true");
//		properties.put("mail.smtp.starttls.enable", "true");
//
//		// 建立一個Session物件，並把properties傳進去
//		Session mailSession = Session.getInstance(properties, new Authenticator() {
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication(user, pwd);
//			}
//		});
//
//		try {
//			// 建立一個 MimeMessage object.
//			MimeMessage message = new MimeMessage(mailSession);
//			// 設定郵件
//			message.setFrom(new InternetAddress(from)); // 設定寄件人
//			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); // 設定收件人
//			message.setSubject(subject); // 設定主旨
//
//			// 宣告一個multipart , 它可以使內文有不同的段落，
//			// 使其可以用用來夾帶內文及檔案
//			Multipart multipart = new MimeMultipart();
//			// 第一個段落
//			BodyPart messageBodyPart = new MimeBodyPart(); // 宣告一個BodyPart用以夾帶內文
//			messageBodyPart.setText(body);// 設定內文
//			multipart.addBodyPart(messageBodyPart); // 把BodyPart加入Multipart
//			// 第二個段落
////            BodyPart fileBodyPart = new MimeBodyPart(); //宣告一個BodyPart用以夾帶附加檔案
////            String filename = "要送的檔案路徑";  //要夾帶的檔案名稱  
////            DataSource source = new FileDataSource(filename);//讀取檔案
////            fileBodyPart.setDataHandler(new DataHandler(source));
////            fileBodyPart.setFileName("要顯示的檔案名稱"); //設定附加檔案顯示的名稱
////            multipart.addBodyPart(fileBodyPart);//把BodyPart加入Multipart（這個part夾帶檔案）
//
//			message.setContent(multipart); // 設定eMultipart為messag的Content
//			Transport transport = mailSession.getTransport("smtp");
//			transport.connect(host, user, pwd);
//			// 傳送信件
//			transport.sendMessage(message, message.getAllRecipients());
//
//			System.out.println("發送成功");
//			// 關閉連線
//			transport.close();
//
//		} catch (MessagingException mex) {
//			mex.printStackTrace();
//		}
//
//	}
}
