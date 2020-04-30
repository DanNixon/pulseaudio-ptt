module PlaceAtCentres(centres)
{
  dx = centres[0] / 2;
  dy = centres[1] / 2;

  for(x = [-dx, dx])
  {
    for(y = [-dy, dy])
    {
      translate([x, y])
      {
        children();
      }
    }
  }
}

module OuterProjection(size, radius)
{
  centres = size - (2 * [radius, radius]);

  hull()
  {
    PlaceAtCentres(centres)
    {
      circle(r=radius, $fn=64);
    }
  }
}

module MountHoles(centres, support_diameter, hole_diameter, hole_edges)
{
  difference()
  {
    PlaceAtCentres(centres)
    {
      circle(d=support_diameter, $fn=32);
    }

    PlaceAtCentres(centres)
    {
      circle(d=hole_diameter, $fn=hole_edges);
    }
  }
}

module InnerProjection(size, wall_thickness, radius, hole_centres, support_diameter, hole_diameter, hole_edges)
{
  difference()
  {
    OuterProjection(size, radius);
    square(size - (2 * [wall_thickness, wall_thickness]), center=true);
  }
  MountHoles(hole_centres, support_diameter, hole_diameter, hole_edges);
}

module LowerPlate(size, radius, hole_centres, hole_diameter, hole_edges)
{
  difference()
  {
    OuterProjection(size, radius);

    PlaceAtCentres(hole_centres)
    {
      circle(d=hole_diameter, $fn=hole_edges);
    }
  }
}
