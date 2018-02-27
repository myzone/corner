$fn = 40;
difference()
{
	translate([0, 12, 12])
	difference()
	{
		
		minkowski()
		{

			difference()
			{
				cube([30-12, 100-12*2, 35-12]);

				rotate([0, -3, 0])
				translate([0, -5, -35])
				cube([40, 110, 35]);
			}

			sphere(12, $fn = 60);

		}

		translate([-100, -50, -50])
		cube([100, 200, 100]);

		rotate([0, -3, 0])
		translate([-10, -50, 35-12])
		cube([100, 200, 100]);

		translate([0, -20, 35-12-2])
		rotate([0, -45, 0])
		cube([5, 200, 5]);
	}
/*
	translate([-12+4, 100/2, 35-4 + 8])
	rotate([0, 45, 0])
	translate([0, 0, -2])
	hull()
	{
		
		translate([0, -26, 0])
		cylinder(h = 10, r = 12);

		translate([0, 26, 0])
		cylinder(h = 10, r = 12);
	}
*/

	translate([30+5+1+0.5, 100/2, -1])
	rotate([0, -45, 0])
	translate([0, 0, 17])
	hull()
	{
		translate([0, -26, 0])
		union()
		{
			sphere(r = 4);
			translate([0, 0, 50])
			sphere(r = 4);
		}

		translate([0, 26, 0])
		union()
		{
			sphere(r = 4);
			translate([0, 0, 50])
			sphere(r = 4);
		}
	}

	translate([30+5+1+0.5, 100/2, -1])
	rotate([0, -45, 0])
	translate([0, 0, 50-4])
	hull()
	{
		translate([0, -26, 0])
		cylinder(h = 4, r1 = 4, r2 = 8);

		translate([0, 26, 0])
		cylinder(h = 4, r1 = 4, r2 = 8);
	}

	d = 3;
	translate([20+d, 10-d, 35])
	rotate([0, 0, 90])
//	scale([1, 1, 3])
	minkowski()
	{
		linear_extrude(height=0.1)
		text("87°", font="Source Sans Pro:style=ExtraLight", $fn=10);
//		sphere(1, $fn=20);
		cylinder(h = 1.5, r1=0, r2 = 0.7, $fs=5);
	}

//	translate([-5, 10, 0])
//	cube([100, 100, 100]);
}


translate([0, 25, 35-2])
cube([5+1.6, 50, 3]);
