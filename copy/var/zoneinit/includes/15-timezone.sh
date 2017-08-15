#!/bin/bash
# Set system timezone from mdata information
mdata-get system:timezone && sm-set-timezone $(mdata-get system:timezone)
