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
@Table(name="phieunhap")
public class PhieuNhap {
	@Id
	private String idpn;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	private Date ngaynhap;
	
	@ManyToOne
	@JoinColumn(name="idnv")
	private NhanVien nv;
	
	@ManyToOne
	@JoinColumn(name="idncc")
	private NCC ncc;
	
	@OneToMany(mappedBy = "phieuNhap",fetch = FetchType.EAGER)
	private Collection<CTPhieuNhap> ctPhieuNhap;

	public String getIdpn() {
		return idpn;
	}

	public void setIdpn(String idpn) {
		this.idpn = idpn;
	}

	public Date getNgaynhap() {
		return ngaynhap;
	}

	public void setNgaynhap(Date ngaynhap) {
		this.ngaynhap = ngaynhap;
	}

	public NhanVien getNv() {
		return nv;
	}

	public void setNv(NhanVien nv) {
		this.nv = nv;
	}

	public NCC getNcc() {
		return ncc;
	}

	public void setNcc(NCC ncc) {
		this.ncc = ncc;
	}

	public Collection<CTPhieuNhap> getCtPhieuNhap() {
		return ctPhieuNhap;
	}

	public void setCtPhieuNhap(Collection<CTPhieuNhap> ctPhieuNhap) {
		this.ctPhieuNhap = ctPhieuNhap;
	}
	
	//ham xu li
		public String autoSetIDPN(List<String> list) {
			String idPN = null;
			for(String id:list) {
				idPN = id;
			}	
			idPN = "PN" + String.valueOf(Integer.parseInt(idPN.split("N")[1]) + 1);
			return idPN;
		}
	
}
