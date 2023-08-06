//  let gomain = document.getElementById("form");
// 회원탈퇴 로직 시작
//     $(document).ready(function(){
//         $('#delete-button').click(function(e){
//             e.preventDefault();  // 기본 링크 클릭 동작을 방지합니다.
//
//             $.ajax({
//                 url: '/deleteCust',  // 스프링 컨트롤러 메서드가 매핑된 URL
//                 type: 'POST',
//                 data: {memberId: 'exampleId'},  // 탈퇴하려는 회원의 ID
//                 success: function(result){
//                     // 성공 응답을 받으면 alert 출력
//                         gomain.submit();
//                     alert("탈퇴에 성공했습니다");
//                 //히든으로 폼 만들어두고 성공하면 그게 클릭되게
//                 },
//                 error: function(){
//                     alert("회원 탈퇴에 실패하였습니다.");
//                 }
//             });
//         });
//     });
//     회원탈퇴 로직 끝