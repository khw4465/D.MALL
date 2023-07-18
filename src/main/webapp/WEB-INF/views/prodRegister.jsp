<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품등록</title>
    <link rel="stylesheet" href="<c:url value='/css/prodRegister.css'/>">
<%--    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">--%>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<div class="mTitle">
    <h1>상품 등록</h1>
</div>
<%--enctype="multipart/form-data"--%>
<form  id="prodRegister" method="POST" action="/prod/register">
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
                                    <input type="hidden" name="prodCd" id="prodCd" value="10" />
                                    <!-- prodCd 서비스나 컨트롤러에서 정해져야할듯. -->
                                    <input type="hidden" name="cateCd" id="cateCd" value="" />
<%--                                    <input type="hidden" name="sn" id="sn" value="" />--%>
                                    <!-- sn은 서비스나 컨트롤러에서 정해져야할듯. -->
                                    <!-- ---------------------------------------------------------------------------------- -->
                                </table>
                            </div>
                        </td>
                    </tr>
<%--name속성 추가해야함 --%>
                    <tr>
                        <th scope="row">진열상태</th>
                        <td>
                            <label><input type="radio"  value="T"> 진열함</label>
                            <label><input type="radio"  value="F" checked> 진열안함</label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">판매상태</th>
                        <td>
                            <label><input type="radio"  value="T"> 판매함</label>
                            <label><input type="radio"  value="F" checked> 판매안함</label>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">옵션상태</th>
                        <td id="optionTd">
                            <label><input type="radio"  value="T"> 옵션있음</label>
                            <label><input type="radio"  value="F" checked> 옵션없음</label>
                        </td>
                    </tr>

                    <tr>
                        <th scope="row">할인상태</th>
                        <td id="discountTd">
                            <label><input type="radio"  value="T"> 할인있음</label>
                            <label><input type="radio"  value="F" checked> 할인없음</label>
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
                        <th scope="row">상품명</th>
                        <td>
                            <input type="text" name="prodName" placeholder="예시) 닭가슴살-프로" value="">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">상품 가격</th>
                        <td>
                            <input type="text" name="prodPrice" value="">
                        </td>
                    </tr>

                    <tr>
                        <th scope="row">입력수량</th>
                        <td>
                            <input type="text" name="invQty" value="">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">판매단위</th>
                        <td>
                            <input type="text" value="">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">보관유형</th>
                        <td>
                            <input type="text" value="">
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
                            <input type="text" id="manufacture_date" name="mftDate" value="">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">소비기한</th>
                        <td>
                            <input type="text" id="expiry_date" name="useDate" value="">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">판매 시작일시</th>
                        <td>
                            <input type="text" id="start_date" name="saleStart">
                        </td>
                    </tr>
                    <tr>
                        <th scope="row">판매 종료일시</th>
                        <td>
                            <input type="text" id="end_date" name="saleLast">
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- ------------------------------------------------------------------------------------ -->

    <!-- ------------------------------------------------------------------------------------ -->
<%--    <table border="1">--%>
<%--        <h2>이미지 등록</h2>--%>
<%--        <tr>--%>
<%--            <th scope="row">--%>
<%--                <label for="main-image">대표 이미지 (권장 500px * 500px):</label>--%>
<%--            </th>--%>
<%--            <td>--%>
<%--                <input type="file" id="main-image"  accept="image/*">--%>
<%--&lt;%&ndash;                name속성 추가해야함&ndash;%&gt;--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <th scope="row">--%>
<%--                <label for="additional-images">상세 이미지 (권장 300px * 300px):</label>--%>
<%--            </th>--%>
<%--            <td>--%>
<%--                <input type="file" id="additional-images"  accept="image/*" multiple>--%>
<%--&lt;%&ndash;                name속성 추가해야함&ndash;%&gt;--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--    <br>--%>
    <!-- -------------------------------------------------------------------------- -->
<%--    <a class="btnSubmit" id="eProductRegister">상품등록</a>--%>
    <button type="submit" class="btnSubmit">상품등록</button>
</form>
<script>
    //분류 누르고 그 값이 히든필드에 담긴다.
    var subCategories = {
        '100': [
            { id: '101', name: '프로' },
            { id: '102', name: '스테이크' },
            { id: '103', name: '스팀/소프트' },
            { id: '104', name: '소스닭가슴살' },
            { id: '105', name: '슬라이스' }
        ],
        '200': [
            { id: '201', name: '알뜰샐러드' },
            { id: '202', name: '토핑샐러드' }
        ],
        '300': [
            { id: '301', name: '다이어트 도시락' },
            { id: '302', name: '간편도시락' },
            { id: '303', name: '곤약볶음밥' },
            { id: '304', name: '주먹밥/김밥' }
        ],
        '400': [
            { id: '401', name: '제로음료' },
            { id: '402', name: '유제품' },
            { id: '403', name: '프로틴' },
            { id: '404', name: '보충제' }
        ]
    };
    var categoryList = document.getElementById('categoryList');
    var subCategoryContainer = document.getElementById('subCategoryContainer');
    var subCategoryList = document.getElementById('subCategoryList');
    var productName = document.querySelector('input[name="product_name"]'); // 상품명 input 필드
    var cateCdField = document.getElementById('cateCd');  // 히든필드
    var selectedCategory = '';
    var selectedSubCategory = '';
    categoryList.addEventListener('click', function (event) {
        if (event.target.tagName === 'LI') {
            selectedCategory = event.target.textContent;
            var category = event.target.getAttribute('data-category');
            var data = subCategories[category];

            subCategoryList.innerHTML = '';
            for (var i = 0; i < data.length; i++) {
                var li = document.createElement('li');
                li.textContent = data[i].name;
                li.dataset.id = data[i].id;  // Sub-category ID를 저장
                subCategoryList.appendChild(li);
            }
            subCategoryContainer.classList.remove('displaynone');
        }
    });
    subCategoryList.addEventListener('click', function (event) {
        if (event.target.tagName === 'LI') {
            selectedSubCategory = event.target.textContent;
            var id = event.target.dataset.id;  // Sub-category ID를 가져옴
            cateCdField.value = id;  // 히든필드에 Sub-category ID를 설정
            productName.value = selectedCategory + '-' + selectedSubCategory;
        }
    });
</script>
</body>
</html>
