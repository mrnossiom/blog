+++
title = "Embedded Car"
weight = 2

draft = true

[extra]
# TODO: fix rendering first
# overview = ""
# skills = "rust"
wip = true
+++

INTRO

<!-- more -->

# Story

## Beginning

I wanted to do embedded programmation since I started learning Rust. As a system programmming language, it seemed to be a nice application to explore.

It all started in november 2023, I shared my idea of making a small remote controlled car to some friends. I started right away to do some research on hardware.
By the following day, I had watched content on electricity, DC motors, resistors, etc. That’s how I got hyped about a non-existing car in my own bedroom.

By the end of the week, a friend and I went to [LetMeKnow](https://letmeknow.fr), an electronics store that I already knew about 'cause of 3D printing. I bought material to begin my embedded journey: jumper wires, a breadboard, a battery, a small servomotor, a motor driver, motors and wheels.

At that point I had everything I needed but the microcontroller, which in a way was the core of this project. I found another shop on my way home that could provide me the Holy Blue Pill, a [`STM32F103C8T6`] board, and the associated [`ST-Link V2`] programmer to flash the controller.

<!-- I was actually one euro short to pay because his card machine was broken, but the vendor was nice and let me go with the Holy Grail. -->

First things first, I found the different data sheets about my components. Also, I began experimentating with Rust and [Embassy]. In the following days, I did some soldering and added various theoric implementations to interface with e.g. the motor driver. Fritzing, an open-source software to build circuits, was my choice to conceptualize my board. I went back to buy more hardware components: an ultrasonic sensor, a Bluetooth module and resistors.

## First hardware interactions

First experiments with components were not trouble-free. The ultrasonic sensor, through my calculations, was indicating absurd distances. Same for the Bluetooth, I struggled to connect it to my computer, and get data in and out of it. All I got back was what seemed incoherent/random bytes.

One of the main issue I encountered was the fact that the microcontroller with Embassy on top kindof acts as a black box where it's difficult to get the root cause of what's not working. The most annoying part was the physic layer which I have almost no experience in and can hardly debug correctly.

I reworked the repository to welcome a new `car-controller` crate. It contains software to interact with the car (`GUI`/`CLI`). A [video](https://www.reddit.com/r/rust/comments/yhaslb/media_i_used_rust_as_the_middle_man_for_my_rc_car) found by my friend shows a car being controlled by an XBox controller. I actually have one. That great idea that is now mine (thanks to [a Rust game input library](https://gitlab.com/gilrs-project/gilrs)).

---

<!-- TODO: insert small icon for GitHub, needs icon shortcode -->
See project on GitHub: [`embedded-car`]

[`embedded-car`]: https://github.com/mrnossiom/embedded-car
[`STM32F103C8T6`]: https://stm32-base.org/boards/STM32F051C8T6-Blue-Pill
[`ST-Link V2`]: https://stm32-base.org/boards/Debugger-STM32F103C8U6-STLINKV2
[Embassy]: https://embassy.dev/
