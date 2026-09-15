#!/bin/bash

while [[ true ]]; do
  nvim /tmp/pi/pi-input.md
  cat /tmp/pi/pi-input.md
  if [[ -s /tmp/pi/pi-input.md ]]; then
    pi < /tmp/pi/pi-input.md > /tmp/pi/pi-output.md
  else
    echo "Pi time is over"
    break
  fi
  cat /tmp/pi/pi-output.md >> /tmp/pi/pi-input.md
done
