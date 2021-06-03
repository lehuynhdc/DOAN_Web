package dungcunhakhoa.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dcnk.entity.NhanVien;
import dcnk.entity.PhanQuyen;
import dcnk.entity.User;

@Transactional
@Controller
@RequestMapping("/user/")
public class UserController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	ServletContext servlet;
	
	@ModelAttribute("user")
	public User user(HttpSession session2) {
		Session session = factory.getCurrentSession();
		User user = (User) session.get(User.class, (String) session2.getAttribute("username"));
		return user;
	}
	
	@RequestMapping("index")
	public String index(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "from User";
		Query query = session.createQuery(hql);
		List<NhanVien> list = query.list();
		model.addAttribute("users", list);
		return "user/index";
	}
	
	//tạo mới 1 user 
	@RequestMapping(value="insert/{idnv}",method = RequestMethod.GET)
	public String insert(ModelMap model,@PathVariable("idnv") String idnv,RedirectAttributes re) {
		Session session = factory.getCurrentSession();
		NhanVien nv = (NhanVien) session.get(NhanVien.class, idnv);
		if(!(nv.getUser() == null)) {
			re.addFlashAttribute("message", "Nhân viên đã có user");
			return "redirect:../../nhanvien/index.htm";
		}
		PhanQuyen pq = new PhanQuyen("PQ2","Nhân Viên");
		User user = new User();
		user.setNhanvien(nv);
		user.setPhanquyen(pq);
		model.addAttribute("user", user);
		return "user/insert";
	}
	@RequestMapping(value = "insert",method = RequestMethod.POST)
	public String insert(ModelMap model, @ModelAttribute("user") User user,
			@RequestParam("idphanquyen") String idpq,@RequestParam("idnhanvien") String idnv) {
		Session session1 = factory.getCurrentSession();
		NhanVien nv = (NhanVien) session1.get(NhanVien.class, idnv);
		PhanQuyen pq = (PhanQuyen) session1.get(PhanQuyen.class,idpq);
		user.setNhanvien(nv);
		user.setPhanquyen(pq);
		nv.setUser(user);
		session1.clear();
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.update(nv);
			session.save(user);
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
		Session session2 = factory.getCurrentSession();
		String hql = "FROM User";
		Query query = session2.createQuery(hql);
		List<User> list = query.list();
		model.addAttribute("users", list);
		return "user/index";
	}
	
	 //chỉnh sửa 1 user
	@RequestMapping(value="update/{username}",method = RequestMethod.GET)
	public String update(ModelMap model, @PathVariable("username") String username) {
		Session session = factory.getCurrentSession();
		User user = (User) session.get(User.class,username);
		model.addAttribute("user", user);
		return "user/update";
	}
	
	@RequestMapping(value = "update",method = RequestMethod.POST)
	public String update(ModelMap model, @ModelAttribute("user") User user,
			@RequestParam("idpq") String idpq) {
		Session session = factory.getCurrentSession();
		User userUpdate = (User) session.get(User.class, user.getUsername());
		PhanQuyen pq = (PhanQuyen) session.get(PhanQuyen.class, idpq);
		userUpdate.setPassword(user.getPassword());
		userUpdate.setPhanquyen(pq);
		session.clear();
		Session session1 = factory.openSession();
		 Transaction t = session1.beginTransaction();
		 try {
			 session1.update(userUpdate);
			 t.commit();
			 model.addAttribute("message","Update thành công !");			
		 }
		 catch (Exception e) {
			t.rollback();
			model.addAttribute("message","Update thất bại !");
		}
		 finally {
			session1.close();
		}
		Session session2 = factory.getCurrentSession();
		String hql = "FROM User";
		Query query = session2.createQuery(hql);
		List<User> list = query.list();
		model.addAttribute("users", list);
		return "user/index";
	}
	
	//xóa 1 user
	@RequestMapping(value="delete/{username}",method = RequestMethod.GET)
	public String delete(ModelMap model, @PathVariable("username") String username) {
		Session session = factory.getCurrentSession();
		User user = (User) session.get(User.class, username);
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
		String hql = "FROM User";
		Query query = session.createQuery(hql);
		List<NhanVien> list = query.list();
		model.addAttribute("users", list);
		return "user/index";
	}
	
	//xem trang cá nhân
	@RequestMapping(value = "profile",method = RequestMethod.GET)
	public String profile() {
		return "user/profile";
	}
	@RequestMapping(value = "profile",method = RequestMethod.POST)
	public String profile(RedirectAttributes re,
			@RequestParam("fileAvata") MultipartFile fileAvata,
			HttpSession session) {
		if(fileAvata.isEmpty()) {
			re.addFlashAttribute("message", "Vui lòng chọn file!");
			return "redirect:profile.htm";
		}
		else {
			try {
				String photoPath = servlet.getRealPath("/images/" + session.getAttribute("username") + ".png");
				fileAvata.transferTo(new File(photoPath));
				re.addFlashAttribute("mesage", "Thành công !");
				return "redirect:profile.htm";
			}
			catch (Exception e) {
				re.addFlashAttribute("mesage", "Lỗi lưu file !");
			}
		}
		return "redirect:profile.htm";
	}
}

