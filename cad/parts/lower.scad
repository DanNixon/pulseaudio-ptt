use <../common.scad>
include <../dimensions.scad>

module Lower()
{
  translate([0, 0, lower_plate])
  {
    difference()
    {
      color("blue")
      {
        linear_extrude(lower_height)
        {
          InnerProjection(outer_dimensions, wall, outer_radius, mounting_hole_centres, hole_support, 3.5, 16);
        }
      }

      translate([-(outer_dimensions[0] / 2) - 1, -9 / 2, 3])
      {
        cube([wall + 2, 9, 4]);
      }
    }
  }

  color("magenta")
  {
    linear_extrude(lower_plate)
    {
      LowerPlate(outer_dimensions, outer_radius, mounting_hole_centres, 3.5, 16);
    }
  }
}

Lower();
