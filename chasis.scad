//Espesor paredes
espesor=3;

//porcas M3
radioPorcas=2.9;

//furados de M3
metrica=1.5;

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
ZSoportes=24;

//Posición Breadboard
xBreadboard=XBase-XBreadboard*1.4;
yBreadboard=(YBase-YBreadboard)/2;
zBreadboard=ZSoportes+espesor-8;

//Dimensións resaltes
XResalte=40;
YResalte=14;
ZResalte=espesor*2;

//facer os furados do motor con oco para a porca OS FURADOS DO SOPORTE SON GRANDES, RADIO 2
module furadosMotor(){
	union(){
	cylinder(r=metrica, h=espesor,$fn=20);
	translate([0,0,espesor])cylinder(r=radioPorcas,h=espesor*2,$fn=6);
	}
	union(){
	translate ([26,0,0])  cylinder(r=1.5, h=espesor,$fn=20);
	translate([26,0,espesor])cylinder(r=radioPorcas,h=espesor*2,$fn=6);
	}
	}

module furadosCaster(){
	union(){
	cylinder(r=1.5, h=espesor,$fn=20);
	translate([0,0,espesor])cylinder(r=radioPorcas,h=espesor*2,$fn=6);
	}
	union(){
	translate ([0,separacionFuradosCaster,0])  cylinder(r=1.5, h=espesor,$fn=20);
	translate([0,separacionFuradosCaster,espesor])cylinder(r=radioPorcas,h=espesor*2,$fn=6);
	}
	}

module furadosDriver(){

	cylinder(r=1.5, h=espesor,$fn=20);
	translate ([33,0,0])  cylinder(r=1.5, h=espesor,$fn=20);
	translate ([0,29,0])  cylinder(r=1.5, h=espesor,$fn=20);
	translate ([33,29,0])  cylinder(r=1.5, h=espesor,$fn=20);
	}

module furadosPila(){
	cube([2,4,espesor]) ;
	translate ([26,0,0])  cube([2,4,espesor]);
	translate ([0,24,0])  cube([2,4,espesor]);
	translate ([26,24,0])  cube([2,4,espesor]);
	}

module resaltesMotor(){
	difference(){
		cube ([XResalte,YResalte,ZResalte]);
		}
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
		union(){
				hull(){
				//soporteBallCaster
					translate ([radioCirculos,YBase/2,0]) cylinder(r=radioCirculos,h=espesor,$fn=50);
					translate ([radioCirculos,YBase/2+separacionFuradosCaster/2,0]) cylinder(r=radioCirculosPequenosCaster,h=espesor,$fn=50);
					translate ([radioCirculos,YBase/2-separacionFuradosCaster/2,0]) cylinder(r=radioCirculosPequenosCaster,h=espesor,$fn=50);
					translate ([XBase,radioCirculos,0]) cylinder(r=radioCirculos,h=espesor,$fn=50);
					translate ([XBase,YBase-radioCirculos,0]) cylinder(r=radioCirculos,h=espesor,$fn=50);
					translate ([xBreadboard-espesor,YBase-radioCirculos,0]) cylinder(r=radioCirculos,h=espesor,$fn=50);
					translate ([xBreadboard-espesor,radioCirculos,0]) cylinder(r=radioCirculos,h=espesor,$fn=50);					
				}
			//resaltes Ball Caster
			translate ([radioCirculos,YBase/2,0]) resalteCaster();
			
			
			//resaltes laterais
			translate([xBreadboard-espesor,yBreadboard-YResalte,0])resaltesMotor();
			translate([xBreadboard-espesor,yBreadboard+YBreadboard,0])resaltesMotor();
			
			//soportes breadboard
			translate([xBreadboard-espesor,yBreadboard,espesor])cube([XSoportes,espesor,ZSoportes]);
			translate([xBreadboard-espesor,yBreadboard+YBreadboard-espesor,espesor])cube([XSoportes,espesor,ZSoportes]);
		}

		//furados resaltes
		translate ([xBreadboard-espesor+(XResalte-26)/2,yBreadboard-YResalte+YResalte/2,0]) furadosMotor();
		translate ([xBreadboard-espesor+(XResalte-26)/2,yBreadboard+YBreadboard+YResalte/2,0]) furadosMotor();
		translate([radioCirculos,YBase/2-separacionFuradosCaster/2,0]) furadosCaster();
		//furados driver
		translate([xBreadboard-(XBreadboard/2-33/1.8),(YBase-29)/2,0]) furadosDriver();
		
		//furados pila
		translate ([XBase/5, (YBase-29)/2,0])furadosPila();
		
		//fendas ARRANXAR
		translate([20,(YBase-YBase/4.2)/2,0]) cube ([XBase/1.3,YBase/4.2,ZBase]);
		
		//Breadboard
		translate([xBreadboard,yBreadboard,zBreadboard]) breadboard();

		//furados frontais
			translate ([XBase+5,yBreadboard+10,0]) cylinder(r=1.5, h=espesor,$fn=20);
			translate ([XBase+5,yBreadboard+YBreadboard-10,0])  cylinder(r=1.5, h=espesor,$fn=20);
			translate ([XBase+5,YBase/2,0])  cylinder(r=1.5, h=espesor,$fn=20);
			translate ([XBase,8,0])  cylinder(r=1.5, h=espesor,$fn=20);
			translate ([XBase,YBase-8,0])  cylinder(r=1.5, h=espesor,$fn=20);


	}




