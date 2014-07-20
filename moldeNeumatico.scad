//o radio interno do neumatico, exterior da roda
radio=18;

//o espesor da goma que queremos
espesor=3;

//o ancho do neumatico
ancho=6;

difference(){
	//externo molde
		cylinder(r=radio+espesor+2,h=ancho+2,$fn=radio*3);
		difference(){
			//externo neumatico
				translate([0,0,2]) cylinder(r=radio+espesor,h=ancho+2,$fn=radio*3);
			
			//interno neumatico
				translate([0,0,2]) cylinder(r=radio,h=ancho+2,$fn=radio*3);
		}
	//oco
	cylinder(r=radio-2,h=ancho+4,$fn=radio*3);
	//ocos purga
		translate([radio+espesor/2,0,0]) cylinder(r=espesor/2,h=2,$fn=20);
		translate([-(radio+espesor/2),0,0]) cylinder(r=espesor/2,h=2,$fn=20);
}


