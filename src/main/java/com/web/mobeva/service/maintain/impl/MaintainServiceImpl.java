package com.web.mobeva.service.maintain.impl;

import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

import com.web.mobeva.dao.maintain.MaintainDao;
import com.web.mobeva.model.auth.AuthinfoBean;
import com.web.mobeva.model.maintain.MaintainBookingBean;
import com.web.mobeva.model.maintain.MaintainDetailsBean;
import com.web.mobeva.model.maintain.MaintainPartsBean;
import com.web.mobeva.model.maintain.MaintainStationBean;
import com.web.mobeva.service.maintain.MaintainService;

@Service
public class MaintainServiceImpl implements MaintainService {

	MaintainDao dao;

	@Autowired
	public void setDao(MaintainDao dao) {
		this.dao = dao;
	}

	// ------------------------------------前台開始----------------------------------

	/**
	 * 取得單一會員預約單
	 */
	@Transactional
	@Override
	public List<MaintainBookingBean> getBookingById(int u_id) {
		return dao.getBookingById(u_id);
	}

	/**
	 * 取得所有預約單
	 */
	@Transactional
	@Override
	public List<MaintainBookingBean> getAllBooking() {
		return dao.getAllBooking();
	}

	/**
	 * 取得單一預約單保養明細
	 */
	@Transactional
	@Override
	public List<MaintainDetailsBean> getMaintainDetailsById(int mb_id) {
		return dao.getMaintainDetailsById(mb_id);
	}

	/**
	 * 取得所有據點
	 */
	@Transactional
	@Override
	public List<MaintainStationBean> getAllStation() {
		return dao.getAllStation();
	}

	/**
	 * 取得指定據點
	 */
	@Transactional
	@Override
	public List<MaintainStationBean> getMaintainStationBeanById(int ms_id) {
		return dao.getMaintainStationBeanById(ms_id);
	}

	/**
	 * 修改指定保養明細(int md_id, int mp_id, int md_pcs)
	 */
	@Transactional
	@Override
	public void updateMaintainDetailsBean(int md_id, int mp_id, int md_pcs) {
		dao.updateMaintainDetailsBean(md_id, mp_id, md_pcs);

	}

	/** 指定預約單狀態變更 */
	@Transactional
	@Override
	public void updateMaintainBooking(int mb_id, int mb_status) {
		dao.updateMaintainBooking(mb_id, mb_status);
	}

	/**
	 * 新增預約單(int md_id, int mp_id, int md_pcs)
	 */
	@Override
	public void addBooking(MaintainBookingBean maintainBookingBean) {
		dao.addBooking(maintainBookingBean);

	}

	/** 修改選取保養明細 */
	@Transactional
	@Override
	public void update_admin_md_Bean(MaintainDetailsBean mdb) {
		dao.update_admin_md_Bean(mdb);
	}

	/** 取得所有員工 */
	@Transactional
	@Override
	public List<AuthinfoBean> getAllAuth() {
		return dao.getAllAuth();
	}

	@Transactional
	@Override
	public void addMaintainDetail(MaintainDetailsBean mdb) {
		dao.addMaintainDetail(mdb);
	}

	// 寄信
	@Transactional
	@Override
	public void sendLessStock(String name, String toemail, String mailsubject, String mailmessage, int stock,
			String mp_name) {
		// <a href=''>重置密碼</a>
		String user = "eeit11034@gmail.com";// user
		String pwd = "Do!ng123";// password
		String to = toemail;
		String from = "eeit11034@gmail.com";// 寄件人的email
		/*
		 * host yahoo:"smtp.mail.yahoo.com" outlook:"smtp-mail.outlook.com"
		 */
		String host = "smtp.gmail.com";

		String subject = "MOBEVA庫存量不足";
		String body = "你好，此" + mp_name + "庫存剩餘" + stock + "\n" + "請採購人員進貨";

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
//		              BodyPart fileBodyPart = new MimeBodyPart(); //宣告一個BodyPart用以夾帶附加檔案
//		              String filename = "要送的檔案路徑";  //要夾帶的檔案名稱  
//		              DataSource source = new FileDataSource(filename);//讀取檔案
//		              fileBodyPart.setDataHandler(new DataHandler(source));
//		              fileBodyPart.setFileName("要顯示的檔案名稱"); //設定附加檔案顯示的名稱
//		              multipart.addBodyPart(fileBodyPart);//把BodyPart加入Multipart（這個part夾帶檔案）

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

	// ------------------------------------前台結束----------------------------------

}
