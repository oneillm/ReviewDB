// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

$((function () {
           $(".tab-content").hide();
           if(document.location.hash !='') {
                 showTabByHash();
           }
           else {
                 showFirstTab()
           }

           $('#tabs ul li a').click(function(ev){
               ev.preventDefault();
               showTab($this);
           });
         });
           function showTab(tab) {
               $('#tabs ul li').removeClass('selected');
               tab.addClass('selected');
               $(".tab-content").hide();
               var activeTab = tab.find("a").attr("href");
               $(activeTab).fadeIn();
           }
           function showTabByHash() {
               var tabName = window.location.hash;
               var tabNumber = '1';
               $(tabName).show();
               $("#tabs ul li:nth-child(tabNumber)").addClass('selected').show();
           }
           function showFirstTab(){
                  $("#tabs ul li:first").addClass('selected').show();
                  $(".tab-content:first").show();
           }
