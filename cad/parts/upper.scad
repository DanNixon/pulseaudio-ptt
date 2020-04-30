use <../common.scad>
include <../dimensions.scad>

module Upper()
{
  translate([0, 0, upper_height])
  {
    color("red")
    {
      linear_extrude(upper_plate)
      {
        difference()
        {
          OuterProjection(outer_dimensions, outer_radius);

          /* NeoPixel cutout */
          translate([-15, 0])
          {
            square([5.5, 5.5], center=true);
          }

          /* Cherry switch cutout */
          translate([14, 0])
          {
            square([14.5, 14], center=true);
          }
        }
      }
    }
  }

  color("green")
  {
    linear_extrude(upper_height)
    {
      InnerProjection(outer_dimensions, wall, outer_radius, mounting_hole_centres, hole_support, 3, 5);
    }
  }
}

Upper();
