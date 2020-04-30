#!/bin/sh

set -ex

out_dir='out'
mkdir "$out_dir"

openscad 'parts/lower.scad' -o "$out_dir/lower.stl"
openscad 'parts/upper.scad' -o "$out_dir/upper.stl"
