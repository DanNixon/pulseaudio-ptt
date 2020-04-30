#include "ptt_button.h"
#include "comm.h"
#include "led.h"

void setup()
{
  ptt_button::init();
  led::init();
  comm::init();

  comm::send_mic_off();
}

void loop()
{
  ptt_button::update();

  if (ptt_button::was_pressed()) {
    comm::send_mic_on();
  } else if (ptt_button::was_released()) {
    comm::send_mic_off();
  }

  comm::update();

  if (comm::is_muted()) {
    led::show_mic_off();
  } else {
    led::show_mic_on();
  }
}
