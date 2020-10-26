
Unit ARCHOBR;

Interface
//Parte Publica
uses crt;

Type 
    Obra =   Record
        Nombre:   String; //de la obra
        Artista:   String; // nombre
        Anio:   Integer;
        Descripcion:   String;
        Tipo:   String;
        Material:   String;
        Estilo:   String;
        Altura:   Integer;
        Peso:   Real;
        Completo:   String[2];
        Partes:   Byte;
        Codigo_Obra:   Int64;
        Nombre_Museo:   String;
        Activo:   boolean;
    End;

Archivo_Obras = file Of Obra;

Var 
    Obras:   Archivo_Obras;
    Obr:   Obra;
    Posicion:   Integer;

//METODOS DE APERTURA, LECTURA, MODIFICACION, GUARDADO Y CIERRE
Procedure AbrirO (Var Obras:Archivo_Obras);
Procedure LeerO (Var Obras:Archivo_Obras;Var Obr:Obra; Posicion:Integer);
Procedure ModificarO (Var Obras:Archivo_Obras; Var Obr:Obra; Posicion:Integer);
Procedure GuardarO (Var Obras:Archivo_Obras; Var Obr:Obra);
Procedure CerrarO (Var Obras:Archivo_Obras);

//METODOS DE BUSQUEDA Y ORDENAMIENTO
Procedure burbujaO (Var Obras:Archivo_Obras);
Procedure Buscar_Obra_Codigo (Var Obras:Archivo_Obras;Var pos:int64; Code:int64; Var obr:Obra);
Procedure Buscar_Obra_Nombre (Var Obras:Archivo_Obras;Var pos:int64; Name:String; Var obr:Obra);

//METODOS DE ANALISIS
Procedure Barrido_Obr(Var Obras:Archivo_Obras);
Procedure Secuencia_Obras(var Obras:Archivo_Obras; Nombre:String; var Contador:Int64); //cuenta las obras de un artista (ya no es necesario)
Procedure Buscar_Museo_en_Obras (var Obras:Archivo_Obras; buscado:String; var obr:Obra; y:Byte; var posicion:int64); //Busca un Museo en el archivo Obras
Procedure Buscar_Artista_en_Obras(var Obras:Archivo_Obras; buscado:String ;var Obr:Obra; y:Byte; var posicion:int64); // Busca un Artista en el Archivo Obras
Procedure Buscar_Artista_Modificar(var Obras:Archivo_Obras; var Obr:Obra; buscado:String; reemplazo:String); // Busca un Artista en el Archivo Obras y lo modifica
Procedure Buscar_Museo_Modificar(var Obras:Archivo_Obras; var Obr:Obra; buscado:String; reemplazo:String); // Busca un museo en el Archivo Obras y lo modifica
Implementation
//Parte Privada

{APERTURA, LECTURA, MODIFICACION, GUARDADO Y CIERRE
}

Procedure AbrirO(Var Obras:Archivo_Obras);
Begin
    Assign(Obras,'X:\ARCHOBR.dat');
    Reset(Obras);
    If (ioresult <> 0) Then
        Begin
            ReWrite(Obras);
        End;
End;


Procedure ModificarO(Var Obras:Archivo_Obras; Var Obr:Obra; Posicion:Integer);
Begin
    Seek(Obras,Posicion);
    Write(Obras,Obr);
End;


Procedure LeerO(Var Obras:Archivo_Obras;Var Obr:Obra; Posicion:Integer);
Begin
    Seek(Obras,Posicion);
    Read(Obras,Obr);
End;


Procedure GuardarO(Var Obras:Archivo_Obras; Var Obr:Obra);
Begin
    Seek(Obras,Filesize(Obras));
    Write(Obras,Obr);
End;


Procedure CerrarO(Var Obras:Archivo_Obras);
Begin
    Close(Obras);
End;





{ORDENAMIENTO Y BUSQUEDA}

Procedure burbujaO(Var Obras:Archivo_Obras);
//BURBUJA MEJORADO PARA ARCHIVOS
Var 
    L, i, j :   LongInt;
    RegA, RegB, RegAux :   Obra;
