package dcnk.entity;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="ctphieunhap")
public class CTPhieuNhap {
	@Id
	@GeneratedValue
	private Integer id;
	
	private Integer soluong;
	private BigDecimal gia;
	
	@ManyToOne
	@JoinColumn(name ="idpn")
	private PhieuNhap phieuNhap;
	
	@ManyToOne
	@JoinColumn(name ="idmathang")
	private MatHang mathang;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSoluong() {
		return soluong;
	}

	public void setSoluong(Integer soluong) {
		this.soluong = soluong;
	}

	public BigDecimal getGia() {
		return gia;
	}

	public void setGia(BigDecimal gia) {
		this.gia = gia;
	}

	public PhieuNhap getPhieuNhap() {
		return phieuNhap;
	}

	public void setPhieuNhap(PhieuNhap phieuNhap) {
		this.phieuNhap = phieuNhap;
	}

	public MatHang getMathang() {
		return mathang;
	}

	public void setMathang(MatHang mathang) {
		this.mathang = mathang;
	}
}
