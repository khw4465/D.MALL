<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>상품 등록 관리자 페이지</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style id="style">
        li {
            list-style: none;
        }

        .dis_btn {
            border: 1px solid black;
            background-color: #f8f9fd;
            color: black;
            outline: none;
        }

        .dis_dropdown {
            position: absolute;
            display: inline-block;
        }

        .dis_dropdown-content {
            display: none;
            position: absolute;
            background-color: #f8f9fd;
            min-width: 23px;
            z-index: 1;
        }

        .dis_dropdown-content a {
            color: black;
            text-decoration: none;
            display: block;
        }

        .dis_dropdown-content a:hover {
            background-color: #ddd
        }

        .dis_dropdown:hover .dis_dropdown-content {
            display: block;
        }

        .dis_btn:hover,
        .dropdown:hover .dis_btn {
            background-color: white;
        }

        /* The Modal (background) */
        .modal {
            display: none;
            /* Hidden by default */
            position: fixed;
            /* Stay in place */
            z-index: 1;
            /* Sit on top */
            padding-top: 100px;
            /* Location of the box */
            left: 0;
            top: 0;
            width: 100%;
            /* Full width */
            height: 100%;
            /* Full height */
            overflow: auto;
            /* Enable scroll if needed */
            background-color: rgb(0, 0, 0);
            /* Fallback color */
            background-color: rgba(0, 0, 0, 0.4);
            /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }

        .question-button {
            display: inline-block;
            border: 1px solid #000;
            text-align: center;
            font-weight: bold;
            cursor: pointer;
            border-top-width: 0px;
            border-right-width: 0px;
            border-left-width: 0px;
            border-bottom-width: 0px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        #dis_toggle {
            display: none;
        }

        #prid_toggle {
            display: none;
        }

        #opt_toggle {
            display: none;
        }

        .box {
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }

        .box-header {
            background-color: #f1f1f1;
            padding: 10px;
            cursor: pointer;
            position: relative;
        }

        .box-content {
            display: none;
            padding: 10px;
        }

        .arrow {
            position: absolute;
            top: 50%;
            right: 10px;
            transform: translateY(-50%);
            width: 0;
            height: 0;
            border-style: solid;
            border-width: 0 5px 5px 5px;
            border-color: transparent transparent #000000 transparent;
        }

        .arrow.up {
            transform: translateY(-50%) rotate(180deg);
        }

        .category-box {
            display: flex;
            height: 250px;
        }

        .category-box .category {
            flex: 1;
            border: 1px solid #ccc;
            padding: 10px;
            margin-right: 10px;
        }

        .classification {
            border: 1px solid #0088dd;
            padding: 5px;
            text-align: center;
        }

        #productName {
            width: 500px;
            float: left;
            margin: 10px;
            display: inline;
        }

        .discount {
            border: 1px solid #0088dd;
            padding: 10px;
            text-align: center;
            margin-top: 10px;
        }

        .period {
            border: 1px solid #0088dd;
            padding: 10px;
            text-align: center;
            margin-top: 10px;
        }

        #discount {
            margin-top: 30px;
            margin-bottom: 30px;
        }

        #period {
            margin-top: 30px;
            margin-bottom: 30px;

        }

        .price_label {
            margin-right: 30px;
        }

        #productPrice {
            margin-right: 10px;
        }

        #tmp {
            margin-bottom: 10px;
        }

        #productStock {
            margin-right: 10px;
        }

        #dis_period_toggle {
            display: none;
        }

        #prid_period_toggle {
            display: none;
        }

        .btn {
            display: block;
            width: 100%;
            padding: 10px;
            font-size: 16px;
            text-align: center;
            background-color: #0088dd;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;
        }

        #opt_adjust {
            display: block;
            width: 100%;
            padding: 10px;
            font-size: 16px;
            text-align: center;
            background-color: #cccccc;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 20px;

        }

        .form-to {
            margin: 0 5px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        #won {
            margin-right: 20px;
        }

        .dropdown {
            position: relative;
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f1f1f1;
            min-width: 160px;
            overflow: auto;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown a:hover {
            background-color: #ddd;
        }

        .show {
            display: block;
        }

        .opt_btn {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            color: white;
            background-color: #3498db;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 40px;
            height: 30px;
        }

        .opt_btn:hover {
            background-color: #2980b9;
        }

        #opt_name,
        #opt_value {
            display: inline-block;
            vertical-align: top;
        }

        #opt_name {
            margin-left: 100px;
            margin-right: 200px;
        }

        #opt_value {
            margin-right: 100px;

        }

        /* #unit {
            margin-right: 50px;
            visibility: hidden;
        } */

        #opt_input {
            /* float : left; */
            margin-top: 100px;
            width: 150px;
            margin-right: 100px;
        }

        #op1_name {
            width: 180px;
        }

        #op1_value {
            width: 400px;
        }

        .option_name {
            width: 180px;
        }

        .op_value {
            width: 400px;
            float: left;
            margin-right: 10px;
        }

        #opt_menu input {
            display: block;
            margin-top: 10px;
        }

        .quty_check {
            display: inline;
        }

        .list {
            width: 80%;
            margin: auto;
            padding: 30px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            font-size: 14px;
            text-align: center;
            vertical-align: middle;
            border: 1px solid black;
        }

        td,
        th {
            border: 1px solid black;
        }

        #table-container {
            display: flex;
            justify-content: center;
        }

        table input {
            text-align: center;
            display: block;
            margin: 0 auto;
        }

        /* .L_cate {
            transition: background-color 0.3s, color 0.3s;
        } */

        .L_cate:hover {
            background-color: lightgoldenrodyellow;
        }

        #clicked_cate {
            color: darkgreen;
            margin-left: 87px;
        }

        #prod_name {
            color: darkgreen;
            margin-left: 100px;
        }

        #prod_price {
            color: darkgreen;
            margin-left: 100px;
        }

        #prod_stk {
            color: darkgreen;
            margin-left: 87px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>상품 등록</h1>
    <div class="box">
        <div class="box-header" onclick="toggleBoxContent(this)">
            복사 등록
            <span class="arrow up"></span>
        </div>
        <div class="box-content">
            <input type="checkbox" id="productCopy"> 미구현
        </div>
    </div>
    <div class="box">
        <div class="box-header" onclick="toggleBoxContent(this)">
            <span>카테고리</span><span id="clicked_cate"></span>
            <span class="arrow up"></span>
        </div>
        <div class="box-content">
            <div class="category-box">
                <div class="category" style="overflow: auto;">
                    <div class="classification">
                        대분류
                    </div>
                    <div class="L_cate" id="닭가슴살">닭가슴살&nbsp&nbsp&nbsp(P0)</div>
                    <div class="L_cate" id="도시락&볶음밥">도시락&볶음밥&nbsp&nbsp&nbsp(P1)</div>
                    <div class="L_cate" id="샐러드">샐러드&nbsp&nbsp&nbsp(P2)</div>
                    <div class="L_cate" id="음료">음료&nbsp&nbsp&nbsp(P3)</div>
                    <!-- <div class="L_cate" id="소고기">소고기&nbsp&nbsp&nbsp(P4)</div> -->
                    <!-- <div class="L_cate" id="P5">돼지&오리고기&nbsp&nbsp&nbsp(P5)</div>
                    <div class="L_cate" id="P6">닭안심살&nbsp&nbsp&nbsp(P6)</div>
                    <div class="L_cate" id="P7">베이커리&치즈&nbsp&nbsp&nbsp(P7)</div>
                    <div class="L_cate" id="P8">과자&간식&떡&nbsp&nbsp&nbsp(P8)</div>
                    <div class="L_cate" id="P9">비건식품&nbsp&nbsp&nbsp(P9)</div>
                    <div class="L_cate" id="P10">건강식품&nbsp&nbsp&nbsp(P10)</div>
                    <div class="L_cate" id="P11">반찬&밀키트&nbsp&nbsp&nbsp(P11)</div>
                    <div class="L_cate" id="P12">안주&nbsp&nbsp&nbsp(P12)</div>
                    <div class="L_cate" id="P13">소스&오일&nbsp&nbsp&nbsp(P13)</div>
                    <div class="L_cate" id="P14">펫푸드&nbsp&nbsp&nbsp(P14)</div>
                    <div class="L_cate" id="P15">운동&생활용품&nbsp&nbsp&nbsp(P15)</div>
                    <div class="L_cate" id="P16">식단&패키지&nbsp&nbsp&nbsp(P16)</div> -->
                </div>
                <div class="category" style="overflow: auto;">
                    <div class="classification">
                        중분류
                    </div>
                    <div id="m_list"></div>
                </div>
                <div class="category">
                    <div class="classification">
                        소분류
                    </div>
                </div>
                <div class="category">
                    <div class="classification">
                        세분류
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="box">
        <div class="box-header" onclick="toggleBoxContent(this)">
            <span>상품명</span><span id="prod_name"></span>
            <span class="arrow up"></span>
        </div>
        <div class="box-content">
            <input type="text" class="form-control" id="productName" oninput="char_Count(this.value)">
            <p id="characterCount">0/100</p>
        </div>
    </div>
    <div class="box">
        <div class="box-header" onclick="toggleBoxContent(this)">
            <span>판매가</span><span id="prod_price"></span>
            <span class="arrow up"></span>
        </div>
        <div class="box-content">
            <div>
                <label class="price_label" for="productPrice">판매가</label><input type="text" class="form-control"
                                                                                id="productPrice"
                                                                                oninput="input_prc(this.value)"><span
                    id="won">원</span><span
                    id=price_korean></span>
            </div>
            <hr/>
            <div id="discount">
                <label class="price_label">할인</label><span class="discount" id="dis_on"
                                                           onclick="dis_on_toggle()">설정함</span><span class="discount"
                                                                                                     id="dis_off"
                                                                                                     onclick="dis_off_toggle()">설정안함</span>
            </div>
            <hr/>
            <div id="dis_toggle">
                <div>
                    <div id="discount_spread"><label class="price_label">기본할인</label><span>판매가에서
                                즉시 할인이 가능한 유형으로 할인된 가격으로 상품을 판매할 수 있습니다.</span>
                        <div style="margin-top: 10px; margin-bottom: 10px;"><input type="text" class="dis_btn"
                                                                                   id="dis_value"
                                                                                   oninput="input_dis(this.value)"
                                                                                   style="padding-bottom: 0px;">
                            <div class="dis_dropdown">
                                <button class="dis_btn" style="border-left:1px solid #dbdde2" id="dis_unit_btn">
                                    %
                                </button>
                                <span style="margin-left:10px">할인</span>
                                <div class="dis_dropdown-content">
                                    <a class="dis_unit" id="%">%</a>
                                    <a class="dis_unit" id="원">원</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div id="tmp">
                            <input id="discount_period" type="checkbox"><label for="discount_period">특정기간만
                            할인</label>
                        </div>
                        <div id="dis_period_toggle">
                            <hr/>
                            <form id="start_dttm" style="display: inline;">
                                <label for="datepicker">할인시작 날짜 및 시간 :</label>
                                <input type="date" class="dis_start_input" id="dis_start_date"
                                       oninput="save_date_time(this.value)">
                                <input type="time" class="dis_start_input" id="dis_start_time"
                                       oninput="save_date_time(this.value)">
                                <button type="button" id="del_dis_start_data"
                                        onclick="del_DateTime(this.id)">초기화
                                </button>
                            </form>
                            <br/><br/>
                            <form id="end_dttm">
                                <label for="datepicker2">할인종료 날짜 및 시간 :</label>
                                <input type="date" class="dis_end_input" id="dis_end_date"
                                       oninput="save_date_time(this.value)">
                                <input type="time" class="dis_end_input" id="dis_end_time"
                                       oninput="save_date_time(this.value)">
                                <button type="button" id="del_dis_end_data"
                                        onclick="del_DateTime(this.id)">초기화
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
                <hr/>
                <div>
                    <p id="dis_adj_price">할인가 : 0원 (0원 할인)</p>
                </div>
            </div>
            <hr/>
            <div id="period">
                <label class="price_label">판매기간</label><span class="period" id="prid_on"
                                                             onclick="prid_on_toggle()">설정함</span><span class="period"
                                                                                                        id="prid_off"
                                                                                                        onclick="prid_off_toggle()">설정안함</span>
            </div>
            <hr/>
            <div id="prid_toggle">
                <div>
                    <div>
                        <hr/>
                        <form id="start_dttm" style="display: inline;">
                            <label for="datepicker">판매시작 날짜 및 시간 :</label>
                            <input type="date" class="sell_start_input" id="sell_start_date"
                                   oninput="save_date_time(this.value)">
                            <input type="time" class="sell_start_input" id="sell_start_time"
                                   oninput="save_date_time(this.value)">
                            <button type="button" id="del_sell_start_data"
                                    onclick="del_DateTime(this.id)">초기화
                            </button>
                        </form>
                        <br/><br/>
                        <form id="end_dttm">
                            <label for="datepicker2">판매종료 날짜 및 시간 :</label>
                            <input type="date" class="sell_end_input" id="sell_end_date"
                                   oninput="save_date_time(this.value)">
                            <input type="time" class="sell_end_input" id="sell_end_time"
                                   oninput="save_date_time(this.value)">
                            <button type="button" id="del_sell_end_data"
                                    onclick="del_DateTime(this.id)">초기화
                            </button>
                        </form>
                    </div>
                </div>
                <hr/>
            </div>
        </div>
    </div>
