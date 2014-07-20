//Espesor paredes
espesor=3;

//Dimensions Breadboard
XBreadboard=34.5;
YBreadboard=45.5;
ZBreadboard=9;

//Dimensions plataforma base
XBase=XBreadboard*3;
YBase=YBreadboard*1.5;
ZBase=espesor;
radioCirculos=19/2;
radioCirculosPequenosCaster=5;
separacionFuradosCaster=25;

//Dimensions soportes breadboard
XSoportes=XBreadboard+espesor*2;
YSoportes=espesor;
ZSoportes=36;

//Posición Breadboard
xBreadboard=XBase-XBreadboard*1.4;
yBreadboard=(YBase-YBreadboard)/2;
zBreadboard=ZSoportes+espesor-5;

//Dimensións resaltes
XResalte=40;
YResalte=14;
ZResalte=espesor*2;

//facer os furados do motor con oco para a porca OS FURADOS DO SOPORTE SON GRANDES, RADIO 2
module furadosMotor(){
	union(){
	cylinder(r=1.5, h=espesor,$fn=20);
	translate([0,0,espesor])cylinder(r=3,h=espesor*2,$fn=6);
	}
	union(){
	translate ([26,0,0])  cylinder(r=1.5, h=espesor,$fn=20);
	translate([26,0,espesor])cylinder(r=3,h=espesor*2,$fn=6);
	}
	}

module furadosCaster(){
	union(){
	cylinder(r=1.5, h=espesor,$fn=20);
	translate([0,0,espesor])cylinder(r=3,h=espesor*2,$fn=6);
	}
	union(){
	translate ([0,separacionFuradosCaster,0])  cylinder(r=1.5, h=espesor,$fn=20);
	translate([0,separacionFuradosCaster,espesor])cylinder(r=3,h=espesor*2,$fn=6);
	}
	}

module furadosDriver(){

	cylinder(r=1.5, h=espesor,$fn=20);
	translate ([33,0,0])  cylinder(r=1.5, h=espesor,$fn=20);
	translate ([0,29,0])  cylinder(r=1.5, h=espesor,$fn=20);
	translate ([33,29,0])  cylinder(r=1.5, h=espesor,$fn=20);
	}

module furadosPila(){

	cylinder(r=1.5, h=espesor,$fn=20);
	translate ([21,0,0])  cylinder(r=1.5, h=espesor,$fn=20);
	translate ([0,25,0])  cylinder(r=1.5, h=espesor,$fn=20);
	translate ([21,25,0])  cylinder(r=1.5, h=espesor,$fn=20);
	}

module resaltesMotor(){
	cube ([XResalte,YResalte,ZResalte]);
	}

module resalteCaster(){
	hull(){
	cylinder(r=radioCirculos,h=ZResalte,$fn=50);
	translate ([0,separacionFuradosCaster/2,0]) cylinder(r=radioCirculosPequenosCaster,h=ZResalte,$fn=50);
	translate ([0,-separacionFuradosCaster/2,0]) cylinder(r=radioCirculosPequenosCaster,h=ZResalte,$fn=50);
	
	}
	}

module breadboard(){
	cube([XBreadboard,YBreadboard,ZBreadboard]);
	}



//base 
	difference(){
		
			//resaltes Ball Caster
			translate ([radioCirculos,YBase/2,0]) resalteCaster();
			
			
			
		
		
		translate([radioCirculos,YBase/2-separacionFuradosCaster/2,0]) furadosCaster();
		

	}





