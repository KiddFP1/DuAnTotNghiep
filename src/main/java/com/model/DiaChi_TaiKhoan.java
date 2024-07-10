package com.model;


import java.io.Serializable;

import jakarta.persistence.Column;
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
@Table(name = "DiaChi_TaiKhoan")
public class DiaChi_TaiKhoan implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "ma_tai_khoan")
    private TaiKhoan taiKhoan_diaChi;

    @Column(name = "ho_ten")
    private String hoTen;

    @Column(name = "so_dien_thoai")
    private String sdt;

    @Column(name = "dia_chi", length = 250)
    private String diaChi;

    @Column(name = "mac_dinh")
    private Boolean macDinh;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public TaiKhoan getTaiKhoan_diaChi() {
		return taiKhoan_diaChi;
	}

	public void setTaiKhoan_diaChi(TaiKhoan taiKhoan_diaChi) {
		this.taiKhoan_diaChi = taiKhoan_diaChi;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public Boolean getMacDinh() {
		return macDinh;
	}

	public void setMacDinh(Boolean macDinh) {
		this.macDinh = macDinh;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public DiaChi_TaiKhoan(Long id, TaiKhoan taiKhoan_diaChi, String hoTen, String sdt, String diaChi,
			Boolean macDinh) {
		super();
		this.id = id;
		this.taiKhoan_diaChi = taiKhoan_diaChi;
		this.hoTen = hoTen;
		this.sdt = sdt;
		this.diaChi = diaChi;
		this.macDinh = macDinh;
	}

	public DiaChi_TaiKhoan() {
		super();
	}

}