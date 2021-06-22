import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import Swiper, { Navigation, Pagination } from 'swiper'
Swiper.use([Navigation, Pagination]);
import 'swiper/swiper-bundle.css'

require("stylesheets/application.scss")

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', () => {
  const swiper = new Swiper('.swiper-container', {
    loop: true,
    autoplay: true,
    pagination: {
      el: '.swiper-pagination',
    },
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },

  });

})

