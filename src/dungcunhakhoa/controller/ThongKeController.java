package dungcunhakhoa.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import dcnk.entity.MatHang;

@Transactional
@Controller
@RequestMapping("/thongke/")
public class ThongKeController {
	@Autowired
	SessionFactory factory;
	
	//thống kê
	@RequestMapping("index")
	public String index(ModelMap model) {
		Session session = factory.getCurrentSession();
		String hql = "from MatHang";
		Query query = session.createQuery(hql);
		List<MatHang> list = query.list();
		model.addAttribute("items", list);
		return "thongke/index";
	}
}
