#!/usr/bin/env bash
docker run --rm -it --net host -v /etc/canvas/code:/var/canvas -v /etc/canvas/apache:/etc/apache2/sites-enabled playlyfe/canvas debug
