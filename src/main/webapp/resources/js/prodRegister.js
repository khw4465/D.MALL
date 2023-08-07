//분류 누르고 그 값이 히든필드에 담긴다. 상품명도 출력
var subCategories = {
    '100': [
        {id: '101', name: '프로'},
        {id: '102', name: '스테이크'},
        {id: '103', name: '스팀/소프트'},
        {id: '104', name: '소스닭가슴살'},
        {id: '105', name: '슬라이스'}
    ],
    '200': [
        {id: '201', name: '알뜰샐러드'},
        {id: '202', name: '토핑샐러드'}
    ],
    '300': [
        {id: '301', name: '다이어트 도시락'},
        {id: '302', name: '간편도시락'},
        {id: '303', name: '곤약볶음밥'},
        {id: '304', name: '주먹밥/김밥'}
    ],
    '400': [
        {id: '401', name: '제로음료'},
        {id: '402', name: '유제품'},
        {id: '403', name: '프로틴'},
        {id: '404', name: '보충제'}
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

radios.forEach(function (radio) {
    radio.addEventListener('change', function () {
        var optionTd = document.getElementById('optionTd');
        // 판매단위 input 필드
        var unitInput = document.querySelector('#sellingUnit');

        // 옵션있음을 선택했을 때
        if (this.value === 'T') {
            var select = document.createElement('select');

            optionList.forEach(function (option) {
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
window.addEventListener('load', function() {
    var manufacture_date = document.getElementById("manufacture_date");
    var expiry_date = document.getElementById("expiry_date");
    var start_date = document.getElementById("start_date");
    var end_date = document.getElementById("end_date");

    manufacture_date.addEventListener("change", function() {
        var date = new Date(manufacture_date.value);
        date.setDate(date.getDate() + 30);
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
});

//상품 할인
$('input[name="dcCd"]').change(function () {
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

$('#discountPercent, #prodPrice, input[name="invQty"]').on('input', function () {
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

    reader.onload = function () {
        if (reader.readyState == 2) {
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

        reader.onload = (function (file) {
            return function (e) {
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

    // *상품등록이 잘 되었는지 확인하는 방식 필요*  추후 수정
document.querySelector('.btnSubmit').addEventListener('click', () => {
    alert('상품이 등록되었습니다.');
})