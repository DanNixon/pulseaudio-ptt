#include "comm.h"

#include <Arduino.h>

bool muted = false;

namespace comm {
void init() {
  Serial.begin(9600);
  while (!Serial) {
    delay(500);
  }
}

void update() {
  if (Serial.available()) {
    auto c = Serial.read();
    switch (c) {
    case 'M':
      muted = true;
      break;
    case 'U':
      muted = false;
      break;
    default:
      break;
    }
  }
}

void send_mic_on() { Serial.print('U'); }
void send_mic_off() { Serial.print('M'); }

bool is_muted() { return muted; }
} // namespace comm
