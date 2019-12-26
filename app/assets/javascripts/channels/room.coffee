App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # サーバーサイドから値を受け取る
    $('#posts').append("<h4 style='color: white;'>" + data['customer_first_name'] + "さん<br>" + data['message'] + "</h4>"); # 投稿を追加

  speak: (message) ->
    @perform 'speak', message: message　#サーバーサイドのspeakアクションにmessageパラメータを渡す

jQuery(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return キーのキーコードが13
    App.room.speak [event.target.value, $('[data-user]').attr('data-user'), $('[data-room]').attr('data-room')] # speak メソッド, event.target.valueを引数に.
    event.target.value = ''
    event.preventDefault()