package dcnk.entity;

import java.util.Collection;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name="nhanvien")
public class NhanVien {
	@Id
	private String idnv;
	
	private String ho;
	private String ten;
	
	@NotBlank(message = "Phải chọn Nam hoặc Nữ !")
	private String gioitinh;	
	private String diachi;
	
	@OneToOne(mappedBy = "nhanvien")
	private User user;

	@OneToMany(mappedBy = "nhanvien",fetch = FetchType.EAGER)
	private Collection<PhieuMuon> phieuMuon;

	public NhanVien(String idnv, String ho, String ten, User user,String gt) {
		super();
		this.idnv = idnv;
		this.ho = ho;
		this.ten = ten;
		this.user = user;
		this.gioitinh = gt;
	}
	
	public NhanVien(NhanVien nv) {
		this.idnv = nv.getIdnv();
		this.ho = nv.getHo();
		this.ten = nv.getTen();
		this.gioitinh = nv.getGioitinh();
		this.diachi = nv.getDiachi();
	}
	public NhanVien() {}
	
	public String getIdnv() {
		return idnv;
	}

	public void setIdnv(String idnv) {
		this.idnv = idnv;
	}

	public String getHo() {
		return ho;
	}

	public void setHo(String ho) {
		this.ho = ho;
	}

	public String getTen() {
		return ten;
	}

	public void setTen(String ten) {
		this.ten = ten;
	}

	public String getGioitinh() {
		return gioitinh;
	}

	public void setGioitinh(String gioitinh) {
		this.gioitinh = gioitinh;
	}

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public Collection<PhieuMuon> getPhieuMuon() {
		return phieuMuon;
	}

	public void setPhieuMuon(Collection<PhieuMuon> phieuMuon) {
		this.phieuMuon = phieuMuon;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	//ham xu li
	public String autoSetIDNV(List<String> list) {
		String idNV = null;
		for(String id:list) {
			idNV = id;
		}	
		idNV = "NV" + String.valueOf(Integer.parseInt(idNV.split("V")[1]) + 1);
		return idNV;
	}
//	public static void main() {
//		NhanVien nv = new NhanVien();
//		List<String> list = new ArrayList<>();
//		list.add("NV1");
//		list.add("NV2");
//		list.add("NV3");
//		String newID = nv.autoSetIDNV(list);
//	}
	
}
