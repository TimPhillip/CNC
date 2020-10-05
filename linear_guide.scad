
module mgn12h
(
    length,
    cart_position = 0 
){

    rail(length);
    translate([cart_position,0,0])
    cart();
}

module rail(length){
    
    difference(){
        translate([0,-6])
        cube([length,12,8]);
        
        
        for( d = [10:25:length]){
            translate([d,0,0])
            cylinder(d=4, h= 30, center= true, $fn= 12);
        }
    }
}

module cart(){
    
    translate([-45.4 / 2,0,0])
    difference(){
        translate([0,-27/2,6])
        cube([45.4,27,7]);
        
        translate([0,-13/2,6])
        cube([45.4,13,2]);
        
        // m3 mounts
        translate([45.4 / 2 - 10,-10,10])
        cylinder(d= 3, $fn=12, h = 20, center= true);
        
        translate([45.4 / 2 + 10,-10,10])
        cylinder(d= 3, $fn=12, h = 20, center= true);
        
        translate([45.4 / 2 - 10,+10,10])
        cylinder(d= 3, $fn=12, h = 20, center= true);
        
        translate([45.4 / 2 + 10,+10,10])
        cylinder(d= 3, $fn=12, h = 20, center= true);
    }

}

mgn12h(500, 250);