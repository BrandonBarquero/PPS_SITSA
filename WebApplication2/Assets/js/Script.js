var ShowCells = function () {
    var tbody = jQuery('tbody');
    var row = jQuery('tbody > tr');
    row.addClass('closed');
    row.click(function () {
        if ((!jQuery(this).hasClass('closed')) && (jQuery(this).parent().is("tbody ::after"))) {
            jQuery(this).attr('class', 'closed');
        }
        else {
            row.addClass('closed');
            jQuery(this).removeClass('closed');
        }
    });
}

function colocarPlus() {
    var tbody = jQuery('tbody');
    var row = jQuery('tbody > tr');
    row.addClass('closed');
    row.click(function () {

        var $v_class = $(this).attr('class');

        if ($v_class != 'pagination-ys closed') {
            if ((!jQuery(this).hasClass('closed')) && (jQuery(this).parent().is("tbody"))) {
                jQuery(this).attr('class', 'closed');
            }
            else {
                row.addClass('closed');
                jQuery(this).removeClass('closed');
            }
        }
    });
}

function ActiveDataLinea() {
    $('.nav-tabs a[href="#odc"]').tab('show');
}

jQuery(document).ready(function () {
    ShowCells();
});
