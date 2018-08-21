$(document).ready(function(){
  $(".spot").on('click', function(){
    var user_move = $(this).data('moves')
    var token = document.getElementsByName('csrf-token')[0].content
    $( "#" + user_move ).append(currentPlayer);
    $( "#" + user_move ).parent().addClass("no-click");
      $.ajax({
        method: 'put',
        url: '/game',
        headers: { 'X-CSRF-Token': token },
        data: { "move": user_move,
                "player": currentPlayer },
        success: function(res) {
          $.ajax({
            method: 'get',
            url: '/',
            data: { "player": currentPlayer },
            success: function(res) {
              currentPlayer = currentPlayer == 'x' ? 'o' : 'x'
            }
        });
      }
      });
    });
  });
