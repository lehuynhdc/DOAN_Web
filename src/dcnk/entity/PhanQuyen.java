package dcnk.entity;

import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="phanquyen")
public class PhanQuyen {
	@Id
	private String idpq;
	
	private String tenpq;
	
	@OneToMany(mappedBy = "phanquyen",fetch = FetchType.EAGER)
	private Collection<User> users;

	public PhanQuyen() {}
	public PhanQuyen(String idpq, String tenpq) {
		super();
		this.idpq = idpq;
		this.tenpq = tenpq;
	}

	public String getIdpq() {
		return idpq;
	}

	public void setIdpq(String idpq) {
		this.idpq = idpq;
	}

	public String getTenpq() {
		return tenpq;
	}

	public void setTenpq(String tenpq) {
		this.tenpq = tenpq;
	}

	public Collection<User> getUsers() {
		return users;
	}

	public void setUsers(Collection<User> users) {
		this.users = users;
	}
}
