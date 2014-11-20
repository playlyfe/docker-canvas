#!/usr/bin/env bash
gosu postgres createuser canvas --no-createdb --no-superuser --no-createrole
gosu postgres createdb canvas_production --owner=canvas
gosu postgres createdb canvas_queue_production --owner=canvas
