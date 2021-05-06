package dcnk.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="phieumuon")
public class PhieuMuon {
	@Id
	private String idpm;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	private Date ngaymuon;
		
	@ManyToOne
	@JoinColumn(name ="idnv")
	private NhanVien nhanvien;

	public String getIdpm() {
		return idpm;
	}

	public void setIdpm(String idpm) {
		this.idpm = idpm;
	}

	public Date getNgaymuon() {
		return ngaymuon;
	}

	public void setNgaymuon(Date ngaymuon) {
		this.ngaymuon = ngaymuon;
	}

	public NhanVien getNhanvien() {
		return nhanvien;
	}

	public void setNhanvien(NhanVien nhanvien) {
		this.nhanvien = nhanvien;
	}
	
}
