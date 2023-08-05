// 페이지가 로드되면 실행
window.onload = function () {
    // URL의 쿼리 매개변수를 읽어옴
    var urlParams = new URLSearchParams(window.location.search);

    // 'msg' 매개변수가 있는지 확인
    if (urlParams.has('msg')) {
        var msg = urlParams.get('msg');// 'msg' 매개변수의 값을 읽어옴
        msg = decodeURIComponent(msg);// 메시지를 디코딩
        alert(msg);// 알림을 표시
    }
    if (urlParams.has('histmsg')) {
        var msg = urlParams.get('histmsg');  // 'msg' 매개변수의 값을 읽어옴
        msg = decodeURIComponent(msg); // 메시지를 디코딩
        alert(msg);  // 알림을 표시
    }
};

//관리자로그인 active
$(document).ready(function(){
    $('.tabMenu > li > a').click(function(event) {
        event.preventDefault(); // Prevent the default action
        $('.tabMenu > li').removeClass('active'); // remove active class from all li elements
        $(this).parent().addClass('active'); // add active class to the clicked li element's parent
    });
});

//로그인버튼

