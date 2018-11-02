jQuery(function ($) {
    jQuery(document).ready(function () {
        $('.slick-codepen').slick({
            draggable: false,
            accessibility: true,
            centerMode: true,
            variableWidth: true,
            slidesToShow: 3,
            speed: 800,
            arrows: true,
            dots: true,
            swipeToSlide: true,
            infinite: true,
            autoplay: true,
            autoplaySpeed: 3200
        });


        var prevSlideInterval = null,
            nextSlideInterval = null;

        function prevSlideAnimation() { $('.slick-codepen').slickPrev(); };
        function nextSlideAnimation() { $('.slick-codepen').slickNext(); };

        $('.slick-prev').on('mouseenter', function () {
            prevSlideInterval = window.setInterval(function () { prevSlideAnimation() }, 200);
        });

        $('.slick-prev').on('mouseleave', function () {
            window.clearInterval(prevSlideInterval);
        });

        $('.slick-next').on('mouseenter', function () {
            nextSlideInterval = window.setInterval(function () { nextSlideAnimation() }, 200);
        });

        $('.slick-next').on('mouseleave', function () {
            window.clearInterval(nextSlideInterval);
        });
    });
})