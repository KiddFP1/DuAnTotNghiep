package com.model;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
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
@Table(name = "Quyen")
public class Quyen implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "ten")
    private String ten;

    @OneToMany(mappedBy = "quyen", cascade = CascadeType.ALL)
    private List<Quyen_TaiKhoan> quyenTaiKhoan;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public List<Quyen_TaiKhoan> getQuyenTaiKhoan() {
		return quyenTaiKhoan;
	}

	public void setQuyenTaiKhoan(List<Quyen_TaiKhoan> quyenTaiKhoan) {
		this.quyenTaiKhoan = quyenTaiKhoan;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Quyen(String id, String ten, List<Quyen_TaiKhoan> quyenTaiKhoan) {
		super();
		this.id = id;
		this.ten = ten;
		this.quyenTaiKhoan = quyenTaiKhoan;
	}

	public Quyen() {
		super();
	}


}