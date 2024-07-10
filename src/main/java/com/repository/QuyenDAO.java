package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.Quyen;


public interface QuyenDAO extends JpaRepository<Quyen, String> {
    // Các phương thức tùy chỉnh nếu cần
}
