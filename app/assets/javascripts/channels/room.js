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