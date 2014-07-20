//oco para o motor
module oco(){
intersection(){
cube([20,10,13]);
translate([10,5,0])
	cylinder(r=6.5,h=13,$fn=40);
}
}


difference(){
//soporte
union(){
//base
	cube([36,2.5,13]);
//cubo		
	translate([9,2.5,0])cube ([18,10,13]);
}

translate ([8,0,0]) #oco();

//oco parafuso
translate([5,4,6.5])
rotate([90,0,0])
cylinder (r=2, h=10,$fn=20);

//oco parafuso
translate([31,4,6.5])
rotate([90,0,0])
cylinder (r=2, h=10,$fn=20);

}

