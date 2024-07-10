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
@Table(name = "PhanLoai")
public class PhanLoai implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "ten_loai", unique = true)
    private String tenLoai;

    @Column(name = "mo_ta", columnDefinition = "NVARCHAR(MAX)")
    private String moTa;
    
    @OneToMany(mappedBy = "phanLoai")
    private List<SanPham> loaiSanPham;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTenLoai() {
		return tenLoai;
	}

	public void setTenLoai(String tenLoai) {
		this.tenLoai = tenLoai;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public List<SanPham> getLoaiSanPham() {
		return loaiSanPham;
	}

	public void setLoaiSanPham(List<SanPham> loaiSanPham) {
		this.loaiSanPham = loaiSanPham;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public PhanLoai(Integer id, String tenLoai, String moTa, List<SanPham> loaiSanPham) {
		super();
		this.id = id;
		this.tenLoai = tenLoai;
		this.moTa = moTa;
		this.loaiSanPham = loaiSanPham;
	}

	public PhanLoai() {
		super();
	}
    
}
