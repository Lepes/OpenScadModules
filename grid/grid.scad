/*
Author: Lepes
email:  lepecity (at) gmail (dot) com
Date: 03/01/2014
License: CC (by-sa)


Crédits:
-  Roland Hieber (rohieb) by its Write.scad that is used to print numbers.

   
Revisions (include your name and comments if you modify this file):
2014-01-05	Antonio Navarro: Rework using "module"

*/

include <write.scad>

/***************************************/
// default parameters
/***************************************/

defSmallStep=10;	//Espacio entre lineas finas
defBigStep=50;		//Espacio entre lineas gruesas

defGridSize=100;		//Tamaño total de la cuadrícula
defGridLine=0.2;		//Grosor de las lineas

defTextRotation = [ 0, 0, 45];
/***************************************/
/***************************************/
/* 
  Crea una serie de cubos paralelos  a lo largo de un eje.
  smallStep: distancia entre dos líneas del grid, p.e.: 10
  bigStep: Cubo más grande, para resaltar, p.e.: 50
  gridSize: El tamaño del grid será siempre el doble de lo que 
			pongas aqui.
  gridLine: Tamaño del lado del cubo. 
*/
module grid(smallStep=defSmallStep,
					bigStep=defBigStep,
					gridSize=defGridSize,
					gridLine=defGridLine){
	//un cubo por cada 10mm 
	for ( i=[-gridSize :smallStep: gridSize]){
		if (i % bigStep == 0) {
			translate([i, 0, -2*gridLine+gridLine/2])
				cube([ 2*gridLine, 2*gridSize, 2*gridLine], center=true);
		}
		else {
			translate([i, 0, -gridLine])
				cube([ gridLine, 2*gridSize , gridLine], center=true);
		}
	}
}

/* 
  Muestra números a modo de escala del grid.
  Los números se pintan igual que el grid, 
  desde valores negativos, pasando por cero hasta 
  el valor positivo.
  
  AVISO: Puede ralentizar bastante el renderizado
		(dependerá de tu ordenador)
*/
module showScale(	invertSign = false,
					smallStep=defSmallStep,
					gridSize=defGridSize,
					textRotation = defTextRotation){
					
	for ( s=[-gridSize :smallStep: gridSize]){
		if (!invertSign ) {
			translate([ s, gridSize + 1, 0])
				rotate(textRotation)
				write(str(-s));
		}
		else {
			translate([s, gridSize + 1, 0])
				rotate(textRotation)
					write(str(s));
		}
		
	}			
}				

module showScaleX(	smallStep=defSmallStep,
					gridSize=defGridSize,
					textRotation = defTextRotation){
	
	color("red") showScale(	true, 
							smallStep,
							gridSize, 
						textRotation);
}

module showScaleY(
					smallStep=defSmallStep,
					gridSize=defGridSize,
					textRotation = defTextRotation){
	
	color("green")
		rotate ([0, 0, -90]) 
			showScale(	false, 
						smallStep,
						gridSize, 
						textRotation);
}

module showScaleZ(
					smallStep=defSmallStep,
					gridSize=defGridSize,
					textRotation = defTextRotation){
	
	color("blue")
			rotate ([0, 90, 0]) 
				showScale(	false, 
						smallStep,
						gridSize, 
						textRotation);
}


module showGridX(smallStep=defSmallStep,
					bigStep=defBigStep,
					gridSize=defGridSize,
					gridLine=defGridLine){
	color("red") grid(smallStep,
									bigStep,
									gridSize,
									gridLine);
}

module showGridY(smallStep=defSmallStep,
					bigStep=defBigStep,
					gridSize=defGridSize,
					gridLine=defGridLine){

	color("green")
		rotate([0,0,90]) grid(smallStep,
											bigStep,
											gridSize,
											gridLine);
}

module showGridZ(smallStep=defSmallStep,
					bigStep=defBigStep,
					gridSize=defGridSize,
					gridLine=defGridLine){

	color("blue")
		rotate([0,90,0]) grid(smallStep,
											bigStep,
											gridSize,
											gridLine);
}

module showGridXY(smallStep=defSmallStep,
					bigStep=defBigStep,
					gridSize=defGridSize,
					gridLine=defGridLine){

	showGridX(smallStep,
					bigStep,
					gridSize,
					gridLine);
	showGridY(smallStep,
					bigStep,
					gridSize,
					gridLine);
}

module showGridXZ(smallStep=defSmallStep,
					bigStep=defBigStep,
					gridSize=defGridSize,
					gridLine=defGridLine){

	rotate([90,0,0])
		showGridX(smallStep,
						bigStep,
						gridSize,
						gridLine);
	rotate([0,0,90])
		showGridZ(smallStep,
						bigStep,
						gridSize,
						gridLine);
}

module showGridYZ(smallStep=defSmallStep,
					bigStep=defBigStep,
					gridSize=defGridSize,
					gridLine=defGridLine){

	rotate([0,90,0])
		showGridY(smallStep,
						bigStep,
						gridSize,
						gridLine);
	rotate([0,0,0])
		showGridZ(smallStep,
						bigStep,
						gridSize,
						gridLine);
}

module vector(gridSize=defGridSize,
						gridLine=defGridLine) {

	cylinder(h=gridSize/10, r=gridLine*5, $fn=50);
	translate([0,0,gridSize/10]) 
		cylinder (h=gridSize/30, r1=gridLine*25/3, r2=0, $fn=50);
}

module showAxes(gridSize=defGridSize,
							gridLine=defGridLine) {

	color("blue")
		vector(gridSize,
					gridLine);

	rotate(a = [-90,0,0])
		color("green")
			vector(gridSize,
						gridLine);

	rotate([0, 90,0])
		color("red")
			vector(gridSize,
						gridLine);
}

