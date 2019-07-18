Unit MENU;
Interface
uses crt,iconos_carteles,ARCHART,ARCHDIR,ARCHMUS,ARCHOBR,VALIDACIONES;

var
Opc:char;
Resp:Boolean;
N1:String; 
B,Busc,Pos:Integer;
X,Y:Byte;

//Menus
Procedure Menu_Principal;
Procedure Menu_Cargar;
Procedure Menu_Editar;
Procedure Menu_Borrar;
Procedure Menu_Estadisticas;

//Cargar
Procedure MCargar_OBR (var Obras:Archivo_Obras;var Museos:Archivo_Museos;Var Artistas:Archivo_Artistas);
Procedure MCargar_ART (var Artistas:Archivo_Artistas);
Procedure MCargar_MUS (var Museos:Archivo_Museos; Var Directores:Archivo_Directores);
Procedure MCargar_Director (var Directores:Archivo_Directores);

//Baja
Procedure MBajar_obr (var Obras:Archivo_Obras);
Procedure MBajar_Art (var Artistas:Archivo_Artistas);
Procedure MBajar_Mus (var Museos:Archivo_Museos);
Procedure MBajar_Dir (var Directores:Archivo_Directores);

//Modificar
Procedure MModificar_Obra(var Obras:Archivo_Obras);
Procedure MModificar_Artista(var Artistas:Archivo_Artistas);
procedure MModificar_Museo(var Museos:Archivo_Museos);
Procedure MModificar_Director(var Directores:Archivo_Directores);

Procedure Segun_Obra_Mostrar_Artista_Museo (var Obras:Archivo_Obras);
Procedure Segun_Museo_Mostrar_Director_Obras (var Museos:Archivo_Museos;Var Obras:Archivo_Obras);
Procedure Segun_Artista_Mostrar_Obras (Var Obras:Archivo_Obras;Var Artistas:Archivo_Artistas);

{Procedure Menu_Estadisticas ();
Procedure Menu_Estadisticas ();
Procedure Menu_Estadisticas ();
Procedure Menu_Estadisticas ();}

///////////////////////////////////////

Implementation

Procedure Menu_Principal;
Begin
	Repeat
	 Menu_Principal_Graph();
	 Opc:=Readkey;
	Until ((Opc='1') or (Opc='2') or (Opc='3') or (Opc='4') or (Opc='0'));
	
	Case (Opc) of
	 '1':Menu_Cargar();
	 '2':Menu_Editar();
	 '3':Menu_Borrar();
	End;
Readkey;
Clrscr;
End;

Procedure Menu_Cargar;
Begin
	Repeat
	 Menu_Cargar_Graph;
	 Opc:=Readkey;
	Until ((Opc='1') or (Opc='2') or (Opc='3') or (Opc='4') or (Opc='0'));
	
	Case (Opc) of
	 '1':MCargar_OBR(Obras,Museos,Artistas);
	 '2':MCargar_ART (Artistas);
	 '3':MCargar_MUS(Museos,Directores);
	 '4':MCargar_Director(Directores);
	 '0':Menu_Principal;
	End;
Menu_Principal();
End;

Procedure Menu_Editar;
Begin
	Repeat
	 Menu_Editar_Graph;
	 Opc:=Readkey;
	Until ((Opc='1') or (Opc='2') or (Opc='3') or (Opc='4') or (Opc='0'));
	Case (Opc) of
	 '1':MModificar_Obra (Obras);
	 '2':MModificar_Artista (Artistas);
	 '3':MModificar_Museo (Museos);
	 '4':MModificar_Director (Directores);
	 '0':Menu_Principal;
	End;
Menu_Principal;
End;

Procedure Menu_Borrar;
Begin
	Repeat
	 Menu_Borrar_Graph;
	 Opc:=Readkey;
	Until ((Opc='1') or (Opc='2') or (Opc='3') or (Opc='4') or (Opc='0'));
	Case (Opc) of
	 '1':MBajar_obr (Obras);
	 '2':MBajar_Art (Artistas);
	 '3':MBajar_Mus (Museos);
	 '4':MBajar_Dir (Directores);
	 '0':Menu_Principal;
	End;
Menu_Principal;
End;

Procedure Menu_Estadisticas;
Begin
	Repeat
	 Menu_Estadisticas_Graph;
	 Opc:=Readkey;
	Until ((Opc='1') or (Opc='2') or (Opc='3') or (Opc='4') or (Opc='0') or (Opc='5'));
	Case (Opc) of
	 {'1':MModificar_Obra (Obras);
	 '2':MModificar_Artista (Artistas);
	 '3':MModificar_Museo (Museos);
	 '4':MModificar_Director (Directores);
	 '5':}
	 '0':Menu_Principal;
	End;
Menu_Principal;
End;

