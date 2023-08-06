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
    return true;
}

function checkPasswordLength(input) {
    var errorElement = document.getElementById('passwordError');

    if (input.value.length < 8) {
        errorElement.style.display = 'block';
    } else {
        errorElement.style.display = 'none';
    }
}

function validatePassword() {
    var pwd = document.getElementById('loginJoinCustPwd1').value;
    var pwd2 = document.getElementById('loginJoinCustPwd2').value;
    var confirmError = document.getElementById('confirmError');
    var confirmSuccess = document.getElementById('confirmSuccess');

    if (pwd !== pwd2) {
        confirmError.style.display = 'block';
        confirmSuccess.style.display = 'none';
    } else {
        confirmError.style.display = 'none';
        confirmSuccess.style.display = 'block';
    }
}
