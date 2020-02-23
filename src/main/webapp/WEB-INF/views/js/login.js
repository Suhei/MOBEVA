$(function () {
    $("#dialog").dialog({
        autoOpen: false,
        modal: true,
        width: 515,
        title: "會員登入",
        show: {
            effect: "blind",
            duration: 500
        },
        hide: {
            effect: "explode",
            duration: 500
        },
    });
    $("#opener").on("click", function () {
        $("#dialog").dialog("open");
    });
});