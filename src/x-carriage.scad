// PRUSA iteration3
// X carriage
// GNU GPL v3
// Modified version by Sam Sheffield <hello@samsheffield.com>
// Original design by Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org

use <bearing.scad>

module x_carriage_base(){
 // Small bearing holder
 translate([-33/2,0,0]) rotate([0,0,90]) horizontal_bearing_base(1);
 // Long bearing holder
 translate([-33/2,45,0]) rotate([0,0,90]) horizontal_bearing_base(2);
 // Base plate
 translate([-33,-11.5,0]) cube([33,68,7]);
 // Belt holder base
 translate([-33,20,0]) cube([33,16,17]);
}

module x_carriage_beltcut(){
 // Cut in the middle for belt
 translate([-2.5-16.5+1,19,7]) cube([4.5,13,15]);
 // Cut clearing space for the belt
 translate([-38,5,7]) cube([40,13,15]);
 // Belt slit
 translate([-66,21.5+10,6]) cube([67,1,15]);
 // Smooth entrance
 translate([-66,21.5+10,14]) rotate([45,0,0]) cube([67,15,15]);
 // Teeth cuts
 for ( i = [0 : 23] ){
  translate([0-i*3,21.5+8,6]) cube([1.7,3,15]);
 }
}

module x_carriage_labyrinth(){
 // Cut the labyrinth for the belt
 translate([-7.65-16.5+1,19,7]) cube([3,13,15]);
 translate([-4.65-16.5+1,18,7]) rotate([0, 0, 45]) cube([3,3,15]);
 translate([-4.65-16.5+1,18,7]) cube([8,3,15]);
 translate([.55-16.5+1,20,7]) rotate([0, 0, -45]) cube([3,3,15]);

 translate([-7.65-16.5+1,28.85,7]) rotate([0, 0, 45]) cube([3,3,15]);
 translate([3.5-16.5+1,31,7]) rotate([0, 0, -45]) cube([3,3,15]);
 translate([2.65-16.5+1,19,7]) cube([3,13,15]);
 // Cut clearing space for the belt
 translate([-38,5,7]) cube([40,13,15]);
 // Belt slit
 translate([-66,21.5+9.5,6]) cube([67,2,15]);
 // Smooth entrance
 translate([-66,21.5+10,14]) rotate([45,0,0]) cube([67,15,15]);

}

module x_carriage_holes(){
 // Small bearing holder holes cutter
 translate([-33/2,0,0]) rotate([0,0,90]) horizontal_bearing_holes(1);
 // Long bearing holder holes cutter
 translate([-33/2,45,0]) rotate([0,0,90]) horizontal_bearing_holes(2);
  // Extruder mounting holes
  translate([-16.5+11.5,24.25,-1])cylinder(r=1.7, h=20, $fn=8);
  translate([-16.5+11.5,24.25,10])cylinder(r=3.1, h=20, $fn=6); 
  translate([-16.5-11.5,24.25,-1])cylinder(r=1.7, h=20, $fn=8);
  translate([-16.5-11.5,24.25,10])cylinder(r=3.1, h=20, $fn=6); 	
}

module x_carriage_fancy(){
 // Top right corner
 translate([13.5,-5,0]) translate([0,45+11.5,-1]) rotate([0,0,45]) translate([0,-15,0]) cube([30,30,20]);
 // Bottom right corner
 translate([0,5,0]) translate([0,-11.5,-1]) rotate([0,0,-45]) translate([0,-15,0]) cube([30,30,20]);
 // Bottom ĺeft corner
 translate([-33,5,0]) translate([0,-11.5,-1]) rotate([0,0,-135]) translate([0,-15,0]) cube([30,30,20]);
 // Top left corner
 translate([-33-13.5,-5,0]) translate([0,45+11.5,-1]) rotate([0,0,135]) translate([0,-15,0]) cube([30,30,20]);	
}

// Final part
module x_carriage(){
 difference(){
  x_carriage_base();
  x_carriage_labyrinth();
  x_carriage_holes();
  x_carriage_fancy();
 }
}

x_carriage();