Procedure MCargar_OBR( var Obras:Archivo_Obras;var Museos:Archivo_Museos;Var Artistas:Archivo_Artistas);
var
	obr:Obra;
	Pos, Pos2, Pos3:Integer; 
	Busc, Busc2, Busc3, B:Longint;
	Mus:Museo;
	Artist:Artista;
	Aux:String;

Begin
Menu_Cargar_Obra_Part1;
TextColor(Green);
Gotoxy (33,5);
X:=(33);
Y:=(5);
Readln (N1);
Validacion_Integer(N1,B,X,Y);
Busc:=B; //En el buscado se guarda el codigo de la  Obra que ingresa el usuario.

AbrirO (Obras);
Buscar_Obras(Obras,pos,Busc,obr); //la busqueda tiene que devolver si la obra existe (T/F) en el archivo, si no existe se agrega a la lista y se la ordena
If (Pos=-1) then // esto es si no lo encontro.
	Begin
	 obr.Codigo_Obra:=Busc;
	 Menu_Cargar_Obra_Part2;
	 
	 TextColor(Green);
	 Gotoxy(35,7);
	 Read(obr.Material);
	 
	 Readkey;
	 
	 TextColor(Green);
	 Gotoxy(31,9);
	 Read(N1);
	 X:=(31);
	 Y:=(9);
	 Validacion_Integer2(N1,B,X,Y);
	 obr.Anio:=B;

	 TextColor(Green);
	 Gotoxy(28,11);
	 Read(obr.Tipo);
	
	 TextColor(Green);
	 Gotoxy(30,13);
	 Read(obr.Estilo);
	
	 TextColor(Green);
	 Gotoxy(36,15);
	 X:=(36);
	 Y:=(15);
	 Read(N1);
	 Validacion_Integer(N1,B,X,Y);
	 obr.Peso:=B;
	
	 TextColor(Green);
	 Gotoxy(39,17);
	 X:=(39);
	 Y:=(17);
	 Read(N1);
	 Validacion_Integer(N1,B,X,Y);
	 obr.Altura:=B;
	

	 TextColor(Green);
	 Gotoxy(37,19);
	 Read(obr.Completo);
	
	 TextColor(Green);
	 Gotoxy(34,21);
	 X:=(34);
	 Y:=(21);
	 Read(N1);
	 Validacion_Integer(N1,B,X,Y);
	 obr.partes:=B;


	 TextColor(Green);
	 Window(3,24,60,26);
	 Gotoxy(27,23);
	 X:=(27);
	 Y:=(23);
	 Read(obr.Descripcion);
	 Window(1,1,120,35);
	

	 TextColor(Green);
	 Gotoxy(31,28);
	 X:=(31);
	 Y:=(28);
	 Read(N1); // aca leemos el DNI del Artista
	 Validacion_Integer(N1,B,X,Y);
	 Busc2:=B;
	
	 TextColor(Green);
	 Gotoxy(32,30);
	 X:=(32);
	 Y:=(30);
	 Read(N1); // aca leemos el codigo Museo
	 Validacion_Integer(N1,B,X,Y);
	 Busc3:=B;
	 
	 obr.activo:=true;
	 GuardarO(Obras,obr);
	 CerrarO(Obras);
	 
	 AbrirA(Artistas);//Entro al Archivo Artista y busco si exite para poder cargarlo en la Obra (xq estoy cargando la Obra).
	 pos2:=-1;
	 Buscar_Artista(Artistas,pos2,Busc2,Artist); // La Variable Pos2,Busc2, Direct2... representa a la Variable pos,buscado y direct dentro del procedure buscar_director.
	 CerrarA(Artistas);
	 
	 If (pos2=-1) then // esto pregunta solo si el Artista existe, si no existe lo cargo de la siguiente forma. 
		Begin
		 Aviso_Artista_Inexistente;
		 Readkey;
		 MCargar_ART(Artistas);
		End;
		
	 AbrirM(Museos);//Entro al Archivo Museos y busco si exite para poder cargarlo en la Obra (xq estoy cargando la Obra).
	 pos3:=-1;
	 Buscar_Museo (Museos,pos3,Busc3,Mus); // La Variable Pos3,Busc3, Mus... representa a la Variable pos,buscado y mus dentro del procedure buscar_Museo.
	 CerrarM(Museos);
	 
	 If (pos3=-1) then // esto pregunta solo si el Museo existe, Entonces cargo el Museo de la siguiente forma. 
		Begin
		 Aviso_Museo_Inexistente;
		 Readkey;
		 MCargar_MUS(Museos,Directores);
        End;
	
	End
	Else
	 Aviso_Dato_Existente();
	 CerrarO(Obras);
	 Menu_Cargar();
	
Aviso_Carga_Exitosa();
End;

Procedure MCargar_ART(var Artistas:Archivo_Artistas);
var
	Pos:integer;
	Artist:Artista;

Begin
Pos:=-1;
Menu_Cargar_Artista_Part1();
TextColor (Green);
Gotoxy (31,6); Readln (Busc);

