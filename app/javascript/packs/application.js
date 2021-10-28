import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "controllers"

import Swiper, { Navigation, Pagination, Autoplay, EffectFade, Lazy } from 'swiper'
Swiper.use([ Navigation, Pagination, Autoplay, EffectFade, Lazy ])
import 'swiper/swiper-bundle.css'

require("stylesheets/application.scss")

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', () => {

})

