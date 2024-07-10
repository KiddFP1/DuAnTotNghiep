package com.model;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
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
@Table(name = "NhaSanXuat")
public class NhaSanXuat implements Serializable{
	private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "ten_nha_xuat_ban", length = 100)
    private String tenNhaXuatBan;

    @Column(name = "mo_ta", columnDefinition = "NVARCHAR(MAX)")
    private String moTa;

    @Column(name = "hinh_anh", columnDefinition = "VARCHAR(MAX)")
    private String hinhAnh;
    
    @OneToMany(mappedBy = "nhaSanXuat")
    private List<SanPham> nhaSanXuat;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTenNhaXuatBan() {
		return tenNhaXuatBan;
	}

	public void setTenNhaXuatBan(String tenNhaXuatBan) {
		this.tenNhaXuatBan = tenNhaXuatBan;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public String getHinhAnh() {
		return hinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}

	

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	

	public NhaSanXuat(Long id, String tenNhaXuatBan, String moTa, String hinhAnh, List<SanPham> nhaSanXuat) {
		super();
		this.id = id;
		this.tenNhaXuatBan = tenNhaXuatBan;
		this.moTa = moTa;
		this.hinhAnh = hinhAnh;
		this.nhaSanXuat = nhaSanXuat;
	}

	public List<SanPham> getNhaSanXuat() {
		return nhaSanXuat;
	}

	public void setNhaSanXuat(List<SanPham> nhaSanXuat) {
		this.nhaSanXuat = nhaSanXuat;
	}

	public NhaSanXuat() {
		super();
	}
    
}
