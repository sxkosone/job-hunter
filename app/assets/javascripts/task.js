

function showEditForm(){
    event.stopPropagation()
    var item_text = event.target.firstChild.textContent
    var item_path = $(event.target).parent().find('.link-to').children().attr('href')
    var form_authenticity_token = $('#authenticity')[0].textContent
    var form_string = `<form class="inline" action="${item_path}" method="post" accept-charset='UTF-8'><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="${form_authenticity_token}"><input type="hidden" name="_method" value="patch"> <input class="inline" type="text" name="task[description]" value="${item_text}"> <button type="submit" class="btn btn-primary">Update</button> </form>`
    $(event.target).replaceWith(form_string)
}