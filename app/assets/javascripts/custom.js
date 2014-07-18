
$( document ).ready(function() {
   $(function () {
    $('#myTab a:first').tab('show');
  })
});

// home page

$(document).ready(function() {
  // navigation click actions
  $('.scroll-link').on('click', function(event){
    event.preventDefault();
    var sectionID = $(this).attr("data-id");
    scrollToID('#' + sectionID, 750);
  });
  // scroll to top action
  $('.scroll-top').on('click', function(event) {
    event.preventDefault();
    $('html, body').animate({scrollTop:0}, 'slow');
  });
  // mobile nav toggle
  $('#nav-toggle').on('click', function (event) {
    event.preventDefault();
    $('#main-nav').toggleClass("open");
  });
  // $('.comment-form').on('ajax:success', function(e, data, textStatus, jqXHR){
  //   $(this).closest(".comments-details").toggleClass("text-center")
  //   console.log(data.description);
  // });

  $('.post').on('submit', '.comment-form', function(event) {
    event.preventDefault();

    var $post = $(event.delegateTarget);

    var action = $(this).attr('action');
    var data = $(this).serialize();

    $.ajax({
      url: action,
      method: 'POST',
      data: data,
      success: function(data) {
        $post.find('#comment-for-post').append('<li>' + data.description + '</li>');
        $post.find('#comment_description').val('');
        currentLikesCount = parseInt($post.find('.likes-count').text(), 10);
        $post.find('.likes-count').text(currentLikesCount + 1);
      },
      error: function(errors) {

      }
    });
  });
});
// scroll function
function scrollToID(id, speed){
  var offSet = 50;
  var targetOffset = $(id).offset().top - offSet;
  var mainNav = $('#main-nav');
  $('html,body').animate({scrollTop:targetOffset}, speed);
  if (mainNav.hasClass("open")) {
    mainNav.css("height", "1px").removeClass("in").addClass("collapse");
    mainNav.removeClass("open");
  }
}
if (typeof console === "undefined") {
    console = {
        log: function() { }
    };
}












