Unit ARCHDIR;

Interface //Parte Publica
Uses Crt;

Type 
Director=Record
	 APyNom:String;
	 DNI:Int64;
	 Direccion:String;
	 Periodo_Asignacion_Inic:String;
	 Periodo_Asignacion_Fin:String;
	 Telefono:String[20];
	 Activo:boolean;
	End;

T_vec_dir=array [1..6] of Director;	
Archivo_Directores=File of Director;

Var 
	Directores:Archivo_Directores;
	Direct:Director;
	Pos:Integer;

//METODOS DE APERTURA, LECTURA, MODIFICACION, GUARDADO Y CIERRE
Procedure AbrirD(var Directores:Archivo_Directores);
Procedure LeerD(var Directores:Archivo_Directores; var Direct:Director; Pos:Integer);
Procedure ModificarD(var Directores:Archivo_Directores; var Direct:Director; Pos:Integer);
Procedure GuardarD(var Directores:Archivo_Directores; Direct:Director);
Procedure CerrarD(var Directores:Archivo_Directores);

//METODOS DE BUSQUEDA Y ORDENAMIENTO
Procedure burbuja_mejorado(var v:T_vec_dir; d:integer);
Procedure Buscar_Director(var Directores:Archivo_Directores; var pos:int64; buscado:String; var Direct:Director);

//METODO DE PRUEBAS
Procedure Barrido_Dir(var Directores:Archivo_Directores);

Implementation //Parte Privada

{APERTURA, LECTURA, MODIFICACION, GUARDADO Y CIERRE
}

Procedure AbrirD(Var Directores:Archivo_Directores);
Begin
 Assign(Directores,'X:\ARCHDIR.dat');
 Reset(Directores);
 If (ioresult <> 0) then
	Begin
	 ReWrite(Directores);
	End;
End;

Procedure LeerD(var Directores:Archivo_Directores; var Direct:Director; Pos:Integer);
Begin
 Seek(Directores,Pos);
 Read(Directores,Direct);
End;

Procedure ModificarD(var Directores:Archivo_Directores; var Direct:Director; Pos:Integer);
Begin
 Seek(Directores,Pos);
 Write(Directores,Direct);
End;

Procedure GuardarD(var Directores:Archivo_Directores; Direct:Director);
Begin
 Seek(Directores,FileSize(Directores));
 Write(Directores,Direct);
End;

Procedure CerrarD(Var Directores:Archivo_Directores);
Begin
 Close (Directores);
End;

{METODOS DE ORDENAMIENTO Y BUSQUEDA
* }

Procedure burbuja_mejoradoA(var Artistas:Archivo_Artistas); //BURBUJA MEJORADO PARA ARCHIVOS
var
	L, i : LongInt;
	orden : boolean;
	RegA, RegB, RegAux : Artista;
begin
  i := 0;
  AbrirA(Artistas);
  L := FileSize(Artistas);
  gotoxy(40,40);
  writeln (FileSize(Artistas));
  orden := false;
  readkey;
  while not(orden)do begin //mientras no este ordenado 
	 orden:=true;
	 for i := 0 to (L-1) do begin // Ciclo de i y el adyascente
		 if not eof(Artistas) then Begin
			 LeerA(Artistas,RegA,i);  //Obtengo los parametros por los cuales quiero ordenar
			 LeerA(Artistas,RegB,i+1);
			 if RegB.Nombre > RegA.Nombre then begin
				 orden:=false;
				 RegAux := RegB;
				 ModificarA(Artistas,RegA,i+1);
				 ModificarA(Artistas,RegAux,i);	
				end;
			End;
		end;
	end;
 CerrarA(Artistas);
end;


Procedure Buscar_Director(var Directores:Archivo_Directores;  var pos:int64;  buscado:String;  var Direct:Director);
var 
	posicion : int64;
	
begin
 AbrirD(Directores);
 posicion:=0;
 pos:=-1;
 while (not eof ( Directores)) and (pos = -1) do
	begin
	 LeerD (Directores, Direct, posicion);
	 If Direct.APyNom = buscado then
		begin
		 pos := posicion;
		end;
	 inc(posicion);
	end;	
 CerrarD(Directores);
end;

{METODOS PARA PRUEBAS
* }

Procedure Barrido_Dir(var Directores:Archivo_Directores);
var
	Punt, Lim : int64;
	Registro : Director;
	
Begin
 Gotoxy(1,25);
 AbrirD(Directores);
 Lim:=FileSize(Directores);
 Punt:=0;
 While (not eof) and (punt <> Lim) do begin
	 LeerD(Directores,Registro,Punt);
	 Writeln(Registro.APyNom);
	 Punt:=(Punt+1);
	End;
 CerrarD(Directores);
End;


begin
end.
