#pragma once

namespace comm {
void init();
void update();

void send_mic_on();
void send_mic_off();

bool is_muted();
} // namespace comm
