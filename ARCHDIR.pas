
Unit ARCHDIR;

Interface
//Parte Publica

Uses Crt;

Type 
    Director =   Record
        APyNom:   String;
        DNI:   Int64;
        Direccion:   String;
        Periodo_Asignacion_Inic:   String;
        Periodo_Asignacion_Fin:   String;
        Telefono:   String[20];
        Activo:   boolean;
    End;

    T_vec_dir =   array [1..6] Of Director;
    Archivo_Directores =   File Of Director;

Var 
    Directores:   Archivo_Directores;
    Direct:   Director;
    Pos:   Integer;

    //METODOS DE APERTURA, LECTURA, MODIFICACION, GUARDADO Y CIERRE
Procedure AbrirD(Var Directores:Archivo_Directores);
Procedure LeerD(Var Directores:Archivo_Directores; Var Direct:Director; Pos:
                Integer);
Procedure ModificarD(Var Directores:Archivo_Directores; Var Direct:Director; Pos
                     :Integer);
Procedure GuardarD(Var Directores:Archivo_Directores; Direct:Director);
Procedure CerrarD(Var Directores:Archivo_Directores);

//METODOS DE BUSQUEDA Y ORDENAMIENTO
Procedure burbujaD(Var Directores:Archivo_Directores);
Procedure Buscar_Director(Var Directores:Archivo_Directores; Var pos:int64;
                          buscado:String; Var Direct:Director);

//METODO DE PRUEBAS
Procedure Barrido_Dir(Var Directores:Archivo_Directores);

Implementation
//Parte Privada

{APERTURA, LECTURA, MODIFICACION, GUARDADO Y CIERRE
}

Procedure AbrirD(Var Directores:Archivo_Directores);
Begin
    Assign(Directores,'X:\ARCHDIR.dat');
    Reset(Directores);
    If (ioresult <> 0) Then
        Begin
            ReWrite(Directores);
        End;
End;

Procedure LeerD(Var Directores:Archivo_Directores; Var Direct:Director; Pos:
                Integer);
Begin
    Seek(Directores,Pos);
    Read(Directores,Direct);
End;

Procedure ModificarD(Var Directores:Archivo_Directores; Var Direct:Director; Pos
                     :Integer);
Begin
    Seek(Directores,Pos);
    Write(Directores,Direct);
End;

Procedure GuardarD(Var Directores:Archivo_Directores; Direct:Director);
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

Procedure burbujaD(Var Directores:Archivo_Directores);
//BURBUJA MEJORADO PARA ARCHIVOS

Var 
    L, i :   LongInt;
    orden :   boolean;
    RegA, RegB, RegAux :   Director;
Begin
    i := 1;
    AbrirD(Directores);
    L := FileSize(Directores);
    orden := false;
    While Not(orden) Do
        Begin
            //mientras no este ordenado 
            orden := true;
            For i := 0 To (L-1) Do
                Begin
                    // Ciclo de i y el adyascente
                    If Not eof(Directores) Then
                        Begin
                            LeerD(Directores,RegA,i);


                          //Obtengo los parametros por los cuales quiero ordenar
                            LeerD(Directores,RegB,i+1);
                            If RegB.APyNom > RegA.APyNom Then
                                Begin
                                    orden := false;
                                    RegAux := RegB;
                                    ModificarD(Directores,RegA,i+1);
                                    ModificarD(Directores,RegAux,i);
                                End;
                        End;
                End;
        End;
    CerrarD(Directores);
End;


Procedure Buscar_Director(Var Directores:Archivo_Directores;  Var pos:int64;
                          buscado:String;  Var Direct:Director);

Var 
    posicion :   int64;

Begin
    AbrirD(Directores);
    posicion := 0;
    pos := -1;
    While (Not eof ( Directores)) And (pos = -1) Do
        Begin
            LeerD (Directores, Direct, posicion);
            If Direct.APyNom = buscado Then
                Begin
                    pos := posicion;
                End;
            inc(posicion);
        End;
    CerrarD(Directores);
End;

{METODOS PARA PRUEBAS
* }

Procedure Barrido_Dir(Var Directores:Archivo_Directores);

Var 
    Punt, Lim :   int64;
    Registro :   Director;

Begin
    clrscr;
    // borrar!
    Gotoxy(1,25);
    AbrirD(Directores);
    Lim := FileSize(Directores);
    Punt := 0;
    While (Not eof) And (punt <> Lim) Do
        Begin
            LeerD(Directores,Registro,Punt);
            If Registro.Activo = True Then
                Begin
                    Writeln(Registro.APyNom);
                End;
            Punt := (Punt+1);
        End;
    CerrarD(Directores);
End;


Begin
End.
