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
//= require turbolinks
//= require_tree .


;(function( $, window, undefined ){

  // GLOBAL SCOPE VARIABLES
  var error = $('#js-form-error'),
    map,
    geocoder,
    flag;

  var gMaps = {
    'codeAddress':function(a, b) {
      var c = new google.maps.Geocoder();
      c.geocode( { 'address': a }, function(d, e) {
        if (e == google.maps.GeocoderStatus.OK) { b(d[0].geometry.location); }
      });
    },
    'returnCoords':function (a){
      return new google.maps.Latlng( a.lat(), a.lng() );
    }
  }

  var formTools = {
    'check_regex':function( a ){
       a.parent().removeClass('has-error');
        if( a.val().length > 1 || new RegExp( a.attr('data-regex'), 'i' ).test( a.val() ) ){
          flag = true;
      } else {
       a.parent().addClass('has-error');
       flag = false;
       return false;
      }
    }
  }


  // TOGGLE TOOLBAR
  $(document).on('click', '#js-tools-trigger', function(){
  $('#js-tools').slideToggle();
  });


  // CHECK HOTEL NAME AGAINST DATABSE RECORDS
  $(document).on('blur','#js-check-hotel-name', function(){
    a = $(this),
    b = a.parent();
    $.get( a.data('validate'),
    { hotel: a.val()
    }).success(function(){ b.removeClass('has-error has-success').addClass('has-success');
    }).error(function(){ b.removeClass('has-error has-success').addClass('has-error');
    });
  });



  // GEOCODE ANY PART OF ADDRESS STRING FOR PINPOINT ACCURACY OF HOTEL
  $(document).on('blur','.hotel-location', function( event ){
   var geocodeString = '';
   $('.hotel-location').each(function(){
       gMaps.geocodeString += $(this).val() + '+';
   });
   initialize( geocodeString );
  });


  // SUBMIT NEW HOTEL DATA

  $('#js-new-hotel').submit( function( event ){
  event.preventDefault();
    var form = $(this),
        formAction = form.attr('data-action');
        formData = form.serialize();

    error.html('').hide();

    $(this).find('[data-regex]').each( function(){
      formTools.check_regex( $(this) )
    });

    if( flag == true ){

     $.ajax({ url:formAction, type:'GET', data:formData,
        async:false,
        headers : { "cache-control": "no-cache" },
        success:function( data ){
            var data = $.parseJSON(data);
            error.html(data.message)
            if( data.status == true ){
              error.addClass("alert alert-success");
              form.reset();
            } else {
              error.addClass("alert alert-danger");
            }
            error.slideDown();
        },
        cache:false,
        contentType:false,
        processData:false
     });
    }
  });


  // GOOGLE MAP HOTEL GEOCODE
  function initialize( geocodeString ) {

    var mapOptions = { zoom: 10, center: new google.maps.LatLng(-34.397, 150.644) };
    var mapID = document.getElementById('map-canvas');

    map = new google.maps.Map(mapID, mapOptions);

    if( geocodeString.length > 1){
      newCenter = geocodeString.split(' ').join('+');

      gMaps.codeAddress(newCenter, function(center){
        map.setCenter(center);
        map.setZoom(17);
        $('#js-hotel-lat').val( center.lat() );
        $('#js-hotel-lng').val( center.lng() );
        var marker = new google.maps.Marker({ position: center, map: map, draggable:true });
        google.maps.event.addListener( marker, 'dragend', function( event ) {
          $('#js-hotel-lat').val( event.latLng.lat() );
          $('#js-hotel-lng').val( event.latLng.lng() );
        });
      });
    }
  }


  //
  if( typeof google == "object"){
    google.maps.event.addDomListener(window, 'load', initialize);
  }


  // IMGUR FILE UPLOAD AND RETURN LINK - API ID 96d8d26a87f164a
  $(document).ready(function(){
    $('#js-new-hotel-image').submit(function( event ) { alert('asdasd')
      event.preventDefault();
      var form = $(this),
          formBtn = form.find('button'),
          formData = new FormData(form[0]),
          urlField = $('#js-hotel-image-src'),
          imageField = $('#js-image-window');

      error.html('');

      $.ajax({
          url:'/hotel/upload',
          type:'POST',
          data:formData,
          async:false,
          headers : { "cache-control": "no-cache" },
          success:function ( imgurData ) {
              var imgurData = JSON.parse(imgurData);
              if ( imgurData.success == true ) {
                urlField.val( imgurData.data.link );
                imageField.html('<img src='+imgurData.data.link+' style="height:100%; width:auto;" />');
                  form.trigger('reset');
              } else {
                  error.html( imgurData.success ).addClass('alert-danger');
              }
          },
          cache:false,
          contentType:false,
          processData:false
       });
    });
  })

})( jQuery, window );
