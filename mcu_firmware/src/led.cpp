#include "led.h"

#include <FastLED.h>

constexpr auto num_leds = 1;
constexpr auto data_pin = 17;

CRGB leds[num_leds];

void show_color(CRGB const c) {
  for (auto i = 0; i < num_leds; i++) {
    leds[i] = c;
  }
  FastLED.show();
}

namespace led {
void init() {
  FastLED.addLeds<NEOPIXEL, data_pin>(leds, num_leds);
  show_color(CRGB::Blue);
}

void show_mic_on() { show_color(CRGB::Red); }
void show_mic_off() { show_color(CRGB::Green); }
} // namespace led
