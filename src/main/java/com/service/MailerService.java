package com.service;

import com.model.MailInfor;

import jakarta.mail.MessagingException;

public interface MailerService {
	/**
	 * Gửi email
	 *
	 * @param mail thông tin email
	 * @throws MessagingException lỗi gửi email
	 */
	void send(MailInfor mail) throws MessagingException;

	/**
	 * Gửi email đơn giản
	 *
	 * @param to      email người nhận
	 * @param subject tiêu đề email
	 * @param body    nội dung email
	 * @throws MessagingException lỗi gửi email
	 */
	void send(String to, String subject, String body) throws MessagingException;

	/**
	 * Xếp mail vào hàng đợi * @param mail thông tin email
	 */
	void queue(MailInfor mail);

	/**
	 * Tạo MailInfo và xếp vào hàng đợi
	 *
	 * @param to      email người nhận
	 * @param subject tiêu đề email
	 * @param body    nội dung email
	 */
	void queue(String to, String subject, String body);
}