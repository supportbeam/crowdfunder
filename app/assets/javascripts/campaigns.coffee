$(document).ready ->
  $('button').on 'click', ->
    id = $(this).data("reward_id")
    $.getScript("/campaign/make_pledge/#{id}")
