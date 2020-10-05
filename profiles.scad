
module aluminium_profile(
    length,
    num_profiles = 1
){
    
    profile_width = 20;
    
    for ( i = [0: num_profiles - 1]){
        translate([0,0,profile_width* i])
        difference(){
            cube([length, profile_width, profile_width]);
            
            rotate([0,90,0])
            translate([-profile_width/2, profile_width/2,- length/ 2])
            cylinder(d= 4.2, h= 2 * length, $fn=12);
            
            translate([0,profile_width / 2, profile_width / 2])
            for(r = [0:4]){
                rotate([90 * r,0,0])
                translate([0,0,-profile_width / 2])
                union(){
                    translate([0,-3.1,0])
                    cube([length, 6.2, 1.8]);
                    hull(){
                        translate([0,-13.4/2,1.8])
                        cube([length, 13.4, .1]);
                        translate([0,-3.1,4.0])
                        cube([length, 6.2, 1.8]);
                    }
                }
            }
        }
    }
}


aluminium_profile(400,3);