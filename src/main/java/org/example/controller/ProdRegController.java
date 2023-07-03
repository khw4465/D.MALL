package org.example.controller;

import org.example.domain.*;
import org.example.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;

@Controller
@RequestMapping("/prod")
public class ProdRegController {

    private static final String CURR_IMAGE_REPO_PATH = "/Users/sanghoon/dgaja/dgaja/src/main/webapp/resources";

    @Autowired
    ProdService prodService;

    @Autowired
    ProdStokService prodStokService;

    @Autowired
    ProdOptValService prodOptValService;

    @Autowired
    ProdImgService prodImgService;


    @GetMapping("/index")
    public String index(HttpServletRequest request) {

        return "prod_reg";
    }

    @GetMapping("/grid")
    public String grid(HttpServletRequest request) {

        return "grid";
    }

    @PostMapping("/inquiry")
    @ResponseBody
    public int inquiry(@RequestBody ClsData c, ProdDto prodDto, Model m, HttpSession session, RedirectAttributes rattr) {
        System.out.println("진입");
        System.out.println("ClsCd =" + c.getClsCd());
        prodDto.setClsCd(c.getClsCd());

        int clsCount = -1;

        try {
            int rowCnt = prodService.getClsCount(prodDto); //inquiry
            clsCount = rowCnt; //해당 카테고리 상품수 반환
            System.out.println("반환받은 카테고리상품수" + clsCount);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return clsCount;
    }

    @PostMapping("/imgUpload")
    public ResponseEntity<String> uploadImage(@RequestParam("file") MultipartFile[] files) {
        try {
            List<String> fileNames = new ArrayList<>();
            for (MultipartFile file : files) {
                String originalFilename = file.getOriginalFilename();
                String filePath = CURR_IMAGE_REPO_PATH + "/" + originalFilename;
                File destFile = new File(filePath);
                file.transferTo(destFile);
                fileNames.add(originalFilename);
            }
            return ResponseEntity.ok("파일 업로드 성공: " + fileNames);
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 업로드 실패");
        }
    }


    @PostMapping("/reg")
    @ResponseBody
    public int reg(@RequestBody ProdRegData r, ProdDto prodDto, ProdOptValDto prodOptValDto,
                   ProdStokDto prodStokDto, ProdImgDto prodImgDto, Model m, HttpSession session, RedirectAttributes rattr) {

        //옵션적용할지말지 여부 확인해서. 옵션적용안하면 -> 상품테이블, 재고테이블 insert
        //옵션적용하면 -> 1. 옵션명 배열 개수로 옵션 수 찾기 2. 옵션수에 따라 opt_value로 for문돌리면서
        // 상품테이블, 옵션테이블, 재고테이블에 하나씩 insert.

        int prod_rowCnt = 0; //상품테이블 insert후 return값
        int stk_rowCnt = 0; //상품재고테이블 insert후 return값
        int opt_rowCnt = 0; //상품옵션테이블 insert후 return값
        int img_rowCnt = 0; //상품이미지테이블 insert 후 return값


        if ((r.getOptYn().equals(0)) || (r.getOptYn().equals("0"))) { //0이면 옵션설정 x
            // 인덱스 0:할인시작 날짜 1:할인시작 시간 2.할인종료 날짜 3.할인종료 시간 4.판매시작 날짜 5.판매시작 시간 6.판매종료 날짜 7.판매종료 시간
            //1. 상품테이블 insert

            prodDto.setDisYn("Y"); //상품진열여부
            prodDto.setDisDttmYn(r.getDisDttmYn()); //할인기간적용여부
            prodDto.setSalesDttmYn(r.getSalesDttmYn()); //판매기간적용여부
            prodDto.setSALES_DTTM_FROM((r.getDataDateTime()[4] == null ? "" : r.getDataDateTime()[4]) + "-" + (r.getDataDateTime()[5] == null ? "" : r.getDataDateTime()[5])); //판매시작 년-월-일-시-분
            prodDto.setSALES_DTTM_TO((r.getDataDateTime()[6] == null ? "" : r.getDataDateTime()[6]) + "-" + (r.getDataDateTime()[7] == null ? "" : r.getDataDateTime()[7])); //판매종료 년-월-일-시-분
            prodDto.setDcDttmFrom((r.getDataDateTime()[0] == null ? "" : r.getDataDateTime()[0]) + "-" + (r.getDataDateTime()[1] == null ? "" : r.getDataDateTime()[1])); //할인시작 년-월-일-시-분
            prodDto.setDcDttmTo((r.getDataDateTime()[2] == null ? "" : r.getDataDateTime()[2]) + "-" + (r.getDataDateTime()[3] == null ? "" : r.getDataDateTime()[3])); //할인종료 년-월-일-시-분
            prodDto.setPAYMT_YN("Y"); //결제가능여부
            prodDto.setRegYn("Y"); //상품등록상태
            prodDto.setProdStus("신상품"); //상품상태 신상품, 중고상품 등등
            prodDto.setSalesYn("Y"); //상품판매여부
            prodDto.setSalesYn("Y"); //상품진열여부
            prodDto.setProdName(r.getProdName()); //상품명
            prodDto.setBasePrc(r.getBasePrc()); //상품판매가격
            prodDto.setDisPrc(r.getDisPrc()); //상품할인가격
            prodDto.setDcUnit(r.getDcUnit()); //할인단위(%/원)
            prodDto.setDcVal(r.getDcVal()); //할인값(슷자)
            prodDto.setDisYn(r.getDisYn()); //할인유무
            prodDto.setOptYn(r.getOptYn()); //옵션적용유무 -> 이걸보고 옵션테이블에 데이터 넣을지 판단
            prodDto.setProdCd(r.getClsCd() + r.getProdStartCd());
            prodDto.setClsCd(r.getClsCd()); //분류코드

            //여기서부터 상품재고테이블
            prodStokDto.setProdCd(r.getClsCd() + (r.getProdStartCd() + 1)); //상품코드
            prodStokDto.setProdStok(r.getProdStok()); //상품재고

            //여기서부터 상품이미지 테이블
            prodImgDto.setProdCd(r.getClsCd() + (r.getProdStartCd() + 1)); //상품코드저장
            prodImgDto.setSn("1");
            prodImgDto.setImgUse("title");
            prodImgDto.setImgName(r.getImgTname());
            prodImgDto.setImgPath("/"+r.getImgTname());

            try {
                prod_rowCnt = prodService.register(prodDto); //insert
                stk_rowCnt = prodStokService.register(prodStokDto); //insert
                img_rowCnt = prodImgService.register(prodImgDto); //insert

            } catch (Exception e) {
                e.printStackTrace();
            }

            for(int i=0; i<r.getImgDname().length;i++) {
                //여기서부터 상품이미지 테이블
                prodImgDto.setProdCd(r.getClsCd() + r.getProdStartCd()) ; //상품코드저장
                prodImgDto.setSn(""+(i + 2));
                prodImgDto.setImgUse("detail");
                prodImgDto.setImgName(r.getImgDname()[i]);
                prodImgDto.setImgPath("/" + r.getImgDname()[i]);

                try {
                    img_rowCnt += prodImgService.register(prodImgDto); //insert
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

            return prod_rowCnt + stk_rowCnt + img_rowCnt;

        } else {
            //1. 옵션명 배열 개수로 옵션 수 찾기 2. 옵션수에 따라 opt_value로 for문돌리면서
            // 상품테이블, 옵션테이블, 재고테이블에 하나씩 insert.

            int optNum = r.getOptName().length; //옵션명 갯수 반환

            if (optNum == 1) {

                for (int i = 0; i < r.getOptVal1().length; i++) {
                    //1. 상품테이블 insert

                    prodDto.setDisYn("Y"); //상품진열여부
                    prodDto.setDisDttmYn(r.getDisDttmYn()); //할인기간적용여부
                    prodDto.setSalesDttmYn(r.getSalesDttmYn()); //판매기간적용여부
                    prodDto.setSALES_DTTM_FROM((r.getDataDateTime()[4] == null ? "" : r.getDataDateTime()[4]) + "-" + (r.getDataDateTime()[5] == null ? "" : r.getDataDateTime()[5])); //판매시작 년-월-일-시-분
                    prodDto.setSALES_DTTM_TO((r.getDataDateTime()[6] == null ? "" : r.getDataDateTime()[6]) + "-" + (r.getDataDateTime()[7] == null ? "" : r.getDataDateTime()[7])); //판매종료 년-월-일-시-분
                    prodDto.setDcDttmFrom((r.getDataDateTime()[0] == null ? "" : r.getDataDateTime()[0]) + "-" + (r.getDataDateTime()[1] == null ? "" : r.getDataDateTime()[1])); //할인시작 년-월-일-시-분
                    prodDto.setDcDttmTo((r.getDataDateTime()[2] == null ? "" : r.getDataDateTime()[2]) + "-" + (r.getDataDateTime()[3] == null ? "" : r.getDataDateTime()[3])); //할인종료 년-월-일-시-분
                    prodDto.setPAYMT_YN("Y"); //결제가능여부
                    prodDto.setRegYn("Y"); //상품등록상태
                    prodDto.setProdStus("신상품"); //상품상태 신상품, 중고상품 등등
                    prodDto.setSalesYn("Y"); //상품판매여부
                    prodDto.setSalesYn("Y"); //상품진열여부
                    prodDto.setProdName(r.getProdName()); //상품명
                    prodDto.setBasePrc(r.getBasePrc()); //상품판매가격
                    prodDto.setDisPrc(r.getDisPrc()); //상품할인가격
                    prodDto.setDcUnit(r.getDcUnit()); //할인단위(%/원)
                    prodDto.setDcVal(r.getDcVal()); //할인값(슷자)
                    prodDto.setDisYn(r.getDisYn()); //할인유무
                    prodDto.setOptYn(r.getOptYn()); //옵션적용유무 -> 이걸보고 옵션테이블에 데이터 넣을지 판단
                    prodDto.setProdCd(r.getClsCd() + (r.getProdStartCd()+i)); //상품코드
                    prodDto.setClsCd(r.getClsCd()); //분류코드

                    //여기서부터 상품재고테이블
                    prodStokDto.setProdCd(r.getClsCd() + (r.getProdStartCd()+i)); //상품코드
                    prodStokDto.setProdStok(BigDecimal.valueOf(Integer.parseInt(r.getOptQty()[i])));    // 옵션상품재고수량

                    //상품옵션테이블
                    prodOptValDto.setProdCd(r.getClsCd() + (r.getProdStartCd()+i)); //상품코드
                    prodOptValDto.setOptName1(r.getOptName()[0]); //상품옵션명1
                    prodOptValDto.setOptVal1(r.getOptVal1()[i]); //상품옵션값 세팅
                    prodOptValDto.setQty(BigDecimal.valueOf(Integer.parseInt(r.getOptQty()[i])));    // 옵션상품재고수량
                    prodOptValDto.setOptPrc(BigDecimal.valueOf(Integer.parseInt(r.getOptPrc()[i])));    // 옵션상품가격
                    prodOptValDto.setUseYn("Y"); //사용여부

                    //상품이미지테이블
                    prodImgDto.setProdCd(r.getClsCd() + (r.getProdStartCd()+i)); //상품코드저장
                    prodImgDto.setSn("1");
                    prodImgDto.setImgUse("title");
                    prodImgDto.setImgName(r.getImgTname());
                    prodImgDto.setImgPath("/"+r.getImgTname());

                    try {
                        prod_rowCnt = prodService.register(prodDto); //insert
                        stk_rowCnt = prodStokService.register(prodStokDto); //insert
                        opt_rowCnt = prodOptValService.register(prodOptValDto); //insert
                        img_rowCnt = prodImgService.register(prodImgDto); //insert

                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                    for (int j=0; j<r.getImgDname().length;j++) {

                        //여기서부터 상품이미지 테이블
                        prodImgDto.setProdCd(r.getClsCd() + (r.getProdStartCd() + i )); //상품코드저장
                        prodImgDto.setSn((j + 2) + "");
                        prodImgDto.setImgUse("detail");
                        prodImgDto.setImgName(r.getImgDname()[j]);
                        prodImgDto.setImgPath("/" + r.getImgDname()[j]);

                        try {
                            img_rowCnt += prodImgService.register(prodImgDto); //insert
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
                return prod_rowCnt + stk_rowCnt + opt_rowCnt + img_rowCnt;

            } else if (optNum == 2) {

                int tmpCnt = 0;

                for (int i = 0; i < r.getOptVal1().length; i++) {
                    for (int j = 0; j < r.getOptVal2().length; j++) {
                        //1. 상품테이블 insert

                        prodDto.setDisYn("Y"); //상품진열여부
                        prodDto.setDisDttmYn(r.getDisDttmYn()); //할인기간적용여부
                        prodDto.setSalesDttmYn(r.getSalesDttmYn()); //판매기간적용여부
                        prodDto.setSALES_DTTM_FROM((r.getDataDateTime()[4] == null ? "" : r.getDataDateTime()[4]) + "-" + (r.getDataDateTime()[5] == null ? "" : r.getDataDateTime()[5])); //판매시작 년-월-일-시-분
                        prodDto.setSALES_DTTM_TO((r.getDataDateTime()[6] == null ? "" : r.getDataDateTime()[6]) + "-" + (r.getDataDateTime()[7] == null ? "" : r.getDataDateTime()[7])); //판매종료 년-월-일-시-분
                        prodDto.setDcDttmFrom((r.getDataDateTime()[0] == null ? "" : r.getDataDateTime()[0]) + "-" + (r.getDataDateTime()[1] == null ? "" : r.getDataDateTime()[1])); //할인시작 년-월-일-시-분
                        prodDto.setDcDttmTo((r.getDataDateTime()[2] == null ? "" : r.getDataDateTime()[2]) + "-" + (r.getDataDateTime()[3] == null ? "" : r.getDataDateTime()[3])); //할인종료 년-월-일-시-분
                        prodDto.setPAYMT_YN("Y");     //결제가능여부
                        prodDto.setRegYn("Y");        //상품등록상태
                        prodDto.setProdStus("신상품");  //상품상태 신상품, 중고상품 등등
                        prodDto.setSalesYn("Y");      //상품판매여부
                        prodDto.setSalesYn("Y");      //상품진열여부
                        prodDto.setProdName(r.getProdName()); //상품명
                        prodDto.setBasePrc(r.getBasePrc()); //상품판매가격
                        prodDto.setDisPrc(r.getDisPrc()); //상품할인가격
                        prodDto.setDcUnit(r.getDcUnit()); //할인단위(%/원)
                        prodDto.setDcVal(r.getDcVal()); //할인값(슷자)
                        prodDto.setDisYn(r.getDisYn()); //할인유무
                        prodDto.setOptYn(r.getOptYn()); //옵션적용유무 -> 이걸보고 옵션테이블에 데이터 넣을지 판단
                        prodDto.setProdCd(r.getClsCd() + (r.getProdStartCd() + tmpCnt)); //상품코드
                        prodDto.setClsCd(r.getClsCd()); //분류코드

                        //여기서부터 상품재고테이블
                        prodStokDto.setProdCd(r.getClsCd() + (r.getProdStartCd() + tmpCnt)); //상품코드
                        prodStokDto.setProdStok(BigDecimal.valueOf(Integer.parseInt(r.getOptQty()[tmpCnt])));    // 옵션상품재고수량

                        //상품옵션테이블
                        prodOptValDto.setProdCd(r.getClsCd() + (r.getProdStartCd() + tmpCnt)); //상품코드
                        prodOptValDto.setOptName1(r.getOptName()[0]); //상품옵션명1
                        prodOptValDto.setOptName2(r.getOptName()[1]); //상품옵션명2
                        prodOptValDto.setOptVal1(r.getOptVal1()[i]); //상품옵션값1 세팅
                        prodOptValDto.setOptVal2(r.getOptVal2()[j]); //상품옵션값2 세팅
                        prodOptValDto.setQty(BigDecimal.valueOf(Integer.parseInt(r.getOptQty()[tmpCnt])));    // 옵션상품재고수량
                        prodOptValDto.setOptPrc(BigDecimal.valueOf(Integer.parseInt(r.getOptPrc()[tmpCnt])));    // 옵션상품가격
                        prodOptValDto.setUseYn("Y"); //사용여부

                        //상품이미지테이블
                        prodImgDto.setProdCd(r.getClsCd() + (r.getProdStartCd() + tmpCnt)); //상품코드저장
                        prodImgDto.setSn("1");
                        prodImgDto.setImgUse("title");
                        prodImgDto.setImgName(r.getImgTname());
                        prodImgDto.setImgPath("/"+r.getImgTname());

                        try {
                            prod_rowCnt = prodService.register(prodDto); //insert
                            stk_rowCnt = prodStokService.register(prodStokDto); //insert
                            opt_rowCnt = prodOptValService.register(prodOptValDto); //insert
                            img_rowCnt = prodImgService.register(prodImgDto); //insert

                        } catch (Exception e) {
                            e.printStackTrace();
                        }

                        for(int k=0; k<r.getImgDname().length;k++) {

                            //여기서부터 상품이미지 테이블
                            prodImgDto.setProdCd(r.getClsCd() + (r.getProdStartCd() + tmpCnt)); //상품코드저장
                            prodImgDto.setSn(""+(k + 2));
                            prodImgDto.setImgUse("detail");
                            prodImgDto.setImgName(r.getImgDname()[k]);
                            prodImgDto.setImgPath("/" + r.getImgDname()[k]);

                            try {
                                img_rowCnt += prodImgService.register(prodImgDto); //insert
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                        tmpCnt++;
                    }
                }
                return prod_rowCnt + stk_rowCnt + opt_rowCnt + img_rowCnt;

            } else {//옵션이 3개인경우

                int tmpCnt = 0;

                for (int i = 0; i < r.getOptVal1().length; i++) {
                    for (int j = 0; j < r.getOptVal2().length; j++) {
                        for (int k = 0; k < r.getOptVal3().length; k++) {

                            //1. 상품테이블 insert

                            prodDto.setDisYn("Y"); //상품진열여부
                            prodDto.setDisDttmYn(r.getDisDttmYn()); //할인기간적용여부
                            prodDto.setSalesDttmYn(r.getSalesDttmYn()); //판매기간적용여부
                            prodDto.setSALES_DTTM_FROM((r.getDataDateTime()[4] == null ? "" : r.getDataDateTime()[4]) + "-" + (r.getDataDateTime()[5] == null ? "" : r.getDataDateTime()[5])); //판매시작 년-월-일-시-분
                            prodDto.setSALES_DTTM_TO((r.getDataDateTime()[6] == null ? "" : r.getDataDateTime()[6]) + "-" + (r.getDataDateTime()[7] == null ? "" : r.getDataDateTime()[7])); //판매종료 년-월-일-시-분
                            prodDto.setDcDttmFrom((r.getDataDateTime()[0] == null ? "" : r.getDataDateTime()[0]) + "-" + (r.getDataDateTime()[1] == null ? "" : r.getDataDateTime()[1])); //할인시작 년-월-일-시-분
                            prodDto.setDcDttmTo((r.getDataDateTime()[2] == null ? "" : r.getDataDateTime()[2]) + "-" + (r.getDataDateTime()[3] == null ? "" : r.getDataDateTime()[3])); //할인종료 년-월-일-시-분
                            prodDto.setPAYMT_YN("Y"); //결제가능여부
                            prodDto.setRegYn("Y"); //상품등록상태
                            prodDto.setProdStus("신상품"); //상품상태 신상품, 중고상품 등등
                            prodDto.setSalesYn("Y"); //상품판매여부
                            prodDto.setSalesYn("Y"); //상품진열여부
                            prodDto.setProdName(r.getProdName()); //상품명
                            prodDto.setBasePrc(r.getBasePrc()); //상품판매가격
                            prodDto.setDisPrc(r.getDisPrc()); //상품할인가격
                            prodDto.setDcUnit(r.getDcUnit()); //할인단위(%/원)
                            prodDto.setDcVal(r.getDcVal()); //할인값(슷자)
                            prodDto.setDisYn(r.getDisYn()); //할인유무
                            prodDto.setOptYn(r.getOptYn()); //옵션적용유무 -> 이걸보고 옵션테이블에 데이터 넣을지 판단
                            prodDto.setProdCd(r.getClsCd() + (r.getProdStartCd() + tmpCnt)); //상품코드
                            prodDto.setClsCd(r.getClsCd()); //분류코드

                            //여기서부터 상품재고테이블
                            prodStokDto.setProdCd(r.getClsCd() + (r.getProdStartCd() + tmpCnt)); //상품코드
                            prodStokDto.setProdStok(BigDecimal.valueOf(Integer.parseInt(r.getOptQty()[tmpCnt])));    // 옵션상품재고수량

                            //상품옵션테이블
                            prodOptValDto.setProdCd(r.getClsCd() + (r.getProdStartCd() + tmpCnt)); //상품코드
                            prodOptValDto.setOptName1(r.getOptName()[0]); //상품옵션명1
                            prodOptValDto.setOptName2(r.getOptName()[1]); //상품옵션명2
                            prodOptValDto.setOptName3(r.getOptName()[2]); //상품옵션명3
                            prodOptValDto.setOptVal1(r.getOptVal1()[i]); //상품옵션값1 세팅
                            prodOptValDto.setOptVal2(r.getOptVal2()[j]); //상품옵션값2 세팅
                            prodOptValDto.setOptVal3(r.getOptVal3()[k]); //상품옵션값3 세팅
                            prodOptValDto.setQty(BigDecimal.valueOf(Integer.parseInt(r.getOptQty()[tmpCnt])));    // 옵션상품재고수량
                            prodOptValDto.setOptPrc(BigDecimal.valueOf(Integer.parseInt(r.getOptPrc()[tmpCnt])));    // 옵션상품가격
                            prodOptValDto.setUseYn("Y"); //사용여부

                            //상품이미지테이블
                            prodImgDto.setProdCd(r.getClsCd() + (r.getProdStartCd() + tmpCnt)); //상품코드저장
                            prodImgDto.setSn("1");
                            prodImgDto.setImgUse("title");
                            prodImgDto.setImgName(r.getImgTname());
                            prodImgDto.setImgPath("/"+r.getImgTname());

                            try {
                                prod_rowCnt = prodService.register(prodDto); //insert
                                stk_rowCnt = prodStokService.register(prodStokDto); //insert
                                opt_rowCnt = prodOptValService.register(prodOptValDto); //insert
                                img_rowCnt = prodImgService.register(prodImgDto); //insert

                            } catch (Exception e) {
                                e.printStackTrace();
                            }

                            for(int w=0; w<r.getImgDname().length;w++) {

                                //여기서부터 상품이미지 테이블
                                prodImgDto.setProdCd(r.getClsCd() + (r.getProdStartCd() + tmpCnt)); //상품코드저장
                                prodImgDto.setSn(""+(w + 2));
                                prodImgDto.setImgUse("detail");
                                prodImgDto.setImgName(r.getImgDname()[w]);
                                prodImgDto.setImgPath("/" + r.getImgDname()[w]);

                                try {
                                    img_rowCnt += prodImgService.register(prodImgDto); //insert
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            }
                            tmpCnt++;
                        }
                    }
                }
                return prod_rowCnt + stk_rowCnt + opt_rowCnt + img_rowCnt;
            }
        }
    }

    private boolean loginCheck(HttpServletRequest request) {
        // 1. 세션을 얻어서
        HttpSession session = request.getSession();
        // 2. 세션에 id가 있는지 확인, 있으면 true를 반환
        return session.getAttribute("id") != null;
    }
}