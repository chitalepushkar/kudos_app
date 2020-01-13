// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import 'bootstrap'
import '../stylesheets/application';

$(document).on("ready turbolinks:load",function() {
  $("button").on("click", function(event){
    event.preventDefault();
    var sender_id = $(".list-group").data("sender")
    var recipient_id = $(this).data("recipient");      
    var kudos_message = $('#kds_txt_' + recipient_id).val();
    $.post('/kudos_recipients',
    { kudos_recipient:  {
      "sender_id": sender_id,
      "recipient_id": recipient_id,
      "message": kudos_message
    }},
      function(data, status, jqXHR){
        $('#kds_txt_' + recipient_id).val("")
        alert("Kudos given successfully.");
    }).fail(function(data, status, jqXHR){
      $('#kds_txt_' + recipient_id).val("")
      if(data["status"] == 400) {
        if(data["responseJSON"] && data["responseJSON"]["error"] && data["responseJSON"]["error"]["sender_id"]) {
          alert("Error: " + data["responseJSON"]["error"]["sender_id"][0])
        }
      }
    });
  });
});