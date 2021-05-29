package dungcunhakhoa.controller;

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

import dcnk.entity.NhanVien;
import dcnk.entity.User;

@Transactional
@Controller
@RequestMapping("/nhanvien/")
public class NhanVienController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "from NhanVien";
		Query query = session.createQuery(hql);
		List<NhanVien> list = query.list();
		model.addAttribute("staffs", list);
		return "nhanvien/index";
	}
	
	@RequestMapping(value="insert",method = RequestMethod.GET)
	public String insert(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "select idnv FROM NhanVien";
		Query query = session.createQuery(hql);
		List<String> list = query.list();
		NhanVien nv = new NhanVien();
		nv.setIdnv(nv.autoSetIDNV(list));
		model.addAttribute("nv", nv);
		return "nhanvien/insert";
	}
	
	@RequestMapping(value = "insert",method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("nv") NhanVien nv) {
		Session session = factory.openSession();
		 Transaction t = session.beginTransaction();
		 try {
			 session.save(nv);
			 t.commit();
			 model.addAttribute("message","Thêm mới thành công !");
		 }
		 catch (Exception e) {
			t.rollback();
			model.addAttribute("message","Thêm mới thất bại !");
		}
		 finally {
			session.close();
		}
		session = factory.getCurrentSession();
		String hql = "FROM NhanVien";
		Query query = session.createQuery(hql);
		List<NhanVien> list = query.list();
		model.addAttribute("staffs", list);
		return "nhanvien/index";
	}
	
	@RequestMapping(value="update/{idnv}",method = RequestMethod.GET)
	public String update(ModelMap model, @PathVariable("idnv") String idnv) {
		Session session = factory.getCurrentSession();
		NhanVien nv = (NhanVien) session.get(NhanVien.class,idnv);
		model.addAttribute("nv", nv);
		return "nhanvien/update";
	}
	
	@RequestMapping(value = "update",method = RequestMethod.POST)
	public String update(ModelMap model, @ModelAttribute("nv") NhanVien nv) {
		Session session = factory.openSession();
		 Transaction t = session.beginTransaction();
		 try {
			 session.update(nv);
			 t.commit();
			 model.addAttribute("message","Update thành công !");
		 }
		 catch (Exception e) {
			t.rollback();
			model.addAttribute("message","Update thất bại !");
		}
		 finally {
			session.close();
		}
		session = factory.getCurrentSession();
		String hql = "FROM NhanVien";
		Query query = session.createQuery(hql);
		List<NhanVien> list = query.list();
		model.addAttribute("staffs", list);
		return "nhanvien/index";
	}
	
	@RequestMapping(value="delete/{idnv}",method = RequestMethod.GET)
	public String delete(ModelMap model, @PathVariable("idnv") String idnv) {
		Session session = factory.getCurrentSession();
		NhanVien nv = (NhanVien) session.get(NhanVien.class, idnv);
		User user = nv.getUser();
		session.clear();
		session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			 session.delete(user);
			 t.commit();
			 model.addAttribute("message","Delete thành công !");
		 }
		 catch (Exception e) {
			t.rollback();
			model.addAttribute("message","Delete thất bại !");
		}
		 finally {
			session.close();
		}
		session = factory.getCurrentSession();
		String hql = "FROM NhanVien";
		Query query = session.createQuery(hql);
		List<NhanVien> list = query.list();
		model.addAttribute("staffs", list);
		return "nhanvien/index";
	}
}
