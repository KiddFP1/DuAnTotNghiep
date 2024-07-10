package com.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.model.SanPham;

public interface SanPhamDAO extends JpaRepository<SanPham, Long>{

}
