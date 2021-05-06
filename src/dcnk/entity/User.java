package dcnk.entity;


import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name="userCH")
public class User {
	@Id
	@NotBlank(message = "Không được để trống username !")
	private String username;
	
	@NotBlank(message = "Không được để trống password !")
	private String password;
	
	@ManyToOne
	@JoinColumn(name ="idpq")
	private PhanQuyen phanquyen;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "fkidnv",referencedColumnName = "idnv")
	private NhanVien nhanvien;

	public User() {}
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public PhanQuyen getPhanquyen() {
		return phanquyen;
	}

	public void setPhanquyen(PhanQuyen phanquyen) {
		this.phanquyen = phanquyen;
	}

	public NhanVien getNhanvien() {
		return nhanvien;
	}

	public void setNhanvien(NhanVien nhanvien) {
		this.nhanvien = nhanvien;
	}
	
}
