package org.example.controller;

import org.example.domain.ProdDto;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/prod")
public class ProdController {

    @GetMapping("/register")
    public String prodregisterGET(Model m) throws Exception{
        ProdDto prodDto = new ProdDto();
        m.addAttribute("prodDto",prodDto);

        return "prodRegister";
    }

    @PostMapping("/register")
    public String prodregisterPost(ProdDto prodDto) throws Exception{
        // 상품등록 서비스 호출


        return "admin"; // 결과창 다른곳으로 돌려보내야함.
    }


}
