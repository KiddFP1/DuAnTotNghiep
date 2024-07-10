package com.model;

import java.io.Serializable;
import java.math.BigDecimal;

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
@Table(name = "SanPham")
public class SanPham implements Serializable {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long isbn;

    @ManyToOne
    @JoinColumn(name = "ma_loai")
    private PhanLoai phanLoai;

    @ManyToOne
    @JoinColumn(name = "nha_san_xuat")
    private NhaSanXuat nhaSanXuat;

    @Column(name = "ma_sp")
    private Long masp;

    @Column(name = "hinh_anh", columnDefinition = "VARCHAR(MAX)")
    private String hinhAnh;

    @Column(name = "ten_sach", length = 250)
    private String tensp;

    @Column(name = "nam_san_xuat")
    private String namSanXuat;

    @Column(name = "mo_ta", columnDefinition = "NVARCHAR(MAX)")
    private String moTa;

    private BigDecimal donGia;

    @Column(name = "ti_le_giam_gia")
    private Integer tiLeGiamGia;

    private BigDecimal giaGoc;

    private Integer soLuong;
    
    @ManyToOne
    @JoinColumn(name = "tinh_trang")
    private TinhTrangSanPham tinhTrangSanPham;

	public long getIsbn() {
		return isbn;
	}

	public void setIsbn(long isbn) {
		this.isbn = isbn;
	}

	public PhanLoai getPhanLoai() {
		return phanLoai;
	}

	public void setPhanLoai(PhanLoai phanLoai) {
		this.phanLoai = phanLoai;
	}

	public NhaSanXuat getNhaSanXuat() {
		return nhaSanXuat;
	}

	public void setNhaSanXuat(NhaSanXuat nhaSanXuat) {
		this.nhaSanXuat = nhaSanXuat;
	}

	public Long getMasp() {
		return masp;
	}

	public void setMasp(Long masp) {
		this.masp = masp;
	}

	public String getHinhAnh() {
		return hinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}

	public String getTensp() {
		return tensp;
	}

	public void setTensp(String tensp) {
		this.tensp = tensp;
	}

	public String getNamSanXuat() {
		return namSanXuat;
	}

	public void setNamSanXuat(String namSanXuat) {
		this.namSanXuat = namSanXuat;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public BigDecimal getDonGia() {
		return donGia;
	}

	public void setDonGia(BigDecimal donGia) {
		this.donGia = donGia;
	}

	public Integer getTiLeGiamGia() {
		return tiLeGiamGia;
	}

	public void setTiLeGiamGia(Integer tiLeGiamGia) {
		this.tiLeGiamGia = tiLeGiamGia;
	}

	public BigDecimal getGiaGoc() {
		return giaGoc;
	}

	public void setGiaGoc(BigDecimal giaGoc) {
		this.giaGoc = giaGoc;
	}

	public Integer getSoLuong() {
		return soLuong;
	}

	public void setSoLuong(Integer soLuong) {
		this.soLuong = soLuong;
	}

	public TinhTrangSanPham getTinhTrangSanPham() {
		return tinhTrangSanPham;
	}

	public void setTinhTrangSanPham(TinhTrangSanPham tinhTrangSanPham) {
		this.tinhTrangSanPham = tinhTrangSanPham;
	}

	public SanPham(long isbn, PhanLoai phanLoai, NhaSanXuat nhaSanXuat, Long masp, String hinhAnh, String tensp,
			String namSanXuat, String moTa, BigDecimal donGia, Integer tiLeGiamGia, BigDecimal giaGoc, Integer soLuong,
			TinhTrangSanPham tinhTrangSanPham) {
		super();
		this.isbn = isbn;
		this.phanLoai = phanLoai;
		this.nhaSanXuat = nhaSanXuat;
		this.masp = masp;
		this.hinhAnh = hinhAnh;
		this.tensp = tensp;
		this.namSanXuat = namSanXuat;
		this.moTa = moTa;
		this.donGia = donGia;
		this.tiLeGiamGia = tiLeGiamGia;
		this.giaGoc = giaGoc;
		this.soLuong = soLuong;
		this.tinhTrangSanPham = tinhTrangSanPham;
	}

	public SanPham() {
		super();
	}
    
}
