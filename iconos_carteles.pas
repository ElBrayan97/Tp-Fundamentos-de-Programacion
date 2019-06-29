unit iconos_carteles;

interface
uses crt;

//Menues de Opciones  //////////////////////////////////////////////////
Procedure Menu_Principal_Graph;
Procedure Menu_Cargar_Graph;
Procedure Menu_Editar_Graph;
Procedure Menu_Borrar_Graph;
Procedure Menu_Estadisticas_Graph;

//Menues de Carga //////////////////////////////////////////////////////
//OBRA
Procedure Menu_Cargar_Obra_Part1();
Procedure Menu_Cargar_Obra_Part2();

//ARTISTA
Procedure Menu_Cargar_Artista_Part1();
Procedure Menu_Cargar_Artista_Part2();

//MUSEO
Procedure Menu_Cargar_Museo_Part1();
Procedure Menu_Cargar_Museo_Part2();

//DIRECTOR
Procedure Menu_Cargar_Director_Part1();
Procedure Menu_Cargar_Director_Part2();

//Menues de Edicion ////////////////////////////////////////////////////
//GENERAL
Procedure Cuadro_Edicion();
//OBRA
Procedure Menu_Editar_Obra_Part1();
Procedure Menu_Editar_Obra_Part2();

//ARTISTA
Procedure Menu_Editar_Artista_Part1();
Procedure Menu_Editar_Artista_Part2();

//MUSEO
Procedure Menu_Editar_Museo_Part1();
Procedure Menu_Editar_Museo_Part2();

//DIRECTOR
Procedure Menu_Editar_Director_Part1();
Procedure Menu_Editar_Director_Part2();

//Menues de Borrado  ///////////////////////////////////////////////////
//OBRA
Procedure Menu_Baja_Obra();
Procedure Menu_Baja_Obra_Inexistente();

//ARTISTA
Procedure Menu_Baja_Artista();
Procedure Menu_Baja_Artista_Inexistente();

//MUSEO
Procedure Menu_Baja_Museo();
Procedure Menu_Baja_Museo_Inexistente();

//DIRECTOR
Procedure Menu_Baja_Director();
Procedure Menu_Baja_Director_Inexistente();

{//Menues de Estadistica  ///////////////////////////////////////////////
//OBRA
Procedure Menu_Estadistica_Obra_Part1();
Procedure Menu_Estadistica_Obra_Part2();

//ARTISTA
Procedure Menu_Estadistica_Artista_Part1();
Procedure Menu_Estadistica_Artista_Part2();

//MUSEO
Procedure Menu_Estadistica_Museo_Part1();
Procedure Menu_Estadistica_Museo_Part2();

//DIRECTOR
Procedure Menu_Estadistica_Director_Part1();
Procedure Menu_Estadistica_Director_Part2();
}

//Iconos y Carteles  ///////////////////////////////////////////////////
{
Solo los carteles que requieren
las coordenadas, tienen X e Y}
Procedure Aviso_Artista_Inexistente;
Procedure Aviso_Museo_Inexistente;
Procedure Aviso_Director_Inexistente;
Procedure Dato_Ingresado_Erroneo(X:Byte; Y:Byte; Tamanio:Byte);
Procedure Aviso_Dato_Inexistente;
Procedure Aviso_Carga_Exitosa;
Procedure Aviso_Dato_Existente;
Procedure Aviso_Edicion_Exitosa;
Procedure Aviso_Eliminacion_Exitosa;
Procedure Dato_Encontrado_Obra;
Procedure Dato_Encontrado_Artista;
Procedure Dato_Encontrado_Museo;
Procedure Dato_Encontrado_Director;
Procedure Tick;


 ///////////////////////////////////////////////////////////////////////
 ///////////////////////////////////////////////////////////////////////
 ///////////////////////////////////////////////////////////////////////
IMPLEMENTATION

//MENUES DE OPCIONES
{
A partir de aqui se declaran los menues
 graficos que contienen las opciones de 
 desplazamiento por el menu}
 
