// PRUSA iteration3
// NEMA 17 extruder small gear
// GNU GPL v3
// Modified by Sam Sheffield <hello@samsheffield.com>
// Original by Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org


include <external_gear_script.scad>;

module small_gear()
{
	translate([0,0,0])
	{

		translate ([30,0,0])
		difference(){
			union(){
				rotate ([0,0,360*-1/20]) gear (number_of_teeth=8,
				circular_pitch=335,rim_thickness=20,bore_diameter=0,hub_thickness=15,hub_diameter=19);
				//cylinder(r=10,h= 10);
			}
			#translate([-3.25,3.75,0]) cube([6.5,3.2,9]);
			#translate([0,0,4]) rotate([-90,0,0]) 
				cylinder(r=1.75, h=20, $fn=10);


			difference(){ 
				translate ([0,0,-1]) cylinder(r=5.75/2, h=25, $fn=30);
				translate ([-5,1.75,0])cube([10,10,30]);
			}
		}
	}
}


small_gear();


