package dcnk.entity;

import java.util.Collection;
import java.util.Date;

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
	
	private String idnv;
	
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

	public String getIdnv() {
		return idnv;
	}

	public void setIdnv(String idnv) {
		this.idnv = idnv;
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
	
}
