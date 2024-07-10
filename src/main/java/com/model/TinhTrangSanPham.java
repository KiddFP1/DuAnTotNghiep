package com.model;

import java.io.Serializable;
import java.util.List;

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
@Table(name = "TinhTrangSanPham")
public class TinhTrangSanPham implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "id", length = 4)
    private Integer id;

    @Column(name = "ten_tinh_trang", length = 150)
    private String tenTinhTrang;
    
    @OneToMany(mappedBy = "tinhTrangSanPham")
    private List<SanPham> tinhTrang_sanPham;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTenTinhTrang() {
		return tenTinhTrang;
	}

	public void setTenTinhTrang(String tenTinhTrang) {
		this.tenTinhTrang = tenTinhTrang;
	}

	public List<SanPham> getTinhTrang_sanPham() {
		return tinhTrang_sanPham;
	}

	public void setTinhTrang_sanPham(List<SanPham> tinhTrang_sanPham) {
		this.tinhTrang_sanPham = tinhTrang_sanPham;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public TinhTrangSanPham(Integer id, String tenTinhTrang, List<SanPham> tinhTrang_sanPham) {
		super();
		this.id = id;
		this.tenTinhTrang = tenTinhTrang;
		this.tinhTrang_sanPham = tinhTrang_sanPham;
	}

	public TinhTrangSanPham() {
		super();
	}

    
}
