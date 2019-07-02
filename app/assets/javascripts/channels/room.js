jQuery(document).on('turbolinks:load', function() {
  const messages = $('#messages');

  if (messages.length > 0) {
    App.room = App.cable.subscriptions.create({ channel: 'RoomChannel', room_id: messages.data('room_id') }, {
      received: function(data) {
        $('#messages').append(data['message']);
      },
      speak: function(message) {
        return this.perform('speak', { message: message });
      }
    });

    $(document).on('submit', '#messageForm', function () {
      const input = document.getElementById('messageInput');
      App.room.speak(input.value);
      $('messageInput').value = '';
    });
  }
});