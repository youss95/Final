package dream.tk.service;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.stereotype.Service;

import dream.tk.config.EmailConfig;

@Service
public class EmailService {
	
	public String sendEmailConfirm(String rcpName, String rcpEmail) throws Exception {
		
		
		Email email = new SimpleEmail();
		email.setHostName("smtp.naver.com");
		email.setSmtpPort(465);
		email.setCharset("euc-kr"); // 인코딩 설정(utf-8, euc-kr)
		email.setAuthenticator(new DefaultAuthenticator(EmailConfig.getUserAccount(), EmailConfig.getUserpassword()));
		email.setSSL(true);
		email.setFrom(EmailConfig.getUserAccount(), EmailConfig.getUserName());
		email.setSubject("TASTY KOREA Account Confirmation");
		

		String msg1="If you want to join us, please put ";
		String msg2 = String.valueOf((int)(Math.random()*(1000000-100000))+100000);
		String msg3 = " in your confirming area.";
        String msg = msg1+msg2+msg3;
		email.setMsg(msg);
		email.addTo(rcpEmail, rcpName);
		email.send();
		
		return msg2;
	}

}
