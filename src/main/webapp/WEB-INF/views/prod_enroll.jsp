<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%--<jsp:include page="common/include.jsp"/>--%>
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
    <link rel="stylesheet" href="/prod_enroll.css">
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
                                    원
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
                        <button onclick="exportTableToExcel('table', 'table_data')">Export to Excel</button>
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
        <input type="file" class="real-upload" id="title_img" accept="image/*" required>
        <li class="image-preview"></li>
        <hr/>
        <h3 id="add_img_length">추가이미지(0/9)</h3>
        <input type="file" class="real-upload" id="add_img" accept="image/*" required multiple>
        <li class="image-preview"></li>
    </div>
</div>
<button type="submit" class="btn" id="enroll">등록</button>
</div>
<script src="/prod_enroll.js"></script>
</body>
</html>