AbrirA (Artistas);
Buscar_Artista (Artistas,Pos,Busc,Artist); //la busqueda tiene que devolver si el artista existe (T/F) en el archivo, si no existe se agrega a la lista y se la ordena
If (Pos=-1) then
	Begin
	 Menu_Cargar_Artista_Part2;
	 Artist.DNI:=Busc;
	 Artist.Activo:=True;
	 TextColor(Green);
	 Gotoxy (34,8); Readln (Artist.Nombre);
	 Gotoxy (37,10); Readln (Artist.Direccion);
	 Gotoxy (35,12); Readln (Artist.Fecha_Nacimiento);
	 
	 GuardarA (Artistas,Artist);
	 CerrarA (Artistas);
	 Aviso_Carga_Exitosa();
	End
		Else
		Begin
		 Aviso_Dato_Existente();
		 CerrarA (Artistas);
		End;
End;


Procedure MCargar_Director(var Directores:Archivo_Directores);// Estas son las altas
var
	pos:Integer;
	Direct:Director;

Begin
Menu_Cargar_Director_Part1;
TextColor (Green);
Gotoxy (32,6); Readln(Busc);
AbrirD (Directores);
Buscar_Director (Directores,pos,Busc,Direct); //la busqueda tiene que devolver si el museo existe (T/F) en el archivo, si no existe se agrega a la lista y se la ordena
If (pos=-1) then
	Begin
	 Direct.DNI:=Busc;
	 Menu_Cargar_Director_Part2;
	 TextColor (Green);
	 Gotoxy (34,8); Readln (Direct.ApyNom);
	 Gotoxy (37,10); Readln (Direct.Direccion);
	 Gotoxy (36,14); Readln (Direct.Periodo_Asignacion_Inic);
	 Gotoxy (32,16); Readln (Direct.Periodo_Asignacion_Fin);
	 Gotoxy (27,18); Readln (Direct.Telefono);
	 Direct.Activo:=True;
	 GuardarD(Directores,Direct);
	 Aviso_Carga_Exitosa();
	End
		Else
		Begin
		 Aviso_Dato_Existente();
		End;
CerrarD (Directores);
End;

Procedure MCargar_MUS(var Museos:Archivo_Museos; Var Directores:Archivo_Directores); //esto permite declarar los archivos a los cuales se puede acceder en este procedimiento que son Director y Museo.
var
	pos, Pos2, Busc, Busc2 :integer;
	Mus:Museo;
	Direct2:Director;

Begin
Menu_Cargar_Museo_Part1;
TextColor (Green);
Gotoxy (31,6); Readln(Busc); //en el buscado se buscado se guarda el codigo del museo que ingresa el usuario.
AbrirM (Museos);
Buscar_Museo (Museos,pos,Busc,Mus); //la busqueda tiene que devolver si el museo existe (T/F) en el archivo, si no existe se agrega a la lista y se la ordena
If (pos=-1) then // esto es si no lo encontro.
	begin
	 Menu_Cargar_Museo_Part2;
	 TextColor (Green);
	 Mus.Codigo:=Busc;
	 Gotoxy (32,8); Readln (Mus.Nombre);
	 Gotoxy (31,10); Readln (Mus.Calle);
	 Gotoxy (30,12); Readln (Mus.Pais);
	 Gotoxy (24,14); Readln (Mus.Telefono);
	 Gotoxy (32,16); Readln (Busc2); // aca leemos el DNI del Director
	 Mus.Director:=Busc2;
	 Mus.activo:=true;
	 GuardarM (Museos,Mus);
	 CerrarM (Museos);
	 Aviso_Carga_Exitosa();
	 
	 AbrirD (Directores);//Entro al Archivo Directores
	 Buscar_Director (Directores,Pos2,Busc2,Direct2); // Busco si el Director relacionado a este museo que estoy cargndo Existe en el Archivo de Directores.
	 CerrarD(Directores);
	 If (Pos2=-1) Then // Si el Director no existe lo cargo, sino solo se le asigna el director al museo que cargo
		Begin
		 Aviso_Director_Inexistente;
		 MCargar_Director(Directores);
		End;		
	End
		Else
		Begin
		 Aviso_Dato_Existente();
		 CerrarM(Museos);
		 Menu_Cargar();
		End;
End;

Procedure MBajar_Art(var Artistas:Archivo_Artistas);//Estas son las bajas
Var 
	Bus:integer;
    Pos:integer;
    artist:Artista;

Begin
Menu_Baja_Artista;
Gotoxy (84,2); Readln(Bus);
AbrirA(Artistas);
Buscar_Artista(Artistas,Pos,Bus,artist);
If (Pos<>-1) then
    Begin
     LeerA(Artistas,artist,Pos);//llamar a la funcion leer de la unit Artista (controlar si los parametros estan bien puestos)
     If (artist.Activo=True) then
        Begin
         artist.Activo:=False;
         ModificarA(Artistas,artist,pos);//llamar a la funcion modificar de la unit Artista (controlar si los parametros estan bien puestos)
         Aviso_Eliminacion_Exitosa();
        End;
	End
		Else
		Begin
		 Menu_Baja_Artista_Inexistente;
		 Gotoxy (51,20); Write (Bus);	
		End;
