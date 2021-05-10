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

import dcnk.entity.MatHang;
import dcnk.entity.NhanVien;

@Transactional
@Controller
@RequestMapping("/mathang/")
public class MatHangController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "from MatHang";
		Query query = session.createQuery(hql);
		List<NhanVien> list = query.list();
		model.addAttribute("items", list);
		return "mathang/index";
	}
	
	@RequestMapping(value="insert",method = RequestMethod.GET)
	public String insert(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "select idmathang FROM MatHang";
		Query query = session.createQuery(hql);
		List<String> list = query.list();
		MatHang mh = new MatHang();
		mh.setIdmathang(mh.autoSetIDMH(list));
		model.addAttribute("mh", mh);
		return "mathang/insert";
	}
	
	@RequestMapping(value = "insert",method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("mathang") MatHang mh) {
		Session session = factory.openSession();
		 Transaction t = session.beginTransaction();
		 try {
			 session.save(mh);
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
		String hql = "FROM MatHang";
		Query query = session.createQuery(hql);
		List<NhanVien> list = query.list();
		model.addAttribute("items", list);
		return "mathang/index";
	}
	
	@RequestMapping(value="update/{idmathang}",method = RequestMethod.GET)
	public String update(ModelMap model, @PathVariable("idmathang") String idmathang) {
		Session session = factory.getCurrentSession();
		MatHang mh = (MatHang) session.get(MatHang.class,idmathang);
		model.addAttribute("mh", mh);
		return "mathang/update";
	}
	
	@RequestMapping(value = "update",method = RequestMethod.POST)
	public String update(ModelMap model, @ModelAttribute("mh") MatHang mh) {
		Session session = factory.openSession();
		 Transaction t = session.beginTransaction();
		 try {
			 session.update(mh);
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
		String hql = "FROM MatHang";
		Query query = session.createQuery(hql);
		List<NhanVien> list = query.list();
		model.addAttribute("items", list);
		return "mathang/index";
	}
	
	@RequestMapping(value="delete/{idmathang}",method = RequestMethod.GET)
	public String delete(ModelMap model, @PathVariable("idmathang") String idmathang, @ModelAttribute("mh") MatHang mh) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		
		try {
			 session.delete(mh);
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
		String hql = "FROM MatHang";
		Query query = session.createQuery(hql);
		List<NhanVien> list = query.list();
		model.addAttribute("items", list);
		return "mathang/index";
	}
}
