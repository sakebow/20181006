$(document).ready(function () {
    $("#forget").click(function () {
        if ($("input[name='id']").val() != "") {
            $.ajax({
                url: '/Login/ResetPassword/?id=' + $("input[name='id']").val(),
                type: 'POST',
                success: function () {
                    alert('RESET ALREADY!');
                },
                error: function () {
                    alert('ID ERROR!');
                }
            });
        } else {
            alert("No ID!");
        }
    });
});