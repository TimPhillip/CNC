use<parts/profiles.scad>
use<parts/linear_guide.scad>
use<parts/aluminium_plate.scad>
use<parts/stepper_motor.scad>
use<parts/3d_printed_parts.scad>
use<parts/spindle_motor.scad>

/* [Frame]*/
// Show the main frame
main_frame = true;
// Show the horinzontal frame
horizontal_frame = true;
// Show the MDF Ground plate
mdf_plate = true;

/* [Axis] */
// Show the X-Axis
x_axis = true;
// Show the Y-Axis
y_axis = true;
// Show the Z-Axis
z_axis = true;

/* [Motor] */
// Show the spindle motor
spindle = false;


module main_frame(length, width, height){
    
    translate([20,0,0])
    union(){
        aluminium_profile(length, 3);
        
        translate([-20,width,0])
        aluminium_profile(length,3);
        
        rotate([0,0,90])
        aluminium_profile(width,3);
        
        translate([length,20,0])
        rotate([0,0,90])
        aluminium_profile(width,3);
    }
    
    translate([10,0,50])
    rotate([90,0,0])
    mgn12h(500, 250);
    
    translate([10,520,50])
    rotate([-90,0,0])
    mgn12h(500, 250);
}

module horizontal_frame(){
    translate([260,-13,10])
    rotate([90,0,0])
    side_plate();
    
    translate([260,13 + 520 + 5,10])
    rotate([90,0,0])
    side_plate();
    
    translate([300,-13,250])
    rotate([0,0,90])
    aluminium_profile(546,3);
    
    translate([280,13,300])
    rotate([-90,0,90])
    mgn12h(500, 250);
    
    translate([280,13,260])
    rotate([-90,0,90])
    mgn12h(500, 250);
}

module mdf_plate(length, width, height){
    color("Sienna")
    cube([width, length, height]);
}

module y_axis(){
    // Y - Axis motor
    translate([280 - 13,-13 - 5,280])
    rotate([0,0,90])
    nema23_with_mounted(){
        t8_lead_screw(550);
        t8_coupler();
    }
    
    translate([280 - 13,250 + 13,280])
    rotate([-90,0,90])
    y_axis_lead_screw_mount();
}

module x_axis(){
    
    // X - Axis motors
    translate([-5,-30,30])
    nema23_with_mounted(){
        t8_lead_screw(500);
        t8_coupler();
    }
    translate([-5,30 + 520,30])
    nema23_with_mounted(){
        t8_lead_screw(500);
        t8_coupler();
    }
    
    translate([260,-18,30])
    rotate([90,0,0])
    x_axis_lead_screw_mount();
    
    translate([260,18 + 520,30])
    rotate([-90,0,0])
    x_axis_lead_screw_mount();
    
    translate([523,0,0])
    rotate([0,-90,0])
    x_axis_bearing_mount();
    
    translate([523,520,60])
    rotate([180,90,0])
    x_axis_bearing_mount();
}

module z_axis(){

    rotate([-90,0,90])
    z_axis_mount_plate();
    
    translate([-5,-30,-50])
    rotate([0,-90,0])
    mgn12h(100,50);
    
    translate([-5,30,-50])
    rotate([0,-90,0])
    mgn12h(100,50);
    
    translate([-13 -5 ,0,0])
    rotate([0,-90,0])
    z_axis_lead_screw_mount();
    
    // Z - axis motor
    translate([-13 - 5,0,100])
    rotate([0,90,0])
    nema23_with_mounted(){
        t8_lead_screw(150);
        t8_coupler();
    }
    
    translate([-18 - 8 - 5,0,0])
    rotate([0,90,0])
    spindle_mount_plate();
}


module cnc(){
    
    if (main_frame)
        color("lightgrey")
        main_frame(500,500,100);
    
    if (horizontal_frame)
        color("lightgrey")
        horizontal_frame();
    
    if (mdf_plate)
        translate([20,20,40])
        mdf_plate(480,480,20);
    
    if (x_axis)
        x_axis();
    
    if (y_axis)
        y_axis();
    
    if (z_axis)
        translate([280 - 13 - 8,250 + 13,280])
        z_axis();
    
    if (spindle)
        translate([200,260,200])
        spindle_motor();
}

cnc();
