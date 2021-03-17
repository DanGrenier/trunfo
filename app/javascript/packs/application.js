// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("channels")
require("jquery")
require("jquery-ui")


import "bootstrap";
import "@fortawesome/fontawesome-free/js/all";
import "../stylesheets/application";
import $ from 'jquery';

global.$ = jQuery;

require.context('../images', true, /\.(?:png|jpg|gif|ico|svg)$/)

document.addEventListener("turbolinks:load", () => {
  var data = $('body').data();
  $(document).trigger(data.controller+'#'+data.action+':loaded');
	
	$( ".dropdown-submenu" ).click(function(event) {
    
    // stop bootstrap.js to hide the parents
    event.stopPropagation();
    // hide the open children
    $( this ).find(".dropdown-submenu").removeClass('open');
    // add 'open' class to all parents with class 'dropdown-submenu'
    $( this ).parents(".dropdown-submenu").addClass('open');
    // this is also open (or was)
    $( this ).toggleClass('open');
     });

  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
})
