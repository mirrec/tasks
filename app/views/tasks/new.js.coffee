$('#<%= dom_id @project %> .uncompleted').append('<%= j render 'form', task: @task %>')
$('#<%= dom_id @task %> input[name="task[name]"]').focus()
