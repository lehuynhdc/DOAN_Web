package dungcunhakhoa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dcnk.entity.NhanVien;
import dcnk.entity.PhanQuyen;
import dcnk.entity.User;

@Transactional
@Controller
public class LoginController {
	
	@Autowired 
	SessionFactory factory;
	
	@RequestMapping("index")
	public String index() {
		return "index";
	}
	
	//đăng xuất
	@RequestMapping("logout")
	public String logout(HttpSession SE) {
		SE.setAttribute("username",null);
		SE.setAttribute("role",null);
	
		return "redirect:index.htm";
	}
	
	@RequestMapping("home")
	public String home(ModelMap model,HttpSession session) {		
		Session session2 = factory.getCurrentSession();
		User user = (User) session2.get(User.class,(String) session.getAttribute("username"));
		model.addAttribute("user", user);
		return "home";
	}
	
	
	@RequestMapping(value = "/login",method = RequestMethod.GET)
	public String login(ModelMap model) {
		model.addAttribute("user", new User());
		return "login";
	}
 
	//đăng nhập
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String login(ModelMap model,
			@Validated @ModelAttribute("user") User user,
			BindingResult errors, HttpSession SE) {
		if(errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây !");
		}
		else {
			Session session = factory.getCurrentSession();
			String hql = "FROM User where username = '" + user.getUsername() + "'";
			Query query = session.createQuery(hql);
			List<User> list = query.list();
			if(list.isEmpty()) {
				model.addAttribute("message", "Sai tài khoản hoặc mật khẩu");
				model.addAttribute("user",new User());
				return "login";
			}
			User user2 = (User) list.get(0);
			if(user.getUsername().equals(user2.getUsername()) && user.getPassword().equals(user2.getPassword())){
				SE.setAttribute("username", user.getUsername());
				SE.setAttribute("role", user2.getPhanquyen().getIdpq());
				model.addAttribute("user", user2);
				return "home";
			}
			else {
				model.addAttribute("message", "Sai tài khoản hoặc mật khẩu");
				model.addAttribute("user",new User());
				return "login";
			}
		}
		return "login";
	}
	
	@RequestMapping(value = "/register",method = RequestMethod.GET)
	public String register(ModelMap model) {
		model.addAttribute("user", new User());
		return "register";
	}
	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public String register(ModelMap model,@ModelAttribute("user") User user,
			@ModelAttribute("repeat-pass") String repeatPass,@ModelAttribute("ho") String ho,
			@ModelAttribute("ten") String ten,@RequestParam("gioitinh") String GT) {
		if(!(repeatPass.equals(user.getPassword()))) {
			model.addAttribute("message", "Password không trùng với repeat password !");
			return "register";
		}
		Session session = factory.getCurrentSession();
		String hql = "select idnv FROM NhanVien";
		Query query = session.createQuery(hql);
		List<String> list = query.list();
		NhanVien nv1 = new NhanVien();
		NhanVien nv = new NhanVien(nv1.autoSetIDNV(list), ho, ten, user,GT);
		PhanQuyen pq = new PhanQuyen("PQ2", "Nhân Viên");
		user.setPhanquyen(pq);
		user.setNhanvien(nv);
		Session session1 = factory.openSession();
		Transaction t = session1.beginTransaction();
		try {
			session1.save(nv);
			session1.save(user);
			t.commit();
			model.addAttribute("message", "Bạn đã đăng ký thành công !");	
		}
		catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Bạn đã đăng ký thất bại !");
		}
		 finally {
			session1.close();
		}
		
		return "register";
	}
}
