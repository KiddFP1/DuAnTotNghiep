package com.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.model.MailInfor;
import com.service.MailerService;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;

@Service
public class MailerServiceImpl implements MailerService {
	@Autowired
	JavaMailSender sender;

	@Override
	public void send(MailInfor mail) {
		// Tạo message
		MimeMessage message = sender.createMimeMessage();
		// Sử dụng Helper để thiết lập các thông tin cần thiết cho message
		MimeMessageHelper helper;
		try {
			helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(mail.getFrom());
			helper.setTo(mail.getTo());
			helper.setSubject(mail.getSubject());
			helper.setText(mail.getBody(), true);
			helper.setReplyTo(mail.getFrom());
			String[] cc = mail.getCc();
			if (cc != null && cc.length > 0) {
				helper.setCc(cc);
			}
			String[] bcc = mail.getBcc();
			if (bcc != null && bcc.length > 0) {
				helper.setBcc(bcc);
			}
			String[] attachments = mail.getAttachments();
			if (attachments != null && attachments.length > 0) {
				for (String path : attachments) {
					File file = new File(path);
					helper.addAttachment(file.getName(), file);
				}
			}
			// Gửi message đến SMTP server
			sender.send(message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public void send(String to, String subject, String body) {
		this.send(new MailInfor(to, subject, body));
	}

	List<MailInfor> list = new ArrayList<>();

	@Override
	public void queue(MailInfor mail) {
		list.add(mail);
	}

	@Override
	public void queue(String to, String subject, String body) {
		queue(new MailInfor(to, subject, body));
	}

	@Scheduled(fixedDelay = 5000)
	public void run() {
		while (!list.isEmpty()) {
			MailInfor mail = list.remove(0);
			try {
				this.send(mail);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
