include <grid.scad>

smallStep = 10;
bigStep = 50;
gridSize = 50;
gridLine = 0.2;

showGridZ(smallStep,  bigStep, gridSize, gridLine);
showScaleZ(smallStep, gridSize, textRotation = [0,0,90]);
showAxes();