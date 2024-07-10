package com.model;


import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Quyen_TaiKhoan")
public class Quyen_TaiKhoan implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "ma_tai_khoan")
    private TaiKhoan taiKhoan_quyen;

    @ManyToOne
    @JoinColumn(name = "ma_quyen")
    private Quyen quyen;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public TaiKhoan getTaiKhoan_quyen() {
		return taiKhoan_quyen;
	}

	public void setTaiKhoan_quyen(TaiKhoan taiKhoan_quyen) {
		this.taiKhoan_quyen = taiKhoan_quyen;
	}

	public Quyen getQuyen() {
		return quyen;
	}

	public void setQuyen(Quyen quyen) {
		this.quyen = quyen;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Quyen_TaiKhoan(Long id, TaiKhoan taiKhoan_quyen, Quyen quyen) {
		super();
		this.id = id;
		this.taiKhoan_quyen = taiKhoan_quyen;
		this.quyen = quyen;
	}

	public Quyen_TaiKhoan() {
		super();
	}

}