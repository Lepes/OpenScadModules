include <grid.scad>

smallStep = 10;
bigStep = 50;
gridSize = 50;
gridLine = 0.2;

showGridY(smallStep,  bigStep, gridSize, gridLine);
showScaleY(smallStep, gridSize, textRotation = [45,0,45]);
showAxes();