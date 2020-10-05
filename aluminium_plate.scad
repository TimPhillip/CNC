
module side_plate(){
    
    color("gray")
    translate([-50,0,0])
    cube([100,300,5]);
}

module z_axis_mount_plate(){
    color("grey")
    difference(){
        translate([-50, -50,0])
        cube([100,100,5]);
    
        // M3 mount
        for (dx = [-10, 10]){
            for ( dy = [30,10, -10, -30]){
                translate([dx, dy, 0])
                cylinder(d= 3, h = 50, center =true, $fn=16);
            }
        }
    }
}

module spindle_mount_plate(){
    
    color("grey")
    difference(){
        translate([-50, -50,0])
        cube([100,100,5]);
    
        // M3 mount
        for (dx = [-10, 10]){
            for ( dy = [40,20, -20, -40]){
                translate([dx, dy, 0])
                cylinder(d= 3, h = 50, center =true, $fn=16);
            }
        }
    }
}


//side_plate();
//z_axis_mount_plate();
spindle_mount_plate();