CerrarA(Artistas);
Clrscr;
Menu_Borrar();
End;

Procedure MBajar_Dir(var Directores:Archivo_Directores);
Var
	Bus:integer;
    Pos:integer;
    direct:Director;

Begin
Menu_Baja_Director;
Gotoxy (55,2); Readln(Bus);Readln(Bus);
AbrirD(Directores);
Buscar_Director(Directores,Pos,Bus,direct);
If (Pos<>-1) then
	Begin
     LeerD(Directores,direct,Pos);//llamar a la funcion leer de la unit Artista (controlar si los parametros estan bien puestos)
     If (direct.Activo=True) then
		Begin
         direct.Activo:=False;
         ModificarD(Directores,direct,pos);//llamar a la funcion modificar de la unit Director (ahora si esta bien)
		 Aviso_Eliminacion_Exitosa();
		End;
	End
		Else
		Begin
		 Menu_Baja_Director_Inexistente;
		 Gotoxy (29,11); Write (Bus);	
		End;
CerrarD(Directores);
Clrscr;
Menu_Borrar();
End;

Procedure MBajar_Mus(var Museos:Archivo_Museos);//Estas son las bajas
Var
	Bus:integer;
    Pos:integer;
    Mus:Museo;

Begin
Menu_Baja_Museo;
Gotoxy (85,2); Readln(Bus);
AbrirM(Museos);
Buscar_Museo(Museos,Pos,Bus,Mus);
If (Pos<>-1) then
	Begin
     LeerM(Museos,Mus,Pos);//llamar a la funcion leer de la unit Museos (controlar si los parametros estan bien puestos)
     If (Mus.Activo=True) then
        Begin
         Mus.Activo:=False;
         ModificarM(Museos,mus,pos);//llamar a la funcion modificar de la unit Artista (controlar si los parametros estan bien puestos)
		 Aviso_Eliminacion_Exitosa();
        End;
    End
		Else
		Begin
		 Menu_Baja_Museo_Inexistente;
		 Gotoxy (65,11); Write (Bus);
		End;
CerrarM(Museos);
Clrscr;
Menu_Borrar();
End;

Procedure MBajar_obr(var Obras:Archivo_Obras);//Estas son las bajas
Var 
	Bus:integer;
    Pos:integer;
    Obr:Obra;
    
Begin
Menu_Baja_Obra;
TextColor (Green);
Gotoxy (85,2); Readln(Bus);
AbrirO(Obras);
Buscar_Obras(Obras,Pos,Bus,Obr);
If (Pos<>-1) then
    Begin
     LeerO(Obras,Obr,Pos);//llamar a la funcion leer de la unit Obras (controlar si los parametros estan bien puestos)
     If (Obr.Activo=True) then
		Begin
		 Obr.Activo:=False;
		 ModificarO(Obras,obr,pos);//llamar a la funcion modificar de la unit Obra (ahora si esta bien)
		 Aviso_Eliminacion_Exitosa();
		End;
	End
		Else
		Begin
		 Menu_Baja_Obra_Inexistente;
		 Gotoxy (65,11); Write (Bus);
		End;
CerrarO(Obras);
Clrscr;
Menu_Borrar();
End;

Procedure MModificar_Artista(var Artistas:Archivo_Artistas);
Var 
	Bus:integer;
	Pos:integer;
	artist:Artista;
	Opc:char;
	
Begin
Menu_Editar_Artista_Part1;
Gotoxy (24,4); Readln(Bus);
AbrirA(Artistas);
Buscar_Artista(Artistas,Pos,Bus,artist);
If (Pos<>-1) then
	Begin
     LeerA(Artistas,artist,Pos);//Aca llamo al Procedure leer de la unit Artista (controlar si los parametros estan bien puestos)
     If (artist.Activo=True) then
		Begin
		 Dato_Encontrado_Artista;
			Repeat// el Repeat y el Until se utiliza para mostrar los datos de aca abajo hasta que se apriete una de las opciones (1,2,3,a)
             Menu_Editar_Artista_Part2;
             TextColor(Green);
             Gotoxy (8,4); Writeln (artist.DNI);
             Gotoxy (11,6); Writeln (artist.Nombre);
             Gotoxy (14,8); Writeln (artist.Direccion);
             Gotoxy (24,10); Writeln (artist.Fecha_Nacimiento);
             Opc:=Readkey;
             TextColor(Blue);
				Case Opc of
                   '1':	Begin
						 Write ('D.N.I.: ');
						 TextColor(Blue);
						 Readln(artist.DNI);
                         ModificarA(Artistas,artist,pos);//llamar a la funcion modificar de la unit Artista (controlar si los parametros estan bien puestos)
                         Aviso_Edicion_Exitosa();
                        End;
                     
                    '2':Begin
                         Write ('Nombre: ');
                         TextColor(Blue);
                         Readln(artist.Nombre);
                         ModificarA(Artistas,artist,pos);//llamar a la funcion modificar de la unit Artista (controlar si los parametros estan bien puestos)
                         Aviso_Edicion_Exitosa();
                        End;
                     
                    '3':Begin
                         Write ('Direccion: ');
                         TextColor(Blue);
                         Readln(artist.Direccion);
                         ModificarA(Artistas,artist,pos);//llamar a la funcion modificar de la unit Artista (controlar si los parametros estan bien puestos)
                         Aviso_Edicion_Exitosa();
                        End;
                    '4':Begin
						 Write ('Fecha de Nacimiento: ');
						 TextColor(Blue); 
						 Readln(artist.Fecha_Nacimiento);
						 ModificarA(Artistas,artist,pos);
						 Aviso_Edicion_Exitosa();
						End;
                End;
            Until (Opc='0');
         Aviso_Edicion_Exitosa;
        End;
    End
		Else
		Begin
		 Aviso_Dato_Inexistente;
		End;