</div>
<div class="box">
    <div class="box-header" onclick="toggleBoxContent(this)">
        <span>재고수량</span><span id="prod_stk"></span>
        <span class="arrow up"></span>
    </div>
    <div class="box-content">
        <input type="text" class="form-control" id="productStock" oninput="input_stk(this.value)"><span>개</span>
    </div>
</div>
<div class="box">
    <div class="box-header" onclick="toggleBoxContent(this)">
        옵션
        <span class="arrow up"></span>
    </div>
    <div class="box-content">
        <div id="discount">
            <label class="price_label">옵션</label><span class="discount" id="opt_on"
                                                       onclick="opt_on_toggle()">설정함</span><span class="discount"
                                                                                                 id="opt_off"
                                                                                                 onclick="opt_off_toggle()">설정안함</span>
        </div>
        <hr/>
        <div id="opt_toggle">
            <div>
                <p>옵션명개수</p>
                <!-- The Modal -->
                <div id="myModal" class="modal">
                    <!-- Modal content -->
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <p>옵션에 따라 상품 코드가 각각 다르게 부여되는데, 동일한 번호로 상품 코드를 받고 싶으시다면 체크해 주세요.(ex 재고관리에 사용)</p>
                    </div>
                </div>
                <div class="dropdown">
                    <button onclick="myFunction()" class="dropbtn" id="opt_num">1개▽</button>
                    <div id="myDropdown" class="dropdown-content" onclick="opt_num2()">
                        <a class="opt_list" id="1">1개</a>
                        <a class="opt_list" id="2">2개</a>
                        <a class="opt_list" id="3">3개</a>
                    </div>
                </div>
            </div>
            <hr/>
            <div>
                <span id="opt_input" class="opt_menu">옵션입력</span>
                <span id="opt_menu">
                        <div class="opt_menu">
                            <span id="opt_name">옵션명
                                <div>
                                    <div id="option_name">
                                        <input type="text" id="opt0" class="op_name" oninput="opt_remember(this.id)"
                                               placeholder="예시 : 맛" style="color: gray;">
                                    </div>
                                    <button type="submit" id="opt_adjust" onclick="opt_menu_adjust()">옵션목록으로 적용</button>
                                </div>
                            </span>
                            <span style="display: inline-block">
                                <div>옵션값</div>
                                <div id="op_value">
                                    <div style="display: flex; align-items: center; justify-content: center;">
                                        <input type="text" id="opt1" class="op_value" oninput="opt_remember(this.id)"
                                               placeholder="예시 : 달콤한맛, 매운맛(,로 구분)" style="color: gray;"><span
                                            id="quantity"><label for="quty_check">동일상품코드부여</label><input type="checkbox"
                                                                                                         class="same_prod_cd"
                                                                                                         id="check1"
                                                                                                         style="display: inline">
                                            <div class="question-button">?</div>
                                        </span><button class="opt_btn" id="plus-button" style='margin-left:10px;'
                                                       onclick="opt_num2(2)">+</button>
                                    </div>
                                </div>
                            </span>
                        </div>
                        <hr/>
                        <div>옵션목록</div>
                        <section class="list">
                            <div id="table-container">
                                <table id="table" border:1px;>
                                    <form id="make_table">
                                        <tr>
                                            <th rowspan="2"><input type="checkbox" id="all"></th>
                                            <th id="tb_opt_name" colspan="2">옵션명</th>
                                            <th rowspan="2">옵션가</th>
                                            <th rowspan="2">재고수량</th>
                                            <th rowspan="2">판매상태</th>
                                            <th rowspan="2">상품코드</th>
                                            <th rowspan="2">상품수량</th>
                                            <th rowspan="2">사용여부</th>
                                            <th rowspan="2">삭제</th>
                                        </tr>
                                        <tr id="name_arr">
                                            <td style="visibility:hidden;">""</td>
                                        </tr>
                                    </form>
                                </table>
                            </div>
                        </section>
                        <button onclick="exportTableToExcel('table', 'table_data')">Export to Excel1</button>
                </span>
            </div>
        </div>
    </div>
</div>
</div>
<div class="box">
    <div class="box-header" onclick="toggleBoxContent(this)">
        상품 이미지
        <span class="arrow up"></span>
    </div>
    <div class="box-content">
        <h3>대표이미지(썸네일)</h3>
<%--        <form action = "${contextPath}/upload" method = "post" enctype = "multipart/form-data">--%>
        <input type="file" class="real-upload" id="title_img" name="uploadT" accept="image/*" required>
        <li class="image-preview"></li>
        <hr/>
        <h3 id="add_img_length">추가이미지(0/9)</h3>
        <input type="file" class="real-upload" id="add_img" name = "uploadD" accept="image/*" required multiple>
        <li class="image-preview"></li>
<%--        </form>--%>
    </div>
