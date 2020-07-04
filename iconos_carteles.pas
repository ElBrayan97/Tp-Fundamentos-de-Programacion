
Unit iconos_carteles;

Interface
uses crt;

//Menues de Opciones  //////////////////////////////////////////////////
Procedure Menu_Principal_Graph;
Procedure Menu_Cargar_Graph;
Procedure Menu_Editar_Graph;
Procedure Menu_Borrar_Graph;
Procedure Menu_Estadisticas_Graph;

//Menues de Carga //////////////////////////////////////////////////////
//OBRA
Procedure Menu_Cargar_Obra();

//ARTISTA
Procedure Menu_Cargar_Artista_Part1();
Procedure Menu_Cargar_Artista_Part2();

//MUSEO
Procedure Menu_Cargar_Museo();

//DIRECTOR
Procedure Menu_Cargar_Director_Part1();
Procedure Menu_Cargar_Director_Part2();

//Menues de Edicion ////////////////////////////////////////////////////
//GENERAL
Procedure Cuadro_Edicion_Museo();
Procedure Cuadro_Edicion_Obra();
//OBRA
Procedure Menu_Editar_Obra_Part1(Var Bus:String);
Procedure Menu_Editar_Obra_Part2();

//ARTISTA
Procedure Menu_Editar_Artista_Part1(Var Bus:String);
Procedure Menu_Editar_Artista_Part2();

//MUSEO
Procedure Menu_Editar_Museo_Part1(Var Bus:String);
Procedure Menu_Editar_Museo_Part2();

//DIRECTOR
Procedure Menu_Editar_Director_Part1(Var Bus:String);
Procedure Menu_Editar_Director_Part2();
Procedure Menu_Editar_Director_Part3();

//Menues de Borrado  ///////////////////////////////////////////////////
//OBRA
Procedure Menu_Baja_Obra(Var Nombre:String);
Procedure Menu_Baja_Obra_Inexistente();

//ARTISTA
Procedure Menu_Baja_Artista(Var Nombre:String);
Procedure Menu_Baja_Artista_Inexistente();

//MUSEO
Procedure Menu_Baja_Museo(Var Nombre:String);
Procedure Menu_Baja_Museo_Inexistente();

//DIRECTOR
Procedure Menu_Baja_Director(Var Nombre:String);
Procedure Menu_Baja_Director_Inexistente();

//Menues de Estadistica  ///////////////////////////////////////////////
//OBRA
Procedure Menu_Estadistica_ObrasxAutor();
Procedure Menu_Estadistica_Dni_Artista(Var busc:int64);


