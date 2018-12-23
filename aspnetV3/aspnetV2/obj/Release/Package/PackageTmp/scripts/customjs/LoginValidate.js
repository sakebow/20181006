$(function () {
    $('#login_verifycode').click(function () {
        $("#verifycode").val('');
        $("#login_verifycode").attr("src", "/Login/VerifyCode?time=" + Math.random());
    })
})