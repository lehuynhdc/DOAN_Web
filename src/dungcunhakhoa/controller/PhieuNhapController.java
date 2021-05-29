package dungcunhakhoa.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dcnk.entity.CTPhieuNhap;
import dcnk.entity.MatHang;
import dcnk.entity.NCC;
import dcnk.entity.NhanVien;
import dcnk.entity.PhieuNhap;

@Transactional
@Controller
@RequestMapping("/phieunhap/")
public class PhieuNhapController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "from PhieuNhap";
		Query query = session.createQuery(hql);
		List<PhieuNhap> list = query.list();
		model.addAttribute("nPhieu", list);
		return "phieunhap/index";
	}
	
	@RequestMapping(value="update/{idpn}",method = RequestMethod.GET)
	public String update(ModelMap model, @PathVariable("idpn") String idpn) {
		Session session = factory.getCurrentSession();
		PhieuNhap phieunhap = (PhieuNhap) session.get(PhieuNhap.class,idpn);
		String hql = "from NCC";
		Query query = session.createQuery(hql);
		List<NCC> ncc = query.list();
		String hql1 = "from NhanVien";
		Query query1 = session.createQuery(hql1);
		List<NhanVien> nv = query1.list();
		String hql2 = "from CTPhieuNhap where idpn = '" + idpn +"'";
		Query query2 = session.createQuery(hql2);
		List<CTPhieuNhap> ctPN = query2.list();
		String hql3 = "from MatHang";
		Query query3 = session.createQuery(hql3);
		List<MatHang> mh = query3.list();
		model.addAttribute("phieunhap", phieunhap);
		model.addAttribute("nccs", ncc);
		model.addAttribute("nvs", nv);
		model.addAttribute("ctPNs", ctPN);
		model.addAttribute("mhs", mh);
		return "phieunhap/update";
	}
	
	@RequestMapping(value = "update",method = RequestMethod.POST)
	public String update(RedirectAttributes re, ModelMap model,
			@RequestParam("idpn") String idpn,
			@RequestParam("idnv") String idnv,
			@RequestParam("idncc") String idncc) {
		Session session = factory.getCurrentSession();
		PhieuNhap pn = (PhieuNhap) session.get(PhieuNhap.class, idpn);
		NhanVien nv = (NhanVien) session.get(NhanVien.class, idnv);
		NCC ncc = (NCC) session.get(NCC.class, idncc);
		pn.setNcc(ncc);
		pn.setNv(nv);
		session.clear();
		Session session1 = factory.openSession();
		 Transaction t = session1.beginTransaction();
		 try {
			 session1.update(pn);
			 t.commit();
			 re.addFlashAttribute("message","Update thành công !");			
		 }
		 catch (Exception e) {
			t.rollback();
			re.addFlashAttribute("message","Update thất bại !");
		}
		 finally {
			session1.close();
		}
		return "redirect:index.htm";
	}
	
	@RequestMapping(value = "updates",method = RequestMethod.POST)
	public String update(RedirectAttributes re, ModelMap model, 
			@RequestParam("idpn") String idpn,
			@RequestParam("id") int id, 
			@RequestParam("soluong") int soluong,
			@RequestParam("gia") BigDecimal gia) {
		Session session = factory.getCurrentSession();
		CTPhieuNhap ctpn = (CTPhieuNhap) session.get(CTPhieuNhap.class, id);
		ctpn.setGia(gia);
		ctpn.setSoluong(soluong);
		session.clear();
		Session session1 = factory.openSession();
		 Transaction t = session1.beginTransaction();
		 try {
			 session1.update(ctpn);
			 t.commit();
			 re.addFlashAttribute("message","Update thành công !");			
		 }
		 catch (Exception e) {
			t.rollback();
			re.addFlashAttribute("message","Update thất bại !");
		}
		 finally {
			session1.close();
		}
		return "redirect:update/"+ idpn +".htm";
	}
	
	@RequestMapping(value="delete/{idpn}",method = RequestMethod.GET)
	public String delete(RedirectAttributes re,ModelMap model, @PathVariable("idpn") String idpn, @ModelAttribute("phieunhap") PhieuNhap phieunhap) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			 session.delete(phieunhap);
			 t.commit();
			 re.addFlashAttribute("message","Delete thành công !");
		 }
		 catch (Exception e) {
			t.rollback();
			re.addFlashAttribute("message","Delete thất bại !");
		}
		 finally {
		session.close();
		}
		return "redirect:../index.htm";
	}
	
	@RequestMapping(value="info/{idpn}",method = RequestMethod.GET)
	public String info(ModelMap model, @PathVariable("idpn") String idpn) {
		Session session = factory.getCurrentSession();
		PhieuNhap pn = (PhieuNhap) session.get(PhieuNhap.class, idpn);
		String hql = "from CTPhieuNhap where idpn = '" + idpn +"'";
		Query query = session.createQuery(hql);
		List<CTPhieuNhap> list = query.list();
		model.addAttribute("nPhieu", list);
		model.addAttribute("phieunhap", pn);
		return "phieunhap/info";	
	}
	
	@RequestMapping(value="insert",method = RequestMethod.GET)
	public String insert(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "from NCC";
		Query query = session.createQuery(hql);
		List<NCC> ncc = query.list();
		String hql1 = "from NhanVien";
		Query query1 = session.createQuery(hql1);
		List<NhanVien> nv = query1.list();
		String hql2 = "select idpn FROM PhieuNhap";
		Query query2 = session.createQuery(hql2);
		List<String> list = query2.list();
		PhieuNhap pn = new PhieuNhap();
		pn.setIdpn(pn.autoSetIDPN(list));
		model.addAttribute("pn", pn);
		model.addAttribute("nccs", ncc);
		model.addAttribute("nvs", nv);
		return "phieunhap/insert";	
	}
	
	@RequestMapping(value="insert",method = RequestMethod.POST)
	public String insert(RedirectAttributes re,
			@RequestParam("idnv") String idnv,
			@RequestParam("idpn") String idpn,
			@RequestParam("idncc") String idncc) {
		
		Session session = factory.getCurrentSession();
		PhieuNhap pn = new PhieuNhap();
		NhanVien nv = (NhanVien) session.get(NhanVien.class, idnv);
		NCC ncc = (NCC) session.get(NCC.class, idncc);
		pn.setIdpn(idpn);
		pn.setNcc(ncc);
		pn.setNv(nv);
		pn.setNgaynhap(new Date());
		session.clear();
		session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			 session.save(pn);
			 t.commit();
			 re.addFlashAttribute("message","Thêm phiếu nhập thành công !");
		 }
		 catch (Exception e) {
			t.rollback();
			re.addFlashAttribute("message","Thêm phiếu nhập thất bại !");
		}
		 finally {
		session.close();
		}
		return "redirect:index.htm";
	}
	
	@RequestMapping(value = "add",method = RequestMethod.POST)
	public String add(RedirectAttributes re,
			@RequestParam("idpn") String idpn,
			@RequestParam("idmh") String idmh,
			@RequestParam("soluong") int soluong,
			@RequestParam("gia") BigDecimal gia) {
		Session session = factory.getCurrentSession();
		PhieuNhap pn = (PhieuNhap) session.get(PhieuNhap.class, idpn);
		for(CTPhieuNhap ct : pn.getCtPhieuNhap()) {
			if(ct.getMathang().getIdmathang().equals(idmh)) {
				re.addFlashAttribute("message","Mặt hàng đã tồn tại !");
				return "redirect:update/"+ idpn +".htm";
			}
		}
		MatHang mh = (MatHang) session.get(MatHang.class, idmh);		
		CTPhieuNhap ctpn = new CTPhieuNhap();
		ctpn.setMathang(mh);
		ctpn.setGia(gia);
		ctpn.setSoluong(soluong);
		ctpn.setPhieuNhap(pn);
		session.clear();
		session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			 session.save(ctpn);
			 t.commit();
			 re.addFlashAttribute("message","Thêm mặt hàng thành công !");
		 }
		 catch (Exception e) {
			t.rollback();
			re.addFlashAttribute("message","Thêm mặt hàng thất bại !");
		}
		 finally {
		session.close();
		}
		return "redirect:update/"+ idpn +".htm";
	}
	
	@RequestMapping(value = "deleteCT/{idpn}/{id}",method = RequestMethod.GET)
	public String deleteCT(RedirectAttributes re,
			@PathVariable("id") int id,
			@PathVariable("idpn") String idpn) {
		Session session = factory.getCurrentSession();
		CTPhieuNhap ctpn = (CTPhieuNhap) session.get(CTPhieuNhap.class, id);
		session.clear();
		session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			 session.delete(ctpn);
			 t.commit();
			 re.addFlashAttribute("message","Xóa mặt hàng thành công !");
		 }
		 catch (Exception e) {
			t.rollback();
			re.addFlashAttribute("message","Xóa mặt hàng thất bại !");
		}
		 finally {
		session.close();
		}
		return "redirect:../../update/"+ idpn +".htm";
	}
}
