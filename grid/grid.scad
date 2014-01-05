/*
Autor: Lepes
email:  lepecity (at) gmail (dot) com
Fecha: 03/01/2014

Licencia Creative Commons: Reconocimiento (by): Se permite cualquier explotación de la obra, incluyendo una finalidad comercial, así como la creación de obras derivadas, la distribución de las cuales también está permitida sin ninguna restricción. Más información en: http://es.creativecommons.org/blog/licencias/

Agradecimiento especial a Juan Gonzalez Gomez (Obijuan from CloneWars Spain)
por la idea original.

Propósito:
   Crear una cuadricula de colores para visualizar con más 
   facilidad los objetos situados en el espacio

Uso de la unidad:
  - Copiar este archivo en la carpeta de bibliotecas de OpenScad, normalmente en "Documentos\OpenSCAD\libraries"
  - abrir un archivo nuevo de opensCad y poner (por ejemplo):
		include  <grid.scad>

  - Funciones implementadas:
			- showGridX()
			- showGridY()
			- showGridZ()
			- showGridXY()
			- showGridXZ()
			- showGridYZ()
			- showAxes()

  - Parametros: Todas, excepto showAxes(), admiten los siguientes parametros
	  en este orden para cambiar los configurados por defecto:
			smallStep
			bigStep
			gridSize
			gridLine

			*showAxes() solo admite los dos ultimos.
			
  - Guardar y pulsar F6

Diseño:
   - Cada línea es un cubo alargado
   - Se situa por debajo del plano
   - Se pintan 2 tipos de líneas:
     - finas: cada 10 unidad (configurable mediante smallStep)
	 - gruesas: cada 50 unidades (configurable mediante bigStep)
   
Revisiones:

2014-01-05	Antonio Navarro: Se rehace usando modulos

*/

/***************************************/
// Parametros por defecto
/***************************************/

defSmallStep=10;		//Espacio entre lineas finas
defBigStep=50;		//Espacio entre lineas gruesas

defGridSize=100;		//Tamaño total de la cuadrícula
defGridLine=0.2;		//Grosor de las lineas

/***************************************/
/***************************************/

module grid(smallStep=defSmallStep,
					bigStep=defBigStep,
					gridSize=defGridSize,
					gridLine=defGridLine){

	//un cubo por cada 10mm 
	for ( i=[-gridSize :smallStep: gridSize])
		translate([0, i, -gridLine])
			cube([ 2*gridSize , gridLine,  gridLine], center=true);

	//una linea gruesa cada 50 mm 
	for ( i=[-gridSize :bigStep: gridSize]) 
		translate([0, i, -2*gridLine+gridLine/2])
			cube([ 2*gridSize , 2*gridLine,  2*gridLine], center=true);
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