package dcnk.entity;

import java.util.Collection;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="mathang")
public class MatHang {
	@Id
	private String idmathang;
	
	private String tenmathang;
	
	@OneToMany(mappedBy = "mathang",fetch = FetchType.EAGER)
	private Collection<CTPhieuNhap> ctPhieuNhap;
	
	@OneToMany(mappedBy = "mathang",fetch = FetchType.EAGER)
	private Collection<CTPhieuMuon> ctPhieuMuon;
	
	@OneToMany(mappedBy = "mathang",fetch = FetchType.EAGER)
	private Collection<LichSuHu> lichSuHu;

	public String getIdmathang() {
		return idmathang;
	}

	public void setIdmathang(String idmathang) {
		this.idmathang = idmathang;
	}

	public String getTenmathang() {
		return tenmathang;
	}

	public void setTenmathang(String tenmathang) {
		this.tenmathang = tenmathang;
	}

	public Collection<CTPhieuNhap> getCtPhieuNhap() {
		return ctPhieuNhap;
	}

	public void setCtPhieuNhap(Collection<CTPhieuNhap> ctPhieuNhap) {
		this.ctPhieuNhap = ctPhieuNhap;
	}

	public Collection<CTPhieuMuon> getCtPhieuMuon() {
		return ctPhieuMuon;
	}

	public void setCtPhieuMuon(Collection<CTPhieuMuon> ctPhieuMuon) {
		this.ctPhieuMuon = ctPhieuMuon;
	}

	public Collection<LichSuHu> getLichSuHu() {
		return lichSuHu;
	}

	public void setLichSuHu(Collection<LichSuHu> lichSuHu) {
		this.lichSuHu = lichSuHu;
	}
	
	//ham xu li
		public String autoSetIDMH(List<String> list) {
			String idMH = null;
			for(String id:list) {
				idMH = id;
			}	
			idMH = "MH" + String.valueOf(Integer.parseInt(idMH.split("H")[1]) + 1);
			return idMH;
		}
}
