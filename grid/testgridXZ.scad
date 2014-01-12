include <grid.scad>

smallStep = 10;
bigStep = 50;
gridSize = 50;
gridLine = 0.2;
textOffset = 8; //separate text from grid 

showGridXZ(smallStep,  bigStep, gridSize, gridLine);
translate([0, -gridSize-textOffset, -gridSize - textOffset]) 
	showScaleX(smallStep, gridSize, textRotation= [90,0,0]);
translate([gridSize + textOffset, -gridSize , 0 ]) 
	showScaleZ(smallStep, gridSize, textRotation = [0,-90,90]);
showAxes();

