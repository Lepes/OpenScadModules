/*
EN:
	This is a custom grid that is not centered on origin, 
	so we don't want negative numbers, we should do manually

ES:
	Este es un grid que no está centrado en el origen de coordenadas
	así que no queremos números negativos, lo haremos a mano.
*/

include <grid.scad>
include <Write.scad>


smallStep = 10;
bigStep = 50;
gridSize = 50;
gridLine = 0.2;

// grid XY
translate([gridSize, gridSize, 0])
	showGridXY(smallStep,  bigStep, gridSize, gridLine);

// grid YZ
translate([0, gridSize, gridSize])
	showGridYZ(smallStep,  bigStep, gridSize, gridLine);

	
for (i= [0 : smallStep : gridSize*2]){

	// Scale on X
	color("red")
	translate([2* gridSize + 10, i, 0])
		write(str(i)); 

	// Scale on Y
	color("green")
	translate([i, 2* gridSize + 10, 0])
	write(str(i)); 
		
	// Scale on Z
	color("blue")
	translate([0, 2*gridSize +5, i]) // +5 is an offset
	rotate([90, 0, 45]) //numbers vertically
		write(str(i)); 
		
}
	
scale([2, 2, 2]) showAxes(); //bigger Axes
