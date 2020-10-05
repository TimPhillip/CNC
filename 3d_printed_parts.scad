
module x_axis_lead_screw_mount(){
    
    difference(){
        hull(){
            translate([0,0,30 -18])
            rotate([0,90,0])
            cylinder(d= 20, h=100, center = true);
            
            translate([-50,-20,0])
            cube([100,40,5]);
        }
        
        translate([0,0,30 -18])
        rotate([0,90,0])
        cylinder(d= 10, h=110, center = true);
        
        // mounts
        for( dx = [-45: 30: 60] ){
           for( dy = [-15, 15]){
               translate([dx, dy, 0])
               cylinder(d=3, h= 30, center = true, $fn=16);
               
               translate([dx, dy, 4])
               cylinder(d=8, h= 30, center = false, $fn=16);
           } 
        }
        
        translate([-51,-25,4])
        cube([31,50,50]);
        
        translate([20,-25,4])
        cube([31,50,50]);
    }
    
}

module x_axis_bearing_mount(){
    
    difference(){
        translate([0,-60,0])
        cube([60,100,6]);
        
        translate([30,-30,0])
        cylinder(d = 30, h = 30, $fn=16, center = true);
        
        translate([-5,0,3])
        cube([70,60,20]);
        
        // M3 mounts
        for(dx = [10, 30, 50]){
           translate([dx,20,0])
           cylinder(d=3, h= 50, center = true, $fn= 16);
        }
    }
}

module y_axis_lead_screw_mount(){
    
    difference(){
        union(){
            translate([-30,5,0])
            cube([60, 30, 8]);
            
            translate([-30,-35,0])
            cube([60, 30, 8]);
            
            hull(){
                translate([-25,0,0])
                rotate([0,90,0])
                cylinder(d=16, h= 10, center=true, $fn=32);
                
                translate([-30,5,0])
                cube([10, 15, 8]);
            
                translate([-30,-20,0])
                cube([10, 15, 8]);
            }
            
            hull(){
                translate([25,0,0])
                rotate([0,90,0])
                cylinder(d=16, h= 10, center=true, $fn=32);
                
                translate([20,5,0])
                cube([10, 15, 8]);
            
                translate([20,-20,0])
                cube([10, 15, 8]);
            }
        }
        
        // M3 mount
        for (dx = [-10, 10]){
            for ( dy = [30,10, -10, -30]){
                translate([dx, dy, 0])
                cylinder(d= 3, h = 50, center =true, $fn=16);
            }
        }
        
        // screw hole
        rotate([0,90,0])
        cylinder(d=8.5, h= 200, center=true, $fn=32);
    }

}


module z_axis_lead_screw_mount(){
    
    difference(){
        union(){
            translate([-30,15,0])
            cube([60, 30, 8]);
            
            translate([-30,-45,0])
            cube([60, 30, 8]);
            
            hull(){
                translate([-25,0,0])
                rotate([0,90,0])
                cylinder(d=16, h= 10, center=true, $fn=32);
                
                translate([-30,5,0])
                cube([10, 15, 8]);
            
                translate([-30,-20,0])
                cube([10, 15, 8]);
            }
            
            hull(){
                translate([25,0,0])
                rotate([0,90,0])
                cylinder(d=16, h= 10, center=true, $fn=32);
                
                translate([20,5,0])
                cube([10, 15, 8]);
            
                translate([20,-20,0])
                cube([10, 15, 8]);
            }
        }
        
        // M3 mount
        for (dx = [-10, 10]){
            for ( dy = [40,20, -20, -40]){
                translate([dx, dy, 0])
                cylinder(d= 3, h = 50, center =true, $fn=16);
            }
        }
        
        // screw hole
        rotate([0,90,0])
        cylinder(d=8.5, h= 200, center=true, $fn=32);
    }

}


//x_axis_lead_screw_mount();
//x_axis_bearing_mount();
//y_axis_lead_screw_mount();
z_axis_lead_screw_mount();