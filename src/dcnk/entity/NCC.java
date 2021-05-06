package dcnk.entity;

import java.util.Collection;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="ncc")
public class NCC {
	@Id
	private String idncc;
	
	private String tenncc;
	private String diachi;
	
	@OneToMany(mappedBy = "ncc",fetch = FetchType.EAGER)
	private Collection<PhieuNhap> phieuNhap;

	public String getIdncc() {
		return idncc;
	}

	public void setIdncc(String idncc) {
		this.idncc = idncc;
	}

	public String getTenncc() {
		return tenncc;
	}

	public void setTenncc(String tenncc) {
		this.tenncc = tenncc;
	}

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public Collection<PhieuNhap> getPhieuNhap() {
		return phieuNhap;
	}

	public void setPhieuNhap(Collection<PhieuNhap> phieuNhap) {
		this.phieuNhap = phieuNhap;
	}
}
