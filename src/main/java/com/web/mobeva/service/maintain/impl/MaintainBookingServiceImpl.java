package com.web.mobeva.service.maintain.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.mobeva.dao.maintain.MaintainBookingDao;
import com.web.mobeva.model.maintain.MaintainBookingBean;
import com.web.mobeva.model.maintain.MaintainInfoBean;
import com.web.mobeva.model.maintain.MaintainStationBean;
import com.web.mobeva.model.user.UserCarBean;
import com.web.mobeva.model.user.UserInfoBean;
import com.web.mobeva.service.maintain.MaintainBookingService;

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

@Service
public class MaintainBookingServiceImpl implements MaintainBookingService {
	MaintainBookingDao dao;

	@Autowired
	public void setDao(MaintainBookingDao dao) {
		this.dao = dao;
	}
	// ================================前台ServiceImp======================================

	@Transactional
	@Override
	public UserInfoBean queryMember(Integer id) {
		return dao.queryMember(id);
	}

	@Transactional
	@Override
	public MaintainStationBean getStationById(int stationId) {
		return dao.getStationById(stationId);
	}

	@Transactional
	@Override
	public List<UserCarBean> getCarList(int u_id) {
		return dao.getCarList(u_id);
	}

	@Transactional
	@Override
	public UserCarBean getUserCarById(int usercarId) {
		return dao.getUserCarById(usercarId);
	}

	@Transactional
	@Override
	public List<Integer> selectDay(String mb_date, int ms_id) {
		return dao.selectDay(mb_date, ms_id);
	}

	@Transactional
	@Override
	public List<MaintainStationBean> getStationList() {
		return dao.getStationList();
	}

	// ================================共用ServiceImp======================================

	@Transactional
	@Override
	public void addBooking(MaintainBookingBean booking) {
		dao.addBooking(booking);
	}

	@Transactional
	@Override
	public Map<Integer, String> getCarMap(int u_id) {
		Map<Integer, String> carMap = new HashMap<>();
		List<UserCarBean> list = dao.getCarList(u_id);
		for (UserCarBean ucb : list) {
			carMap.put(ucb.getUc_id(), ucb.getUc_number());
		}
		return carMap;
	}

	@Transactional
	@Override
	public Map<Integer, String> getSetMap() {
		Map<Integer, String> setMap = new HashMap<>();
		List<MaintainInfoBean> list = dao.getSet();
		for (MaintainInfoBean mib : list) {
			setMap.put(mib.getMi_id(), mib.getMi_name());
		}
		return setMap;
	}

	@Transactional
	@Override
	public Map<Integer, String> getStationMap() {
		Map<Integer, String> stationMap = new HashMap<>();
		List<MaintainStationBean> list = dao.getStationList();
		for (MaintainStationBean msb : list) {
			stationMap.put(msb.getMs_id(), msb.getMs_name());
		}
		return stationMap;
	}

	// 成功新增預約時寄信
	@Transactional
	@Override
	public void sendbookingsucess(String name, String toemail, String mailsubject, String mailmessage, String date) {
		// <a href=''>重置密碼</a>
		String user = "eeit11034@gmail.com";// user
		String pwd = "Do!ng123";// password
		String to = toemail;
		String from = "eeit11034@gmail.com";// 寄件人的email
		/*
		 * host yahoo:"smtp.mail.yahoo.com" outlook:"smtp-mail.outlook.com"
		 */
		String host = "smtp.gmail.com";

		String subject = "MOBEVA新增預約成功";
		String body = "親愛的" + name + "，您已成功預約保養，時間為" + date + "\n" + "請準時到場，感謝您的蒞臨！";

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

	// ================================後台ServiceImp======================================

	@Transactional
	@Override
	public List<MaintainBookingBean> getAllbooking() {
		return dao.getAllbooking();
	}

	@Transactional
	@Override
	public void updatestatus(int mb_id, int mb_status) {
		dao.updatestatus(mb_id, mb_status);
	}

	@Transactional
	@Override
	public MaintainBookingBean getSinglebooking(int mb_id) {
		return dao.getSinglebooking(mb_id);
	}

	@Transactional
	@Override
	public void updateBooking(MaintainBookingBean update) {
		dao.updateBooking(update);
	}

	@Transactional
	@Override
	public UserInfoBean getSingleUser(String u_account) {
		return dao.getSingleUser(u_account);
	}

}
