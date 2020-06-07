Unit ARCHMUS;
Interface //Parte Publica
Uses Crt;
	
Type
Museo = Record
	 Codigo, Telefono : Int64;
	 Nombre, Calle, Ciudad, Pais, Name_Director : String;
	 Activo : Boolean;
	End;
T_vec_mus = array [1..9] of Museo;
Archivo_Museos = File of Museo;

Var
	Museos:Archivo_Museos;
	Mus:Museo;

//METODOS DE APERTURA, LECTURA, MODIFICACION, GUARDADO Y CIERRE
Procedure AbrirM( var Museos:Archivo_Museos);
Procedure LeerM (var Museos:Archivo_Museos; var Mus:Museo; Pos:Integer);
Procedure ModificarM (var Museos:Archivo_Museos; var Mus:Museo; Pos:integer);
Procedure GuardarM (Var Museos:Archivo_Museos; Var Mus:Museo);
Procedure CerrarM (var Museos:Archivo_Museos);

//METODOS DE BUSQUEDA Y ORDENAMIENTO
Procedure burbujaM(var Museos:Archivo_Museos);
Procedure Buscar_Museo_Codigo (var Museos:Archivo_Museos; var pos:int64; codigo_buscado:int64; var Mus:Museo);
Procedure Buscar_Museo_Nombre (var Museos:Archivo_Museos;var pos:int64; Nombre:String; var Mus:Museo);

//METODO DE PRUEBAS
Procedure Barrido_Mus(var Museos:Archivo_Museos);

Implementation //Parte Privada

{APERTURA, LECTURA, MODIFICACION, GUARDADO Y CIERRE
}

Procedure AbrirM(var Museos : Archivo_Museos);
Begin
 Assign(Museos,'X:\ARCHMUS.dat');
 Reset(Museos);
 If (ioresult <> 0) then
	Begin
	 Rewrite(Museos);
	End;
End;

Procedure LeerM(var Museos:Archivo_Museos; var Mus:Museo; Pos:Integer);
Begin
 Seek(Museos,Pos);
 Read(Museos,Mus);
End;

Procedure ModificarM(var Museos:Archivo_Museos; var Mus:Museo; Pos:Integer);
Begin
 Seek(Museos,Pos);
 Write(Museos,Mus);
End;

Procedure GuardarM (Var Museos:Archivo_Museos; Var Mus:Museo);
Begin
 Seek(Museos,Filesize(Museos));
 Write(Museos,Mus);
End;

Procedure CerrarM (Var Museos:Archivo_Museos);
Begin
 Close(Museos);
End;

Procedure burbujaM(var Museos:Archivo_Museos); //BURBUJA MEJORADO PARA ARCHIVOS
var
	L, i : LongInt;
	orden : boolean;
	RegA, RegB, RegAux : Museo;
begin
  i := 1;
  AbrirM(Museos);
  L := FileSize(Museos);
  if (L=1) then // si el archivo tiene menos de 2 registros no se ordena
	begin
  	  orden := false;
	  while not(orden)do begin //mientras no este ordenado 
		 orden:=true;
		 for i := 0 to (L-1) do begin // Ciclo de i y el adyascente
			 if not eof(Museos) then Begin
				 LeerM(Museos,RegA,i);  //Obtengo los parametros por los cuales quiero ordenar
				 LeerM(Museos,RegB,i+1);
				 if RegB.Nombre > RegA.Nombre then begin
					 orden:=false;
					 RegAux := RegB;
					 ModificarM(Museos,RegA,i+1);
					 ModificarM(Museos,RegAux,i);	
					end;
				End;
			end;
		end;
	end;
 CerrarM(Museos);
end;

Procedure Buscar_Museo_Codigo(var Museos:Archivo_Museos;var pos:int64; codigo_buscado:int64; var Mus:Museo);
var 
	posicion : int64;

Begin
 AbrirM(Museos); // Apertura del Archivo de Museos
 posicion:=0;
 pos:=-1;
 While (not eof (Museos)) and (pos=-1) do
	Begin
	 LeerM (Museos, Mus, posicion);
	 if (Mus.Codigo = codigo_buscado) then
		Begin
		 pos:=posicion;
		End;
	 inc(posicion);
	End;
 CerrarM(Museos); // Cierre del Archivo de Museos
End;


Procedure Buscar_Museo_Nombre(var Museos:Archivo_Museos; var pos:int64; Nombre:String; var Mus:Museo);
var
	posicion : int64;

Begin
 posicion := 0;
 pos := -1;
 AbrirM(Museos); // Apertura del Archivo de Museos
 While (not eof (Museos)) and (pos = -1) do
	Begin
	 LeerM(Museos, Mus, posicion);
	 If (Mus.Nombre = Nombre)then
		Begin
		 pos := posicion;
		End;
	 inc(posicion);
	End;
 CerrarM(Museos); // Cierre del Archivo de Museos
End;

{METODOS PARA PRUEBAS
* }

Procedure Barrido_Mus(var Museos:Archivo_Museos);
var
	Punt, Lim : int64;
	Registro : Museo;
	
Begin
clrscr;// borrar!
 Gotoxy(1,25);
 AbrirM(Museos); // apertura del archivo
 Lim := FileSize(Museos); // tamaño del archivo
 Punt := 0; //posicion en el archivo
 While (not eof) and (punt <> Lim) do begin
	 LeerM(Museos,Registro,Punt);
	 if Registro.Activo = True then
		Begin
		  Writeln(Registro.Nombre);
		End;
	 Punt:=(Punt+1);
	End;
 CerrarM(Museos);
End;


begin
end.
