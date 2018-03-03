$fn = 40;

module corner(length, height, gradient, radius, hole_radius) {
    hole_length=length-radius*4;
    belt_width=1;

    module main_block() {
        module front_side_cut() {
            translate([-radius*2, -length/2, 0])
                cube([radius*2, length*2, height*2]);
        }

        module top_side_cut() {
            translate([0, -length/2, height])
                rotate([0, -gradient, 0])
                translate([-height/2, 0, 0])
                cube([height*2, length*2, height*2]);
        }

        module bottom_side_cut() {
            rotate([0, -gradient, 0])
                translate([-height/2, 0, -height])
                cube([height*2, length, height]);
        }

        module belt_cut() {
            rotate([0, -gradient, 0])
                translate([belt_width, 0, -height+belt_width])
                cube([height*2, length, height]);
        }

        module chamfer() {
            translate([0, -length/2, height-2])
                rotate([0, -45, 0])
                cube([5, length*2, 5]);
        }

        difference() {
            translate([0, radius, radius])
                minkowski() {
                    difference() {
                        cube([height-radius, length-radius*2, height-radius]);

                        translate([0, -radius, 0])
                            bottom_side_cut();
                    }

                    sphere(radius);
                }

            front_side_cut();
            top_side_cut();

            belt_cut();

            chamfer();
        }
    }


    module hole_chamfer() {
        translate([height*0.25, length/2, height*0.75])
            rotate([0, -45, 0])
            hull()
            union()
            for (x=[hole_length/2, -hole_length/2])
                translate([0, x, 0])
                    cylinder(h=height, r1=0, r2=height*sin(45));
    }

    module trash_hole() {
        translate([height, length/2, -1])
            rotate([0, -45, 0])
            translate([0, 0, radius+hole_radius])
                hull()
                union()
                for (x=[hole_length/2, -hole_length/2],
                     y=[0, height*2])
                    translate([0, x, y])
                        sphere(r=hole_radius);

        hole_chamfer();
    }

    module hole_support() {
        intersection() {
            translate([0, radius*2, height-2])
                cube([height, hole_length, hole_radius]);

            translate([-0.2, 0, 0])
                hole_chamfer();
        }


    }

    module label() {
        x=2;
        y=1;

        translate([height-radius+y, radius-x, height-1])
            rotate([0, 0, 90])
            minkowski() {
                linear_extrude(height=2)
                    text(text=str(90 - gradient, "°"), font="Source Sans Pro:style=ExtraLight", $fn=5);

                cylinder(h=10, r1=0, r2=0.7, $fs=4);
            }
    }

    difference() {
        main_block();
        trash_hole();

        label();
    }

    hole_support();
}

corner(length=100, height=30, gradient=3, radius=7, hole_radius=4);