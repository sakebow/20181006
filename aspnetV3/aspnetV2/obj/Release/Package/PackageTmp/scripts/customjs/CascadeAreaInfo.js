$(document).ready(function () {
    $("select[name='country']").change(function () {
        var url = '/Student/SelectProvince/?countryId=' + $("select[name='country']").val();
        alert(url);
        $.getJSON(url, function (data) {
            $("select[name='province']").html('');
            $("select[name='city']").html('');
            $("select[name='area']").html('');
            $("<option></option>").val("0").text("0").appendTo($("select[name='province']"));
            $.each(data, function (i, item) {
                alert(item);
                $("<option></option>").val(item["省份代码"]).text(item["省份名称"]).appendTo($("select[name='province']"));
            });
        });
    });
    $("select[name='province']").change(function () {
        var url = '/Student/SelectCity/?provinceId=' + $("select[name='province']").val();
        alert(url);
        $.getJSON(url, function (data) {
            $("select[name='city']").html('');
            $("select[name='area']").html('');
            $.each(data, function (i, item) {
                $("<option></option>").val(item["城市代码"]).text(item["城市名称"]).appendTo($("select[name='city']"));
            });
        });
    });
    $("select[name='city']").change(function () {
        var url = '/Student/SelectArea/?cityId=' + $("select[name='city']").val();
        alert(url);
        $.getJSON(url, function (data) {
            $("select[name='area']").html('');
            $.each(data, function (i, item) {
                $("<option></option>").val(item["区县代码"]).text(item["区县名称"]).appendTo($("select[name='area']"));
            });
        });
    });
});