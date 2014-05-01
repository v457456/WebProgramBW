$(document).ready(function () {

    $('.menu_head').click(function () {
        var oneVisible = $('ul.menu_body').is(':visible');
        var twoVisible = $('ul.menu_body2').is(':visible');
        if (oneVisible) {
            $('ul.menu_body').slideUp('medium');
        } else {
            if (twoVisible) {
                $('ul.menu_body2').slideUp('fast');
            }
            $('ul.menu_body').slideDown('medium');
        }
        return false;
    });
    $('.menu_head2').click(function () {
        var oneVisible = $('ul.menu_body').is(':visible');
        var twoVisible = $('ul.menu_body2').is(':visible');
        if (twoVisible) {
            $('ul.menu_body2').slideUp('medium');
        } else {
            if (oneVisible) {
                $('ul.menu_body').slideUp('fast');
            }
            $('ul.menu_body2').slideDown('medium');
        }
        return false;
    });
});