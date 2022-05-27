let joinProceed = true;
let msg = "";
$(document).ready(function () {
    $("#userJoin").click(function () {
        if (!joinProceed) {
            alert("가입 진행중입니다.");
            return;
        }
        joinProceed = false;
        if ($("#userName").val() === "") {
            msg = "이름을 입력해 주세요.";
            setMessage(msg, "#userName");
            joinProceed = true;
            return;
        }
        if ($("#birthDate").val() === "" || $("#birthDate").val().length != 6) {
            msg = "생년월일은 6자리로 입력해 주세요.";
            setMessage(msg, "#birthDate");
            joinProceed = true;
            return;
        }
        if ($("#userId").val() === "") {
            msg = "아이디를 입력해 주세요.";
            setMessage(msg, "#userId");
            joinProceed = true;
            return;
        }
        if ($("#pwd").val() === "") {
            msg = "비밀번호를 입력해 주세요.";
            setMessage(msg, "#pwd");
            joinProceed = true;
            return;
        }
        if (registerValidation('pwd', $("#pwd").val())) {
            msg = "비밀번호는 10~20자 영문, 숫자, 특수문자 중 2종류 이상을 사용해주세요.";
            setMessage(msg, "#pwd");
            joinProceed = true;
            return;
        }
        if ($("#pwd").val() !== $("#pwdCheck").val()) {
            msg = "비밀번호가 일치 하지 않습니다.";
            setMessage(msg, "#pwdCheck");
            joinProceed = true;
            return;
        }
        if ($("#email").val() === "") {
            msg = "이메일을 입력해 주세요.";
            setMessage(msg, "#email");
            joinProceed = true;
            return;
        }
        if (registerValidation('email', $("#email").val())) {
            msg = "이메일 주소 형식에 맞게 입력해주세요.";
            setMessage(msg, "#email");
            joinProceed = true;
            return;
        }
        if ($("#phoneNum").val() === "") {
            msg = "휴대폰번호를 입력해 주세요.";
            setMessage(msg, "#phoneNum");
            joinProceed = true;
            return;
        }
        if (registerValidation('phone', $("#phoneNum").val())) {
            msg = "휴대폰 번호는 10~11자리 숫자로 입력해주세요.";
            setMessage(msg, "#phoneNum");
            joinProceed = true;
            return;
        }

        $.ajax({
            type: 'POST',
            url: "/goods/register/memberInsert",
            headers: {"content-type": "application/json"},
            dataType: 'text',
            data: JSON.stringify(toJson("#joinForm")),
            success: function (data) {
                let result = JSON.parse(data);
                if (result.result) {
                    alert(result.message);
                    window.location.href = "/goods/register/registerConfirm";
                    return;
                }
                $("#msg").html('<i class="fa fa-exclamation-circle"> ' + result.message);
                joinProceed = true;
                return;
            },
            error: function () {
                alert("error");
            }
        });
    });
});
function setMessage(msg, id) {
    /* $("#msg").html(text)*/
    document.getElementById("msg").innerHTML = '<i class="fa fa-exclamation-circle"> ' + msg + '</i>';
    $(id).focus();
};