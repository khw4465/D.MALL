// // 모델에서 저장한 값을 JavaScript 변수에 할당
// var selectedYear = "${birthYear}";
// var selectedMonth = "${birthMonth}"; // 문자열로 저장했으므로 따옴표 사용
// var selectedDay = "${birthDay}";
//
// window.addEventListener('load', function () {
//     var yearSelect = document.getElementById('year');
//     var monthSelect = document.getElementById('month');
//     var daySelect = document.getElementById('day');
//
//     // 년도 추가
//     for (var i = 2023; i >= 1900; --i) {
//         var option = document.createElement('option');
//         option.text = option.value = i;
//         yearSelect.add(option);
//         if (i == selectedYear) option.selected = true; // 선택된 년도 설정
//     }
//
//     // 월 추가
//     for (var i = 1; i <= 12; ++i) {
//         var option = document.createElement('option');
//         option.text = option.value = i;
//         monthSelect.add(option);
//         if (i == selectedMonth) option.selected = true; // 선택된 월 설정
//     }
//
//     // 일 추가
//     for (var i = 1; i <= 31; ++i) {
//         var option = document.createElement('option');
//         option.text = option.value = i;
//         daySelect.add(option);
//         if (i == selectedDay) option.selected = true; // 선택된 일 설정
//     }
// });
//
// window.addEventListener('load', function () {
//     const inputs = document.querySelectorAll('.input-field');
//     inputs.forEach(input => {
//         //input.setAttribute('readonly', true);
//     });
//
//     const buttons = document.querySelectorAll('.edit-button');
//
//     buttons.forEach(button => {
//         button.addEventListener('click', (e) => {
//             const inputField = e.target.closest('.input-wrap').querySelector('.input-field');
//             const buttonText = e.target.innerText;
//             if (buttonText.includes('변경')) {
//                 // e.target.innerText = buttonText.replace('변경', '수정');
//                 // inputField.removeAttribute('readonly');
//             } else if (buttonText.includes('수정')) {
//                 // e.target.innerText = buttonText.replace('수정', '변경');
//                 // inputField.setAttribute('readonly', true);
//             }
//         });
//     });
// });
//
// $(document).ready(function () {
//     $('.confirm-btn').click(function () {
//         let modydto_name = $('#cust-name').val();
//         let modydto_phone = $('#cust-mpno').val();
//         let modydto_email = $('#cust-email').val();
//         let modydto_acno = $('#cust-acno').val();
//
//         // 생년월일 값 가져오기
//         let modydto_year = $('#year').val();
//         let modydto_month = $('#month').val();
//         let modydto_day = $('#day').val();
//
//         $.ajax({
//             type: 'POST',
//             url: '/custModify',
//             headers: {"content-type": "application/json"},
//             contentType: 'application/json; charset=utf-8',
//             dataType: 'json',
//             data: JSON.stringify({
//                 "cust-name": modydto_name,
//                 "cust-mpno": modydto_phone,
//                 "cust-email": modydto_email,
//                 "cust-acno": modydto_acno,
//                 "birthdate": {
//                     "year": modydto_year,
//                     "month": modydto_month,
//                     "day": modydto_day
//                 } // 생년월일 객체 추가
//             }),
//             success: function (result) {
//                 $('#cust-name').val(result.name);
//                 $('#cust-mpno').val(result.mpno);
//                 $('#cust-email').val(result.email);
//                 $('#cust-acno').val(result.acno);
//                 alert("회원 정보가 업데이트되었습니다.");
//                 window.location.href = "/custModify";
//             },
//             error: function (request, status, error) {
//                 // 에러 메세지를 자세히 출력
//                 alert("에러");
//                 alert(JSON.stringify(request))
//                 alert(JSON.stringify(status))
//                 alert(JSON.stringify(error))
//             }
//         });
//     });
// });