

function showEditForm() {
    event.stopPropagation()
    var item_text = $(event.target).parent()["0"].innerText
    var item_path = $(event.target).parent().parent().find('.link-to').children().attr('href')
    var form_authenticity_token = $('#authenticity')[0].textContent
    var form_string = `<form class="inline update-task" action="${item_path}" method="post" accept-charset='UTF-8'><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="${form_authenticity_token}"><input type="hidden" name="_method" value="patch"> <input class="inline update-task" type="text" name="task[description]" value="${item_text}"> </form>`
    // Replace the text with a form to update
    $(event.target.parentElement).replaceWith(form_string)
    // Focus the user on the input field
    $("input.update-task").focus()
    // Listen for leave focus of input
    $("input.update-task").blur(function() {
        // If the user has not changed the input the form will not submit
        if ($(this)['0'].value === item_text) {
            $('form.update-task').replaceWith(`<p class="inline">${item_text} <i onclick="showEditForm()" class="fas fa-pencil-alt"></i></p>`)
        } else {
            // If the user changed the value and clicks away the value will update
            $("form.update-task").submit();
        }
    });
}

// If the user hits enter while updating a task the form will submit and the task will update
$("input.update-task").keypress(function (event) {
    if (event.which == 13) {
        event.preventDefault();

        $("form.update-task").submit();
    }
});

   



