package dcnk.entity;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="ctphieumuon")
public class CTPhieuMuon {
	@Id
	@GeneratedValue
	private Integer id;
	
	private Integer soluong;
	
	@ManyToOne
	@JoinColumn(name ="idpm")
	private PhieuMuon phieuMuon;
	
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

	public PhieuMuon getPhieuMuon() {
		return phieuMuon;
	}

	public void setPhieuMuon(PhieuMuon phieuMuon) {
		this.phieuMuon = phieuMuon;
	}

	public MatHang getMathang() {
		return mathang;
	}

	public void setMathang(MatHang mathang) {
		this.mathang = mathang;
	}
}
