$('#<%= dom_id @task %>').replaceWith('<%= j render 'form', task: @task %>')
