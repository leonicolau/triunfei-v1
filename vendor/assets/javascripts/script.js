$(document).ready(function(){
    // Change color on scroll
    $(window).scroll(function() {
        var scroll = $(window).scrollTop();
        if (scroll >= 100){
            $(".navbar-default").removeClass("bg-scrolled");
        } else {
            $(".navbar-default").addClass("bg-scrolled");
        }
    });
    // FIX transparent problem
    $(".navbar-toggle").click(function() {
        $(".navbar-default").removeClass("bg-scrolled");
        var collapsed = typeof $('.navbar-collapse').attr("aria-expanded") === "undefined" ? true : !$('.navbar-collapse').attr("aria-expanded");
        if (($(window).scrollTop() < 100) && (!collapsed)){
            $(".navbar-default").addClass("bg-scrolled");
        }
    });
});
