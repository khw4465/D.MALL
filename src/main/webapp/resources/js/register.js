function check(form) {
    var email = form.email.value; //폼의 네임속성이 email인거의 값을 가져온다.
    var regularEx = /^[a-zA-Z0-9._~!@#$%^&*()-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
    //    /^ 정규식의 시작
    // 알파벳+@알파벳+.com
    //  $/ 는 정규식의 끝
    if (!(regularEx.test(email))) {
        alert("이메일 주소를 다시 입력해주세요.");
        return false; // 폼 제출 못함
    }

    // TODO 회원가입 시 데이터 넘어가는것 확인하는 로직 필요
    // 비밀번호 규칙 안지켰더니 alert창은 뜨는데 데이터 안넘어감
    alert('회원가입이 완료되었습니다.');
    return true;
}
