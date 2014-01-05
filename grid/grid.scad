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

		gridShowAxes = true;
		smallStep = 1 ;
		bigStep = 5;
		gridShowZ = false;
		// fin de configuracion de la cuadricula
		
  - Guardar y pulsar F6
  
   
Diseño:
   - Cada línea es un cubo alargado
   - Se situa por debajo del plano XY, es decir, en Z negativa
   - Se pintan 2 tipos de líneas:
     - finas: cada 10 unidad (configurable mediante smallStep)
	 - gruesas: cada 50 unidades (configurable mediante bigStep)
   
Revisiones:

<Fecha> <Autor modificación> <comentarios>



*/

include <TextGenerator.scad> //para poner la regla en mm

/***************************************/
// Inicio de parámetros configurables
/***************************************/
/* 
	Tamaño de la cuadricula en cada eje (en mm):
	- Introducir valores positivos
	- gridSizeX = 200 hará que se pinte en el eje X las líneas de color rojo, desde -200 hasta 200 
*/
gridSizeX = 100;
gridSizeY = 100;
gridSizeZ = 100;


gridTextSize       = 0.5 ; 	// Tamaño del texto 3D a modo de regla 
gridSmallStepTextX = true ; // texto de regla en cada linea fina del eje X
gridSmallStepTextY = true ; // texto de regla en cada linea fina del eje Y
gridSmallStepTextZ = true ; // texto de regla en cada linea fina del eje Z
gridShowAxes       = true ; // Muestra 3 flechas indicando el lado positivo de cada eje en el origen de coordenadas.


/*	Posibilidad de ocultar algún eje
	- valores posibles: true o false */
gridShowX = true;
gridShowY = true;
gridShowZ = false;

/*	Grosor de cada línea
	- Dado que se usan cubos para pintar cada línea, 
	  es la longitud de cada lado del cubo  */
gridLineX = 0.2; 
gridLineY = 0.2; 
gridLineZ = 0.2; 


smallStep = 10 ;  /* distancia entre 2 líneas finas */
bigStep   = 50 ; /* distancia entre 2 lineas gruesas */

/***************************************/
// Fin de parámetros configurables
/***************************************/

if ( gridShowX ) {
	//un cubo por cada 10mm 
	for ( i=[-gridSizeX :smallStep: gridSizeX]){
		color("red")
		translate([0, i, -gridLineX])
			cube([ 2*gridSizeX , gridLineX,  gridLineX], center=true);
			
		//añadir el texto en 3D en cada linea fina
		if (gridSmallStepTextX){
			color("red")
			translate([ gridSizeX +1 , i, 0.1])
			scale([gridTextSize,gridTextSize,gridTextSize])
			rotate (a = [45, 0,-30])
				drawtext(str(i));
		}
	}
	//una linea gruesa cada 50 mm 
	for ( i=[-gridSizeX :bigStep: gridSizeX]){ 
		color("red")
		translate([0, i, -2*gridLineX+gridLineX/2])
			cube([ 2*gridSizeX , 2*gridLineX,  2*gridLineX], center=true);
		
		//añadir el texto en 3D en cada linea gruesa
		//si no se pintó en lineas finas
		if (!gridSamllStepTextX ) {
			color("red")
			translate([ gridSizeX + 1, i, 0.1])
			scale([gridTextSize,gridTextSize,gridTextSize])
			rotate (a = [45, 0,-30])
				drawtext(str(i));
		}
	}
	
}		

if ( gridShowY ) {
	for ( y=[-gridSizeY :smallStep: gridSizeY]){
		color("green")
		translate([y , 0,-gridLineY])
			cube([ gridLineX , 2*gridSizeY,  gridLineY], center=true);

		if (gridSmallStepTextY){	//añadir el texto en 3D en lineas finas
			color("green")
			translate([ y,  gridSizeY + 1,  0.1])
			rotate (a = [45, 0,30])
			scale([gridTextSize,gridTextSize,gridTextSize])
				drawtext(str(y));
		}
			
	}
	for ( y=[-gridSizeY :bigStep: gridSizeY]){
		color("green")
		translate([y , 0,-2*gridLineY+gridLineY/2])
			cube([ 2*gridLineX , 2*gridSizeY,  2*gridLineY], center=true);

		//añadir el texto en 3D en linea gruesa
		//si no se pintó en lineas finas
		if (!gridSmallStepTextY) {
			color("green")
			translate([ y,  gridSizeY + 1,  0.1])
			rotate (a = [45, 0,30])
			scale([gridTextSize,gridTextSize,gridTextSize])
				drawtext(str(y));
		}
	}

}		
if ( gridShowZ ) {
for ( z=[-gridSizeZ :smallStep: gridSizeZ])
	//un cubo por cada 10mm 
	for ( z=[-gridSizeZ :smallStep: gridSizeZ]){
		color("blue")
		translate([0, gridLineZ, z])
			cube([ 2*gridSizeZ , gridLineZ, gridLineZ ], center=true);
			
		//añadir el texto en 3D en cada linea fina
		if (gridSmallStepTextZ){
			color("blue")
			translate([ gridSizeZ + gridTextSize + 2 , 0, z])
			scale([gridTextSize,gridTextSize,gridTextSize])
			rotate (a = [90, 0,0])
				drawtext(str(z));
		}
	}
}		

if (gridShowAxes) {
	color("blue"){
		cylinder(h= 7, $fn= 40);
		translate([0, 0 , 7]) 
			cylinder (h = 3, r1 = 5/3, r2 = 0, $fn= 20);
	}
	rotate(a = [-90,0,0])
	color("green"){
		cylinder(h= 7, $fn= 40);
		translate([0, 0 , 7]) 
			cylinder (h = 3, r1 = 5/3, r2 = 0, $fn= 20);
	}
	rotate([0, 90,0])
	color("red"){
		cylinder(h= 7, $fn= 40);
		translate([0, 0 , 7]) 
			cylinder (h = 3, r1 = 5/3, r2 = 0, $fn= 20);
	}
}
