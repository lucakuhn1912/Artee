import 'slick-carousel';

$('.slick-carousel').slick({
  prevArrow: '<i class="fas fa-chevron-left"></i>',
  nextArrow: '<i class="fas fa-chevron-right"></i>',
  infinite: true,
  slidesToShow: 3,
  slidesToScroll: 2,
  autoplay: true,
  responsive: [
  {
    breakpoint: 992,
    settings: {
      slidesToShow: 2
    }
  },
  {
    breakpoint: 1200,
    settings: {
      slidesToShow: 3
    }
  },
  {
    breakpoint: 768,
    settings: {
      slidesToShow: 1
    }
  }
  ]
});
