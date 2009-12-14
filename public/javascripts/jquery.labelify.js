function applyClick() {
    var data = {};
    data['field'] = $(this).attr('associate');
    data['value'] = $($(this).attr('associate')).attr('value');
    $.post('/profile_update', data, null, 'json');
    $(this).attr('src', '/images/loading.gif');
    $($(this).attr('associate')).removeClass('labelified_active');
    $($(this).attr('associate')).addClass('labelified');
    $($(this).attr('associate')).attr('read_only', true);
    $($(this).attr('associate')).bind('click', onClick);
    $($(this).attr('associate')).bind('click', onClick);
    $($(this).attr('associate')).bind('mouseover', onMouseOver);
    $($(this).attr('associate')).bind('mouseleave', onMouseLeave);
    $($(this).attr('associate')).bind('mouseout', onMouseLeave);
    $(this).remove();
}

function onClick() {
    $(this).attr('read_only', false);
    $(this).removeClass('labelified');
    $(this).addClass('labelified_active');
    $(this).unbind('click', null);
    $(this).unbind('mouseover', null);
    $(this).unbind('mouseleave', null);
    $(this).unbind('mouseout', null);
    $('#edit_' + $(this).attr('id')).remove();
    $(this).after('<img src="/images/apply_icon.png" width="15px" class="apply" associate="#' + $(this).attr('id') + '">')
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