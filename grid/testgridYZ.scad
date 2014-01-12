include <grid.scad>

smallStep = 10;
bigStep = 50;
gridSize = 50;
gridLine = 0.2;
textOffset = 8; //separate text from grid 

showGridYZ(smallStep,  bigStep, gridSize, gridLine);
rotate([0,0,180])
	translate([-gridSize-textOffset, 0, -gridSize - textOffset]) 
	showScaleY(smallStep, gridSize, textRotation= [90,0,0]);
rotate([0,0,90])
	translate([gridSize + textOffset, -gridSize , 0 ]) 
		showScaleZ(smallStep, gridSize, textRotation = [0,-90,90]);
showAxes();

