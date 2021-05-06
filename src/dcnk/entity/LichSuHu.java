package dcnk.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="lichsuhu")
public class LichSuHu {
	@Id
	@GeneratedValue
	private Integer id;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	private Date ngayhu;
	
	private Integer soluonghu;
	
	@ManyToOne
	@JoinColumn(name = "idmathang")
	private MatHang mathang;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getNgayhu() {
		return ngayhu;
	}

	public void setNgayhu(Date ngayhu) {
		this.ngayhu = ngayhu;
	}

	public Integer getSoluonghu() {
		return soluonghu;
	}

	public void setSoluonghu(Integer soluonghu) {
		this.soluonghu = soluonghu;
	}

	public MatHang getMathang() {
		return mathang;
	}

	public void setMathang(MatHang mathang) {
		this.mathang = mathang;
	}
	
}