CerrarA(Artistas);
End;

Procedure MModificar_Museo(var Museos:Archivo_Museos);
Var 
	Bus, Pos:integer;
	mus:Museo;
	Opc:char;

Begin
Menu_Editar_Museo_Part1;
Gotoxy (24,4); Read(Bus);
AbrirM(Museos);
Buscar_Museo(Museos,Pos,Bus,mus);
If (Pos<>-1) then
	Begin
     LeerM(Museos,mus,Pos);//Aca llamo al Procedure leer de la unit Museos (controlar si los parametros estan bien puestos)
     If(mus.Activo=True) then
		Begin
		 Dato_Encontrado_Museo;
            Repeat// el Repeat y el Until se utiliza para mostrar los datos de aca abajo hasta que el usuario seleccione una de las opciones (1,2,3,a)
             Menu_Editar_Museo_Part2;
             TextColor(Green);
             Gotoxy(11,4); Writeln (mus.Codigo); 
             Gotoxy(11,6); Writeln (mus.Nombre); 
             Gotoxy(13,8); Writeln (mus.Director);
             Gotoxy(24,10); Writeln (mus.DNI);  
             Gotoxy(10,12); Writeln (mus.Calle); 
             Gotoxy(11,14); Writeln (mus.Ciudad); 
             Gotoxy(9,16); Writeln (mus.Pais); 
             Gotoxy(13,18); Writeln (mus.Telefono);
             Opc:=Readkey;
             Clrscr;
				Case Opc of
				'1':Begin
                     Cuadro_Edicion();
                     Writeln('D.N.I del Director del Museo ', mus.Nombre);
                     Readln(mus.DNI);
                     ModificarM(Museos,mus,pos);//llamar a la funcion modificar de la unit Museos (controlar si los parametros estan bien puestos)
                     Window(1,1,120,80)
                    End;
                    
                '2':Begin
                     Cuadro_Edicion();
                     Gotoxy (1,1);Writeln('Nombre del Museo: ');
                     Readln(mus.Nombre);
                     ModificarM(Museos,mus,pos);//llamar a la funcion modificar de la unit Museos (controlar si los parametros estan bien puestos)
                     Window(1,1,120,80)
                    End;
                    
                '3':Begin
                     Cuadro_Edicion();
                     Writeln('Telefono del Museo ',mus.Nombre);
                     Readln(mus.Telefono);
                     ModificarM(Museos,mus,pos);//llamar a la funcion modificar de la unit Muesos (controlar si los parametros estan bien puestos)
                     Window(1,1,120,80)
                    End;
                    
                '4':Begin
					 Cuadro_Edicion();
					 Writeln('Direccion del Museo ',mus.Nombre);
					 Readln(mus.Calle);
					 ModificarM(Museos,mus,pos);// ""   "" ""   ""      ""      ""  ""       ""      ""       ""  ""    ""        ""  ""     ""
					 Window(1,1,120,80)
					End;
					
				'5':Begin
					 Cuadro_Edicion();
					 Writeln('Pais en el que se encuentra el Museo ',mus.Nombre);
					 Readln(mus.Pais);
					 ModificarM(Museos,mus,pos);//  ""    ""     ""       ""      ""  ""     ""       ""       ""  ""     ""       ""   ""     ""
					 Window(1,1,120,80)
					End;
					
				'6':Begin
					 Cuadro_Edicion();
					 Writeln('Ciudad en la que se encuentra el Museo ',mus.Nombre);
					 Readln(mus.Ciudad);
					 ModificarM(Museos,mus,pos);//  ""     ""     ""       ""    ""    ""      ""      ""      ""   ""    ""       ""    ""     ""
					 Window(1,1,120,80)
					End; 
                End;
            Until (Opc='0');
         Aviso_Edicion_Exitosa();
        End;
	End
	Else
	 Aviso_Dato_Inexistente();
