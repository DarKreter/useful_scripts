#!/bin/bash
# Display temp of everything in system

sensors # need `lm-sensors` package
echo ""
hddtemp /dev/sd?
