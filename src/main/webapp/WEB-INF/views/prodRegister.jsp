<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%
    request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품등록</title>
    <link rel="stylesheet" href="<c:url value='/css/prodRegister.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/adminHeader.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/admin.css'/>">

    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script>
        var cnt = 1;

        function fn_addFile() {
            var fileInput = "<input type='file' name='file" + cnt + "' class='image-upload'/>";
            var widthInput = "<input type='hidden' name='imgWidth" + cnt + "' class='image-width'/>";
            var heightInput = "<input type='hidden' name='imgHeight" + cnt + "' class='image-height'/>";
            var newRow = "<div>" + fileInput + widthInput + heightInput + "</div>";
            $("#d_file").append(newRow);
            cnt++;
        }

        $(document).on('change', '.image-upload', function (e) {
            var file = e.target.files[0];

            // 이미지만 확인
            if (!file.type.match('image.*')) {
                alert("Only images are allowed!");
                return;
            }

            // 이미지 크기 확인
            var img = new Image();
            img.src = URL.createObjectURL(file);
            img.onload = function () {
                var width = img.naturalWidth;
                var height = img.naturalHeight;

                // Hidden fields update
                $(e.target).siblings('.image-width').val(width);
                $(e.target).siblings('.image-height').val(height);
            };
        });
    </script>
</head>
<body>
<jsp:include page="adminHeader.jsp"/>

<div id="container">
    <jsp:include page="adminSideBar.jsp"/>
    <div id="sidebar2" class="dashboard2">
        <div class="mTitle">
            <h1>상품 등록</h1>
        </div>

        <form id="prodRegister" method="POST" action="/prod/register" enctype="multipart/form-data">
            <div class="section" id="QA_register1">
                <div class="toggleArea" style="display:block;">
                    <div class="mBoard typeProduct">
                        <table border="1" summary="" class="gDivision">
                            <tbody>
                            <tr>
                                <th scope="row">상품분류 선택</th>
                                <td>
                                    <div class="mSearchSelect typeCategory theme1" id="selectCategoryTable">
                                        <div class="state">
                                            <strong class="txtEm" id="eSelectedCategory">카테고리 분류</strong>
                                        </div>
                                        <table border="1" summary="">
                                            <colgroup>
                                                <col style="width:auto" span="1">
                                                <col style="width:300px;">
                                            </colgroup>

                                            <tbody id="eCategoryTbody">
                                            <tr>
                                                <td>
                                                    <div>
                                                        <ul id="categoryList">
                                                            <li data-category="100">닭가슴살</li>
                                                            <li data-category="200">샐러드</li>
                                                            <li data-category="300">도시락.볶음밥</li>
                                                            <li data-category="400">음료/프로틴</li>
                                                        </ul>
                                                    </div>
                                                </td>
                                                <td id="subCategoryContainer" class="displaynone">
                                                    <div class="list">
                                                        <ul depth="2" class="eExposureCategory"
                                                            id="subCategoryList">
                                                        </ul>
                                                    </div>
                                                </td>

                                            </tr>
                                            </tbody>
                                            <input type="hidden" name="prodCd" id="prodCd" value=""/>
                                            <!-- prodCd 서비스나 컨트롤러에서 정해져야할듯. -->
                                            <input type="hidden" name="cateCd" id="cateCd" value=""/>

                                            <!-- sn은 서비스나 컨트롤러에서 정해져야할듯. -->
                                            <!-- ---------------------------------------------------------------------------------- -->
                                        </table>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row">진열상태</th>
                                <td>
                                    <label><input type="radio" name="sortYn" value="T"> 진열함</label>
                                    <label><input type="radio" name="sortYn" value="F" checked> 진열안함</label>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">판매상태</th>
                                <td>
                                    <label><input type="radio" name="saleYn" value="T"> 판매함</label>
                                    <label><input type="radio" name="saleYn" value="F" checked> 판매안함</label>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row">옵션상태</th>
                                <td id="optionTd">
                                    <label><input type="radio" name="optYn" value="T"> 옵션있음</label>
                                    <label><input type="radio" name="optYn" value="F" checked> 옵션없음</label>
                                </td>
                            </tr>

                            <tr>
                                <th scope="row">할인상태</th>
                                <td id="discountTd">
                                    <label><input type="radio" name="dcCd" value="T"> 할인있음</label>
                                    <label><input type="radio" name="dcCd" value="F" checked> 할인없음</label>
                                </td>
                            </tr>
                            <tr id="discountOptionRow" style="display: none;">
                                <th scope="row">할인 옵션</th>
                                <td>
                                    <input id="discountPercent" type="number" placeholder="할인율 입력(%)">
                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- ------------------------------------------------------------------------------------ -->
            <div>
                <div>
                    <h2>기본 정보</h2>
                </div>

                <div>
                    <div>
                        <table border="1">
                            <tbody>
                            <tr>
                                <th scope="row">카테고리명</th>
                                <td>
                                    <input type="text" name="cateName" value="">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">시리얼 번호</th>
                                <td>
                                    <input type="text" id="sn" name="sn" placeholder="예시) 01" value="">
                                </td>
                            </tr>

                            <tr>
                                <th scope="row">상품명</th>
                                <td>
                                    <input type="text" name="prodName" placeholder="예시) 체리맛" value="">
                                </td>
                            </tr>

                            <tr>
                                <th scope="row">입력수량</th>
                                <td>
                                    <input type="text" name="invQty" value="">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">상품 개당 가격</th>
                                <td>
                                    <input id="prodPrice" type="text" name="prodPrice" value="">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">할인된 총 가격</th>
                                <td>
                                    <p id="discountedPrice"></p>
                                </td>
                            </tr>


                            <tr>
                                <th scope="row">판매단위</th>
                                <td>
                                    <input type="text" id="sellingUnit" value="">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">보관유형</th>
                                <td>
                                    <input type="text" id="boxtp" value="">
                                </td>
                            </tr>

                            <tr>
                                <th scope="row">상품 요약설명</th>
                                <td>
                                    <input type="text" name="prodSmrvDesc" value="">

                                </td>
                            </tr>
                            <tr>
                                <th scope="row">상품 상세설명</th>
                                <td>
                                    <textarea rows="3" cols="20" name="prodDtlDesc"></textarea>

                                </td>
                            </tr>
                            <tr>
                                <th scope="row">제조일자</th>
                                <td>
                                    <input type="date" id="manufacture_date" name="mftDate" value="">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">소비기한</th>
                                <td>
                                    <input type="date" id="expiry_date" name="useDate" value="">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">판매 시작일시</th>
                                <td>
                                    <input type="date" id="start_date" name="saleStart">
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">판매 종료일시</th>
                                <td>
                                    <input type="date" id="end_date" name="saleLast">
                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- ------------------------------------------------------------------------------------ -->
            <h2>이미지 등록</h2>
            <table border="1">
                <input type="button" value="이미지 추가" onclick="fn_addFile()"><br>
                <div id="d_file"></div>
            </table>

            <br>
            <button type="submit" class="btnSubmit">상품등록</button>
        </form>
    </div>
</div>
<%--자스 파일 분리함--%>
<script type="text/javascript" src="<c:url value='/js/prodRegister.js'/>"></script>
</body>
</html>
