package dcnk.entity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

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

		public int getSLHu(){
			int soluong = 0;
			for (LichSuHu lsh:this.getLichSuHu()){
				soluong += lsh.getSoluonghu();
			}
			return soluong;
		}
		
		public int getSLConDungDuoc(){
			int soluong = 0;
			for (CTPhieuNhap ct:this.getCtPhieuNhap()){
				soluong += ct.getSoluong();
			}
			soluong -= this.getSLHu();
			return soluong;
		}	
		public int getSLConDungDuocTrongNgay(){
			int soluong = 0;
			for (CTPhieuMuon ct:this.getCtPhieuMuon()){
				if(ct.getPhieuMuon().getNgaymuon().equals(new Date())) {
					soluong += ct.getSoluong();
				}
			}
			soluong = this.getSLConDungDuoc() - soluong;
			return soluong;
		}	
}
