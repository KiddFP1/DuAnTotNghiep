package com.model;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
@Table(name = "GioHang")
public class GioHang implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "ma_tai_khoan", unique = true)
    private TaiKhoan taiKhoan_gioHang;

    @OneToMany(mappedBy = "gioHang")
    private List<ChiTietGioHang> gioHang;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public TaiKhoan getTaiKhoan_gioHang() {
		return taiKhoan_gioHang;
	}

	public void setTaiKhoan_gioHang(TaiKhoan taiKhoan_gioHang) {
		this.taiKhoan_gioHang = taiKhoan_gioHang;
	}

	public List<ChiTietGioHang> getGioHang() {
		return gioHang;
	}

	public void setGioHang(List<ChiTietGioHang> gioHang) {
		this.gioHang = gioHang;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public GioHang(Long id, TaiKhoan taiKhoan_gioHang, List<ChiTietGioHang> gioHang) {
		super();
		this.id = id;
		this.taiKhoan_gioHang = taiKhoan_gioHang;
		this.gioHang = gioHang;
	}

	public GioHang() {
		super();
	}

}