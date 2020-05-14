#!/usr/bin/env python3

import pulsectl
import serial
import threading


source_name = 'alsa_input.pci-0000_00_1f.3.analog-stereo'
serial_port = serial.Serial('/dev/ttyACM0')


class UpdateThread(threading.Thread):
    def run(self):
        with pulsectl.Pulse('ptt-mute-listener') as pulse:
            def update():
                source = pulse.get_source_by_name(source_name)

                print('Source muted:', source.mute)
                serial_port.write(b'M' if source.mute else b'U')


            def stop_on_event(ev):
                raise pulsectl.PulseLoopStop

            pulse.event_mask_set('source')
            pulse.event_callback_set(stop_on_event)

            update()

            while True:
                pulse.event_listen()
                update()


ut = UpdateThread()
ut.start()


with pulsectl.Pulse('ptt-mute-setter') as pulse:
    # List sources
    print('\n'.join([s.name for s in pulse.source_list()]))

    while True:
        source = pulse.get_source_by_name(source_name)

        a = serial_port.read()
        pulse.mute(source, mute=a==b'M')
