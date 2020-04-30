use <parts/lower.scad>
use <parts/upper.scad>
include <dimensions.scad>

explode = 10;

Lower();

translate([0, 0, lower_plate + lower_height + explode])
{
  Upper();
}
