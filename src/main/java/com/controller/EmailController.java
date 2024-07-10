package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class EmailController {

    @Autowired
    private JavaMailSender emailSender;

    @PostMapping("/send-email")
    public String sendEmail(RedirectAttributes redAttr, @RequestParam String userMail, @RequestParam String subject, @RequestParam String message) {
        // Gửi email từ địa chỉ email người dùng đến địa chỉ email cố định
        sendSimpleMessage(userMail, "dovnpc03308@fpt.edu.vn", subject, userMail, message);

        redAttr.addFlashAttribute("message", "Mail đã được gửi! Chúng tôi sẽ sớm phản hồi.");
        return "redirect:/shop/about-us";
    }

    private void sendSimpleMessage(String from, String to, String subject, String userMail, String text) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(from);
        message.setTo(to);
        message.setSubject(subject);

        // Thêm địa chỉ email của người gửi vào nội dung email
        String emailContent = "Mail được gửi bởi: " + userMail + "\n\n" + text;
        message.setText(emailContent);

        emailSender.send(message);
    }

}