begin
AbrirO(Obras);
L := FileSize(Obras);
	if (L>1) then;
	begin
		for j := 1 to (L-1) do
		begin //mientras no este ordenado
			for i := 0 to (L-j-1) do
			begin //Ciclo de i y el adyascente
			 LeerO (Obras, RegA, i); //Obtengo los parametros por los cuales quiero ordenar
			 LeerO (Obras, RegB, i+1);
				if (RegB.Nombre < RegA.Nombre)then
				begin
				 RegAux := RegB;
				 ModificarO (Obras, RegAux, i);
				 ModificarO (Obras, RegA, i+1);
				end;
			end;
		end;
	end;
CerrarO(Obras);
end;


Procedure Buscar_Obra_Codigo (Var Obras:Archivo_Obras; Var pos:int64; Code:int64; Var Obr:Obra); // busqueda para saber si el codigo asignado ya esta en uso
Var 
    posicion:   integer;

Begin
    AbrirO(Obras);
    posicion := 0;
    pos := -1;
    While (Not eof ( Obras)) And (pos=-1) Do
        Begin
            LeerO (Obras,Obr, posicion);
            If (Obr.Codigo_Obra = Code) Then
                Begin
                    pos := posicion
                End;
            inc(posicion);
        End;
    CerrarO(Obras);
End;


Procedure Buscar_Obra_Nombre (Var Obras:Archivo_Obras; Var pos:int64; Name:String; Var Obr:Obra); // busqueda de obra por nombre
Var 
    posicion:   integer;

Begin
    AbrirO(Obras);
    posicion := 0;
    pos := -1;
    While (Not eof ( Obras)) And (pos=-1) Do
        Begin
            LeerO (Obras, Obr, posicion);
            If (Obr.Nombre = Name) Then
                Begin
                    pos := posicion
                End;
            inc(posicion)
        End;
    CerrarO(Obras);
End;






{ANALISIS}

Procedure Barrido_Obr(Var Obras:Archivo_Obras);

Var 
    Punt : int64;
	y : integer;
Begin
	burbujaO(Obras);
	y :=  2;
    AbrirO(Obras);
    Punt := 0;
		While (Not eof(Obras)) do
        Begin
         LeerO(Obras, Obr, Punt);
			If (Obr.Activo = True) Then
			Begin
				gotoxy(1,y);
				Writeln(Obr.Nombre);
				inc(y);
			End;
         inc(Punt);
        End;
    CerrarO(Obras);
End;


Procedure Secuencia_Obras(var Obras:Archivo_Obras; Nombre:String; var Contador:Int64);
var
	Lim, pos: int64;

Begin
	Contador := 0;
    AbrirO(Obras);
    Lim := FileSize(Obras);
    pos := 0;
		While (Not eof (Obras)) And (pos <> Lim) Do
        Begin
            LeerO(Obras, Obr, pos);
				If (Obr.Artista = Nombre) Then
                Begin
                    Inc(Contador);
                End;
         inc(pos);
        End;
    CerrarO(Obras);
End;


Procedure Buscar_Museo_en_Obras(var Obras:Archivo_Obras; buscado:String; var Obr:Obra; y:Byte; var posicion:int64); // Con este procedure recorro el archivo, para mostrar las Obras que pertenecen a un determinado Museo.
var 
 	cont:integer;

const
	tam_lista=2;

begin
 cont:=0;
 AbrirO(Obras);
 textcolor(green);
	If (posicion < Filesize(Obras)) and (posicion >= 0) then
	begin
		repeat// controla si se llego al final del archivo o si se lleno la lista
			begin
			 LeerO(Obras, Obr, posicion);
			 if (Obr.Nombre_Museo = buscado) and (Obr.Activo=True) then // controla la existencia del artista
				begin
				 Gotoxy(36,y);
				 Writeln(Obr.Nombre); // nombre de la obra
				 inc(y); //posicion del cursor
				 inc(cont);
				end;
			 inc(posicion); // puntero del archivo
			end;
		until (posicion=Filesize(Obras)) or (cont=tam_lista);
	End
	Else
		begin
			posicion:=0;
			repeat// controla si se llego al final del archivo o si se lleno la lista
				begin
				 LeerO(Obras, Obr, posicion);
				 if (Obr.Nombre_Museo = buscado) and (Obr.Activo=True) then // controla la existencia del artista
					begin
					 Gotoxy(36,y);
					 Writeln(Obr.Nombre); // nombre de la obra
					 inc(y); //posicion del cursor
					 inc(cont);
					end;
				 inc(posicion); // puntero del archivo
				end;
			until (posicion=Filesize(Obras)) or (cont=tam_lista);
		end;
 CerrarO(Obras);

