$(document).ready(function () {
    $("select[name='courseFaculty']").change(function () {
        var url = '/Admin/SelectSpecialty/?facultyId=' + $("select[name='courseFaculty']").val();
        //alert(url);
        $.getJSON(url, function (data) {
            $("select[name='courseSpecialty']").html('');
            $.each(data, function (i, item) {
                //alert(item);
                $("<option></option>").val(item["专业代码"]).text(item["专业名称"]).appendTo($("select[name='courseSpecialty']"))
            });
        });
    });
    $("select[name='courseSchool']").change(function () {
        var url = '/Admin/SelectFaculty/?schoolId=' + $("select[name='courseSchool']").val();
        alert(url);
        $.getJSON(url, function (data) {
            $("select[name='courseFaculty']").html('');
            $("select[name='courseSpecialty']").html('');
            $.each(data, function (i, item) {
                $("<option></option>").val(item["院系代码"]).text(item["院系名称"]).appendTo($("select[name='courseFaculty']"))
            });
        });
    });
});