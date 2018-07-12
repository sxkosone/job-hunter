


function showEditForm() {
    event.stopPropagation()
    var item_text = $(event.target).parent()["0"].innerText
    var item_path = $(event.target).parent().parent().find('.link-to').children().attr('href')
    var form_authenticity_token = $('#authenticity')[0].textContent
    var form_string = `<form class="inline update-task" action="${item_path}" method="post" accept-charset='UTF-8'><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="${form_authenticity_token}"><input type="hidden" name="_method" value="patch"> <input class="inline update-task" type="text" name="task[description]" value="${item_text}"> </form>`
    $(event.target.parentElement).replaceWith(form_string)
    $("input.update-task").focus()
    $("input.update-task").blur(function() {
        $('form.update-task').replaceWith(`<p class="inline">${item_text} <i onclick="showEditForm()" class="fas fa-pencil-alt"></i></p>`)
    });
}


$("input.update-task").keypress(function (event) {
    if (event.which == 13) {
        event.preventDefault();

        $("form.update-task").submit();
    }
});

   



