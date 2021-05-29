package dcnk.entity;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="phieumuon")
public class PhieuMuon {
	@Id
	private String idpm;
	
	private boolean datra;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	private Date ngaymuon;
		
	@ManyToOne
	@JoinColumn(name ="idnv")
	private NhanVien nhanvien;
	
	@OneToMany(mappedBy = "phieuMuon",fetch = FetchType.EAGER)
	Collection<CTPhieuMuon> ctpm;
	
	public Collection<CTPhieuMuon> getCtpm() {
		return ctpm;
	}

	public void setCtpm(Collection<CTPhieuMuon> ctpm) {
		this.ctpm = ctpm;
	}

	public boolean isDatra() {
		return datra;
	}

	public void setDatra(boolean datra) {
		this.datra = datra;
	}

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
	
	//ham xu li
		public String autoSetIDPM(List<String> list) {
			String idPM = null;
			for(String id:list) {
				idPM = id;
			}	
			idPM = "PM" + String.valueOf(Integer.parseInt(idPM.split("M")[1]) + 1);
			return idPM;
		}
}
