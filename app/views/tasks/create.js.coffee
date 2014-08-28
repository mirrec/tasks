$('#<%= dom_id @task.project %> .uncompleted').append('<%= j render @task %>')
$('#<%= dom_id @task.project %> [name="task[name]"]').val('')
