// PRUSA iteration3
// Y belt holder
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org


module belt_holder_base(){
 translate([-33-8.5,0,-1]) cube([33,15,16]); 
 translate([-33-8.5,11,-1]) cube([33,15,16]);
 translate([-50,22,-1]) cube([50,4,16]);	
}

module belt_holder_labyrinth(){
 // Cut the labyrinth for the belt
 translate([-8.5,0,0]) union(){
	 translate([-23.15,0,3]) cube([3,10.5,15]);
	 translate([-12.85,0,3]) cube([3,10.5,15]);
	 translate([-20.15,-.5,3]) rotate([0, 0, 45]) cube([3,3,15]);
	 translate([-20.15,-.5,3]) cube([8,3,15]);
	 translate([-14.95,1.65,3]) rotate([0, 0, -45]) cube([3,3,15]);
	 translate([-23.15,6.75,3]) rotate([0, 0, 45]) cube([2.5,2.5,15]);
	 translate([-11.625,8.5,3]) rotate([0, 0, -45]) cube([2.5,2.5,15]);
 }

 
 
	union(){
	 // Belt slits
	 translate([-42,8.5,3]) cube([13.25,2,15]);
	 translate([-21.25,8.5,3]) cube([34,2,15]);
	 // Smooth entrance
	 translate([-21.35,9.5,12]) rotate([45,0,0]) cube([34,15,15]);
	 #translate([-42,9.5,12]) rotate([45,0,0]) cube([13.35,15,15]);
	}
}

module belt_holder_beltcut(){
 position_tweak=-0.2;
 // Belt slit
 translate([-66,-0.5+10,3]) cube([67,1,15]);
 // Smooth insert cutout
 translate([-66,-0.5+10,12]) rotate([45,0,0]) cube([67,15,15]);
 // Individual teeth
 for ( i = [0 : 23] ){
  translate([0-i*3+position_tweak,-0.5+8,3]) cube([1.7,3,15]);
 }
 // Middle opening
 translate([-2-25,-1,3]) cube([4,11,15]);	
}

module belt_holder_holes(){
 translate([-4.5,0,7.5]) rotate([-90,0,0]) cylinder(h=30, r=1.7, $fn=10);
 translate([-45.5,0,7.5]) rotate([-90,0,0]) cylinder(h=30, r=1.7, $fn=10);
}

// Final part
module belt_holder(){
 difference(){
  belt_holder_base();
  belt_holder_labyrinth();
  //belt_holder_beltcut();
  belt_holder_holes();
 }
}

belt_holder();