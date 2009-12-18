function applyClick() {
    var data = {};
    data['field'] = $(this).attr('associate');
    data['value'] = $($(this).attr('associate')).attr('value');
    $.post('/profile_update', data, null, 'json');

    $($(this).attr('associate')).attr('read_only', true);
    $($(this).attr('associate')).bind('click', onClick);
    $($(this).attr('associate')).bind('click', onClick);
    $($(this).attr('associate')).bind('mouseover', onMouseOver);
    $($(this).attr('associate')).bind('mouseleave', onMouseLeave);
    $($(this).attr('associate')).bind('mouseout', onMouseLeave);
    if ($($(this).attr('associate')).attr('id') == 'date') {
        $($(this).attr('associate')).removeClass('date-pick');
        $('.dp-choose-date').remove();
    }
    $($(this).attr('associate')).removeClass('labelified_active');
    $($(this).attr('associate')).addClass('labelified');
    // document.removeChild(document.getElementById($(this).attr('id')));
    $(this).remove();
}

function onClick() {
    $(this).removeClass('labelified');
    $(this).unbind('click', null);
    $(this).unbind('mouseover', null);
    $(this).unbind('mouseleave', null);
    $(this).unbind('mouseout', null);
    $('#edit_' + $(this).attr('id')).remove();
    $(this).after('<img src="/images/apply_icon.png" width="15px" class="apply" associate="#' + $(this).attr('id') + '">')
    console.log($(this).attr('id'));
    if ($(this).attr('id') == 'date') {
        $(this).addClass('date-pick');
        $('.date-pick').datePicker({startDate:'01/11/2009'});
        $(this).attr('read_only', true);
    } else {
        $(this).attr('read_only', false);
        $(this).addClass('labelified_active');
    }
}

function onMouseOver() {
    if ($('#edit_' + $(this).attr('id')).length == 0) {
        $(this).after('<img src="/images/edit_icon.png" width="15px" class="apply" id= "edit_' + $(this).attr('id') + '" associate="#' + $(this).attr('id') + '">')
    }
}

function onMouseLeave() {
    $('#edit_' + $(this).attr('id')).remove();
}

function labelify() {
    $('.apply').live('click', applyClick);
    $('.labelified').bind('click', onClick);
    $('.labelified').bind('mouseover', onMouseOver);
    $('.labelified').bind('mouseleave', onMouseLeave);
    $('.labelified').bind('mouseout', onMouseLeave);
}