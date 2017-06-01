package com.agile.signup.service;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.mail.*;
import javax.mail.internet.*;

import com.agile.signup.models.User;

@Service
public class EmailService {
	
	private static final Logger logger = LoggerFactory.getLogger(EmailService.class);
	
	public void publishReminder(List<User> users, String courseDate, int daysUntil){
		logger.info("Sending reminder emails");
		
		Properties amazonSESProps = new Properties();
		InputStream input = null;
		
		
		try {
			List<String> emails = new LinkedList<String>();
			for(int x = 0; x < users.size(); x++){
				emails.add(users.get(x).getEmail());
			}
			
			input = new FileInputStream("smtp.properties");
			amazonSESProps.load(input);
			
			Properties systemProps = System.getProperties();
			systemProps.put("mail.transport.protocol", "smtps");
			systemProps.put("mail.smtp.prot", amazonSESProps.getProperty("port"));
			
			systemProps.put("mail.smtp.auth",  "true");
			systemProps.put("mail.smtp.starttls.enable", "true");
			systemProps.put("mail.smtp.starttls.required",  "true");
			
			Session session = Session.getDefaultInstance(systemProps);
			
			MimeMessage msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(amazonSESProps.getProperty("from")));
			
			for(String email : emails){
				msg.addRecipients(Message.RecipientType.TO, email);
			}
			
			msg.setSubject(amazonSESProps.getProperty("reminder_subject"));
			String bodyText = amazonSESProps.getProperty("reminder_body");
			bodyText = bodyText.replace("xxxx", courseDate);
			bodyText = bodyText.replaceAll("yyyy", "" + daysUntil);
			msg.setContent(bodyText, "text/plain");
			
			Transport transport = session.getTransport();
			
			transport.connect(amazonSESProps.getProperty("host"), 
					amazonSESProps.getProperty("smtp_username"), amazonSESProps.getProperty("smtp_password"));
			
			Transport.send(msg, msg.getAllRecipients());
			
			transport.close();
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}	
	}
}
