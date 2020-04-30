#include "ptt_button.h"

#include <Arduino.h>
#include <Bounce2.h>

constexpr auto button_pin = 5;

Bounce button;

namespace ptt_button {
void init() {
  button.attach(button_pin, INPUT_PULLUP);
  button.interval(25);
}

void update() { button.update(); }

bool was_pressed() { return button.fell(); }
bool was_released() { return button.rose(); }
} // namespace ptt_button
