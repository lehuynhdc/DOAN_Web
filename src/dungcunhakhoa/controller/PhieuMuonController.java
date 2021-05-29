package dungcunhakhoa.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
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

import dcnk.entity.CTPhieuMuon;
import dcnk.entity.CTPhieuNhap;
import dcnk.entity.LichSuHu;
import dcnk.entity.MatHang;
import dcnk.entity.NCC;
import dcnk.entity.NhanVien;
import dcnk.entity.PhieuMuon;
import dcnk.entity.PhieuNhap;

@Transactional
@Controller
@RequestMapping("/phieumuon/")
public class PhieuMuonController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "from PhieuMuon";
		Query query = session.createQuery(hql);
		List<PhieuNhap> list = query.list();
		model.addAttribute("nPhieu", list);
		return "phieumuon/index";
	}
	
	@RequestMapping(value="return/{idpm}", params = {"datra"},method = RequestMethod.GET)
	public String Return(ModelMap model, 
			@PathVariable("idpm") String idpm,
			@RequestParam("datra") int datra,
			RedirectAttributes re) {
		if(datra == 1) {
			re.addFlashAttribute("message", "Phiếu mượn này đã trả");
			return "redirect:../index.htm";
		}
		Session session = factory.getCurrentSession();
		PhieuMuon phieumuon = (PhieuMuon) session.get(PhieuMuon.class,idpm);
		String hql2 = "from CTPhieuMuon where idpm = '" + idpm +"'";
		Query query2 = session.createQuery(hql2);
		List<CTPhieuMuon> ctPM = query2.list();
		model.addAttribute("phieumuon", phieumuon);
		model.addAttribute("nv", phieumuon.getNhanvien());
		model.addAttribute("ctPMs", ctPM);
		model.addAttribute("soluonghu", 0);
		model.addAttribute("datra", "True");
		return "phieumuon/return";
	}
	
	@RequestMapping(value="returns",method = RequestMethod.POST)
	public String returns(RedirectAttributes re,
			@RequestParam("idpm") String idpm,
			@RequestParam("soluonghu") String soluonghu,
			@RequestParam("id") String id) {
		String[] listSLHU = soluonghu.split(",");
		String[] listid = id.split(",");
		Session session = factory.getCurrentSession();
		PhieuMuon phieumuon = (PhieuMuon) session.get(PhieuMuon.class,idpm);
		LichSuHu lsh = new LichSuHu();
		session.clear();
		int i = 0;
		for(String temp : listid) {
			for(CTPhieuMuon ct : phieumuon.getCtpm()) {
				if(ct.getId() == Integer.parseInt(temp)) {
					Boolean trung = false;
					for(LichSuHu lsh1 : ct.getMathang().getLichSuHu()) {
						if(lsh1.getNgayhu().equals(phieumuon.getNgaymuon())) {
							Session session1 = factory.openSession();
							Transaction t = session1.beginTransaction();
							lsh1.setSoluonghu(lsh1.getSoluonghu() + Integer.parseInt(listSLHU[i]));
							try {
								session1.update(lsh1);
								t.commit();
							} catch (Exception e) {
								t.rollback();
							}
							finally {
								session1.close();
							}
							trung = true;
						}
					}
					if(!trung) {
						Session session2 = factory.openSession();
						Transaction t = session2.beginTransaction();
						lsh.setNgayhu(phieumuon.getNgaymuon());
						lsh.setSoluonghu(Integer.parseInt(listSLHU[i]));
						lsh.setMathang(ct.getMathang());
						try {
							session2.save(lsh);
							t.commit();
						} catch (Exception e) {
							t.rollback();
						}
						finally {
							session2.close();
						}
					}
				}
			}
			i++;
		}
		Session session2 = factory.openSession();
		Transaction t = session2.beginTransaction();
		phieumuon.setDatra(true);
		try {
			session2.update(phieumuon);
			t.commit();
		} catch (Exception e) {
			t.rollback();
		}
		finally {
			session2.close();
		}
		return "redirect:index.htm";
	}
	
	@RequestMapping(value="update/{idpm}",method = RequestMethod.GET)
	public String update(ModelMap model, 
			@PathVariable("idpm") String idpm) {
		Session session = factory.getCurrentSession();
		PhieuMuon phieumuon = (PhieuMuon) session.get(PhieuMuon.class,idpm);
		String hql1 = "from NhanVien";
		Query query1 = session.createQuery(hql1);
		List<NhanVien> nv = query1.list();
		String hql2 = "from CTPhieuMuon where idpm = '" + idpm +"'";
		Query query2 = session.createQuery(hql2);
		List<CTPhieuMuon> ctPM = query2.list();
		String hql3 = "from MatHang";
		Query query3 = session.createQuery(hql3);
		List<MatHang> mh = query3.list();
		model.addAttribute("phieumuon", phieumuon);
		model.addAttribute("nvs", nv);
		model.addAttribute("ctPMs", ctPM);
		model.addAttribute("mhs", mh);
		model.addAttribute("datra", phieumuon.isDatra());
		return "phieumuon/update";
	}
	
	@RequestMapping(value = "update",method = RequestMethod.POST)
	public String update(RedirectAttributes re, 
			ModelMap model,
			@RequestParam("idpm") String idpm,
			@RequestParam("idnv") String idnv,
			@RequestParam("datra") String datra) {
		Boolean daTra;
		if(datra.equals("0")) {
			daTra = false;
		}
		else daTra = true;
		Session session = factory.getCurrentSession();
		PhieuMuon pm = (PhieuMuon) session.get(PhieuMuon.class,idpm);
		NhanVien nv = (NhanVien) session.get(NhanVien.class, idnv);
		pm.setNhanvien(nv);
		pm.setDatra(daTra);
		session.clear();
		Session session1 = factory.openSession();
		 Transaction t = session1.beginTransaction();
		 try {
			 session1.update(pm);
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
			@RequestParam("idpm") String idpm,
			@RequestParam("id") int id, 
			@RequestParam("soluong") int soluong) {
		Session session = factory.getCurrentSession();
		CTPhieuMuon ctpm = (CTPhieuMuon) session.get(CTPhieuMuon.class, id);
		ctpm.setSoluong(soluong);
		session.clear();
		Session session1 = factory.openSession();
		 Transaction t = session1.beginTransaction();
		 try {
			 session1.update(ctpm);
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
		return "redirect:update/"+ idpm +".htm";
	}
	
	@RequestMapping(value="delete/{idpm}",method = RequestMethod.GET)
	public String delete(RedirectAttributes re,ModelMap model, @PathVariable("idpm") String idpm, @ModelAttribute("phieumuon") PhieuMuon phieumuon) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			 session.delete(phieumuon);
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
	
	@RequestMapping(value="info/{idpm}",method = RequestMethod.GET)
	public String info(ModelMap model, @PathVariable("idpm") String idpm) {
		Session session = factory.getCurrentSession();
		PhieuMuon pm = (PhieuMuon) session.get(PhieuMuon.class,idpm);
		String hql = "from CTPhieuMuon where idpm = '" + idpm +"'";
		Query query = session.createQuery(hql);
		List<CTPhieuNhap> list = query.list();
		model.addAttribute("nPhieu", list);
		model.addAttribute("phieumuon", pm);
		return "phieumuon/info";	
	}
	
	@RequestMapping(value="insert",method = RequestMethod.GET)
	public String insert(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql1 = "from NhanVien";
		Query query1 = session.createQuery(hql1);
		List<NhanVien> nv = query1.list();
		String hql2 = "select idpm FROM PhieuMuon";
		Query query2 = session.createQuery(hql2);
		List<String> list = query2.list();
		PhieuMuon pm = new PhieuMuon();
		pm.setIdpm(pm.autoSetIDPM(list));
		model.addAttribute("pm", pm);
		model.addAttribute("nvs", nv);
		model.addAttribute("datra", "False");
		return "phieumuon/insert";	
	}
	
	@RequestMapping(value="insert",method = RequestMethod.POST)
	public String insert(RedirectAttributes re,
			@RequestParam("idnv") String idnv,
			@RequestParam("idpm") String idpm,
			@RequestParam("datra") Boolean datra) {
		
		Session session = factory.getCurrentSession();
		PhieuMuon pm = new PhieuMuon();
		NhanVien nv = (NhanVien) session.get(NhanVien.class, idnv);
		pm.setIdpm(idpm);
		pm.setNhanvien(nv);
		pm.setNgaymuon(new Date());
		pm.setDatra(datra);
		session.clear();
		session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			 session.save(pm);
			 t.commit();
			 re.addFlashAttribute("message","Thêm phiếu mượn thành công !");
		 }
		 catch (Exception e) {
			t.rollback();
			re.addFlashAttribute("message","Thêm phiếu mượn thất bại !");
		}
		 finally {
		session.close();
		}
		return "redirect:index.htm";
	}
	
	@RequestMapping(value = "add",method = RequestMethod.POST)
	public String add(RedirectAttributes re,
			@RequestParam("idpm") String idpm,
			@RequestParam("idmh") String idmh,
			@RequestParam("soluong") int soluong) {
		Session session = factory.getCurrentSession();
		PhieuMuon pm = (PhieuMuon) session.get(PhieuMuon.class, idpm);
		for(CTPhieuMuon ct : pm.getCtpm()) {
			if(ct.getMathang().getIdmathang().equals(idmh)) {
				re.addFlashAttribute("message","Mặt hàng đã tồn tại !");
				return "redirect:update/"+ idpm +".htm";
			}
		}
		MatHang mh = (MatHang) session.get(MatHang.class, idmh);		
		CTPhieuMuon ctpm = new CTPhieuMuon();
		ctpm.setMathang(mh);
		ctpm.setSoluong(soluong);
		ctpm.setPhieuMuon(pm);
		session.clear();
		session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			 session.save(ctpm);
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
		return "redirect:update/"+ idpm +".htm";
	}
	
	@RequestMapping(value = "deleteCT/{idpm}/{id}",method = RequestMethod.GET)
	public String deleteCT(RedirectAttributes re,
			@PathVariable("id") int id,
			@PathVariable("idpm") String idpm) {
		Session session = factory.getCurrentSession();
		CTPhieuMuon ctpm = (CTPhieuMuon) session.get(CTPhieuMuon.class, id);
		session.clear();
		session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			 session.delete(ctpm);
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
		return "redirect:../../update/"+ idpm +".htm";
	}
}
