// translate([0,0*19,0])
// rotate([0,0,180])
// mirror([0,0,0])
// scale([1,1,1])

$fn=100;
angle_down=17.5;
angle_left_right=17;
camera_updown = -1;

difference() {
    union() {
        translate([-26.5,0,0])
        rotate([0,0,90])
            import("Klemme_Extruderkabel_2_1.stl");

        translate([camera_updown,0,0])
        color( "orange", 0.5)

        translate([camera_updown,0,0])
        polyhedron([[ 27.5,-26.5,  0 ],                                 //0
                    [ 27.5,  9,  0 ], //1
                    [ 20,    9,  0 ], //2
                    [ 12.5, -5,  0 ],           //3
                    [ 12.5,-12.5,  0 ],              //4
                    [ 20,  -26.5,  0 ],                              //5

                    [ 27.5,-22.5,  8 ],                                 //6
                    [ 27.5,  5,  8 ], //7
                    [ 20,    5,  8 ], //8
                    [ 15.5, -5,  8 ],            //9
                    [ 15.5,-12.5,  8 ],              //10
                    [ 20,  -22.5,  8 ]],                               //11

                   [[0,1,2,3,4,5],  // bottom
                    [11,6,0,5],  // front
                    [8,7,6,11,10,9],  // top
                    [6,7,1,0],  // right
                    [7,8,2,1],  // back
                    [8,9,3,2], //angle back
                    [10,11,5,4], //angle front
                    [9,10,4,3]] // left
        );

        color( "green", 0.5)
        translate([-5.6,-7,0])
            cube([20, 3, 8]);

        color( "yellow", 0.5)
        translate([-7,-14.5,0])
        union() {
            cube([21, 11, 5]);
            translate([0,-4,0])
                cube([4, 20, 5]);
        }
    }

    color( "blue", 0.5)
        translate([-39,-10.5,0])
            cube([31.5, 6, 7]);

    translate([camera_updown,0,0]) {
        translate([21,2.5,-2])
            rotate([-angle_left_right,-angle_down,0])
                cube([8,5,3]);

        translate([21,-25,-3.5])
            rotate([angle_left_right,-angle_down,0])
                cube([8,5,3]);

        translate([30,-8.75,-25])
            rotate([0,-angle_down,0])
                cylinder(h=50, d=7.4);
    }

    translate([-8,-15.25,4])
        screwcutout();

    translate([-37.25,15.25,4])
        screwcutout();
    
    translate([7.25,-15,-0.1])
        cube([5.5, 20, 2]);

    color( "red", 0.5)
        translate([-36,21.5,-0.1])
            rotate([0,0,-34])
                cube([40, 20, 8]);

    color( "red", 0.5)
        translate([-60,-26.2,-0.1])
            rotate([0,0,-22])
                cube([40, 20, 8]);
}

module screwcutout() {
    color( "brown", 0.2)
        union() {
            cylinder(h=2.1, d=9);
            translate([-6.75,0,-5]) cylinder(h=10, d=3.5);
            translate([-7.1,-1.75,-5]) cube([5,3.45,10]);
            translate([-8.5,-4.5,0]) cube([8,9,2.1]);
            translate([-2.5,0,-5]) cylinder(h=10, d=3.5);
            translate([-9,0,0]) cylinder(h=2.1, d=9);
        }
}

showReference=true;
if (showReference) {
    color( "blue", 0.7 )
    rotate([0,-90,0])
    translate([-46,-9.05,-36.2])
    import("Nozzle_cam_and_LEDs_artillery_holder.stl");
}