</div>
<form id="form" action="/" method="get">
</form>
<button type="submit" class="btn" id="reg_btn">등록</button>
</div>
<script>

    let currentDate = new Date(); //현재날짜 데이터 가져오기

    let dateInput = document.getElementById("dis_start_date"); //날짜데이터1

    let dateInput2 = document.getElementById("dis_end_date"); //날짜데이터2

    let dateInput3 = document.getElementById("sell_start_date"); //날짜데이터3

    let dateInput4 = document.getElementById("sell_end_date"); //날짜데이터4

    dateInput.min = formatDate(currentDate); //현재날짜이전은 선택못하게

    dateInput2.min = formatDate(currentDate); //현재날짜이전은 선택못하게

    dateInput3.min = formatDate(currentDate); //현재날짜이전은 선택못하게

    dateInput4.min = formatDate(currentDate); //현재날짜이전은 선택못하게

    // 날짜를 "YYYY-MM-DD" 형식으로 변환하는 함수
    function formatDate(date) {
        var year = date.getFullYear();
        var month = ("0" + (date.getMonth() + 1)).slice(-2);
        var day = ("0" + date.getDate()).slice(-2);
        return year + "-" + month + "-" + day;
    }

    let go_main = document.getElementById("form"); //등록에 성공할시 메인으로 이동시켜주는 form태그 주소

    let cls_count; //해당카테고리에 들어있는 상품 숫자 저장용 변수

    let clsdata; //서버로 분류코드를 전달하기위한 객체

    let regData; //서버로 등록데이터를 전달하기위한 객체

    let prodStartCd ; //등록할때 넘겨줄 상품코드 시작번호

    let regYn ; //등록이 잘됐는지 여부. 잘되면1 안되면 0

    let reg_btn = document.getElementById("reg_btn"); //
    reg_btn.addEventListener("click", prod_reg);

    function prod_reg() {
        regData = {
            prodStartCd : prodStartCd, //상품코드 시작번호
            clsCd: cate_cd, //카테고리코드
            prodName: prod_name_value, //상품명
            basePrc: recent_prc_num, //판매가격
            disPrc: caled_dis_price, //할인가격
            dcUnit: selected_dis_unit, //할인단위
            dcVal: recent_dis_num, //할인값(숫자)
            dataDateTime: dataDateTime, //할인,판매 시작&종료 일시 데이터. 배열
            prodStok: recent_stk_num, //기본재고수량
            optName: opt_name, //옵션명. 배열
            optVal1: opt_value1, //옵션1 값
            optVal2: opt_value2, //옵션2 값
            optVal3: opt_value3, //옵션3 값
            optPrc: opt_prc_data, //옵션가격 데이터. 배열
            optQty: opt_qty_data, //옵션 재고수량 데이터. 배열
            disYn: check_dis, //할인유무. 하면1 안하면0
            optYn: check_opt_adjust, //옵션적용유무. 하면1 안하면0
            salesDttmYn: check_sell_period, //판매기간 설정 여부
            disDttmYn: check_dis_period, //할인기간 설정여부
            imgTname: imgT_name, //값
            imgDname: imgD_name //배열
        }

        $.ajax({
            type: 'POST',
            url: '/prod/reg',
            headers: {"content-type": "application/json"},
            dataType: 'text',
            data: JSON.stringify(regData),
            success: function (result) {// 서버로부터 응답이 도착하면 호출될 함수

               regYn = JSON.parse(result);

                go_main.submit();

               // alert("typeof(regYn)" + typeof(regYn));  number
                //a태그 하나 클릭하게해서 index로 보내기
            },
            error: function () {
                alert("error reg")
            } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()
    }

    /* When the user clicks on the button,
    toggle between hiding and showing the dropdown content */
    function myFunction() {
        document.getElementById("myDropdown").classList.toggle("show");
    }

    // Close the dropdown if the user clicks outside of it
    window.onclick = function (event) {
        if (!event.target.matches('.dropbtn')) {
            var dropdowns = document.getElementsByClassName("dropdown-content");
            var i;
            for (i = 0; i < dropdowns.length; i++) {
                var openDropdown = dropdowns[i];
                if (openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
        }
    }

    let enroll = document.getElementById("enroll"); //상품등록버튼 요소 가져옴

    let add_img_length = document.getElementById("add_img_length"); //추가이미지 개수 보여줄 주소 가져옴

    let add_img = document.getElementById("add_img"); //추가이미지 요소 주소 가져옴

    let same_prod_cd; //동일상품코드부여 체크박스 요소 주소 저장용 변수

    let check_dis = 0; //할인할지말지 체크용 변수. 할인하면 1, 안하면 0 (할인유무)

    let check_sell_period = 0; //판매기간 설정 할지 안할지 체크용 변수. 판매기간 설정하면 1, 안하면 0 (판매기간설정)

    const dis_adj_price = document.getElementById("dis_adj_price"); //할인적용된 가격 보여줄 요소 주소 가져옴

    const dis_unit_btn = document.getElementById("dis_unit_btn"); //할인 단위 선택 버튼 주소 가져옴

    const dis_unit = document.getElementsByClassName("dis_unit"); //할인 단위 선택 리스트들 주소 가져옴(%,원)

    const prid_toggle = document.getElementById("prid_toggle"); //판매기간 펼치는 요소 주소 가져옴

    const prid_on = document.getElementById("prid_on"); //판매기간설정함 요소 주소 가져옴

    const prid_off = document.getElementById("prid_off"); //판매기간설정안함 요소 주소 가져옴

    const prod_price = document.getElementById("prod_price"); //상품가격 펼치는 요소 주소 가져옴

    const prod_name = document.getElementById("prod_name"); //상품명 펼치는 요소 주소 가져옴

    const L_cate = document.getElementsByClassName("L_cate"); //대분류 카테고리 요소 주소 가져옴

    const productPrice = document.getElementById("productPrice"); //상품가격입력 요소 주소 가져옴

    const price_korean = document.getElementById("price_korean"); //상품 가격 한글변환 요소 주소 가져옴

    const dis_on = document.getElementById("dis_on"); //할인설정함 요소 주소 가져옴

    const dis_off = document.getElementById("dis_off"); //할인설정안함 요소 주소 가져옴

    const opt_on = document.getElementById("opt_on"); //옵션설정함 요소 주소 가져옴

    const opt_off = document.getElementById("opt_off"); //옵션설정안함 요소 주소 가져옴

    const discount_period = document.getElementById("discount_period"); //특정기간만 할인할지 요소 주소 가져옴

    let check_dis_period = 0; //특정기간만 할인할지 선택 저장용 변수

    const dis_period_toggle = document.getElementById("dis_period_toggle"); //할인기간 설정시 펼쳐질 요소 주소 가져옴

    const opt_num = document.getElementById("opt_num"); //옵션개수 리스트 요소 주소 가져옴

    const option_name = document.getElementById("option_name"); //옵션명 폼태그 넣어줄 요소 주소 가져옴

    const op_value = document.getElementById("op_value"); //옵션값 폼태그 넣어줄 요소 주소 가져옴

    let check_opt_adjust = 0; //옵션적용할지말지 선택 저장용 변수 옵션적용하면1 안하면 0

    let opt_row = 1; //옵션 row 수

    let tmp_text = ""; // 옵션명 내부 innerText만들어줄 tmp

    let tmp_text2 = ""; // 옵션값 내부 innerText만들어줄 tmp2

    const opt_list = document.getElementsByClassName("opt_list"); //옵션 리스트 요소 주소 가져옴

    const opt_adjust = document.getElementById("opt_adjust"); //옵션목록 적용 요소 주소 가져옴

    let opt_name = []; //옵션명

    let opt_name_num; //옵션명 개수 넣을 변수

    let arr_tmp = [];

    let opt_value1 = []; //옵션명1에 해당하는 옵션값

    let opt_value2  = []; //옵션명2에 해당하는 옵션값

    let opt_value3  = []; //옵션명3에 해당하는 옵션값

    let opt_normal_value1; //옵션명1에 해당하는 옵션값(가공전)

    let opt_normal_value2; //옵션명2에 해당하는 옵션값(가공전)

    let opt_normal_value3; //옵션명3에 해당하는 옵션값(가공전)

    let opt_value1_string; //옵션1 값의 string(가공후)

    let opt_value2_string; //옵션2 값의 string(가공후)

    let opt_value3_string; //옵션3 값의 string(가공후)

    let event_tmp_num; //이벤트 발생시 넘겨줄 숫자

    //옵션적용 실행결과 : 3개면 옵션명배열에 3개 들어감.
    //value는 각각 opt_value1, opt_value2, opt_value3만 남는다.

    let tb_opt_name = document.getElementById("tb_opt_name"); //테이블 태그의 옵션명 개수만큼 길이 늘릴 요소 주소 가져옴

    let name_arr = document.getElementById("name_arr"); //옵션명 넣을 요소 주소 가져옴

    let opt_input_arr = ["", "", "", "", "", ""]; //옵션 input태그의 내용 저장해놓을 배열

    let before_opt = 1; //옵션명개수 저장해놓을 변수

    let prevent_opt_adjust = 0; //옵션명, 옵션값 다 채워지지 않으면 클릭못하게 막는 변수

    let cate_L_cd = new Map([['닭가슴살', 'P0'], ['도시락&볶음밥', 'P1'], ['샐러드', 'P2'], ['음료', 'P3']]); //대분류 카테고리 코드

    let cate_M_list = new Map([['닭가슴살', ['프로', '스테이크', '스팀&소프트', '소스닭가슴살', '슬라이스', '훈제', '생닭가슴살']], ['도시락&볶음밥', ['다이어트도시락', '간편도시락', '비건도시락', '볶음밥', '덮밥&컵밥', '주먹밥']],
        ['샐러드', ['알뜰샐러드', '토핑샐러드', '과일']], ['음료', ['제로음료', '우유&요거트', '프로틴쉐이크', '프로틴음료', '보충제', '커피&차', '주스']]]); //중분류 카테고리 목록

    let cate_M_cd = new Map([['프로', 'P001'], ['스테이크', 'P002'], ['스팀&소프트', 'P003'], ['소스닭가슴살', 'P004'], ['슬라이스', 'P005'], ['훈제', 'P006'], ['생닭가슴살', 'P007'],
        ['다이어트도시락', 'P101'], ['간편도시락', 'P102'], ['비건도시락', 'P103'], ['볶음밥', 'P104'], ['덮밥&컵밥', 'P105'], ['주먹밥', 'P106'], ['알뜰샐러드', 'P201'], ['토핑샐러드', 'P202'],
        ['과일', 'P203'], ['제로음료', 'P301'], ['우유&요거트', 'P302'], ['프로틴쉐이크', 'P303'], ['프로틴음료', 'P304'], ['보충제', 'P305'], ['커피&차', 'P306'], ['주스', 'P307']
    ]); //중분류 카테고리 코드

    let cate_M_name = new Map([['P001', '프로'], ['P002', '스테이크'], ['P003', '스팀&소프트'], ['P004', '소스닭가슴살'], ['P005', '슬라이스'], ['P006', '훈제'],
        ['P007', '생닭가슴살'], ['P101', '다이어트도시락'], ['P102', '간편도시락'], ['P103', '비건도시락'], ['P104', '볶음밥'], ['P105', '덮밥&컵밥'], ['P106', '주먹밥'],
        ['P201', '알뜰샐러드'], ['P202', '토핑샐러드'],
        ['P203', '과일'], ['P301', '제로음료'], ['P302', '우유&요거트'], ['P303', '프로틴쉐이크'], ['P304', '프로틴음료'], ['P305', '보충제'], ['P306', '커피&차'], ['P307', '주스']
    ]); //중분류 카테고리 이름


    let tmp_cate_check = ""; //카테고리 색깔 체크용 변수

    let large_cate; //대분류명 저장해놓을 변수

    let medium_cate; //중분류명 저장해놓을 변수

    let tmp_md_cate = ""; //중분류 목록 저장할 변수

    const clicked_cate = document.getElementById("clicked_cate"); //카테고리에 선택한 카테고리 이름, 분류코드 생성해서 보여줄 변수

    let prevent_fastClick = 0;

    let medium_list; //class 명이 medium_list인 리스트 요소 주소 저장할 변수

    let prev_m_cate = ""; //중분류 클릭하면 해당 요소 id 저장할 변수

    let cate_cd; //클릭된 카테고리 저장할 코드

    let clicked_cate_name; //클릭된 카테고리 저장할 변수 // 이걸 화면에 보여주고, 나중에 맵으로 분류코드 가져와서 옵션쪽에서 상품코드 만들어주는데 사용

    //포기... style태그의 innerHTML을 계속 넣어주려했는데 동작이 이상함..
    // let styleTag = document.getElementById("style"); //style태그 요소 주소 가져옴

    // let abc = Array.from(styleTag);

    // //대분류, 중분류 옵션에 적용할 hover 이벤트 문자열
    // let hover_event = '.L_cate:hover {background-color: lightgoldenrodyellow;} .medium_list:hover { background-color: lightgoldenrodyellow; }';

    //let first_styleTag = styleTag.innerHTML + hover_event; //기존의 style태그의 innerHTML과 hover_event를 결합.

    let prevent_fastClick2 = 0; //빠른클릭 방지 변수. 카테고리 중분류 선택에서 사용

    const make_M_list = document.getElementById("m_list"); //중분류 목록 생성해서 보여줄 변수

    let recent_prc = ""; //최근 입력한 판매가격 문자열 저장할 변수

    let recent_prc_num = 0; //최근 입력한 판매가격 숫자 저장할 변수

    let recent_stk = ""; //최근 입력한 상품재고 문자열 저장할 변수. (입력되면 숫자로 들어옴)

    let recent_stk_num; //최근 입력한 상품재고 숫자 저장할 변수

    let recent_dis = "" //최근 입력한 할인값 문자열 저장할 변수

    let recent_dis_num = 0; //최근 입력한 할인값 숫자 저장할 변수

    let selected_dis_unit = "%"; //선택된 할인 단위(%,원) 저장할 변수

    let caled_dis_price = 0; //할인이 적용된 가격 저장할 변수 num

    let dataDateTime = ["","","","","","","",""]; //날짜 및 시간 저장할 변수. //인덱스 0:할인시작 날짜 //1:할인시작 시간 //2.할인종료 날짜 //3.할인종료 시간
    //4.판매시작 날짜 5.판매시작 시간 6.판매종료 날짜 7.판매종료 시간

    // let dis_start_date = document.getElementById("dis_start_date"); //할인시작 날짜 입력 요소 가져옴

    // let dis_start_time = document.getElementById("dis_start_time"); //할인시작 시간 입력 요소 가져옴

    // let dis_end_date = document.getElementById("dis_end_date"); //할인종료 날짜 입력 요소 가져옴

    // let dis_end_time = document.getElementById("dis_end_time"); //할인종료 시간 입력 요소 가져옴

    // let sell_start_date = document.getElementById("sell_start_date"); //판매시작 날짜 입력 요소 가져옴

    // let sell_start_time = document.getElementById("sell_start_time"); //판매시작 시간 입력 요소 가져옴

    let dis_start_input = document.querySelectorAll('.dis_start_input'); //할인시작 날짜 및 시간 입력 요소 가져옴 (초기화할때 씀)

    let dis_end_input = document.querySelectorAll('.dis_end_input'); //할인종료 날짜 및 시간 입력 요소 가져옴 (초기화할때 씀)

    let sell_start_input = document.querySelectorAll('.sell_start_input') //판매시작 날짜 및 시간 입력 요소 가져옴 (초기화할때 씀)

    let sell_end_input = document.querySelectorAll('.sell_end_input') //판매종료 날짜 및 시간 입력 요소 가져옴 (초기화할때 씀)

    let prod_name_value; //입력된 상품명 저장용 변수

    let opt_prc_data = []; //옵션가격 데이터 저장용 변수

    let opt_qty_data = []; //옵션수량 저장용 변수

    let input_td; //클릭된 테이블의 요소의 주소(옵션가 or 재고수량)

    let tmp_value_data; //테이블태그 바꿀때 데이터 넣어둘 tmp

    let imgDataD; //상세이미지 데이터 전송할 변수

    let imgDataT; //대표이미지 데이터 전송할 변수

    let tmp_imgAdress; //이미지 업로드 주소 저장할 변수

    let imgT_name = ""; //대표이미지 이름 저장용 변수

    // let imgT_wid; //대표이미지 가로사이즈 저장용 변수
    //
    // let imgT_hei; //대표이미지 세로사이즈 저장용 변수

    let imgD_name = []; //상세이미지 이름 저장용 변수

    // let imgD_wid = []; //상세이미지 가로사이즈 저장용 변수
    //
    // let imgD_hei = []; //상세이미지 세로사이즈 저장용 변수




    //id에 해당하는 요소의 value를 ""로 초기화하는 함수
    function clear_restore_stk(id) {
        document.getElementById(id).value = recent_stk;
    }

    function clear_restore_prc(id) {
        document.getElementById(id).value = recent_prc;
    }

    function clear_restore_dis(id) {
        document.getElementById(id).value = recent_dis;
    }

    //옵션으로 적용버튼 누르면 호출되는 함수
    function opt_menu_adjust() {

        if (prevent_opt_adjust === 0) return;

        opt_prc_data = []; //옵션 가격 데이터 초기화

        opt_qty_data = []; //옵션 재고수량 데이터 초기화

        const op_name = document.getElementsByClassName("op_name");

        const op_value = document.getElementsByClassName("op_value");

        //  alert(typeof(op_value)); //object

        for (let i = 0; i < op_name.length; i++) {
            opt_name[i] = op_name[i].value; //옵션이 3개면 옵션명이 3개 들어가겠지.
        }

        // alert("op_value[0].value"+op_value[0].value);
        //alert("typeof(op_value[0].value)"+typeof(op_value[0].value)); //string

        for (let i = 0; i < op_value.length; i++) {
            if (i === 0) {
                opt_value1 = op_value[i].value.split(','); //','를 구분자로 쪼개서 배열로 반환
            }
            if (i === 1) {
                opt_value2 = op_value[i].value.split(',');
            }
            if (i === 2) {
                opt_value3 = op_value[i].value.split(',');
            }
        }

        //alert("테스트 1"); //통과

        if (opt_value1 !== undefined) {
            for (let i = 0; i < opt_value1.length; i++) {
                opt_value1[i] = opt_value1[i].trim(); //좌우공백제거
            }
            let set = new Set(opt_value1); //중복제거
            opt_value1 = [...set];
            op_value[0].value = ""; //옵션값 input태그 초기화
            for (let i = 0; i < opt_value1.length; i++) {
                if (opt_value1[i] !== "" || opt_value1[i] !== " " || opt_value1[i] !== "," || opt_value1[i] !== undefined || opt_value1[i] !== '') arr_tmp.push(opt_value1[i]);
            }
            opt_value1 = arr_tmp; //opt_value1 은 배열
            arr_tmp = [];
            opt_value1_string = opt_value1.join(',');
            while (opt_value1_string.includes(',,')) {
                opt_value1_string = opt_value1_string.replace(',,', ',');
            }
            if (opt_value1_string.charAt(0) === ',') {
                opt_value1_string = opt_value1_string.substring(1);
            }
            // opt_value1_string = opt_value1_string.replace(',,',',');
            if (opt_value1_string.charAt(opt_value1_string.length - 1) === ',') {
                opt_value1_string = opt_value1_string.slice(0, -1);
            }
            op_value[0].value = opt_value1_string;
            opt_input_arr[1] = opt_value1_string;
            opt_value1 = opt_value1_string.split(',');

            for (let i = 0; i < opt_value1.length; i++) {
                opt_prc_data[i] = 0;
                opt_qty_data[i] = 0;
            }
        }

        if (op_value.length > 1 && opt_value2 !== undefined) {
            for (let i = 0; i < opt_value2.length; i++) {
                opt_value2[i] = opt_value2[i].trim();
            }
            let set = new Set(opt_value2);
            opt_value2 = [...set];
            op_value[1].value = "";
            for (let i = 0; i < opt_value2.length; i++) {
                if (opt_value2[i] !== "" || opt_value2[i] !== " " || opt_value2[i] !== "," || opt_value2[i] !== undefined || opt_value2[i] !== '') arr_tmp.push(opt_value2[i]);
            }
            opt_value2 = arr_tmp;
            arr_tmp = [];
            opt_value2_string = opt_value2.join(',');
            while (opt_value2_string.includes(',,')) {
                opt_value2_string = opt_value2_string.replace(',,', ',');
            }
            if (opt_value2_string.charAt(0) === ',') {
                opt_value2_string = opt_value2_string.substring(1);
            }
            if (opt_value2_string.charAt(opt_value2_string.length - 1) === ',') {
                opt_value2_string = opt_value2_string.slice(0, -1);
            }
            op_value[1].value = opt_value2_string;
            opt_input_arr[3] = opt_value2_string;
            opt_value2 = opt_value2_string.split(',');

            for (let i = 0; i < opt_value1.length * opt_value2.length; i++) {
                opt_prc_data[i] = 0;
                opt_qty_data[i] = 0;
            }
        }

        if (op_value.length > 2 && opt_value3 !== undefined) {
            for (let i = 0; i < opt_value3.length; i++) {
                opt_value3[i] = opt_value3[i].trim();
            }
            let set = new Set(opt_value3);
            opt_value3 = [...set];
            op_value[2].value = "";
            for (let i = 0; i < opt_value3.length; i++) {
                if (opt_value3[i] !== "" || opt_value3[i] !== " " || opt_value3[i] !== "," || opt_value3[i] !== undefined || opt_value3[i] !== '') arr_tmp.push(opt_value3[i]);
            }
            opt_value3 = arr_tmp;
            arr_tmp = [];
            opt_value3_string = opt_value3.join(',');
            while (opt_value3_string.includes(',,')) {
                opt_value3_string = opt_value3_string.replace(',,', ',');
            }
            if (opt_value3_string.charAt(0) === ',') {
                opt_value3_string = opt_value3_string.substring(1);
            }
            if (opt_value3_string.charAt(opt_value3_string.length - 1) === ',') {
                opt_value3_string = opt_value3_string.slice(0, -1);
            }
            op_value[2].value = opt_value3_string;
            opt_input_arr[5] = opt_value3_string;
            opt_value3 = opt_value3_string.split(',');

            for (let i = 0; i < opt_value1.length * opt_value2.length * opt_value3.length; i++) {
                opt_prc_data[i] = 0;
                opt_qty_data[i] = 0;
            }
        }

        tb_opt_name.setAttribute("colspan", opt_name.length);

        adjust_table(); //옵션으로 적용할때마다 새로운 테이블 만들어서 제공
        alert("옵션목록으로 적용되었습니다.");

    }

    let table = document.getElementById("table");
    let tmp_table = "";
    let tmp_table_num = 0;

    function adjust_table() {

        table.innerHTML = ""; //기존의 내용 제거

        tmp_table += "<tr>" +
            "<th rowspan='2'>" + "<input type='checkbox' id='all'></th>" +
            "<th id='tb_opt_name' colspan='" + opt_name.length + "'>옵션명</th>" +
            "<th rowspan='2'>옵션가</th>" +
            "<th rowspan='2'>재고수량</th>" +
            "<th rowspan='2'>판매상태</th>" +
            "<th rowspan='2'>상품코드</th>" +
            "<th rowspan='2'>사용여부</th>" +
            "<th rowspan='2'>삭제</th>" +
            "</tr>" +
            "<tr>";

        for (let i = 0; i < opt_name.length; i++) {
            tmp_table += "<td>" + opt_name[i] + "</td>";
        }
        tmp_table += "</tr>";

        switch (opt_name.length) {
            case 1:
                for (let i = 0; i < opt_value1.length; i++) {
                    tmp_table += "<tr><td>" + "<input type='checkbox' id='" + tmp_table_num + "'></td>" +
                        "<td>" + opt_value1[i] + "</td>" +
                        "<td id='opt_prc" + tmp_table_num + "' oninput = 'table_data(this.value)' contenteditable='true'> 0 </td>" +
                        "<td id='opt_qty" + tmp_table_num + "' oninput = 'table_data(this.value)' contenteditable='true'> 0 </td>" +
                        "<td> 판매중 </td>" +
                        "<td>" + cate_cd + cls_count + " </td>" +
                        "<td> Y </td>" +
                        "<td>" + "<button class='table_btn' id='table_btn" + tmp_table_num + "'>x</button></td></tr>";
                    tmp_table_num++;
                    cls_count++;
                }

                tmp_table_num = 0;
                break;

            case 2:
                for (let i = 0; i < opt_value1.length; i++) {
                    for (let j = 0; j < opt_value2.length; j++) {
                        tmp_table += "<tr><td>" + "<input type='checkbox' id='" + tmp_table_num + "'></td>" +
                            "<td>" + opt_value1[i] + "</td>" +
                            "<td>" + opt_value2[j] + "</td>" +
                            "<td id='opt_prc" + tmp_table_num + "' oninput = 'table_data(this.value)' contenteditable='true' > 0 </td>" +
                            "<td id='opt_qty" + tmp_table_num + "' oninput = 'table_data(this.value)' contenteditable='true'> 0 </td>" +
                            "<td> 판매중 </td>" +
                            "<td>" + cate_cd + cls_count + " </td>" +
                            "<td> Y </td>" +
                            "<td>" + "<button class='table_btn' id='table_btn" + tmp_table_num + "'>x</button></td></tr>";
                        tmp_table_num++;
                        cls_count++;
                    }
                }

                tmp_table_num = 0;
                break;

            case 3:
                for (let i = 0; i < opt_value1.length; i++) {
                    for (let j = 0; j < opt_value2.length; j++) {
                        for (let k = 0; k < opt_value3.length; k++) {
                            tmp_table += "<tr ><td>" + "<input type='checkbox' id='" + tmp_table_num + "'></td>" +
                                "<td>" + opt_value1[i] + "</td>" +
                                "<td>" + opt_value2[j] + "</td>" +
                                "<td>" + opt_value3[k] + "</td>" +//oninput="input_prc(this.value)"
                                "<td id='opt_prc" + tmp_table_num + "' oninput = 'table_data(this.value)' contenteditable='true' > 0 </td>" +
                                "<td id='opt_qty" + tmp_table_num + "' oninput = 'table_data(this.value)' contenteditable='true' > 0 </td>" +
                                "<td> 판매중 </td>" +
                                "<td>" + cate_cd + cls_count + "</td>" +
                                "<td> Y </td>" +
                                "<td>" + "<button class='table_btn' id='table_btn" + tmp_table_num + "'>x</button></td></tr>";
                            tmp_table_num++;
                            cls_count++;
                        }
                    }
                }

                tmp_table_num = 0;
                break;
        }

        table.innerHTML = tmp_table;
        tmp_table = "";

        same_prod_cd = document.getElementsByClassName("same_prod_cd"); //동일상품코드부여 체크박스 주소 가져옴
    }

    //옵션테이블에서 옵션가와 재고수량이 입력되었을때 실행될 함수
    function table_data(value) {
        let tmp_id = event.currentTarget.id; //입력된 td태그의 id값 가져오기

        input_td = document.getElementById(event.currentTarget.id);

        tmp_value_data = input_td.innerText;  //바뀐값이 들어감

        //console.log(typeof (tmp_id)); //opt_prc  or  opt_qty 글자수로 쪼개. 앞에꺼 + 뒤에꺼 인덱스
        let id_String = new String(tmp_id);
        let id_array = id_String.substring(0, 7); //어떤 데이터인지
        let tmp_id_index = id_String.substring(7, 8); //인덱스
        let id_index = parseInt(tmp_id_index);

        switch (id_array) {

            case 'opt_prc': //입력된곳이 옵션가일때
                opt_prc_data[id_index] = tmp_value_data;
                break;

            case 'opt_qty': //입력된곳이 재고수량일때
                opt_qty_data[id_index] = tmp_value_data;
                break;
        }
    }


    function toggleBoxContent(element) {
        var boxContent = element.nextElementSibling;
        var arrow = element.querySelector('.arrow');
        if (window.getComputedStyle(boxContent).display === 'none' || window.getComputedStyle(boxContent).display === '') { //if문 조건에 문자열일때
            boxContent.style.display = 'block';
            arrow.classList.remove('up');
        } else {
            boxContent.style.display = 'none';
            arrow.classList.add('up');
        }
    }

    function opt_num2(e) {
        // const opt_id0 = document.getElementById("opt0");

        // const opt_id1 = document.getElementById("opt1");

        // const opt_id2 = document.getElementById("opt2");

        // const opt_id3 = document.getElementById("opt3");

        // const opt_id4 = document.getElementById("opt4");

        // const opt_id5 = document.getElementById("opt5");

        //let tmp = event.target.innerText;
        opt_num.innerText = tmp;
        tmp_text = "";
        tmp_text2 = "";

        if (event.target.id === "1" || e === 1) {
            tmp_text = "<input type='text' id='opt0' class='op_name' oninput='opt_remember(this.id)' placeholder='예시 : 맛' style='color: gray'>"
            tmp_text2 = "<div style='display: flex; align-items: center; justify-content: center; '>" +
                "<input type='text' id='opt1' class='op_value' oninput='opt_remember(this.id)' placeholder='예시 : 달콤한맛, 매운맛(,로 구분)' style='color: gray'>" + "<span" +
                " id='quantity'><label for='quty_check'>동일상품코드부여</label><input type='checkbox'" +
                " class = 'same_prod_cd' id='check1' style='display: inline'>" + "<div class='question-button'>?</div>" + "</span>" + "<button class='opt_btn' style='margin-left:10px' onclick='opt_num2(2)'>+</button>" +
                "</div>";

            option_name.innerHTML = tmp_text;
            op_value.innerHTML = tmp_text2;
            opt_num.innerText = "1개▽";

            //지금여기까지만 하면 태그만 만들어줌. 안에 내용 추가.
            const opt_id0 = document.getElementById("opt0");

            const opt_id1 = document.getElementById("opt1");

            opt_id0.value = opt_input_arr[0];
            opt_id1.value = opt_input_arr[1];
            opt_id0.style.color = 'black';
            opt_id1.style.color = 'black';

            before_opt = 1;

            for (let i = 0; i < opt_input_arr.length; i++) {
                if (i > 1) {
                    opt_input_arr[i] = "";
                }
            }

            opt_list_adjust();

            opt_name.length = 1;

            // Get the modal
            var modal = document.getElementById("myModal");

            // Get the button that opens the modal
            var question_button = document.getElementsByClassName("question-button");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the modal
            for (let i = 0; i < question_button.length; i++) {
                question_button[i].onclick = function () {
                    modal.style.display = "block";
                }
            }


            // When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal.style.display = "none";
            }
        } else if (event.target.id === "2" || e === 2) {
            for (let i = 0; i < 2; i++) {
                if (i === 0) {
                    tmp_text += "<input type='text' id='opt0' class='op_name' oninput='opt_remember(this.id)' placeholder='예시 : 맛' style='color: gray'>"
                    tmp_text2 += "<div style='display: flex;' " + ">" +
                        "<input type='text' id='opt1' class='op_value' oninput='opt_remember(this.id)' placeholder='예시 : 달콤한맛, 매운맛(,로 구분)' style='color: gray'>" + "<span" +
                        "id='quantity'><label for='quty_check'>동일상품코드부여</label><input type='checkbox'" +
                        "class = 'same_prod_cd' id='check1' style='display: inline'>" + "<div class='question-button'>?</div>" +
                        "</span " + ">" +
                        "</div>"
                }
                if (i === 1) {
                    tmp_text += "<input type='text' id='opt2' class='op_name' oninput='opt_remember(this.id)' placeholder='예시 : 맛' style='color: gray'>"
                    tmp_text2 += "<div style='display: flex; align-items: center; justify-content: center; ' " + ">" +
                        "<input type='text' id='opt3' class='op_value' oninput='opt_remember(this.id)' placeholder='예시 : 달콤한맛, 매운맛(,로 구분)' style='color: gray'>" + "<span" +
                        "id='quantity'><label for='quty_check'>동일상품코드부여</label><input type='checkbox'" +
                        "class = 'same_prod_cd' id='check2' style='display: inline'>" + "<div class='question-button'>?</div>" + "<button class='opt_btn' style='display: inline; margin-left:10px; margin-right:10px;' onclick='opt_num2(1)'>x</button>" + "<button class='opt_btn' style='display: inline' onclick='opt_num2(3)'>+</button>" + "</span " + ">" +
                        "</div>"
                }
            }

            option_name.innerHTML = tmp_text;
            op_value.innerHTML = tmp_text2;
            opt_num.innerText = "2개▽";

            const opt_id0 = document.getElementById("opt0");

            const opt_id1 = document.getElementById("opt1");

            const opt_id2 = document.getElementById("opt2");

            const opt_id3 = document.getElementById("opt3");

            if (before_opt === 1) {
                opt_id0.value = opt_input_arr[0];
                opt_id1.value = opt_input_arr[1];
                opt_id0.style.color = 'black';
                opt_id1.style.color = 'black';

            } else if (before_opt === 3) {
                opt_id0.value = opt_input_arr[0];
                opt_id1.value = opt_input_arr[1];
                opt_id2.value = opt_input_arr[2];
                opt_id3.value = opt_input_arr[3];
                opt_id0.style.color = 'black';
                opt_id1.style.color = 'black';
                opt_id2.style.color = 'black';
                opt_id3.style.color = 'black';
            }

            for (let i = 0; i < opt_input_arr.length; i++) {
                if (i > 3) {
                    opt_input_arr[i] = "";
                }
            }

            before_opt = 2;

            opt_list_adjust();
            opt_name.length = 2;

            // Get the modal
            var modal = document.getElementById("myModal");

            // Get the button that opens the modal
            var question_button = document.getElementsByClassName("question-button");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the modal
            for (let i = 0; i < question_button.length; i++) {
                question_button[i].onclick = function () {
                    modal.style.display = "block";
                }
            }

            // When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal.style.display = "none";
            }

        } else {
            for (let i = 0; i < 3; i++) {
                if (i === 0) {
                    tmp_text += "<input type='text' id='opt0' class='op_name' oninput='opt_remember(this.id)' placeholder='예시 : 맛' style='color: gray'>"
                    tmp_text2 += "<div style='display: flex; ' " + ">" +
                        "<input type='text' id='opt1' class='op_value' oninput='opt_remember(this.id)' placeholder='예시 : 달콤한맛, 매운맛(,로 구분)' style='color: gray'>" + "<span" +
                        "id='quantity'><label for='quty_check'>동일상품코드부여</label><input type='checkbox'" +
                        "class = 'same_prod_cd' id='check1' style='display: inline'>" + "<div class='question-button'>?</div>" +
                        "</span " + ">" +
                        "</div>"
                }

                if (i === 1) {
                    tmp_text += "<input type='text' id='opt2' class='op_name' oninput='opt_remember(this.id)' placeholder='예시 : 맛' style='color: gray'>"
                    tmp_text2 += "<div style='display: flex; align-items: center; justify-content: center; ' " + ">" +
                        "<input type='text' id='opt3' class='op_value' oninput='opt_remember(this.id)' placeholder='예시 : 달콤한맛, 매운맛(,로 구분)' style='color: gray'>" + "<span" +
                        "id='quantity'><label for='quty_check'>동일상품코드부여</label><input type='checkbox'" +
                        "class = 'same_prod_cd' id='check2' style='display: inline'>" + "<div class='question-button'>?</div>" + "<button class='opt_btn' style='display: inline; margin-left:10px; margin-right:10px;' onclick='opt_num2(2)'>x</button>" + "</span " + ">" +
                        "</div>"
                }

                if (i === 2) {
                    tmp_text += "<input type='text' id='opt4' class='op_name' oninput='opt_remember(this.id)' placeholder='예시 : 맛' style='color: gray'>"
                    tmp_text2 += "<div style='display: flex; align-items: center; justify-content: center; ' " + ">" +
                        "<input type='text' id='opt5' class='op_value' oninput='opt_remember(this.id)' placeholder='예시 : 달콤한맛, 매운맛(,로 구분)' style='color: gray'>" + "<span" +
                        "id='quantity'><label for='quty_check'>동일상품코드부여</label><input type='checkbox'" +
                        "class = 'same_prod_cd' id='check3' style='display: inline'>" + "<div class='question-button'>?</div>" + "<button class='opt_btn' style='display: inline; margin-left:10px; margin-right:10px;' onclick='opt_num2(2)'>x</button>" + "</span " + ">" +
                        "</div>"
                }
            }
            option_name.innerHTML = tmp_text;
            op_value.innerHTML = tmp_text2;
            opt_num.innerText = "3개▽";

            const opt_id0 = document.getElementById("opt0");

            const opt_id1 = document.getElementById("opt1");

            const opt_id2 = document.getElementById("opt2");

            const opt_id3 = document.getElementById("opt3");

            if (before_opt === 1) {
                opt_id0.value = opt_input_arr[0];
                opt_id1.value = opt_input_arr[1];
                opt_id0.style.color = 'black';
                opt_id1.style.color = 'black';
            }

            if (before_opt === 2) {
                opt_id0.value = opt_input_arr[0];
                opt_id1.value = opt_input_arr[1];
                opt_id2.value = opt_input_arr[2];
                opt_id3.value = opt_input_arr[3];
                opt_id0.style.color = 'black';
                opt_id1.style.color = 'black';
                opt_id2.style.color = 'black';
                opt_id3.style.color = 'black';
            }
            before_opt = 3;
            opt_list_adjust();
            opt_name.length = 3;

            // Get the modal
            var modal = document.getElementById("myModal");

            // Get the button that opens the modal
            var question_button = document.getElementsByClassName("question-button");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the modal
            for (let i = 0; i < question_button.length; i++) {
                question_button[i].onclick = function () {
                    modal.style.display = "block";
                }
            }

            // When the user clicks on <span> (x), close the modal
            span.onclick = function () {
                modal.style.display = "none";
            }
        }
    }

    function prid_on_toggle() {
        check_sell_period = 1; //판매기간 설정 할지 안할지 체크용 변수 = 1
        prid_toggle.style.display = 'block';
        prid_on.style.backgroundColor = 'gold';
        prid_off.style.backgroundColor = 'white';

    }

    function prid_off_toggle() {
        check_sell_period = 0; //판매기간 설정 할지 안할지 체크용 변수 = 0
        prid_toggle.style.display = 'none';
        prid_off.style.backgroundColor = 'gold';
        prid_on.style.backgroundColor = 'white';
    }

    function dis_on_toggle() {
        check_dis = 1; //할인하는지 체크 변수 = 1
        dis_toggle.style.display = 'block';
        dis_on.style.backgroundColor = 'gold';
        dis_off.style.backgroundColor = 'white';
        show_price(); //화면에 가격 띄우기
    }

    function dis_off_toggle() {
        check_dis = 0; //할인하는지 체크 변수 = 0
        dis_toggle.style.display = 'none';
        dis_off.style.backgroundColor = 'gold';
        dis_on.style.backgroundColor = 'white';
        show_price() //화면에 가격 띄우기
    }

    function opt_on_toggle() {
        opt_toggle.style.display = 'block';
        opt_on.style.backgroundColor = 'gold';
        opt_off.style.backgroundColor = 'white';
        check_opt_adjust = 1; //옵션설정할지말지 변수 1
    }

    function opt_off_toggle() {
        opt_toggle.style.display = 'none';
        opt_off.style.backgroundColor = 'gold';
        opt_on.style.backgroundColor = 'white';
        check_opt_adjust = 0; //옵션설정할지말지 변수 0
    }

    function char_Count(value) {
        var count = value.length;
        document.getElementById('characterCount').textContent = count + '/100';
        prod_name.innerText = value;
        prod_name_value = value; //상품명 입력 변수에 넣기
    }

    function input_stk(value) {

        let id = event.currentTarget.id;

        recent_stk_num = parseInt(value); //최근입력한 재고 number타입

        const reString = String(recent_stk_num);

        if (value !== "" && value.length !== reString.length) {
            alert('입력은 숫자만 가능합니다!');
            clear_restore_stk(id);
            return;
        }

        prod_stk.innerText = value + "개";
    }

    function input_prc(value) {

        let id = event.target.id;

        const goNum = parseInt(value);

        const reString = String(goNum);

        if (value !== "" && value.length !== reString.length) {
            alert('입력은 숫자만 가능합니다!');
            clear_restore_prc(id);
            return;
        }
        recent_prc = value; //최근입력한 판매가격 업데이트
        cal_dis(); //할인가격 계산
        show_price(); //화면에 가격 띄우기
    }


    //판매가격 입력되면 호출될 함수
    function input_dis(value) {

        let id = event.target.id;

        const goNum = parseInt(value);

        const reString = String(goNum);

        if (value !== "" && value.length !== reString.length) {
            alert('입력은 숫자만 가능합니다!');
            clear_restore_dis(id);
            return;
        }
        recent_dis = value; //최근입력한 할인값 문자열 업데이트
        cal_dis();
    }

    //할인가 계산할 함수 가져옴 할인가 : 0원 (0원 할인)
    function cal_dis() {
        dis_adj_price.innerText = "";
        recent_prc_num = parseInt(recent_prc); // 최근 입력한 판매가를 숫자로 변경
        recent_dis_num = parseInt(recent_dis); // 최근 입력한 할인숫자 문자열을 숫자로 변경
        if (isNaN(recent_prc_num)) recent_prc_num = 0;
        if (isNaN(recent_dis_num)) recent_dis_num = 0;
        if (selected_dis_unit === "원") {
            caled_dis_price = recent_prc_num - recent_dis_num; // 할인가 = 판매가 - 할인숫자
            dis_adj_price.innerText =
                "할인가 : " + caled_dis_price + "원   (" + recent_dis_num + "원 할인)";
            show_price(); //화면에 가격 띄우기
        } else {
            caled_dis_price = recent_prc_num * (100 - recent_dis_num) / 100;
            dis_adj_price.innerText =
                "할인가 : " +
                caled_dis_price +
                " 원   (" +
                (recent_prc_num - caled_dis_price) +
                "원 할인)";
            show_price(); //화면에 가격 띄우기

        }
    }

    //화면에 가격 뿌려주기
    function show_price() {
        if (check_dis === 0) {
            prod_price.innerHTML = recent_prc + "원";
        } else {
            prod_price.innerHTML = "판매가 : " + recent_prc + "원&nbsp;&nbsp;&nbsp;&nbsp;할인가 : " + caled_dis_price + "원";
        }
    }

    // let opt_input_arr = []; //옵션 input태그의 내용 저장해놓을 배열

    function opt_remember(id) { //사용자가 옵션input태그에 뭔가 입력을 시작하면 저장해놓는 함수

        const id_adress = document.getElementById(id);

        id_adress.style.color = 'black';

        switch (id) {
            case 'opt0':
                opt_input_arr[0] = id_adress.value;
                break;
            case 'opt1':
                opt_input_arr[1] = id_adress.value;
                break;
            case 'opt2':
                opt_input_arr[2] = id_adress.value;
                break;
            case 'opt3':
                opt_input_arr[3] = id_adress.value;
                break;
            case 'opt4':
                opt_input_arr[4] = id_adress.value;
                break;
            case 'opt5':
                opt_input_arr[5] = id_adress.value;
                break;
        }
        opt_list_adjust();
    }

    function opt_list_adjust() {
        if (before_opt === 1 && opt_input_arr[0] !== "" && opt_input_arr[1] !== "" ||
            before_opt === 2 && opt_input_arr[0] !== "" && opt_input_arr[1] !== "" && opt_input_arr[2] !== "" && opt_input_arr[3] !== "" ||
            before_opt === 3 && opt_input_arr[0] !== "" && opt_input_arr[1] !== "" && opt_input_arr[2] !== "" && opt_input_arr[3] !== "" && opt_input_arr[4] !== "" && opt_input_arr[5] !== "") {

            //백그라운드 컬러 블루로, 클릭방지용 변수 = 1로
            opt_adjust.style.backgroundColor = '#0088dd';
            prevent_opt_adjust = 1;
        } else {

            //백그라운드 컬러 그레이로, 클릭방지용 변수 = 0으로
            opt_adjust.style.backgroundColor = '#cccccc';
            prevent_opt_adjust = 0;
        }
    }

    // let cate_L_cd = new Map([['닭가슴살', 'P0'], ['도시락&볶음밥', 'P1'], ['샐러드', 'P2'], ['음료', 'P3']]); //대분류 카테고리 코드

    // let cate_M_list = new Map([['닭가슴살', ['프로', '스테이크', '스팀&소프트', '소스닭가슴살', '슬라이스', '훈제', '생닭가슴살']], ['도시락&볶음밥', ['다이어트도시락', '간편도시락', '비건도시락', '볶음밥', '덮밥&컵밥', '주먹밥']],
    // ['샐러드', ['알뜰샐러드', '토핑샐러드', '과일']], ['음료', ['제로음료', '우유&요거트', '프로틴쉐이크', '프로틴음료', '보충제', '커피&차', '주스']]]); //중분류 카테고리 목록

    // let cate_M_cd = new Map([['프로', 'P001'], ['스테이크', 'P002'], ['스팀&소프트', 'P003'], ['소스닭가슴살', 'P004'], ['슬라이스', 'P005'], ['훈제', 'P006'], ['생닭가슴살', 'P007'],
    // ['다이어트도시락', 'P101'], ['간편도시락', 'P102'], ['비건도시락', 'P103'], ['볶음밥', 'P104'], ['덮밥&컵밥', 'P105'], ['주먹밥', 'P106'], ['알뜰샐러드', 'P201'], ['토핑샐러드', 'P202'],
    // ['과일', 'P203'], ['제로음료', 'P301'], ['우유&요거트', 'P302'], ['프로틴쉐이크', 'P303'], ['프로틴음료', 'P304'], ['보충제', 'P305'], ['커피&차', 'P306'], ['주스', 'P307']
    // ]); //중분류 카테고리 코드

    function go_M_list() {
        if (prevent_fastClick !== 0) return;
        if (tmp_cate_check !== "" && event.target.id === tmp_cate_check) return; //이전과 같은걸 선택했으면 return
        prevent_fastClick++; //1로 올리고 작업시작 1
        //const make_M_list = document.getElementById("m_list"); //중분류 목록 생성해서 보여줄 변수

        make_M_list.innerHTML = "";

        large_cate = event.target.id; //이벤트가 발생한 요소의 id를 저장. id는 "닭가슴살", "샐러드" ..

        medium_cate = cate_M_list.get(large_cate); //맵에서 꺼내. 대분류 이름으로 중분류 목록을 꺼내.

        for (let i = 0; i < medium_cate.length; i++) { //중분류 목록의 길이만큼 반복해서 div태그 안에 추가.
            // tmp_md_cate += "<div onmouseover='this.style.backgroundColor='lightgoldenrodyellow''" +
            //     "onmouseout='this.style.backgroundColor='white'''>" + medium_cate[i] + "&nbsp&nbsp&nbsp(" + cate_M_cd.get(medium_cate[i]) + ")" + "</div>";
            tmp_md_cate += "<div id= '" + cate_M_cd.get(medium_cate[i]) + "'" +
                " class ='medium_list' onclick='save_M_list(this.id)'>" + medium_cate[i] + "&nbsp;&nbsp;&nbsp;(" + cate_M_cd.get(medium_cate[i]) + ")" +
                "</div>"; //중분류의 id값은 자기 분류코드이고, 클릭하면 데이터 저장해둘 함수 이벤트 등록해놓음.
        }

        //tmp_md_cate에 저장됐지.

        // medium_list = document.getElementsByClassName("medium_list"); //중분류 리스트 만들었으면 주소 넣어주기

        // for (let i = 0; i < medium_list.length; i++) {
        // // alert("이벤트 진입");
        //     medium_list[i].addEventListener("click",save_M_list);
        // }

        const cate_check = document.getElementById(tmp_cate_check);
        make_M_list.innerHTML = tmp_md_cate;
        tmp_md_cate = "";

        if (tmp_cate_check === "") { //첫번째 선택 처리
            event.target.style.backgroundColor = "lightgoldenrodyellow";
            tmp_cate_check = event.target.id;
            tmp_md_cate = "";
            prevent_fastClick = 0;
            return;
        }

        cate_check.style.backgroundColor = "white";  //이전꺼는 white로
        event.target.style.backgroundColor = "lightgoldenrodyellow"; //새로운건 lightyellow로
        tmp_cate_check = event.target.id;
        prevent_fastClick = 0;
    }

    function save_M_list(id) {
        //  alert("함수 진입");
        if (prevent_fastClick2 !== 0) return;
        if (prev_m_cate !== "" && id === prev_m_cate) return; //이전과 같은걸 선택했으면 return

        prevent_fastClick2++; //하나올리고 작업시작

        //첫번째 클릭이든 아니든 클릭하면 카테고리옆에 글자 반영.

        clicked_cate_name = cate_M_name.get(id); //선택된 이름

        clicked_cate.innerText = "" + clicked_cate_name + "(" + id + ")";

        let clicked = document.getElementById(id);

        cate_cd = id; //클릭된 카테고리 저장용 변수에 넣기

        clsdata = {'clsCd': cate_cd}; //서버에서 카테고리 상품수 불러올 ajax에 사용할 객체 넣기

        $.ajax({
            type: 'POST',
            url: '/prod/inquiry',
            headers: {"content-type": "application/json"},
            dataType: 'text',
            data: JSON.stringify(clsdata),
            success: function (result) {
                cls_count = JSON.parse(result);    // 서버로부터 응답이 도착하면 호출될 함수

               // alert("받아온 카테고리 상품숫자=" + cls_count);

                cls_count++; //상품코드로 쓰기위해 하나 증가

                prodStartCd = cls_count ; //상품코드시작번호

            },
            error: function () {
                alert("error inquiry")
            } // 에러가 발생했을 때, 호출될 함수
        }); // $.ajax()

        if (prev_m_cate === "") { //첫번째 클릭시 처리
            clicked.style.backgroundColor = "lightgoldenrodyellow";
            prev_m_cate = id;
            prevent_fastClick2 = 0;
            return;
        }

        //첫번째 클릭이 아니면 진행

        const m_cate_check = document.getElementById(prev_m_cate);

        if (m_cate_check !== null) {
            m_cate_check.style.backgroundColor = "white";
        }
        // m_cate_check.style.backgroundColor = "white";  //이전꺼는 white로
        clicked.style.backgroundColor = "lightgoldenrodyellow";
        prev_m_cate = id; //자기 분류코드가 들어감. 코드는 이거 갖다 쓰면될듯..

        prevent_fastClick2 = 0;
    }

    function getImageFiles(e) {
        const uploadFiles = [];
        const files = e.currentTarget.files;
        const imagePreview = document.querySelectorAll('.image-preview');
        // const docFrag = new DocumentFragment(); // DocumentFragment노드 생성
        let tmp_id = e.target.id;

        if (e.target.id === "title_img") {
            imagePreview[0].innerHTML = ""; //대표이미지 초기화
            imgT_name = ""; //대표이미지 이름 초기화
            uploadFiles.push(files);
            const reader = new FileReader();
            reader.onload = (e) => {
                const preview = createElement(e, files[0], tmp_id);
                imagePreview[0].appendChild(preview);
            };
            reader.readAsDataURL(files[0]);
            tmp_imgAdress = document.getElementById("title_img");
            img_upload(e.currentTarget.id); //이미지를 서버에 전송
            return;
        } else {

            if ([...files].length >= 10) {
                add_img.value = ""; //이미지파일 10개이상 넣을시 초기화
                imagePreview[1].innerHTML = ""; //추가이미지 초기화
                alert('이미지는 최대 9개 까지 업로드가 가능합니다.');
                return;
            }

            // 파일 타입 검사
            [...files].forEach(file => {
                if (!file.type.match("image/.*")) {
                    alert('이미지 파일만 업로드가 가능합니다.');
                    return;
                }

                imagePreview[1].innerHTML = ""; //추가이미지 초기화
                imgD_name = []; //상세이미지 이름 초기화
                imgD_size = []; //상세이미지 사이즈 초기화

                // 파일 갯수 검사
                if ([...files].length < 10) {
                    uploadFiles.push(file);
                    const reader = new FileReader();
                    reader.onload = (e) => {
                        const preview = createElement(e, file,tmp_id);
                        imagePreview[1].appendChild(preview);
                    };
                    reader.readAsDataURL(file);
                    // imagePreview[1].appendChild(docFrag);
                    add_img_length.innerText = "추가이미지(" + [...files].length + "/9)";
                    img_upload(e.currentTarget.id); //이미지 서버에 전송
                }
            });
        }
    }

    function createElement(e, file, id) {
        const li = document.createElement('li');
        const img = document.createElement('img');
        img.setAttribute('src', e.target.result);
        img.setAttribute('data-file', file.name);

        if(id==="title_img"){
            imgT_name = file.name;
        }

        if(id==="add_img"){
            imgD_name.push(file.name);
        }

        li.appendChild(img);

        //abc = img;

        img.style.width = "480px";
        img.style.height = "480px";
        return li;
    }

    //let result ; // ajax 결과 반환

    function img_upload(id) {

      //  alert("id="+id); 잘 받아옴. title_img 또는 add_img
      //   alert("id의 타입="+typeof(id));  //string

               let formData = new FormData();

                if(id === "title_img"){
                    formData.append('file', $('#title_img')[0].files[0]);
                }

                if(id ==="add_img") {
                    for(let i=0 ; i < $('#add_img')[0].files.length;i++){
                        formData.append('file', $('#add_img')[0].files[i]);
                    }
                }

                $.ajax({
                    url: '/prod/imgUpload', // 서버 업로드 처리 URL
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function(response) {
                        alert("성공");
                        // 업로드 성공 시 처리할 코드
                    },
                    error: function(error) {
                        // console.log('파일 업로드 실패');
                        alert("실패");
                        // 업로드 실패 시 처리할 코드
                    }
                });
        }


    const realUpload = document.querySelectorAll('.real-upload');

    for (let i = 0; i < realUpload.length; i++) {
        realUpload[i].addEventListener('change', getImageFiles);
    }

    // Get the modal
    var modal = document.getElementById("myModal");

    // Get the button that opens the modal
    var question_button = document.getElementsByClassName("question-button");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal
    for (let i = 0; i < question_button.length; i++) {
        question_button[i].onclick = function () {
            modal.style.display = "block";
        }
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function () {
        modal.style.display = "none";
    }

    discount_period.addEventListener("change", function (event) {
        if (discount_period.checked) {
            dis_period_toggle.style.display = 'block';
            check_dis_period = 1; //특정기간만 할인할지 선택 저장용 변수 1
        } else {
            dis_period_toggle.style.display = 'none';
            check_dis_period = 0; //특정기간만 할인할지 선택 저장용 변수 0
        }
    })

    for (let i = 0; i < L_cate.length; i++) {
        L_cate[i].addEventListener("click", go_M_list);
    }

    //할인단위가 선택되면 호출될 함수
    for (let i = 0; i < dis_unit.length; i++) {
        dis_unit[i].addEventListener("click", function () {
            dis_unit_btn.innerHTML = event.target.id;
            selected_dis_unit = event.target.id;
            cal_dis();
        });
    }

    // 이렇게 하지말고 배열에다가 저장. 순서대로 0~7 약속해서 거기에 저장.
    // let dataDateTime = []날짜 및 시간 저장할 변수. //인덱스 0:할인시작 날짜 //1:할인시작 시간 //2.할인종료 날짜 //3.할인종료 시간
    //4.판매시작 날짜 5.판매시작 시간 6.판매종료 날짜 7.판매종료 시간

    function save_date_time(value) {

        switch (event.target.id) {
            case 'dis_start_date':
                dataDateTime[0] = value;
                break;
            case 'dis_start_time':
                dataDateTime[1] = value;
                break;
            case 'dis_end_date':
                dataDateTime[2] = value;
                break;
            case 'dis_end_time':
                dataDateTime[3] = value;
                break;
            case 'sell_start_date':
                dataDateTime[4] = value;
                break;
            case 'sell_start_time':
                dataDateTime[5] = value;
                break;
            case 'sell_end_date':
                dataDateTime[6] = value;
                break;
            case 'sell_end_time':
                dataDateTime[7] = value;
                break;
        }
    }

    // let dis_start_input = document.querySelectorAll('.dis_start_input'); //할인시작 날짜 및 시간 입력 요소 가져옴 (초기화할때 씀)

    // let dis_end_input = document.querySelectorAll('.dis_end_input'); //할인종료 날짜 및 시간 입력 요소 가져옴 (초기화할때 씀)

    // let sell_start_input = document.querySelectorAll('.sell_start_input') //판매시작 날짜 및 시간 입력 요소 가져옴 (초기화할때 씀)

    // let sell_end_input = document.querySelectorAll('.sell_end_input') //판매종료 날짜 및 시간 입력 요소 가져옴 (초기화할때 씀)

    // 이렇게 하지말고 배열에다가 저장. 순서대로 0~7 약속해서 거기에 저장.
    // let dataDateTime = []날짜 및 시간 저장할 변수. //인덱스 0:할인시작 날짜 //1:할인시작 시간 //2.할인종료 날짜 //3.할인종료 시간
    //4.판매시작 날짜 5.판매시작 시간 6.판매종료 날짜 7.판매종료 시간

    function del_DateTime(id) {
        switch (id) {
            case 'del_dis_start_data': //판매시작 날짜 및 시간 데이터 초기화
                dataDateTime[0] = "";
                dataDateTime[1] = "";

                for (let i = 0; i < dis_start_input.length; i++) {
                    dis_start_input[i].value = "";
                }
                break;

            case 'del_dis_end_data': //판매종료 날짜 및 시간 데이터 초기화
                dataDateTime[2] = "";
                dataDateTime[3] = "";

                for (let i = 0; i < dis_end_input.length; i++) {
                    dis_end_input[i].value = "";
                }
                break;

            case 'del_sell_start_data': //할인시작 날짜 및 시간 데이터 초기화
                dataDateTime[4] = "";
                dataDateTime[5] = "";

                for (let i = 0; i < sell_start_input.length; i++) {
                    sell_start_input[i].value = "";
                }
                break;

            case 'del_sell_end_data': //할인종료 날짜 및 시간 데이터 초기화
                dataDateTime[6] = "";
                dataDateTime[7] = "";

                for (let i = 0; i < sell_end_input.length; i++) {
                    sell_end_input[i].value = "";
                }
                break;
        }
    }

</script>
</body>
</html>