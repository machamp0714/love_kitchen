App.room = App.cable.subscriptions.create({ channel: "RoomChannel" }, {
  connected: function() {

  },

  disconnected: function() {

  },

  received: function(data) {
    alert(data['message'])
  },

  speak: function(message) {
    return this.perform('speak', { message: message });
  }
});

$(document).on('submit', '#messageForm', function() {
  const input = document.getElementById('messageInput');
  App.room.speak(input.value);
  input.value = '';
});