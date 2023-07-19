<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
    request.setCharacterEncoding("UTF-8");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품등록</title>
    <link rel="stylesheet" href="<c:url value='/css/prodRegister.css'/>">
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

        $(document).on('change', '.image-upload', function(e) {
            var file = e.target.files[0];

            // 이미지만 확인
            if (!file.type.match('image.*')) {
                alert("Only images are allowed!");
                return;
            }

            // 이미지 크기 확인
            var img = new Image();
            img.src = URL.createObjectURL(file);
            img.onload = function() {
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
<div class="mTitle">
    <h1>상품 등록</h1>
</div>

<form  id="prodRegister" method="POST" action="/prod/register" enctype="multipart/form-data">
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
                                    <input type="hidden" name="prodCd" id="prodCd" value="" />
                                    <!-- prodCd 서비스나 컨트롤러에서 정해져야할듯. -->
                                    <input type="hidden" name="cateCd" id="cateCd" value="" />

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
                            <input type="text" name="invQty"  value="">
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
<script>
    //분류 누르고 그 값이 히든필드에 담긴다. 상품명도 출력
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
    var productName = document.querySelector('input[name="cateName"]'); // 상품명 input 필드
    var cateCdField = document.getElementById('cateCd');  // 히든필드
    var selectedCategory = '';
    var selectedSubCategory = '';

    var boxTypeInput = document.getElementById('boxtp');  // 보관유형 input 필드

    var snField = document.getElementById('sn');  // Product Code 필드

    categoryList.addEventListener('click', function (event) {
        if (event.target.tagName === 'LI') {
            selectedCategory = event.target.textContent;
            var category = event.target.getAttribute('data-category');
            var data = subCategories[category];

            // 상품 분류에 따른 보관 유형 설정
            if (category == '100' || category == '300') {
                boxTypeInput.value = '냉동';
            } else if (category == '200') {
                boxTypeInput.value = '냉장';
            } else if (category == '400') {
                boxTypeInput.value = '상온';
            } else {
                boxTypeInput.value = '';
            }

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

            // prodCd 값 설정
            var prodCdField = document.getElementById('prodCd'); // prodCd 필드

            //sn을 감지해서 p0101 뒤에 01 이런식으로 붙여주는 코드
            snField.addEventListener('input', function (event) {
                var prodCdField = document.getElementById('prodCd'); // prodCd 필드

                // snField의 값이 변경될 때마다 prodCdField의 값을 업데이트
                prodCdField.value = "P0" + cateCdField.value + event.target.value;
            });
            //sn을 감지해서 p0101 뒤에 01 이런식으로 붙여주는 코드

            // "P0" 추가
            prodCdField.value = "P0" + id + snField.value; // prodCd 필드에 cateCd와 sn 값의 문자열을 더해줌
        }
    });


    // 상품 옵션 리스트
    var optionList = ['10팩', '30팩', '50팩'];

    // 라디오 버튼에 이벤트 리스너 등록
    var radios = document.querySelectorAll('input[type=radio][name="optYn"]');

    radios.forEach(function(radio) {
        radio.addEventListener('change', function() {
            var optionTd = document.getElementById('optionTd');
            // 판매단위 input 필드
            var unitInput = document.querySelector('#sellingUnit');

            // 옵션있음을 선택했을 때
            if (this.value === 'T') {
                var select = document.createElement('select');

                optionList.forEach(function(option) {
                    var opt = document.createElement('option');
                    opt.value = option;
                    opt.textContent = option;
                    select.appendChild(opt);
                });

                optionTd.appendChild(select);

                // 판매단위를 팩으로 설정
                unitInput.value = '팩';
            }
            // 옵션없음을 선택했을 때, 기존 옵션 선택 요소 삭제
            else {
                var select = optionTd.querySelector('select');
                if (select) {
                    optionTd.removeChild(select);
                }
                // 판매단위 초기화
                unitInput.value = '';
            }
        });
    });
   //달력
    window.onload = function() {
        var manufacture_date = document.getElementById("manufacture_date");
        var expiry_date = document.getElementById("expiry_date");
        var start_date = document.getElementById("start_date");
        var end_date = document.getElementById("end_date");

        manufacture_date.addEventListener("change", function() {
            var date = new Date(manufacture_date.value);
            date.setDate(date.getDate() + 100);
            expiry_date.value = date.toISOString().split('T')[0];
        });

        start_date.addEventListener("change", function() {
            end_date.min = start_date.value;
        });

        end_date.addEventListener("change", function() {
            if (end_date.value <= start_date.value) {
                alert("판매 종료일시는 판매 시작일시 이후의 날짜로 설정해주세요.");
                end_date.value = "";
            }
        });
    };

    //상품 할인
    $('input[name="dcCd"]').change(function() {
        if ($(this).val() == 'T') {
            $('#discountOptionRow').show();
            if ($('#prodPrice').val()) {
                $('#discountedPrice').parent().parent().show();
            }
        } else {
            $('#discountOptionRow').hide();
            $('#discountedPrice').parent().parent().hide();
        }
    });

    $('#discountPercent, #prodPrice, input[name="invQty"]').on('input', function() {
        var prodPrice = $('#prodPrice').val();
        var discountPercent = $('#discountPercent').val();
        var invQty = $('input[name="invQty"]').val() || 1;

        if (prodPrice && discountPercent && $('input[name="dcCd"]:checked').val() == 'T') {
            var discountedPrice = (prodPrice * invQty) - ((prodPrice * invQty) * (discountPercent / 100));
            $('#discountedPrice').text(Math.floor(discountedPrice));
            $('#discountedPrice').parent().parent().show();
        } else {
            $('#discountedPrice').parent().parent().hide();
        }
    });

    //이미지 첨부하면 미리보기
    function previewImage(event, targetId) {
        var reader = new FileReader();
        var imageField = document.getElementById(targetId);

        reader.onload = function(){
            if(reader.readyState == 2){
                imageField.src = reader.result;
                imageField.style.display = 'block';
            }
        }
        reader.readAsDataURL(event.target.files[0]);
    }

    function previewAdditionalImages(event) {
        var files = event.target.files; // FileList object

        // Loop through the FileList
        for (var i = 0, f; f = files[i]; i++) {

            // Process image files only.
            if (!f.type.match('image.*')) {
                continue;
            }

            var reader = new FileReader();

            reader.onload = (function(file) {
                return function(e) {
                    // Render thumbnail.
                    var span = document.createElement('span');
                    var img = document.createElement('img');
                    img.src = e.target.result;
                    img.title = escape(file.name);

                    // Set the width of the image
                    img.style.width = '300px';

                    span.appendChild(img);
                    document.getElementById('additional-previews').insertBefore(span, null);
                };
            })(f);

            // Read in the image file as a data URL.
            reader.readAsDataURL(f);
        }
    }

</script>
</body>
</html>
