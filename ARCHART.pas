Unit ARCHART;

Interface //Parte Publica
Uses Crt;

Type 
Artista=Record
	 DNI:Int64;
	 Nombre:String;
	 Direccion:String;
	 Fecha_Nacimiento:String;
	 Activo:Boolean;
	 cant_obras:Integer;
	End;
Archivo_Artistas=File of Artista;

Var
	Artistas : Archivo_Artistas;//esta es la variable para abrir el archivo.
	Artist : Artista;//esta es la variable del tipo del registro para leer en el archivo.

//METODOS DE APERTURA, LECTURA, MODIFICACION, GUARDADO Y CIERRE
Procedure AbrirA(var Artistas:Archivo_Artistas);
Procedure LeerA(var Artistas:Archivo_Artistas; var Reg:Artista; Pos:Integer);
Procedure ModificarA(var Artistas:Archivo_Artistas; var Reg:Artista; Pos:Integer);
Procedure GuardarA(var Artistas:Archivo_Artistas; Reg:Artista);
Procedure CerrarA(var Artistas:Archivo_Artistas);

//METODOS DE BUSQUEDA Y ORDENAMIENTO
Procedure burbuja_mejoradoA(var Artistas:Archivo_Artistas);
Procedure Buscar_Artista(var Artistas:Archivo_Artistas; var Pos:int64; Nombre:String; var art:Artista);

// METODO DE PRUEBAS
Procedure Barrido_Art(var Artistas:Archivo_Artistas);
Implementation //Parte Privada

{APERTURA, LECTURA, MODIFICACION, GUARDADO Y CIERRE
}

Procedure AbrirA(Var Artistas:Archivo_Artistas);
Begin
 Assign(Artistas,'X:\ARCHART.dat');
 Reset(Artistas);
 If (ioresult <> 0) then
	Begin
	 ReWrite(Artistas);
	End;
End;


Procedure LeerA(var Artistas:Archivo_Artistas; var Reg:Artista; Pos:Integer); //Lee una posicion "Pos" del archivo y lo muestra 
Begin
 seek(Artistas,Pos);
 read(Artistas,Reg);
End;


Procedure ModificarA(var Artistas:Archivo_Artistas; var Reg:Artista; Pos:Integer);
Begin
 Seek(Artistas,Pos);
 Write(Artistas,Reg);
End;


Procedure GuardarA(var Artistas:Archivo_Artistas; Reg:Artista);
Begin
 Seek(Artistas,FileSize(Artistas));
 Write(Artistas,Reg);
End;


Procedure CerrarA(var Artistas:Archivo_Artistas);
Begin
 Close(Artistas);
End;

{METODOS DE ORDENAMIENTO Y BUSQUEDA
}

Procedure burbuja_mejoradoA(var Artistas:Archivo_Artistas); //BURBUJA MEJORADO PARA ARCHIVOS
var
	L, i, j : LongInt;
	RegA, RegB, RegAux :Artista;
	
begin
AbrirA(Artistas);
L := FileSize(Artistas);
for j := 1 to (L-1) do
	begin //mientras no este ordenado
	 for i := 0 to (L-j-1) do
		begin //Ciclo de i y el adyascente
		 LeerA (Artistas, RegA, i); //Obtengo los parametros por los cuales quiero ordenar
		 LeerA (Artistas, RegB, i+1);
		 if RegB.Nombre < RegA.Nombre then
			begin
			 RegAux := RegB;
			 ModificarA (Artistas, RegAux, i);
			 ModificarA (Artistas, RegA, i+1);
			end;
		end;
	end;
CerrarA(Artistas);
end;


Procedure Buscar_Artista(var Artistas:Archivo_Artistas; var pos:int64; Nombre:String; var art:Artista);
var 
	posicion : int64;

Begin
 AbrirA(Artistas); // Apertura del Archivo
 Posicion:=0;
 pos:=-1;
 While (not eof ( Artistas)) and (pos=-1) do // Mientras no sea el final del archivo y la variable pos siga siendo -1
	begin
		LeerA (Artistas, Artist, Posicion); // Se lee el registro del archivo que esta en la Posicion...
		 If Artist.Nombre = Nombre then // Si el nombre del artista del registro coincide con el Nombre Buscado
			begin
			 pos := Posicion // se devuelve la posicion del registro en el archivo
			end;
		Inc(Posicion); 
	End;	
 CerrarA(Artistas); // Cierre del Archivo
End;		

{METODOS PARA PRUEBAS
* }

Procedure Barrido_Art(var Artistas:Archivo_Artistas);
var
	Punt, Lim : int64;
	Registro : Artista;
	
Begin
 Gotoxy(1,25);
 AbrirA(Artistas);
 Lim:=FileSize(Artistas);
 Punt:=0;
 While (not eof) and (punt <> Lim) do begin
	 LeerA(Artistas,Registro,Punt);
	 if Registro.Activo = True then
		Begin
		  Writeln(Registro.Nombre);
		End;
	 Punt:=(Punt+1);
	End;
 CerrarA(Artistas);
End;

BEGIN
END.