{Procedure Menu_Estadistica_Obra_Part2();


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
Procedure Dato_Ingresado_Erroneo();
Procedure Aviso_Dato_Inexistente;
Procedure Aviso_Carga_Exitosa;
Procedure Aviso_Dato_Existente;
Procedure Aviso_Dato_Oculto();
Procedure Aviso_Restauracion_Exitosa();
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

Implementation

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
    Writeln ('|__> Ingrese una opcion: ');
    Gotoxy (25,14);
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
    Writeln ('|__> Ingrese una opcion: ');
    Gotoxy (25,14);
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
    Writeln ('|     1: OBRA            \\');
    Writeln ('|     2: ARTISTA         \\');
    Writeln ('|     3: MUSEO           \\');
    Writeln ('|     4: DIRECTOR        \\');
    Writeln ('|                        \\');
    Writeln ('|     0: ATRAS           \\');
    Writeln ('|  ______________________\\');
    Writeln ('| /');
    Writeln ('| \');
    Writeln ('|__> Ingrese una opcion: ');
    Gotoxy (25,14);
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
    Writeln ('|     1: OBRA            \\');
    Writeln ('|     2: ARTISTA         \\');
    Writeln ('|     3: MUSEO           \\');
    Writeln ('|     4: DIRECTOR        \\');
    Writeln ('|                        \\');
    Writeln ('|     0: ATRAS           \\');
    Writeln ('|  ______________________\\');
    Writeln ('| /');
    Writeln ('| \');
    Writeln ('|__> Ingrese una opcion: ');
    Gotoxy (25,14);
End;


Procedure Menu_Estadisticas_Graph;
Begin
    Clrscr;
    TextColor (Green);
    Writeln (' ____________________________');
    Writeln ('|--- MENU DE ESTADISTICAS ---\\');
    //X = (1 A 31)
    TextColor (Blue);
    Writeln ('|============================\\');
    //Y = (1 A 16)
    Writeln ('|                            \\');
    Writeln ('|   1: OBRAS                 \\');
    Writeln ('|                            \\');
    Writeln ('|   2: MUSEO Y SUS OBRAS     \\');
    Writeln ('|                            \\');
    Writeln ('|   3: MOSTRAR TODAS LAS     \\');
    Writeln ('|   ESTADISTICAS DISPONIBLES \\');
    Writeln ('|                            \\');
    Writeln ('|   0: ATRAS                 \\');
    Writeln ('|  __________________________\\');
    Writeln ('| /');
    Writeln ('| \');
    Writeln ('|__> Ingrese una opcion: ');
    Gotoxy (25,16);
End;


Procedure Menu_Estadistica_Dni_Artista(Var busc:int64);
Begin
    busc := 0;
    Textcolor(blue);
    Gotoxy (34,4);
    Writeln ('////////////////////////////////////////////////////////////////');
    Gotoxy (34,5);
    Writeln ('//Ingrese el DNI del Artista para ver sus obras:              //');
    Gotoxy (34,6);
    Writeln ('////////////////////////////////////////////////////////////////');
    textcolor(green);
    Gotoxy (83,5);
    Readln(busc);
End;


//MENUES DE CARGA
{
A partir de aqui se declaran los menues
 graficos para la carga de datos}

//OBRA
Procedure Menu_Cargar_Obra();
Begin
    Clrscr;
    TextColor(Blue);
    Writeln (' ________________________________');
    Writeln ('|                                \\');
    Writeln ('|     ');
    Gotoxy(6,3);
    TextColor(Green);
    Writeln('MENU DE CARGA DE OBRA');
    TextColor(Blue);
    Gotoxy(28,3);
    Writeln ('      \\');
    Writeln ('|________________________________\\__________________________');
    Writeln ('| Ingrese el Nombre de la Obra:                              \\');
    Writeln ('|------------------------------------------------------------\\');
    Writeln ('| Codigo asignado a la Obra:                                 \\');
    Writeln ('|------------------------------------------------------------\\');
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
    Writeln ('| Ingrese la Altura de la Obra (Cmt):                        \\');
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
    Writeln ('| Ingrese el Nombre del artista:                             \\');
    Writeln ('|------------------------------------------------------------\\');
    Writeln ('| Ingrese el Nombre del Museo:                               \\');
    Writeln(' \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
End;

//ARTISTA
Procedure Menu_Cargar_Artista_Part1();
Begin
    Clrscr;
    Textcolor(Blue);
    Writeln (' _________________________________');
    Writeln ('|                                 \\');
    Writeln ('|     ');
    Gotoxy(6,3);
    TextColor(Green);
    Writeln('MENU DE CARGA DE ARTISTAS');
    TextColor(Blue);
    Gotoxy(32,3);
    Writeln ('   \\');
    Writeln ('|_________________________________\\___________________');
    Writeln ('|                                                      \\');
    Writeln ('| Ingrese el Nombre del artista:                       \\');
    Writeln ('|------------------------------------------------------\\');
End;
Procedure Menu_Cargar_Artista_Part2();
Begin
    TextColor(Blue);
    Writeln ('|------------------------------------------------------\\');
    Writeln ('| Ingrese el DNI del Artista:                          \\');
    Writeln ('|------------------------------------------------------\\');
    Writeln ('| Ingrese la Direccion del Artista:                    \\');
    Writeln ('|------------------------------------------------------\\');
    Writeln ('| Ingrese la fecha de Nacimiento:                      \\');
    Writeln ('|______________________________________________________\\');
    Writeln (' \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
End;


//MUSEO
Procedure Menu_Cargar_Museo();
Begin
    Clrscr;
    TextColor(Blue);
    Writeln (' ________________________________');
    Writeln ('|                                \\');
    Writeln ('|    ');
    TextColor(Green);
    Gotoxy(5,3);
    Writeln('MENU DE CARGA DE MUSEO');
    TextColor(Blue);
    Gotoxy(28,3);
    Writeln ('      \\');
    Writeln ('|________________________________\\___________________________');
    Writeln ('|                                                             \\');
    Writeln ('| Ingrese el Nombre del Museo:                                \\');
    Writeln ('|-------------------------------------------------------------\\');
    Writeln ('| Codigo asignado al Museo:                                   \\');
    Writeln ('|-------------------------------------------------------------\\');
    Writeln ('| Ingrese la Calle del Museo:                                 \\');
    Writeln ('|-------------------------------------------------------------\\');
    Writeln ('| Ingrese la Ciudad del Museo:                                \\');
    Writeln ('|-------------------------------------------------------------\\');
    Writeln ('| Ingrese el Pais del Museo:                                  \\');
    Writeln ('|-------------------------------------------------------------\\');
    Writeln ('| Ingrese el Telefono:                                        \\');
    Writeln ('|-------------------------------------------------------------\\');
    Writeln ('| Ingrese el DNI del Director:                                \\');
    Writeln ('|-------------------------------------------------------------\\');
    Writeln (' \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
End;


//DIRECTOR
Procedure Menu_Cargar_Director_Part1();
Begin
    Clrscr;
    Textcolor(Blue);
    Writeln (' _________________________________');
    Writeln ('|                                 \\');
    Writeln ('|   ');
    TextColor(Green);
    Gotoxy (5,3);
    Writeln('MENU DE CARGA DE DIRECTORES');
    TextColor(Blue);
    Gotoxy(32,3);
    Writeln ('   \\');
    Writeln ('|_________________________________\\___________________');
    Writeln ('|                                                      \\');
    Writeln ('| Ingrese el Nombre del Director:                      \\');
    Writeln ('|------------------------------------------------------\\');
End;
Procedure Menu_Cargar_Director_Part2();
Begin
    Textcolor (Blue);
    Gotoxy (1,8);
    Writeln ('|Ingrese el D.N.I. del Director:                       \\');
    Writeln ('|------------------------------------------------------\\');
    Writeln ('|Ingrese la Direccion del Director:                    \\');
    Writeln ('|------------------------------------------------------\\');
    Writeln ('|Ingrese el Periodo de Asignacion:                     \\');
    Writeln ('| ||                                                   \\');
    Writeln ('| | > Fecha de Inicio del Periodo:                     \\');
    Writeln ('| ||                                                   \\');
    Writeln ('| |_> Vencimiento del Periodo:                         \\');
    Writeln ('|------------------------------------------------------\\');
    Writeln ('| Ingrese el Telefono:                                 \\');
    Writeln ('|______________________________________________________\\');
    Writeln (' \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
End;

//MENUES DE EDICION
{
A partir de aqui se declaran los menus de edicion
 de datos de los archivos}

//GENERAL
Procedure Cuadro_Edicion_Museo();
Begin
    TextColor(Green);
    Gotoxy (1,19);
    Writeln ('\\------------------------------------------------------------------------\\');
    Gotoxy (1,20);
    Writeln ('\\                                                                        \\');
    Gotoxy (1,21);
    Writeln ('\\                                                                        \\');
    Gotoxy (1,22);
    Writeln ('\\------------------------------------------------------------------------\\');
    Window(3,20,73,22);
End;


Procedure Cuadro_Edicion_Obra();
Begin
    TextColor(Blue);
    Gotoxy(70,16);
    Writeln ('                                       \\');
    Gotoxy(70,17);
    Writeln ('                                       \\');
    Gotoxy(70,18);
    Writeln ('                                       \\');
    Gotoxy(70,19);
    Writeln ('                                       \\');
    Gotoxy(70,20);
    Writeln ('                                       \\');
    Gotoxy(70,21);
    Writeln ('                                       \\');
    Gotoxy(70,22);
    Writeln ('                                       \\');
    Gotoxy(70,23);
    Writeln ('                                       \\');
    Gotoxy(70,24);
    Writeln ('\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    Window(70,16,108,23);
    TextColor(Green);
End;

//OBRA
Procedure Menu_Editar_Obra_Part1(Var Bus:String);
Begin
    Bus := '';
    Clrscr;
    TextColor(Blue);
    Gotoxy (30,1);
    Writeln ('/////////////////////////////////////////////////////////');
    Gotoxy (30,2);
    Writeln ('///                                                   ///');
    Gotoxy (30,3);
    Writeln ('/////////////////////////////////////////////////////////');
    Gotoxy (30,4);
    Writeln ('//                                                     //');
    Gotoxy (30,5);
    Writeln ('/////////////////////////////////////////////////////////');
    TextColor(Green);
    Gotoxy (34,2);
    Writeln ('Ingrese el Nombre de la obra que desea modificar');
    TextColor(Green);
    Gotoxy (33,4);
    Readln(Bus);
End;

Procedure Menu_Editar_Obra_Part2();
Begin
    TextColor(Blue);
    Writeln ('|\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    Writeln ('|                        ');
    TextColor (Green);
    Gotoxy(25,2);
    Writeln('DATOS ENCONTRADOS');
    TextColor (Blue);
    Gotoxy(42,2);
    Writeln('                         \\');
    Writeln ('|------------------------------------------------------------------\\');
    Writeln ('| Artista:                                                         \\');
    Writeln ('|------------------------------------------------------------------\\');
    Writeln ('| Peso:         Kg |Altura:         Cm |Completo:    |Partes:      \\');
    Writeln ('|------------------------------------------------------------------\\');
    Writeln ('| Tipo:                                                            \\');
    Writeln ('|------------------------------------------------------------------\\');
    Writeln ('| Material:                                                        \\');
    Writeln ('|------------------------------------------------------------------\\');
    Writeln ('| Estilo:                                                          \\');
    Writeln ('|------------------------------------------------------------------\\');
    Writeln ('| Anio:                                                            \\');
    Writeln ('|------------------------------------------------------------------\\');
    Writeln ('| Descripcion:                                                     \\');
    Writeln ('|                                                                  \\');
    Writeln ('|                                                                  \\');
    Writeln ('|                                                                  \\');
    Writeln ('|------------------------------------------------------------------\\');
    Writeln ('| Codigos                                                          \\');
    Writeln ('|   Obra:                        | Museo:                          \\');
    Writeln ('|                                                                  \\');
    Writeln ('|------------------------------------------------------------------\\');
    TextColor(Green);
    Gotoxy(70,1);
    Writeln  ('\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    Gotoxy(70,2);
    Writeln  ('\\ ELIJA EL CAMPO QUE DESEA MODIFICAR  \\');
    Gotoxy(70,3);
    Writeln  ('\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    Gotoxy(70,4);
    Writeln  ('\\-> 1- Descripcion|-> 9- Anio         \\');
    Gotoxy(70,5);
    Writeln  ('\\-> 2- Tipo       |-> 10- Artista     \\');
    Gotoxy(70,6);
    Writeln  ('\\-> 3- Material   |-> 11- Codigo Museo\\');
    Gotoxy(70,7);
    Writeln  ('\\-> 4- Estilo     |-> 12- Codigo Obra \\');
    Gotoxy(70,8);
    Writeln  ('\\-> 5- Altura     |                   \\');
    Gotoxy(70,9);
    Writeln  ('\\-> 6- Peso       |                   \\');
    Gotoxy(70,10);
    Writeln ('\\-> 7- Completo   |                   \\');
    Gotoxy(70,11);
    Writeln ('\\-> 8- Partes     |                   \\');
    Gotoxy(70,12);
    Writeln ('\\-------------------------------------\\');
    Gotoxy(70,13);
    Writeln ('\\--> 00- Salir                        \\');
    Gotoxy(70,14);
    Writeln ('\\-------------------------------------\\');
    TextColor(Blue);
    Gotoxy(70,15);
    Writeln ('\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
End;

//ARTISTA
Procedure Menu_Editar_Artista_Part1(Var Bus:String);
Begin
    Bus := '';
    Clrscr;
    TextColor(Blue);
    Gotoxy (30,1);
    Writeln ('/////////////////////////////////////////////////////////');
    Gotoxy (30,2);
    Writeln ('//                                                     //');
    Gotoxy (30,3);
    Writeln ('/////////////////////////////////////////////////////////');
    Gotoxy (30,4);
    Writeln ('//                                                     //');
    Gotoxy (30,5);
    Writeln ('/////////////////////////////////////////////////////////');
    TextColor(Green);
    Gotoxy (35,2);
    Writeln('Ingrese el Nombre del artista que desea modificar');
    Gotoxy (33,4);
    Readln(Bus);
End;

Procedure Menu_Editar_Artista_Part2();
Begin
    TextColor(Blue);
    Writeln ('|\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    Writeln ('|                            DATOS ENCONTRADOS!                           \\');
    Writeln ('|\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    Writeln ('| DNI:                                                                    \\');
    Writeln ('|-------------------------------------------------------------------------\\');
    Writeln ('| Nombre:                                                                 \\');
    Writeln ('|-------------------------------------------------------------------------\\');
    Writeln ('| Direccion:                                                              \\');
    Writeln ('|-------------------------------------------------------------------------\\');
    Writeln ('| Fecha de nacimiento:                                                    \\');
    Writeln ('|-------------------------------------------------------------------------\\');
    Writeln ('\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    TextColor(Green);
    Gotoxy (77,1 );
    Writeln ('////////////////////////////////');
    Gotoxy (77,2 );
    Writeln ('// ELIJA EL CAMPO A MODIFICAR //');
    Gotoxy (77,3 );
    Writeln ('////////////////////////////////');
    Gotoxy (77,4 );
    Writeln ('//--> 1- D.N.I.               //');
    Gotoxy (77,5 );
    Writeln ('//--> 2- Nombre               //');
    Gotoxy (77,6 );
    Writeln ('//--> 3- Direccion            //');
    Gotoxy (77,7 );
    Writeln ('//--> 4- Fecha de nacimiento  //');
    Gotoxy (77,8 );
    Writeln ('//----------------------------//');
    Gotoxy (77,9 );
    Writeln ('//--> 0- Salir                //');
    Gotoxy (77,10);
    Writeln ('//----------------------------//');
    Gotoxy (1,13);
    Writeln ('\\------------------------------------------------------------------------\\');
    Gotoxy (1,14);
    Writeln ('\\                                                                        \\');
    Gotoxy (1,15);
    Writeln ('\\------------------------------------------------------------------------\\');
End;

//MUSEO
Procedure Menu_Editar_Museo_Part1(Var Bus:String);
Begin
    Bus := '';
    Clrscr;
    TextColor(Blue);
    Gotoxy (30,1);
    Writeln ('/////////////////////////////////////////////////////////');
    Gotoxy (30,2);
    Writeln ('///                                                   ///');
    Gotoxy (30,3);
    Writeln ('/////////////////////////////////////////////////////////');
    Gotoxy (30,4);
    Writeln ('//                                                     //');
    Gotoxy (30,5);
    Writeln ('/////////////////////////////////////////////////////////');
    TextColor(Green);
    Gotoxy (35,2);
    Writeln('Ingrese el Nombre del Museo que desea modificar');
    Gotoxy (33,4);
    Readln(Bus);
End;

Procedure Menu_Editar_Museo_Part2();
Begin
    TextColor (Blue);
    Writeln ('|\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    Writeln ('|                            DATOS ENCONTRADOS                            \\');
    Writeln ('|\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    Writeln ('| Codigo:                                                                 \\');
    Writeln ('|-------------------------------------------------------------------------\\');
    Writeln ('| Nombre:                                                                 \\');
    Writeln ('|-------------------------------------------------------------------------\\');
    Writeln ('| D.N.I. del Director:                                                    \\');
    Writeln ('|-------------------------------------------------------------------------\\');
    Writeln ('| Calle:                                                                  \\');
    Writeln ('|-------------------------------------------------------------------------\\');
    Writeln ('| Ciudad:                                                                 \\');
    Writeln ('|-------------------------------------------------------------------------\\');
    Writeln ('| Pais:                                                                   \\');
    Writeln ('|-------------------------------------------------------------------------\\');
    Writeln ('| Telefono:                                                               \\');
    Writeln ('|-------------------------------------------------------------------------\\');
    Writeln ('\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    TextColor (Green);
    Gotoxy (77,7 );
    Writeln ('//////////////////////////////////////');
    Gotoxy (77,8 );
    Writeln ('//ELIJA EL CAMPO QUE DESEA MODIFICAR//');
    Gotoxy (77,9);
    Writeln ('//////////////////////////////////////');
    Gotoxy (77,10);
    Writeln ('//--> 1- D.N.I. del Director        //');
    Gotoxy (77,11);
    Writeln ('//--> 2- Nombre                     //');
    Gotoxy (77,12);
    Writeln ('//--> 3- Telefono                   //');
    Gotoxy (77,13);
    Writeln ('//--> 4- Calle                      //');
    Gotoxy (77,14);
    Writeln ('//--> 5- Pais                       //');
    Gotoxy (77,15);
    Writeln ('//--> 6- Ciudad                     //');
    Gotoxy (77,16);
    Writeln ('//////////////////////////////////////');
    Gotoxy (77,17);
    Writeln ('//--> 0- Salir                      //');
    Gotoxy (77,18);
    Writeln ('//////////////////////////////////////');
End;

//DIRECTOR
Procedure Menu_Editar_Director_Part1(Var Bus : String);
Begin
    Bus := '';
    Clrscr;
    TextColor(Blue);
    Gotoxy (30,1);
    Writeln ('//////////////////////////////////////////////////////////');
    Gotoxy (30,2);
    Writeln ('///                                                    ///');
    Gotoxy (30,3);
    Writeln ('//////////////////////////////////////////////////////////');
    Gotoxy (30,4);
    Writeln ('//                                                      //');
    Gotoxy (30,5);
    Writeln ('//////////////////////////////////////////////////////////');
    TextColor(Green);
    Gotoxy (34,2);
    Writeln ('Ingrese el Nombre del Director que desea modificar');
    Gotoxy (33,4);
    Readln(Bus);
End;

Procedure Menu_Editar_Director_Part2();
Begin
    Clrscr;
    TextColor(Blue);
    Writeln ('|\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    Writeln ('|                  ');
    TextColor (Green);
    Gotoxy(19,2);
    Writeln ('DATOS ENCONTRADOS');
    TextColor (Blue);
    Gotoxy(36,2);
    Writeln('                         \\');
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
    Writeln (
           '|\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'
    );
    Writeln (
           '|\                                                                                                       \\'
    );
    Writeln (
           '|\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\'
    );
    TextColor(Blue);
    Gotoxy (1,18);
    Gotoxy (64,1);
    Writeln ('|\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    Gotoxy (64,2);
    Writeln ('| ');
    TextColor (Green);
    Gotoxy(66,2);
    Writeln ('ELIJA EL CAMPO QUE DESEA MODIFICAR');
    TextColor(Blue);
    Gotoxy(100,2);
    Writeln('      \\');
    Gotoxy (64,3);
    Writeln ('|-----------------------------------------\\');
    Gotoxy (64,4);
    Writeln ('|   ');
    TextColor (Green);
    Gotoxy(68,4);
    Writeln ('--> 1- Periodo Asignacion');
    TextColor(Blue);
    Gotoxy(93,4);
    Writeln('             \\');
    Gotoxy (64,5);
    Writeln ('|   ');
    TextColor (Green);
    Gotoxy(68,5);
    Writeln ('--> 2- Nombre');
    TextColor(Blue);
    Gotoxy(81,5);
    Writeln('                         \\');
    Gotoxy (64,6);
    Writeln ('|   ');
    TextColor (Green);
    Gotoxy(68,6);
    Writeln ('--> 3- Direccion');
    TextColor(Blue);
    Gotoxy(84,6);
    Writeln('                      \\');
    Gotoxy (64,7);
    Writeln ('|   ');
    TextColor (Green);
    Gotoxy(68,7);
    Writeln ('--> 4- Telefono');
    TextColor(Blue);
    Gotoxy(83,7);
    Writeln('                       \\');
    Gotoxy (64,8);
    Writeln ('|-----------------------------------------\\');
    Gotoxy (64,9);
    Writeln ('|   ');
    TextColor (Green);
    Gotoxy(68,9);
    Writeln('--> 0- Salir <--');
    TextColor(Blue);
    Gotoxy(84,9);
    Writeln('                      \\');
    Gotoxy (64,10);
    Writeln ('|-----------------------------------------\\');
    Gotoxy (3,15);
End;

Procedure Menu_Editar_Director_Part3();
Begin
    TextColor(Blue);
    Gotoxy (64,11);
    Writeln('|');
    TextColor (Green);
    Gotoxy (65,11);
    Writeln('--> 1- Inicio del Periodo de Asignacion');
    TextColor (Blue);
    Gotoxy (104,11);
    Writeln('  \\');
    Gotoxy (64,12);
    Writeln('|');
    TextColor (Green);
    Gotoxy (65,12);
    Writeln('--> 2- Fin del Periodo de Asignacion');
    TextColor (Blue);
    Gotoxy (101,12);
    Writeln('     \\');
    Gotoxy (64,13);
    Writeln('|                                         \\');
End;

//Menus de BORRADO
//OBRA
Procedure Menu_Baja_Obra(Var Nombre:String);
Begin
    TextColor(Green);
    Gotoxy (39,4);
    Writeln ('////////////////////////////////////////////////////////');
    Gotoxy (39,5);
    Writeln ('// Ingrese el Nombre de la Obra que desea dar de baja //');
    Gotoxy (32,6);
    Writeln ('//////////////////////////////////////////////////////////////////////');
    Gotoxy (32,7);
    Writeln ('//                                                                  //');
    Gotoxy (32,8);
    Writeln ('//////////////////////////////////////////////////////////////////////');
    TextColor (Blue);
    Gotoxy (35,7);
    Readln (Nombre);
End;

Procedure Menu_Baja_Obra_Inexistente();
Begin
    TextColor (Red);
    Gotoxy (37,3);
    Writeln        ('////////////////////////////////////////////////////////////');
    Gotoxy (37,4);
    Writeln        ('//');
    Gotoxy (95,4);
    Writeln        ('//');
    Gotoxy (30,5);
    Writeln ('/////////');
    Gotoxy (95,5);
    Writeln        ('/////////');
    Gotoxy (30,6);
    Writeln ('//');
    Gotoxy (102,6);
    Writeln        ('//');
    Gotoxy (30,7);
    Writeln ('//');
    Gotoxy (102,7);
    Writeln        ('//');
    Gotoxy (30,8);
    Writeln ('//');
    Gotoxy (102,8);
    Writeln        ('//');
    Gotoxy (30,9);
    Writeln ('//////////////////////////////////////////////////////////////////////////');

    Gotoxy (58,11);
    Writeln('///////////////');
    Gotoxy (58,12);
    Writeln('// NO EXISTE //');
    Gotoxy (58,13);
    Writeln('///////////////');
End;

//ARTISTA


Procedure Menu_Baja_Artista(Var Nombre:String);
Begin
    TextColor(Green);
    Gotoxy (39,4);
    Writeln ('/////////////////////////////////////////////////////////');
    Gotoxy (39,5);
    Writeln ('// Ingrese el Nombre del Artista que desea dar de baja //');
    Gotoxy (32,6);
    Writeln ('///////////////////////////////////////////////////////////////////////');
    Gotoxy (32,7);
    Writeln ('//                                                                   //');
    Gotoxy (32,8);
    Writeln ('///////////////////////////////////////////////////////////////////////');
    TextColor (Blue);
    Gotoxy (35,7);
    Readln (Nombre);
End;

Procedure Menu_Baja_Artista_Inexistente();
Begin
    TextColor (Red);
    Gotoxy (37,3);
    Writeln        ('/////////////////////////////////////////////////////////////');
    Gotoxy (37,4);
    Writeln        ('//');
    Gotoxy (96,4);
    Writeln        ('//');
    Gotoxy (30,5);
    Writeln ('/////////');
    Gotoxy (96,5);
    Writeln        ('/////////');
    Gotoxy (30,6);
    Writeln ('//');
    Gotoxy (103,6);
    Writeln        ('//');
    Gotoxy (30,7);
    Writeln ('//');
    Gotoxy (103,7);
    Writeln        ('//');
    Gotoxy (30,8);
    Writeln ('//');
    Gotoxy (103,8);
    Writeln        ('//');
    Gotoxy (30,9);
    Writeln ('///////////////////////////////////////////////////////////////////////////');

    Gotoxy (58,11);
    Writeln('///////////////');
    Gotoxy (58,12);
    Writeln('// NO EXISTE //');
    Gotoxy (58,13);
    Writeln('///////////////');
End; 


//MUSEO
Procedure Menu_Baja_Museo(Var Nombre:String);
Begin
    TextColor(Green);
    Gotoxy (39,4);
    Writeln ('///////////////////////////////////////////////////////');
    Gotoxy (39,5);
    Writeln ('// Ingrese el Nombre del Museo que desea dar de baja //');
    Gotoxy (32,6);
    Writeln ('/////////////////////////////////////////////////////////////////////');
    Gotoxy (32,7);
    Writeln ('//                                                                 //');
    Gotoxy (32,8);
    Writeln ('/////////////////////////////////////////////////////////////////////');
    TextColor (Blue);
    Gotoxy (35,7);
    Readln (Nombre);
End;

Procedure Menu_Baja_Museo_Inexistente();
Begin
    TextColor (Red);
    Gotoxy (37,3);
    Writeln        ('///////////////////////////////////////////////////////////');
    Gotoxy (37,4);
    Writeln        ('//');
    Gotoxy (94,4);
    Writeln        ('//');
    Gotoxy (30,5);
    Writeln ('/////////');
    Gotoxy (94,5);
    Writeln        ('/////////');
    Gotoxy (30,6);
    Writeln ('//');
    Gotoxy (101,6);
    Writeln        ('//');
    Gotoxy (30,7);
    Writeln ('//');
    Gotoxy (101,7);
    Writeln        ('//');
    Gotoxy (30,8);
    Writeln ('//');
    Gotoxy (101,8);
    Writeln        ('//');
    Gotoxy (30,9);
    Writeln ('/////////////////////////////////////////////////////////////////////////');

    Gotoxy (58,11);
    Writeln('///////////////');
    Gotoxy (58,12);
    Writeln('// NO EXISTE //');
    Gotoxy (58,13);
    Writeln('///////////////');
End;

//DIRECTOR
Procedure Menu_Baja_Director(Var Nombre:String);
Begin
    TextColor(Green);
    Gotoxy (39,4);
    Writeln ('////////////////////////////////////////////////////////');
    Gotoxy (39,5);
    Writeln ('// Ingrese el Nombre de la Obra que desea dar de baja //');
    Gotoxy (32,6);
    Writeln ('//////////////////////////////////////////////////////////////////////');
    Gotoxy (32,7);
    Writeln ('//                                                                  //');
    Gotoxy (32,8);
    Writeln ('//////////////////////////////////////////////////////////////////////');
    TextColor (Blue);
    Gotoxy (35,7);
    Readln (Nombre);
End;

Procedure Menu_Baja_Director_Inexistente();
Begin
    TextColor (Red);
    Gotoxy (37,3);
    Writeln        ('////////////////////////////////////////////////////////////');
    Gotoxy (37,4);
    Writeln        ('//');
    Gotoxy (95,4);
    Writeln        ('//');
    Gotoxy (30,5);
    Writeln ('/////////');
    Gotoxy (95,5);
    Writeln        ('/////////');
    Gotoxy (30,6);
    Writeln ('//');
    Gotoxy (102,6);
    Writeln        ('//');
    Gotoxy (30,7);
    Writeln ('//');
    Gotoxy (102,7);
    Writeln        ('//');
    Gotoxy (30,8);
    Writeln ('//');
    Gotoxy (102,8);
    Writeln        ('//');
    Gotoxy (30,9);
    Writeln ('//////////////////////////////////////////////////////////////////////////');

    Gotoxy (58,11);
    Writeln('///////////////');
    Gotoxy (58,12);
    Writeln('// NO EXISTE //');
    Gotoxy (58,13);
    Writeln('///////////////');
End;

//Menues de ESTADISTICA
//OBRA

Procedure Menu_Estadistica_ObrasxAutor();
Begin
    TextColor(Blue);
    Gotoxy(33,1);
    Writeln ('/////////////////////////////////////////////////////////////');
    Gotoxy(33,2);
    Writeln ('//               CANTIDAD DE OBRAS POR AUTOR               //');
    Gotoxy(33,3);
    Writeln ('/////////////////////////////////////////////////////////////');
    Gotoxy(33,4);
    Writeln ('//                 AUTOR                     |  CANTIDAD   //');
    Gotoxy(33,5);
    Writeln ('//===========================================|=============//');
    Gotoxy(33,6);
    Writeln ('//                                           |             //');
    Gotoxy(33,7);
    Writeln ('//                                           |             //');
    Gotoxy(33,8);
    Writeln ('//                                           |             //');
    Gotoxy(33,9);
    Writeln ('//                                           |             //');
    Gotoxy(33,10);
    Writeln ('//                                           |             //');
    Gotoxy(33,11);
    Writeln ('//                                           |             //');
    Gotoxy(33,12);
    Writeln ('//                                           |             //');
    Gotoxy(33,13);
    Writeln ('//                                           |             //');
    Gotoxy(33,14);
    Writeln ('//                                           |             //');
    Gotoxy(33,15);
    Writeln ('//                                           |             //');
    Gotoxy(33,16);
    Writeln ('//                                           |             //');
    Gotoxy(33,17);
    Writeln ('//                                           |             //');
    Gotoxy(33,18);
    Writeln ('//                                           |             //');
    Gotoxy(33,19);
    Writeln ('//                                           |             //');
    Gotoxy(33,20);
    Writeln ('//                                           |             //');
    Gotoxy(33,21);
    Writeln ('//                                           |             //');
    Gotoxy(33,22);
    Writeln ('//                                           |             //');
    Gotoxy(33,23);
    Writeln ('//                                           |             //');
    Gotoxy(33,24);
    Writeln ('//                                           |             //');
    Gotoxy(33,25);
    Writeln ('//                                           |             //');
    Gotoxy(33,26);
    Writeln ('//                                           |             //');
    Gotoxy(33,27);
    Writeln ('//                                           |             //');
    Gotoxy(33,28);
    Writeln ('//                                           |             //');
    Gotoxy(33,29);
    Writeln ('//                                           |             //');
    Gotoxy(33,30);
    Writeln ('//                                           |             //');
    Gotoxy(33,31);
    Writeln ('//                                           |             //');
    Gotoxy(33,32);
    Writeln ('/////////////////////////////////////////////////////////////');
    Gotoxy(34,33);
    Writeln (' 1-Pagina Anterior   0-Volver al Menu   2-Pagina Siguiente');
    textcolor(green);
End;


{Procedure Menu_Estadistica_Obra_Part2();
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
    Gotoxy(30,10);
    Writeln ('/////////////////////////////////////////////////////////////');
    Gotoxy(30,11);
    Writeln ('// El Artista No Existe en el Archivo y debe darse de Alta //');
    Gotoxy(30,12);
    Writeln ('/////////////////////////////////////////////////////////////');
    Gotoxy(44,14);
    Writeln ('PRESIONE UNA TECLA PARA CONTINUAR');
    Readkey;
End;

Procedure Aviso_Museo_Inexistente;
Begin
    Textcolor(Red);
    Clrscr;
    Gotoxy(30,10);
    Writeln ('///////////////////////////////////////////////////////////');
    Gotoxy(30,11);
    Writeln ('// El Museo No Existe en el Archivo y debe darse de Alta //');
    Gotoxy(30,12);
    Writeln ('///////////////////////////////////////////////////////////');
    Gotoxy(44,14);
    Writeln ('PRESIONE UNA TECLA PARA CONTINUAR');
    Readkey;
End;

Procedure Aviso_Director_Inexistente;
Begin
    Textcolor(Red);
    Clrscr;
    Gotoxy(30,10);
    Writeln ('//////////////////////////////////////////////////////////////');
    Gotoxy(30,11);
    Writeln ('// El Director No Existe en el Archivo y debe darse de Alta //');
    Gotoxy(30,12);
    Writeln ('//////////////////////////////////////////////////////////////');
    Gotoxy(44,14);
    Writeln ('PRESIONE UNA TECLA PARA CONTINUAR');
    Readkey;
End;

Procedure Aviso_Dato_Inexistente();
Begin
    TextColor(Red);
    Gotoxy (42,13);
    Writeln ('|||||||                   |||||||');
    Gotoxy (42,14);
    Writeln ('|| El dato que intenta Editar  ||');
    Gotoxy (42,15);
    Writeln ('||                             ||');
    Gotoxy (42,16);
    Writeln ('||         NO EXISTE!          ||');
    Gotoxy (42,17);
    Writeln ('|||||||                   |||||||');
    Readkey;
End;


Procedure Aviso_Dato_Existente();
Begin
    Clrscr;
    TextColor(Red);
    Gotoxy (40,13);
    Writeln ('|||||||                   |||||||');
    Gotoxy (40,14);
    Writeln ('|| El dato que intenta Cargar  ||');
    Gotoxy (40,15);
    Writeln ('||                             ||');
    Gotoxy (40,16);
    Writeln ('||         YA EXISTE!          ||');
    Gotoxy (40,17);
    Writeln ('|||||||                   |||||||');
    Readkey;
End;


Procedure Aviso_Dato_Oculto();
Begin
    TextColor(Blue);
    Gotoxy (30,19);
    Writeln ('+--------------------------------------------------+');
    Gotoxy (30,20);
    Writeln ('|PARA ACCEDER A ESTE FORMULARIO DEBE RESTAURARLO...|');
    Gotoxy (30,21);
    Writeln ('+--------------------------------------------------+');
    Gotoxy (46,23);
    Writeln ('+--------------------+');
    Gotoxy (46,24);
    Writeln ('+  RESTAURAR? S / N  +');
    Gotoxy (46,25);
    Writeln ('+--------------------+');
End;


Procedure Aviso_Restauracion_Exitosa();
Begin
    Clrscr;
    TextColor(Green);
    Gotoxy (40,8 );
    Writeln ('  /////                   /////');
    Gotoxy (40,9 );
    Writeln ('//                             //');
    Gotoxy (40,10);
    Writeln ('//    Restauracion Exitosa!    //');
    Gotoxy (40,11);
    Writeln ('//                             //');
    Gotoxy (40,12);
    Writeln ('  /////                   /////');
    Tick();
End;


Procedure Aviso_Carga_Exitosa();

Const
    A =   100;
Begin
    Clrscr;
    TextColor(Green);
    Gotoxy (40,8 );
    Writeln ('  /////                   /////');
    Gotoxy (40,9 );
    Writeln ('//                             //');
    Gotoxy (40,10);
    Writeln ('//    Guardado Exitosamente!   //');
    Gotoxy (40,11);
    Writeln ('//                             //');
    Gotoxy (40,12);
    Writeln ('  /////                   /////');
    Tick;
End;


Procedure Aviso_Edicion_Exitosa();
Begin
    Clrscr;
    TextColor(Green);
    Gotoxy (40,8 );
    Writeln ('  /////                   /////');
    Gotoxy (40,9 );
    Writeln ('//                             //');
    Gotoxy (40,10);
    Writeln ('//    Editado Exitosamente!    //');
    Gotoxy (40,11);
    Writeln ('//                             //');
    Gotoxy (40,12);
    Writeln ('  /////                   /////');
    Tick();
End;


Procedure Aviso_Eliminacion_Exitosa();
Begin
    Clrscr;
    TextColor(Green);
    Gotoxy (40,8 );
    Writeln ('  /////                   /////');
    Gotoxy (40,9 );
    Writeln ('//                             //');
    Gotoxy (40,10);
    Writeln ('//     Eliminacion Exitosa!    //');
    Gotoxy (40,11);
    Writeln ('//                             //');
    Gotoxy (40,12);
    Writeln ('  /////                   /////');
    Tick();
End;

Procedure Dato_Ingresado_Erroneo();

Var
    A,B:   Byte;
Begin
    A := 37;
    B := 1;
    TextColor(Red);
    Gotoxy (A,B ) ;
    Writeln ('+---------------------------------------------------+');
    Gotoxy (A,B+1);
    Writeln ('| INGRESO UN DATO INCORRECTO, INTRO PARA REINTENTAR |');
    Gotoxy (A,B+2);
    Writeln ('+---------------------------------------------------+');
    Readkey;
    Window(A,B,A+53,B+2);
    Clrscr;
    Window(1,1,120,80);
End;

Procedure Dato_Encontrado_Obra;
Begin
    Gotoxy (44,7);
    Writeln('\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    Gotoxy (44,8);
    Writeln('//   OBRA ENCONTRADA !!   //');
    Gotoxy (44,9);
    Writeln('\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    Delay (1500);
    Clrscr;
End;

Procedure Dato_Encontrado_Artista;
Begin
    Gotoxy (44,7);
    Writeln ('\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    Gotoxy (44,8);
    Writeln ('//  ARTISTA ENCONTRADO !! //');
    Gotoxy (44,9);
    Writeln ('\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    Delay (1500);
    Clrscr;
End;

Procedure Dato_Encontrado_Museo;
Begin
    Gotoxy (44,7);
    Writeln ('\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    Gotoxy (44,8);
    Writeln ('//   MUSEO ENCONTRADO !!  //');
    Gotoxy (44,9);
    Writeln ('\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    Delay (1500);
    Clrscr;
End;

Procedure Dato_Encontrado_Director;
Begin
    Gotoxy (44,7);
    Writeln ('\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    Gotoxy (44,8);
    Writeln ('// DIRECTOR ENCONTRADO !! //');
    Gotoxy (44,9);
    Writeln ('\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
    Delay (1500);
    Clrscr;
End;

Procedure Tick();

Const
    A =   75;
Begin
    Delay(A);
    Gotoxy(50,14);
    Writeln ('           __');
    Delay(A);
    Gotoxy(50,15);
    Writeln ('          / /');
    Delay(A);
    Gotoxy(50,16);
    Writeln ('         / / ');
    Delay(A);
    Gotoxy(50,17);
    Writeln ('        / /  ');
    Delay(A);
    Gotoxy(50,18);
    Writeln ('__     / /   ');
    Delay(A);
    Gotoxy(50,19);
    Writeln ('\ \   / /    ');
    Delay(A);
    Gotoxy(50,20);
    Writeln (' \ \ / /     ');
    Delay(A);
    Gotoxy(50,21);
    Writeln ('  \___/      ');
    Delay(A);
    Gotoxy(50,22);
    Writeln ('             ');
    Delay(1000);
    Clrscr;
End;

Begin
End.