Procedure Menu_Principal_Graph;
Begin
 Clrscr;
 TextColor (Green);
 Writeln (' ________________________');
 Writeln ('|----MENU PRINCIPAL------\\');
 TextColor (Blue);                       
 Writeln ('|========================\\');
 Writeln ('|                        \\');
 Writeln ('|     1: CARGAR          \\');
 Writeln ('|     2: MODIFICAR       \\');
 Writeln ('|     3: BORRAR          \\');
 Writeln ('|     4: ESTADISTICAS    \\');
 Writeln ('|                        \\');
 Writeln ('|     0: SALIR           \\');
 Writeln ('|  ______________________\\');
 Writeln ('| /');
 Writeln ('| \');
 Write   ('|__> Ingrese una opcion: ');
End;


Procedure Menu_Cargar_Graph;
Begin
 Clrscr;
 TextColor (Green);
 Writeln (' ________________________');
 Writeln ('|----MENU DE CARGA-------\\');
 TextColor (Blue); 
 Writeln ('|========================\\');
 Writeln ('|                        \\');
 Writeln ('|     1: OBRA            \\');
 Writeln ('|     2: ARTISTA         \\');
 Writeln ('|     3: MUSEO           \\');
 Writeln ('|     4: DIRECTOR        \\');
 Writeln ('|                        \\');
 Writeln ('|     0: ATRAS           \\');
 Writeln ('|  ______________________\\');
 Writeln ('| /');
 Writeln ('| \');
 Write   ('|__> Ingrese una opcion: '); 
End;


Procedure Menu_Editar_Graph;
Begin
 Clrscr;
 TextColor (Green);
 Writeln (' ________________________');
 Writeln ('|--MENU DE MODIFICACION--\\');
 TextColor (Blue); 
 Writeln ('|========================\\');
 Writeln ('|                        \\');
 Writeln ('|    1: OBRA             \\');
 Writeln ('|    2: ARTISTA          \\');
 Writeln ('|    3: MUSEO            \\');
 Writeln ('|    4: DIRECTOR         \\');
 Writeln ('|                        \\');
 Writeln ('|    0: ATRAS            \\');
 Writeln ('|  ______________________\\');
 Writeln ('| /');
 Writeln ('| \');
 Write   ('|__> Ingrese una opcion: ');
End;


Procedure Menu_Borrar_Graph;
Begin
 Clrscr;
 TextColor (Green);
 Writeln (' ________________________');
 Writeln ('|----- MENU BORRAR ------\\');
 TextColor (Blue); 
 Writeln ('|========================\\');
 Writeln ('|                        \\');
 Writeln ('|    1: OBRA             \\');
 Writeln ('|    2: ARTISTA          \\');
 Writeln ('|    3: MUSEO            \\');
 Writeln ('|    4: DIRECTOR         \\');
 Writeln ('|                        \\');
 Writeln ('|    0: ATRAS            \\');
 Writeln ('|  ______________________\\');
 Writeln ('| /');
 Writeln ('| \');
 Write   ('|__> Ingrese una opcion: ');
End;


Procedure Menu_Estadisticas_Graph;
Begin
 Clrscr;
 TextColor (Green);
 Writeln (' ________________________');
 Writeln ('|--MENU DE ESTADISTICAS--\\');
 TextColor (Blue); 
 Writeln ('|========================\\');
 Writeln ('|                        \\');
 Writeln ('|    1: OBRA             \\');
 Writeln ('|    2: ARTISTA          \\');
 Writeln ('|    3: MUSEO            \\');
 Writeln ('|    4: DIRECTOR         \\');
 Writeln ('|    5: MAS INFORMACION  \\');
 Writeln ('|                        \\');
 Writeln ('|    0: ATRAS            \\');
 Writeln ('|  ______________________\\');
 Writeln ('| /');
 Writeln ('| \');
 Write   ('|__> Ingrese una opcion: ');
End;


//MENUES DE CARGA
{
A partir de aqui se declaran los menues
 graficos para la carga de datos}

//OBRA
Procedure Menu_Cargar_Obra_Part1();
Begin
 Clrscr;
 TextColor(Blue);
 Writeln (' ________________________________');
 Writeln ('|                                \\');
 Write   ('|     '); TextColor(Green); Write('MENU DE CARGA DE OBRA'); TextColor(Blue); Writeln ('      \\');
 Writeln ('|________________________________\\__________________________');
 Writeln ('| Ingrese el Codigo de la Obra:                              \\');
 Writeln ('|------------------------------------------------------------\\');
End;
Procedure Menu_Cargar_Obra_Part2();
Begin
 TextColor(Blue);
 Gotoxy(1,7);
 Writeln ('| Ingrese el Material de la Obra:                            \\');
 Writeln ('|------------------------------------------------------------\\');
 Writeln ('| Ingrese el Anio de la Obra:                                \\'); 
 Writeln ('|------------------------------------------------------------\\');
 Writeln ('| Ingrese el Tipo de Obra:                                   \\');
 Writeln ('|------------------------------------------------------------\\');
 Writeln ('| Ingrese el Estilo de Obra:                                 \\');
 Writeln ('|------------------------------------------------------------\\');
 Writeln ('| Ingrese el Peso de la Obra (Kg):                           \\');
 Writeln ('|------------------------------------------------------------\\');
 Writeln ('| Ingrese la Altura de la Obra (Mts):                        \\');
 Writeln ('|------------------------------------------------------------\\');
 Writeln ('| Ingrese si la Obra esta completa:                          \\');
 Writeln ('|------------------------------------------------------------\\');
 Writeln ('| Ingrese las partes de la Obra:                             \\');
 Writeln ('|------------------------------------------------------------\\');
 Writeln ('|            |Ingrese la Descripcion de la Obra:|            \\');
 Writeln ('|                                                            \\');
 Writeln ('|                                                            \\');
 Writeln ('|                                                            \\');
 Writeln ('|------------------------------------------------------------\\');
 Writeln ('| Ingrese el DNI del artista:                                \\');
 Writeln ('|------------------------------------------------------------\\');
 Writeln ('| Ingrese el Codigo del Museo:                               \\');
 Writeln (' \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
End;

//ARTISTA
Procedure Menu_Cargar_Artista_Part1();
Begin
 Clrscr;
 Textcolor(Blue);
 Writeln (' _________________________________');
 Writeln ('|                                 \\');
 Write   ('|    '); TextColor(Green); Write('MENU DE CARGA DE ARTISTAS'); TextColor(Blue); Writeln ('    \\');
 Writeln ('|_________________________________\\___________________');
 Writeln ('|                                                      \\');
 Writeln ('| Ingrese el DNI del Artista:                          \\');
 Writeln ('|------------------------------------------------------\\');
End;
Procedure Menu_Cargar_Artista_Part2();
Begin
 TextColor(Blue);
 Writeln ('|------------------------------------------------------\\');
 Writeln ('| Ingrese el Nombre del artista:                       \\');
 Writeln ('|------------------------------------------------------\\');
 Writeln ('| Ingrese la Direccion del Artista:                    \\');
 Writeln ('|------------------------------------------------------\\');
 Writeln ('| Ingrese la fecha de Nacimiento:                      \\');
 Writeln ('|______________________________________________________\\');
 Writeln (' \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
End;


//MUSEO
Procedure Menu_Cargar_Museo_Part1();
Begin
 Clrscr;
 TextColor(Blue);
 Writeln (' ________________________________');
 Writeln ('|                                \\');
 Write ('|    '); TextColor(Green); Write('MENU DE CARGA DE MUSEO'); TextColor(Blue); Writeln ('      \\');
 Writeln ('|________________________________\\____________________');
 Writeln ('|                                                      \\');
 Writeln ('| Ingrese el codigo de Museo:                          \\');
 Writeln ('|------------------------------------------------------\\');
End;
Procedure Menu_Cargar_Museo_Part2();
Begin
 TextColor (Blue);
 Writeln ('|------------------------------------------------------\\');
 Writeln ('| Ingrese el Nombre del Museo:                         \\'); 
 Writeln ('|------------------------------------------------------\\');
 Writeln ('| Ingrese la Calle del Museo:                          \\');
 Writeln ('|------------------------------------------------------\\');
 Writeln ('| Ingrese el Pais del Museo:                           \\');
 Writeln ('|------------------------------------------------------\\');
 Writeln ('| Ingrese el Telefono:                                 \\');
 Writeln ('|------------------------------------------------------\\');
 Writeln ('| Ingrese el DNI del Director:                         \\');
 Writeln ('|------------------------------------------------------\\'); 
 Writeln (' \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
End;


//DIRECTOR
Procedure Menu_Cargar_Director_Part1();
Begin
 Clrscr;
 Textcolor(Blue);
 Writeln (' _________________________________');
 Writeln ('|                                 \\');
 Write ('|   '); TextColor(Green); Write('MENU DE CARGA DE DIRECTORES'); TextColor(Blue); Writeln ('   \\');
 Writeln ('|_________________________________\\___________________');
 Writeln ('|                                                      \\');
 Writeln ('| Ingrese el DNI del Director:                         \\');
 Writeln ('|------------------------------------------------------\\');
End;
Procedure Menu_Cargar_Director_Part2();
Begin
 Textcolor (Blue);
 Writeln ('|------------------------------------------------------\\');
 Writeln ('|Ingrese el Nombre del Director:                       \\'); 
 Writeln ('|------------------------------------------------------\\');
 Writeln ('|Ingrese la Direccion del Director:                    \\'); 
 Writeln ('|------------------------------------------------------\\');
 Writeln ('|Ingrese el Periodo de Asignacion:                     \\');
 Writeln ('| ||                                                   \\');
 Writeln ('| | > Fecha de Inicio del Periodo:                     \\'); 
 Writeln ('| ||                                                   \\');
 Writeln ('| |_> Vencimiento del Periodo:                         \\'); 
 Writeln ('|------------------------------------------------------\\');
 Writeln ('| Ingrese el el Telefono:                              \\'); 
 Writeln ('|______________________________________________________\\');
 Writeln (' \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
End;

//MENUES DE EDICION
{
A partir de aqui se declaran los menus de edicion
 de datos de los archivos}
//GENERAL
Procedure Cuadro_Edicion();
Begin
Window(25,3,86,12);
TextColor(Blue);
Gotoxy(1,1); Writeln ('+------------------------------------------------------------+');
Gotoxy(1,2); Writeln ('|                                                            |');
Gotoxy(1,3); Writeln ('|                                                            |');
Gotoxy(1,4); Writeln ('|                                                            |');
Gotoxy(1,5); Writeln ('|                                                            |');
Gotoxy(1,6); Writeln ('+------------------------------------------------------------+');
Window(26,4,85,7);
Readln 
End;

//OBRA
Procedure Menu_Editar_Obra_Part1();
Begin

End;

Procedure Menu_Editar_Obra_Part2();
Begin

End;

//ARTISTA
Procedure Menu_Editar_Artista_Part1();
Begin
 Clrscr;
 TextColor(Blue);
 Writeln ('/////////////////////////////////////////////////////////'); 
 Writeln ('///                                                   ///');
 Writeln ('/////////////////////////////////////////////////////////');
 Writeln ('/////////////////////              //////////////////////');
 Writeln ('/////////////////////////////////////////////////////////');
 TextColor(Green);
 Gotoxy (5,2); Write('Ingrese el DNI del artista que desea modificar:');
End;

Procedure Menu_Editar_Artista_Part2();
Begin
 TextColor(Blue);
 Writeln ('|///////////////////////////////////////////////');
 Writeln ('|            DATOS ENCONTRADOS!               //');
 Writeln ('|///////////////////////////////////////////////');
 Writeln ('| DNI:                                        //');
 Writeln ('|---------------------------------------------//');
 Writeln ('| Nombre:                                     //');
 Writeln ('|---------------------------------------------//');
 Writeln ('| Direccion:                                  //');
 Writeln ('|---------------------------------------------//');
 Writeln ('| Fecha de nacimiento:                        //');
 Writeln ('|---------------------------------------------//');
 TextColor(Green);
 Gotoxy (50,1 ); Writeln ('|///////////////////////////////////////////////');
 Gotoxy (50,2 ); Writeln ('|         ELIJA EL CAMPO A MODIFICAR          //');
 Gotoxy (50,3 ); Writeln ('|///////////////////////////////////////////////');
 Gotoxy (50,4 ); Writeln ('|--> 1- D.N.I.                                //');
 Gotoxy (50,5 ); Writeln ('|--> 2- Nombre                                //');
 Gotoxy (50,6 ); Writeln ('|--> 3- Direccion                             //');
 Gotoxy (50,7 ); Writeln ('|--> 4- Fecha de nacimiento                   //');
 Gotoxy (50,8 ); Writeln ('|---------------------------------------------//');
 Gotoxy (50,9 ); Writeln ('|--> 0- Salir                                 //');
 Gotoxy (50,10); Writeln ('|---------------------------------------------//');
End;

//MUSEO
Procedure Menu_Editar_Museo_Part1();
Begin
 Clrscr;
 TextColor(Blue);
 Writeln ('/////////////////////////////////////////////////////////'); 
 Writeln ('///                                                   ///');
 Writeln ('/////////////////////////////////////////////////////////');
 Writeln ('/////////////////////              //////////////////////');
 Writeln ('/////////////////////////////////////////////////////////');
 TextColor(Green);
 Gotoxy (5,2); Write('Ingrese el Codigo del Museo que desea modificar:');
End;

Procedure Menu_Editar_Museo_Part2();
Begin
 TextColor (Blue);
 Writeln ('|//////////////////////////////////////////////');  
 Writeln ('|             DATOS ENCONTRADOS              //');
 Writeln ('|//////////////////////////////////////////////');
 Writeln ('| Codigo:                                    //');
 Writeln ('|--------------------------------------------//'); 
 Writeln ('| Nombre:                                    //');
 Writeln ('|--------------------------------------------//'); 
 Writeln ('| Director:                                  //');
 Writeln ('|--------------------------------------------//'); 
 Writeln ('| D.N.I. del Director:                       //');
 Writeln ('|--------------------------------------------//'); 
 Writeln ('| Calle:                                     //');
 Writeln ('|--------------------------------------------//'); 
 Writeln ('| Ciudad:                                    //');
 Writeln ('|--------------------------------------------//'); 
 Writeln ('| Pais:                                      //');
 Writeln ('|--------------------------------------------//'); 
 Writeln ('| Telefono:                                  //');
 Writeln ('|--------------------------------------------//');
 TextColor (Green);
 Gotoxy (48,8 ); Writeln ('|/////////////////////////////////////'); 
 Gotoxy (48,9 ); Writeln ('|Elija el campo que desea modificar //');
 Gotoxy (48,10); Writeln ('|/////////////////////////////////////'); 
 Gotoxy (48,11); Writeln ('|--> 1- DNI                         //');
 Gotoxy (48,12); Writeln ('|--> 2- Nombre                      //');
 Gotoxy (48,13); Writeln ('|--> 3- Telefono                    //');
 Gotoxy (48,14); Writeln ('|--> 4- Calle                       //');
 Gotoxy (48,15); Writeln ('|--> 5- Pais                        //');
 Gotoxy (48,16); Writeln ('|--> 6- Ciudad                      //');
 Gotoxy (48,17); Writeln ('|-----------------------------------//');
 Gotoxy (48,18); Writeln ('|--> 0- Salir                       //');
 Gotoxy (48,19); Writeln ('|-----------------------------------//');
End;

//DIRECTOR
Procedure Menu_Editar_Director_Part1();
Begin
Clrscr;
TextColor(Blue);
Writeln ('/////////////////////////////////////////////////////////');
Writeln ('///                                                   ///');
Writeln ('/////////////////////////////////////////////////////////');
Writeln ('/////////////////                      //////////////////');
Writeln ('/////////////////////////////////////////////////////////');
End;

Procedure Menu_Editar_Director_Part2();
Begin
 Clrscr;
 TextColor(Blue);
 Writeln ('|\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
 Write ('|                  ');TextColor (Green); Write('DATOS ENCONTRADOS'); TextColor (Blue); Writeln('                         \\');
 Writeln ('|------------------------------------------------------------\\');
 Writeln ('| Nombre:                                                    \\'); 
 Writeln ('|------------------------------------------------------------\\');
 Writeln ('| D.N.I.:                                                    \\');
 Writeln ('|------------------------------------------------------------\\');
 Writeln ('| Direccion:                                                 \\');
 Writeln ('|------------------------------------------------------------\\');
 Writeln ('| Periodo de Asignacion:                                     \\');
 Writeln ('| Desde el:                    |Hasta el:                    \\');
 Writeln ('|------------------------------------------------------------\\');
 Writeln ('| Telefono de Contacto:                                      \\');
 Writeln ('|------------------------------------------------------------\\');
End;

//Menues de BORRADO
//OBRA
Procedure Menu_Baja_Obra();
Begin
 TextColor(Green);
 Gotoxy (25,1); Writeln ('/////////////////////////////////////////////////////////////////////'); 
 Gotoxy (25,2); Writeln ('//Ingrese el Codigo de la Obra que desea dar de baja:              //');
 Gotoxy (25,3); Writeln ('/////////////////////////////////////////////////////////////////////'); 
End;

Procedure Menu_Baja_Obra_Inexistente();
Begin
 TextColor (Red);
 Gotoxy (34,6); Write ('//////////////////////////////////////////////////');
 Gotoxy (34,7); Write ('// El Museo con el Codigo            NO EXISTE! //');
 Gotoxy (34,8); Write ('//////////////////////////////////////////////////');
 Readkey;
End;

//ARTISTA
Procedure Menu_Baja_Artista();
Begin
 Textcolor(Green);
 Gotoxy (25,1); Writeln ('////////////////////////////////////////////////////////////////');
 Gotoxy (25,2); Writeln ('//Ingrese el DNI del Artista que desea dar de baja:           //');
 Gotoxy (25,3); Writeln ('////////////////////////////////////////////////////////////////');
End;
Procedure Menu_Baja_Artista_Inexistente();
Begin
 TextColor(Red);
 Gotoxy (31,6); Write ('///////////////////////////////////////////////////');
 Gotoxy (31,7); Write ('// El Artista con el D.N.I.           NO EXISTE! //');
 Gotoxy (31,8); Write ('///////////////////////////////////////////////////');
 Readkey;
End;

//MUSEO
Procedure Menu_Baja_Museo();
Begin
 TextColor (Green);
 Gotoxy (25,1); Writeln ('/////////////////////////////////////////////////////////////////////');
 Gotoxy (25,2); Writeln ('// Ingrese el Codigo del Museo que desea dar de baja:              //');
 Gotoxy (25,3); Writeln ('/////////////////////////////////////////////////////////////////////');
End;

Procedure Menu_Baja_Museo_Inexistente();
Begin
 TextColor(Red);
 Gotoxy (33,6); Write ('//////////////////////////////////////////////////');
 Gotoxy (33,7); Write ('// El Museo con el Codigo            NO EXISTE! //');
 Gotoxy (33,8); Write ('//////////////////////////////////////////////////');
 Readkey;
End;

//DIRECTOR
Procedure Menu_Baja_Director();
Begin
 TextColor(Green);
 Gotoxy (25,1); Writeln ('/////////////////////////////////////////////////////////////////');
 Gotoxy (25,2); Writeln ('// Ingrese el DNI del Director que desea dar de baja:          //');
 Gotoxy (25,3); Writeln ('/////////////////////////////////////////////////////////////////');
End;

Procedure Menu_Baja_Director_Inexistente();
Begin
 TextColor(Red);
 Gotoxy (32,6); Write ('////////////////////////////////////////////////////');
 Gotoxy (32,7); Write ('// El Director con el D.N.I.           NO EXISTE! //');
 Gotoxy (32,8); Write ('////////////////////////////////////////////////////');
 Readkey;
End;

//Menues de ESTADISTICA
//OBRA
{Procedure Menu_Estadistica_Obra_Part1();
Begin

End;

Procedure Menu_Estadistica_Obra_Part2();
Begin

End;

//ARTISTA
Procedure Menu_Estadistica_Artista_Part1();
Begin

End;

Procedure Menu_Estadistica_Artista_Part2();
Begin

End;

//MUSEO
Procedure Menu_Estadistica_Museo_Part1();
Begin

End;

Procedure Menu_Estadistica_Museo_Part2();
Begin

End;

//DIRECTOR
Procedure Menu_Estadistica_Director_Part1();
Begin

End;

Procedure Menu_Estadistica_Director_Part2();
Begin

End;}

//FIN DE DECLARACION DE MENUES
{
A partir de aqui se declaran procedimientos
que muestran carteles e iconos!}

Procedure Aviso_Artista_Inexistente;
Begin
 Clrscr;
 Textcolor(Red);
 Gotoxy(30,10); Writeln ('/////////////////////////////////////////////////////////////');
 Gotoxy(30,11); Writeln ('// El Artista No Existe en el Archivo y debe darse de Alta //');
 Gotoxy(30,12); Writeln ('/////////////////////////////////////////////////////////////');
 Gotoxy(44,14); Writeln ('PRESIONE UNA TECLA PARA CONTINUAR');
 Readkey;
End;

Procedure Aviso_Museo_Inexistente;
Begin
 Textcolor(Red);
 Clrscr;
 Gotoxy(30,10); Writeln ('///////////////////////////////////////////////////////////');
 Gotoxy(30,11); Writeln ('// El Museo No Existe en el Archivo y debe darse de Alta //');
 Gotoxy(30,12); Writeln ('///////////////////////////////////////////////////////////');
 Gotoxy(44,14); Writeln ('PRESIONE UNA TECLA PARA CONTINUAR');
 Readkey;
End;

Procedure Aviso_Director_Inexistente;
Begin
 Textcolor(Red);
 Clrscr;
 Gotoxy(30,10); Writeln ('//////////////////////////////////////////////////////////////');
 Gotoxy(30,11); Writeln ('// El Director No Existe en el Archivo y debe darse de Alta //');
 Gotoxy(30,12); Writeln ('//////////////////////////////////////////////////////////////');
 Gotoxy(44,14); Writeln ('PRESIONE UNA TECLA PARA CONTINUAR');
 Readkey;
End;

Procedure Aviso_Dato_Inexistente();
Begin
 Clrscr;
 TextColor(Red);
 Gotoxy (40,13); Writeln ('|||||||                   |||||||'); 
 Gotoxy (40,14); Writeln ('|| El dato que intenta Editar  ||');
 Gotoxy (40,15); Writeln ('||                             ||'); 
 Gotoxy (40,16); Writeln ('||         NO EXISTE!          ||');
 Gotoxy (40,17); Writeln ('|||||||                   |||||||');
 DelaY(2000);
End;


Procedure Aviso_Dato_Existente();
Begin
 Clrscr;
 TextColor(Red);
 Gotoxy (40,13); Writeln ('|||||||                   |||||||'); 
 Gotoxy (40,14); Writeln ('|| El dato que intenta Cargar  ||');
 Gotoxy (40,15); Writeln ('||                             ||'); 
 Gotoxy (40,16); Writeln ('||         YA EXISTE!          ||');
 Gotoxy (40,17); Writeln ('|||||||                   |||||||');
 DelaY(2000);
 Clrscr;
End;


Procedure Aviso_Carga_Exitosa();
Const
	A=100;
Begin
 Clrscr;
 TextColor(Green);
 Gotoxy (40,8 );	Writeln ('  /////                   /////'); 
 Gotoxy (40,9 );	Writeln ('//                             //');
 Gotoxy (40,10);	Writeln ('//    Guardado Exitosamente!   //'); 
 Gotoxy (40,11);	Writeln ('//                             //');
 Gotoxy (40,12);	Writeln ('  /////                   /////');
 Tick;
End;


Procedure Aviso_Edicion_Exitosa();
Begin
 Clrscr;
 TextColor(Green);
 Gotoxy (40,8 );	Writeln ('  /////                   /////'); 
 Gotoxy (40,9 );	Writeln ('//                             //');
 Gotoxy (40,10);	Writeln ('//    Editado Exitosamente!    //'); 
 Gotoxy (40,11);	Writeln ('//                             //');
 Gotoxy (40,12);	Writeln ('  /////                   /////');
 Tick();
End;


Procedure Aviso_Eliminacion_Exitosa();
Begin
 Clrscr;
 TextColor(Green);
 Gotoxy (40,8 );	Writeln ('  /////                   /////'); 
 Gotoxy (40,9 );	Writeln ('//                             //');
 Gotoxy (40,10);	Writeln ('//     Eliminacion Exitosa!    //'); 
 Gotoxy (40,11);	Writeln ('//                             //');
 Gotoxy (40,12);	Writeln ('  /////                   /////');
 Tick();
End;

Procedure Dato_Ingresado_Erroneo(X:Byte; Y:Byte; Tamanio:Byte);
Var
 A,B:Byte;
Begin
 A:=37;
 B:=1;
 TextColor(Red);
 Gotoxy (A,B ) ; Write ('+----------------------------+');
 Gotoxy (A,B+1); Write ('| INGRESO UN DATO INCORRECTO |');
 Gotoxy (A,B+2); Write ('+----------------------------+');
 Readkey;
 Window(A,B,A+30,B+2);
 Clrscr;
 Window(X,Y,X+Tamanio,Y);
 Clrscr;
 Window(1,1,120,80);
End;

Procedure Dato_Encontrado_Obra;
Begin
 Writeln ('////////////////////////////');
 Writeln ('//   OBRA ENCONTRADA !!   //');
 Writeln ('////////////////////////////');
 Delay (1500);
 Clrscr;
End;

Procedure Dato_Encontrado_Artista;
Begin
 Writeln ('////////////////////////////');
 Writeln ('//  ARTISTA ENCONTRADO !! //');
 Writeln ('////////////////////////////');
 Delay (1500);
 Clrscr;
End;

Procedure Dato_Encontrado_Museo;
Begin
 Writeln ('////////////////////////////');
 Writeln ('//   MUSEO ENCONTRADO !!  //');
 Writeln ('////////////////////////////');
 Delay (1500);
 Clrscr;
End;

Procedure Dato_Encontrado_Director;
Begin
 Writeln ('////////////////////////////');
 Writeln ('// DIRECTOR ENCONTRADO !! //');
 Writeln ('////////////////////////////');
 Delay (1500);
 Clrscr;
End;

Procedure Tick();
Const
	A=75;
Begin
 Delay(A);
 Gotoxy(50,14); Writeln ('           __');
 Delay(A);
 Gotoxy(50,15); Writeln ('          / /');
 Delay(A);
 Gotoxy(50,16); Writeln ('         / / ');
 Delay(A);
 Gotoxy(50,17); Writeln ('        / /  ');
 Delay(A);
 Gotoxy(50,18); Writeln ('__     / /   ');
 Delay(A);
 Gotoxy(50,19); Writeln ('\ \   / /    ');
 Delay(A);
 Gotoxy(50,20); Writeln (' \ \ / /     ');
 Delay(A);
 Gotoxy(50,21); Writeln ('  \___/      ');
 Delay(A);
 Gotoxy(50,22); Writeln ('             ');
 Delay(1000);
 Clrscr;
End;

BEGIN
END.