End;


Procedure Buscar_Artista_en_Obras(var Obras:Archivo_Obras; buscado:String ;var Obr:Obra; y:Byte; var posicion:int64);
{
Con este procedure recorro el archivo Obras, para mostrar los Obras que pertenecen a un determinado Artista.
}
var 
	cont:integer;
const
	tam_lista=2;
	
begin
cont:=0;
AbrirO(Obras);
textcolor(green);
	If (posicion < Filesize(Obras)) and (posicion >= 0) then
	begin
		repeat// controla si se llego al final del archivo
			begin
			 LeerO(Obras, Obr, posicion);
			 if (Obr.Artista = buscado) and (Obr.Activo = True) then // controla la existencia del artista
				begin
				 Gotoxy(36,y);
				 Writeln(Obr.Nombre); // nombre de la obra
				 Gotoxy(64,y);
				 Writeln (Obr.Nombre_Museo); // museo en el que se encuentra la obra
				 inc(y); //posicion del cursor
				 inc(cont);
				end;
			 inc(posicion); // puntero del archivo
			end;
		until (posicion=Filesize(Obras)) or (cont=tam_lista);
	End
	Else
		begin
		 posicion:=0;
			repeat// controla si se llego al final del archivo
				begin
				 LeerO(Obras, Obr, posicion);
				 if (Obr.Artista = buscado) and (Obr.Activo = True) then // controla la existencia del artista
					begin
					 Gotoxy(36,y);
					 Writeln(Obr.Nombre); // nombre de la obra
					 Gotoxy(64,y);
					 Writeln (Obr.Nombre_Museo); // museo en el que se encuentra la obra
					 inc(y); //posicion del cursor
					 inc(cont);
					end;
				 inc(posicion); // puntero del archivo
				end;
			until (posicion=Filesize(Obras)) or (cont=tam_lista);
		end;
CerrarO(Obras);
end;


Procedure Buscar_Artista_Modificar(var Obras:Archivo_Obras; var Obr:Obra; buscado:String; reemplazo:String);
{
Esta funcion busca por nombre en el archivo y
cuando lo encuentra, lo reemplaza x el nombre nuevo}
var 
	posicion: Int64;

begin
 AbrirO(Obras);
 posicion:=0; //puntero
 while not eof (Obras) do // controla si se llego al final del archivo
	begin
	 LeerO(Obras, Obr, posicion);
	 if (Obr.Artista = buscado) then // controla la existencia del artista
		begin
		 Obr.Artista := reemplazo;
		 ModificarO(Obras,Obr,posicion);
		end;
	 inc(posicion); // puntero del archivo
	end;
CerrarO(Obras);
end;

Procedure Buscar_Museo_Modificar(var Obras:Archivo_Obras; var Obr:Obra; buscado:String; reemplazo:String);
{
Esta funcion busca por nombre en el archivo y
cuando lo encuentra, lo reemplaza x el nombre nuevo}
var 
	posicion: Int64;

begin
 AbrirO(Obras);
 posicion:=0; //puntero
 while not eof (Obras) do // controla si se llego al final del archivo
	begin
	 LeerO(Obras, Obr, posicion);
	 if (Obr.Nombre_Museo = buscado) then // controla la existencia del artista
		begin
		 Obr.Nombre_Museo := reemplazo;
		 ModificarO(Obras,Obr,posicion)
		end;
	 inc(posicion); // puntero del archivo
	end;
CerrarO(Obras);
end;


Begin
End.
