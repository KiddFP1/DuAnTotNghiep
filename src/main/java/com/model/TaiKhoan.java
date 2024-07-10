package com.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

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
@Table(name = "TaiKhoan")
public class TaiKhoan implements Serializable{
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "ten_dang_nhap")
	private String tenDangNhap;

	@Column(name = "ho_ten")
	private String hoTen;

	@Column(name = "mat_khau")
	private String matKhau;

	@Column(name = "email")
	private String email;

	@Column(name = "so_dien_thoai")
	private String sdt;

	@Column(name = "ngay_sinh")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ngaySinh;

	@Column(name = "hoat_dong")
	private Boolean active;

	@OneToMany(mappedBy = "taiKhoan_quyen")
    private List<Quyen_TaiKhoan> quyenTaiKhoan;

    @OneToMany(mappedBy = "taiKhoan_diaChi")
    private List<DiaChi_TaiKhoan> diaChiTaiKhoan;

    @OneToMany(mappedBy = "taiKhoan_gioHang")
    private List<GioHang> taiKhoan_gioHang;



	public String getTenDangNhap() {
		return tenDangNhap;
	}

	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getMatKhau() {
		return matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public Boolean getActive() {
		return active;
	}

	public void setActive(Boolean active) {
		this.active = active;
	}

	public List<Quyen_TaiKhoan> getQuyenTaiKhoan() {
		return quyenTaiKhoan;
	}

	public void setQuyenTaiKhoan(List<Quyen_TaiKhoan> quyenTaiKhoan) {
		this.quyenTaiKhoan = quyenTaiKhoan;
	}

	public List<DiaChi_TaiKhoan> getDiaChiTaiKhoan() {
		return diaChiTaiKhoan;
	}

	public void setDiaChiTaiKhoan(List<DiaChi_TaiKhoan> diaChiTaiKhoan) {
		this.diaChiTaiKhoan = diaChiTaiKhoan;
	}

	public List<GioHang> getTaiKhoan_gioHang() {
		return taiKhoan_gioHang;
	}

	public void setTaiKhoan_gioHang(List<GioHang> taiKhoan_gioHang) {
		this.taiKhoan_gioHang = taiKhoan_gioHang;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public TaiKhoan(String tenDangNhap, String hoTen, String matKhau, String email, String sdt, Date ngaySinh,
			Boolean active, List<Quyen_TaiKhoan> quyenTaiKhoan, List<DiaChi_TaiKhoan> diaChiTaiKhoan,
			List<GioHang> taiKhoan_gioHang) {
		super();
		this.tenDangNhap = tenDangNhap;
		this.hoTen = hoTen;
		this.matKhau = matKhau;
		this.email = email;
		this.sdt = sdt;
		this.ngaySinh = ngaySinh;
		this.active = active;
		this.quyenTaiKhoan = quyenTaiKhoan;
		this.diaChiTaiKhoan = diaChiTaiKhoan;
		this.taiKhoan_gioHang = taiKhoan_gioHang;

	}

	public TaiKhoan() {
		super();
	}


}
