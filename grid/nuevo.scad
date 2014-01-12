include <grid.scad>

smallStep = 10;
bigStep = 50;
gridSize = 50;
gridLine = 0.2;
textOffset = 8; //separate text from grid 

showGridYZ(smallStep,  bigStep, gridSize, gridLine);
rotate([0,90,0]) 
	showScaleX( smallStep, gridSize, textRotation = [0,0,90]);
showAxes();

