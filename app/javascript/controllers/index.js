// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

// import CarouselController from "./carousel_controller"
// application.register("carousel", CarouselController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import Carousel from '/home/larotka/code/Larotka/fuckhoomans/node_modules/stimulus-carousel/dist/stimulus-carousel'
application.register('carousel', Carousel)
