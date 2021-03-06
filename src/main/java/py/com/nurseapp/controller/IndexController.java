package py.com.nurseapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

    private static final String VIEWER = "index";

    @RequestMapping("/")
    public String index(Model model) {
    	model.addAttribute("name", "Marcos Echague");
        return VIEWER;
    }

}
