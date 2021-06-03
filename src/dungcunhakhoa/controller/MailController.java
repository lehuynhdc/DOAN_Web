package dungcunhakhoa.controller;



import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dcnk.entity.User;


@Transactional
@Controller
@RequestMapping("/mail/")
public class MailController {
	@Autowired
	Mailer mailer;
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("form")
	public String index() {
		return "mail/form";
	}
	
	//cấp lại mật khẩu
	@RequestMapping("send")
	public String send(ModelMap model,RedirectAttributes re ,@RequestParam("username")String username,
			@RequestParam("to")String to) {
		String from = "n18dcat017@student.ptithcm.edu.vn";
		String subject = "Change password";
		String body = "New password: 123456789";
		Session session = factory.getCurrentSession();
		User user = (User) session.get(User.class, username);
		if(user == null) {
			re.addFlashAttribute("message", "Không tồn tại username này!");
			return "redirect:form.htm";
		}
		//gui mail
		session.clear();
		Session session2 = factory.openSession();
		Transaction t = session2.beginTransaction();
		try {
			user.setPassword("123456789");
			session2.update(user);
			t.commit();
			mailer.send(from, to, subject, body);
			re.addFlashAttribute("message", "Reset password thành công!");
		} catch (Exception e) {
			t.rollback();
			re.addFlashAttribute("message", "Reset password thất bại!");
		}
		return "redirect:../login.htm";
	}
}
