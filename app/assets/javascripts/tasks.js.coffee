# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
$(document).ready ->
  $(document).on 'click', 'div.task .panel-body', (e)->
    task_id = $(this).parent().data('task-id')
    $.ajax
      url: '/tasks/' + task_id + '/edit'
      dataType: 'script'
  $(document).on {
    'mouseenter': ->
      $(this).addClass('fa-check-circle')
      $(this).removeClass('fa-check-circle-o')
      return
    'mouseleave': ->
      $(this).addClass('fa-check-circle-o')
      $(this).removeClass('fa-check-circle')
      return
  }, 'a i'
