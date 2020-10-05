

module spindle_motor(){
    // body
    cylinder(d = 52, h= 158, $fn=64); /* h= 208 ???*/
    
    // 
    translate([0,0,-18 -13])
    cylinder(d= 19, h = 18 + 13);
}


spindle_motor();