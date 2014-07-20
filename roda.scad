/*funciona ben entre radios de 20 e de 80. */


radio=28;
altura=6;

difference(){
	union(){
		cylinder(r=radio,h=altura,$fn=80);
		cylinder(r=5, h=10+altura, $fn=20);
	}
		intersection(){	
		translate ([0,0,altura]) cylinder (r=1.8,h=14,$fn=20);
		
		translate([-3,-1.3,0]) #cube([6,6,20]);
		
		}
	translate ([0,0,5+altura]) rotate([90,0,0]) cylinder (r=1.3,h=10+altura,$fn=20);

translate ([(radio/2+2),0,0]) cylinder (r=radio/3,h=altura,$fn=50);
translate ([-(radio/2+2),0,0]) cylinder (r=radio/3,h=altura,$fn=50);
translate ([0,(radio/2+2),0]) cylinder (r=radio/3,h=altura,$fn=50);
translate ([0,-(radio/2+2),0]) cylinder (r=radio/3,h=altura,$fn=50);

translate ([(radio/2),(radio/2),0]) cylinder (r=radio/8,h=altura,$fn=50);
translate ([-radio/2,(radio/2),0]) cylinder (r=radio/8,h=altura,$fn=50);
translate ([-(radio/2),-(radio/2),0]) cylinder (r=radio/8,h=altura,$fn=50);
translate ([(radio/2),-(radio/2),0]) cylinder (r=radio/8,h=altura,$fn=50);

}