CerrarM(Museos);
Menu_Editar();
End;

Procedure MModificar_Director(var Directores:Archivo_Directores);
Var 
	Bus:integer;
	Pos:integer;
	direct:Director;
	Opc,Opc2:char;

Begin
Menu_Editar_Director_Part1();
TextColor(Green);
Gotoxy(3,2);Writeln(' INGRESE EL D.N.I. DEL DIRECTOR QUE DESEA MODIFICAR! ');
Gotoxy(25,4); Readln(Bus);
AbrirD(Directores);
Buscar_Director(Directores,Pos,Bus,direct);
	If (Pos<>-1) then
	Begin
     LeerD(Directores,direct,Pos);//Aca llamo al Procedure leer de la unit Directores (controlar si los parametros estan bien puestos)
     If (direct.Activo=True) then
		Begin
		     Dato_Encontrado_Director;
			Repeat // el Repeat y el Until se utiliza para mostrar los datos de aca abajo hasta que el usuario seleccione una de las opciones (1,2,3,a)
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
			 TextColor(Green);
			 Gotoxy (11,4); Writeln (direct.APyNom);
			 Gotoxy (11,6); Writeln (direct.DNI);
			 Gotoxy (14,8); Writeln (direct.Direccion);
			 Gotoxy (13,11); Writeln (direct.Periodo_Asignacion_Inic);
			 Gotoxy (43,11); Writeln (direct.Periodo_Asignacion_Fin);
			 Gotoxy (25,13); Writeln (direct.Telefono);
			 
			 TextColor(Blue);
			 Gotoxy (1,17);
             Writeln ('|\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
             Write ('|         ');TextColor (Green); Write('ELIJA EL CAMPO QUE DESEA MODIFICAR'); TextColor (Blue); Writeln('         \\');
             Writeln ('|----------------------------------------------------\\');
             Write ('|          '); TextColor (Green); Write('--> 1- Periodo Asignacion');TextColor (Blue); Writeln('                 \\');
             Write ('|          '); TextColor (Green); Write('--> 2- Nombre');TextColor (Blue); Writeln('                             \\');
             Write ('|          '); TextColor (Green); Write('--> 3- Direccion');TextColor (Blue); Writeln('                          \\');
             Write ('|          '); TextColor (Green); Write('--> 4- Telefono');TextColor (Blue); Writeln('                           \\');
             Writeln ('|----------------------------------------------------\\');
             Write ('|          ');TextColor (Green); Write('--> 0- Salir <--'); TextColor (Blue); Writeln('                          \\');
             Writeln ('|----------------------------------------------------\\');
             Opc:=readkey;
				
				Case Opc of
                '1':Begin
					 Gotoxy (56,19); Writeln ('|\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
					 Gotoxy (56,20); Write ('|           ');TextColor (Green); Write('ELIJA LA FECHA PARA MODIFICAR'); TextColor (Blue); Writeln('           \\');
					 Gotoxy (56,21); Writeln ('|---------------------------------------------------\\');
					 Gotoxy (56,22); Write ('|   '); TextColor (Green); Write('--> 1- Inicio del Periodo de Asignacion');TextColor (Blue); Writeln('         \\');
					 Gotoxy (56,23); Write ('|   '); TextColor (Green); Write('--> 2- Fin del Periodo de Asignacion');TextColor (Blue); Writeln('            \\');
					 Gotoxy (56,24); Writeln ('|---------------------------------------------------\\');
					 Gotoxy (56,25); Opc2:=Readkey; Writeln ('|                                                   \\');
					 Gotoxy (56,26); Writeln (' \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
					 
					 	Case Opc2 of
						'1':Begin
							 TextColor(Blue);
							 Gotoxy (57,25); Write ('Escriba la Fecha de Inicio del Periodo:');
							 TextColor(Green);
							 Readln(direct.Periodo_Asignacion_Inic);
							 ModificarD(Directores,direct,pos);//llamar a la funcion modificar de la unit Directores (controlar si los parametros estan bien puestos)
							 Aviso_Edicion_Exitosa();
							End;
						
						'2':Begin
							 TextColor(Blue);
							 Gotoxy (57,25); Write ('Escriba la Fecha Final del Periodo:');
							 TextColor(Green);
							 Readln(direct.Periodo_Asignacion_Fin);
							 ModificarD(Directores,direct,pos);
							 Aviso_Edicion_Exitosa();
							End;
						End;
                    End;
                '2':Begin
					 TextColor(Blue);
                     Write('Escriba el Nombre del Director: ');
                     TextColor(Green);
                     Readln(direct.APyNom);
                     ModificarD(Directores,direct,pos);//llamar a la funcion modificar de la unit Directores (controlar si los parametros estan bien puestos)
                     Aviso_Edicion_Exitosa();
                    End;
				'3':Begin
					 TextColor(Blue);
					 Write('Escriba la Direccion del Director: ');
					 TextColor(Green);
					 Readln(direct.Direccion);
					 ModificarD(Directores,direct,pos);//llamar a la funcion modificar de la unit Directores (controlar si los parametros estan bien puestos)
					 Aviso_Edicion_Exitosa();
					End;
				'4':Begin
					 TextColor(Blue);
					 Write('Escriba el Numero de Telefono del Director: ');
					 TextColor(Green);
					 Readln(direct.Telefono);
					 ModificarD(directores,direct,pos);// ""   "" ""   ""      ""      ""  ""       ""      ""       ""  ""    ""        ""  ""     ""
					 Aviso_Edicion_Exitosa();
					End;  
                End;
            Until (Opc='0');
        End;
    End
    Else
     Aviso_Dato_Inexistente();
	 CerrarD(Directores);
	 Menu_Editar();
CerrarD(Directores);
Menu_Editar();
End;

Procedure MModificar_Obra(var Obras:Archivo_Obras);
Var 
	Bus:integer;
	Pos:integer;
	obr:Obra;
	Opc:char;

Begin
Clrscr;
Writeln ('/////////////////////////////////////////////////////////'); 
Writeln ('///                                                   ///');
Writeln ('/////////////////////////////////////////////////////////');
Writeln ('/////////////////////              //////////////////////');
Writeln ('/////////////////////////////////////////////////////////');
Gotoxy (5,2); Writeln('Ingrese el Codigo de la Obra que desea modificar:');
TextColor(Green);
Gotoxy (24,4); Readln(Bus);
AbrirO(Obras);
Buscar_Obras(Obras,Pos,Bus,obr);
If (Pos<>-1) then
	Begin
     LeerO(Obras,obr,Pos);//Aca llamo al Procedure leer de la unit Obras (controlar si los parametros estan bien puestos)
     If (obr.Activo=True) then
		Begin
		 Dato_Encontrado_Obra;
		 Repeat// el Repeat y el Until se utiliza para mostrar los datos de aca abajo hasta que el usuario seleccione una de las opciones (1,2,3,4,5,6,7,8,a)
			TextColor(Blue);
			 Writeln ('|\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
			 Write ('|                     ');TextColor (Green); Write('DATOS ENCONTRADOS'); TextColor (Blue); Writeln('                            \\');
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
			 Writeln ('|------------------------------------------------------------------\\');
			 Writeln ('| Codigos                                                          \\');
			 Writeln ('|   Obra:                        | Museo:                          \\');
			 Writeln ('|------------------------------------------------------------------\\');
			 TextColor(Green);
			 Gotoxy (12,4); Writeln (obr.Artista);
			 Gotoxy (9,6); Writeln (obr.Peso:4:2);
			 Gotoxy (29,6); Writeln (obr.Altura);
			 Gotoxy (51,6); Writeln (obr.Completo);
			 Gotoxy (63,6); Writeln (obr.Partes);
			 Gotoxy (9,8); Writeln (obr.Tipo);
			 Gotoxy (13,10); Writeln (obr.Material);
			 Gotoxy (11,12); Writeln (obr.Estilo);
			 Gotoxy (9,14); Writeln (obr.Anio);
			 Window (16,16,67,17);
			 Gotoxy (16,16); Write (obr.Descripcion);
			 Window (1,1,120,35);
			 Gotoxy (11,20); Writeln (obr.Codigo_Obra);
			 Gotoxy (43,20); Writeln (obr.Codigo_Museo);
			 Gotoxy(71,8); Writeln ('\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
             Gotoxy(71,9); Writeln ('|  ELIJA EL CAMPO QUE DESEA MODIFICAR  \\');
             Gotoxy(71,10); Writeln ('|--> 1- Descripcion                    \\');
             Gotoxy(71,11); Writeln ('|--> 2- Tipo                           \\');
             Gotoxy(71,12); Writeln ('|--> 3- Material                       \\');
             Gotoxy(71,13); Writeln ('|--> 4- Estilo                         \\');
             Gotoxy(71,14); Writeln ('|--> 5- Altura                         \\');
             Gotoxy(71,15); Writeln ('|--> 6- Peso                           \\');
             Gotoxy(71,16); Writeln ('|--> 7- Completo                       \\');
             Gotoxy(71,17); Writeln ('|--> 8- Partes                         \\');
             Gotoxy(71,18); Writeln ('|--------------------------------------\\');
             Gotoxy(71,19); Writeln ('|--> 0- Salir                          \\');
             Gotoxy(71,20); Writeln ('|--------------------------------------\\');
             Gotoxy(71,21); Writeln (' \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\');
             Opc:=readkey;

				Case Opc of
                    '1':Begin
						 Writeln('Descripcion: ');
                         Readln(obr.Descripcion);
                         ModificarO(Obras,obr,pos);//llamar a la funcion modificar de la unit Obras (controlar si los parametros estan bien puestos)
                        End;
                     
                    '2':Begin
                         Writeln('Tipo: ');
                         Readln(obr.Tipo);
                         ModificarO(Obras,obr,pos);//llamar a la funcion modificar de la unit Obras (controlar si los parametros estan bien puestos)
                        End;
                    '3':Begin
						 Writeln('Material: ');
						 Readln(obr.Material);
						 ModificarO(Obras,obr,pos);// ""   "" ""   ""      ""      ""  ""       ""      ""       ""  ""    ""        ""  ""     ""
						End;
						
					'4':Begin
					     Writeln('Estilo: ');
					     Readln(obr.Estilo);
					     ModificarO(Obras,obr,pos);//  ""    ""     ""       ""      ""  ""     ""       ""       ""  ""     ""       ""   ""     ""
					    End;
					    
					'5':Begin
					     Writeln('Altura: ');
					     Readln(obr.Altura);
					     ModificarO(Obras,obr,pos);//  ""     ""     ""       ""    ""    ""      ""      ""      ""   ""    ""       ""    ""     ""
					    End; 
					       
					'6' :Begin
						 Writeln('Peso: ');
						 Readln(obr.Peso);
						 ModificarO(Obras,obr,pos);
						End;
						
					'7':Begin Writeln('Completo: ');
						 Readln(obr.Peso);
						 ModificarO(Obras,obr,pos);
						End;
				End;
			Until (Opc='0');
		End;
	End
	Else 
	 Aviso_Dato_Inexistente();
	 CerrarO(Obras);
	 Menu_Editar();
	 
CerrarO(Obras);
Menu_Editar();
End;

Procedure Segun_Obra_Mostrar_Artista_Museo(var Obras:Archivo_Obras);
var
Buscado:Integer;
pos:Integer;
obr:Obra;
Begin
	pos:=-1;
	Writeln('Ingrese el Codigo de la Obra: ');
	readln(Buscado);
	AbrirO(Obras);
	Buscar_Obras(Obras,pos,Buscado,obr);
	if pos<>-1 then
	Begin
		LeerO(Obras,obr,pos);
		Writeln('El Artista de la Obra ',Buscado,' es: ',obr.Artista);
		Writeln('El Codigo del Museo de la Obra ',Buscado,' es: ',obr.Codigo_Museo);
	End;
CerrarO(Obras);
End;

Procedure Segun_Museo_Mostrar_Director_Obras(var Museos:Archivo_Museos;Var Obras:Archivo_Obras);
var
Buscado:Integer;
pos:Integer;
Mus:Museo;//El Record se llama Museo y el Archivo Museos,
obr:Obra;
Begin
	pos:=-1;
	Writeln('Ingrese el Codigo del Museo: ');
	readln(Buscado);
	AbrirM(Museos);
	Buscar_Museo(Museos,pos,Buscado,Mus);
	if pos<>-1 then //con la posicion -1 digo que el Museo Existe
	Begin
		LeerM(Museos,Mus,pos);
		Writeln('El Director del Museo',Buscado,' es:',Mus.Director);
		AbrirO (Obras);
		Writeln('Las Obras del Museo son:');
		Buscar_Museo_en_Obras(Obras,Buscado,obr);
	End;
CerrarM(Museos);
CerrarO(Obras);
End;

Procedure Segun_Artista_Mostrar_Obras(Var Obras:Archivo_Obras;Var Artistas:Archivo_Artistas);
var
Buscado,pos:Integer;
Obr:Obra;////El Record se llama Obr y el Archivo Obras.
art:Artista;
Begin
	pos:=-1;
	Writeln('Ingrese el DNI del Artista para ver sus Obras: ');
	Readln(Buscado);
	AbrirA(Artistas);
	Buscar_Artista(Artistas,pos,Buscado,art);
	If pos<>-1 then // con la posicion -1 digo que el Artista Existe.
	Begin
	 AbrirO(Obras);
	 Writeln('Las Obras del Artista son: ');
	 Buscar_Artista_en_Obras(Obras,Buscado,Obr);
	End;
CerrarO(Obras);
CerrarA(Artistas);
End; 

{Procedure Menu_Estadisticas(Obras:Archivo_Obras; buscado:String; var total:Integer);
var 
	ac1,ac2:Integer;
	obr:Obras;

Begin
	Repeat
	 Writeln ('Elija una opcion');
	 Writeln ('1- Estadistica por Museo');
	 Writeln ('2- Estadistica por Artista');
	 Writeln ('3- Estadistica por ');
	 Clrscr;
	 ac1:=0;
	 ac2:=0;
		repeat
		 inc(ac1);
			If(obr.tipo=buscado) then
			Begin
			 inc(ac2);
			 inc(ac1);
			End;
		until (ac1:=filesize);
	 Until (nocquevaak!!! :V)
End;}

BEGIN
END.
