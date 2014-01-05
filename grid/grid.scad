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

/*
	Posibilidad de ocultar algún eje
	- valores posibles: true o false
*/
gridShowX = true;
gridShowY = true;
gridShowZ = false;

/* Muestra 3 flechas indicando el lado positivo de cada eje */
gridShowAxes = false;


/*
	Grosor de cada línea
	- Dado que se usan cubos para pintar cada línea, 
	  es la longitud de cada lado del cubo 
*/
gridLineX = 0.2; 
gridLineY = 0.2;
gridLineZ = 0.2;


/* distancia entre 2 líneas finas */
smallStep = 10 ; 

/* distancia entre 2 lineas gruesas */
bigStep = 50 ;

/***************************************/
// Fin de parámetros configurables
/***************************************/

if ( gridShowX ) {
	//un cubo por cada 10mm 
	for ( i=[-gridSizeX :smallStep: gridSizeX])
		color("red")
		translate([0, i, -gridLineX])
			cube([ 2*gridSizeX , gridLineX,  gridLineX], center=true);

	//una linea gruesa cada 50 mm 
	for ( i=[-gridSizeX :bigStep: gridSizeX]) 
		color("red")
		translate([0, i, -2*gridLineX+gridLineX/2])
			cube([ 2*gridSizeX , 2*gridLineX,  2*gridLineX], center=true);
	
	
}		

if ( gridShowY ) {
	for ( y=[-gridSizeY :smallStep: gridSizeY])
		color("green")
		translate([y , 0,-gridLineY])
			cube([ gridLineX , 2*gridSizeY,  gridLineY], center=true);
	for ( y=[-gridSizeY :bigStep: gridSizeY])
		color("green")
		translate([y , 0,-2*gridLineY+gridLineY/2])
			cube([ 2*gridLineX , 2*gridSizeY,  2*gridLineY], center=true);

}		
if ( gridShowZ ) {
for ( z=[-gridSizeZ : gridSizeZ])
	color("blue")
		translate([z , 0,-gridLineZ])
		cube([ gridLineZ , gridLineZ,  2*gridSizeZ], center=true);
	
	color("red") 
		translate([0, 0, -gridSizeZ])
		cube ([2*gridSizeZ, gridLineZ, gridLineZ ], center = true);
	color("red") 
		translate([0, 0, gridSizeZ])
		cube ([2*gridSizeZ, gridLineZ, gridLineZ ], center = true);
		
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
