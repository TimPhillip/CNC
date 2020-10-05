

module nema23(center = false){
     
    translate(center ? [-55, -28.2,-28.2] : [-55,0,0])
    difference(){
        union(){
            cube([55,56.4,56.4]);
            
            
            translate([55,28.2,28.2])
            rotate([0,90,0])
            cylinder(d=38.1, h = 1.6, $fn= 16);
            
            translate([55,28.2,28.2])
            rotate([0,90,0])
            cylinder(d=7.5, h = 27.5, $fn= 16);
        }
   
        //mounts
        for (dx = [-47.4/2, +47.4/2]){
            for (dy = [-47.4/2, +47.4/2]){
                
                translate([-20,28.2 + dx,28.2 +dy])
                rotate([0,90,0])
                //M4
                cylinder(d=4, h = 100, $fn=16);
            }
        }
        
        for (dx = [-28.2, 28.2]){
            for (dy = [-28.2, +28.2]){
                
                translate([-10,28.2 + dx,28.2 + dy])
                rotate([0,90,0])
                cylinder(r=9.1, h = 55 + 10 - 4.8, $fn=16);
            }
        }
        
   }
}

module nema23_with_mounted(){
    
    nema23(center= true);
    translate([27.5,0,0])
    children([0:$children-1]);
    
}


module t8_coupler(){
    rotate([0,90,0])
    difference(){
        cylinder(d = 20, h= 25, center = true);
        cylinder(d = 8, h = 35, center = true);
    }
}

module t8_lead_screw(length){

    rotate([0,90,0])
    cylinder(d=8, h = length);
}

nema23_with_mounted(){
    t8_lead_screw(500);
    t8_coupler();
}