
Unit ARCHMUS;

Interface
//Parte Publica

Uses Crt;

Type 
    Museo =   Record
        Codigo, Telefono :   Int64;
        Nombre, Calle, Ciudad, Pais, Name_Director :   String;
        Activo :   Boolean;
    End;
    T_vec_mus =   array [1..9] Of Museo;
    Archivo_Museos =   File Of Museo;

Var 
    Museos:   Archivo_Museos;
    Mus:   Museo;

    //METODOS DE APERTURA, LECTURA, MODIFICACION, GUARDADO Y CIERRE
Procedure AbrirM( Var Museos:Archivo_Museos);
Procedure LeerM (Var Museos:Archivo_Museos; Var Mus:Museo; Pos:Integer);
Procedure ModificarM (Var Museos:Archivo_Museos; Var Mus:Museo; Pos:integer);
Procedure GuardarM (Var Museos:Archivo_Museos; Var Mus:Museo);
Procedure CerrarM (Var Museos:Archivo_Museos);

//METODOS DE BUSQUEDA Y ORDENAMIENTO
Procedure burbujaM(Var Museos:Archivo_Museos);
Procedure Buscar_Museo_Codigo (Var Museos:Archivo_Museos; Var pos:int64;
                               codigo_buscado:int64; Var Mus:Museo);
Procedure Buscar_Museo_Nombre (Var Museos:Archivo_Museos;Var pos:int64; Nombre:
                               String; Var Mus:Museo);

//METODO DE PRUEBAS
Procedure Barrido_Mus(Var Museos:Archivo_Museos);

Implementation
//Parte Privada

{APERTURA, LECTURA, MODIFICACION, GUARDADO Y CIERRE
}

Procedure AbrirM(Var Museos : Archivo_Museos);
Begin
    Assign(Museos,'X:\ARCHMUS.dat');
    Reset(Museos);
    If (ioresult <> 0) Then
        Begin
            Rewrite(Museos);
        End;
End;

Procedure LeerM(Var Museos:Archivo_Museos; Var Mus:Museo; Pos:Integer);
Begin
    Seek(Museos,Pos);
    Read(Museos,Mus);
End;

Procedure ModificarM(Var Museos:Archivo_Museos; Var Mus:Museo; Pos:Integer);
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

Procedure burbujaM(Var Museos:Archivo_Museos);
//BURBUJA MEJORADO PARA ARCHIVOS

Var 
    L, i :   LongInt;
    orden :   boolean;
    RegA, RegB, RegAux :   Museo;
Begin
    i := 1;
    AbrirM(Museos);
    L := FileSize(Museos);
    If (L=1) Then // si el archivo tiene menos de 2 registros no se ordena
        Begin
            orden := false;
            While Not(orden) Do
                Begin
                    //mientras no este ordenado 
                    orden := true;
                    For i := 0 To (L-1) Do
                        Begin
                            // Ciclo de i y el adyascente
                            If Not eof(Museos) Then
                                Begin
                                    LeerM(Museos,RegA,i);

                          //Obtengo los parametros por los cuales quiero ordenar
                                    LeerM(Museos,RegB,i+1);
                                    If RegB.Nombre > RegA.Nombre Then
                                        Begin
                                            orden := false;
                                            RegAux := RegB;
                                            ModificarM(Museos,RegA,i+1);
                                            ModificarM(Museos,RegAux,i);
                                        End;
                                End;
                        End;
                End;
        End;
    CerrarM(Museos);
End;

Procedure Buscar_Museo_Codigo(Var Museos:Archivo_Museos;Var pos:int64;
                              codigo_buscado:int64; Var Mus:Museo);

Var 
    posicion :   int64;

Begin
    AbrirM(Museos);
    // Apertura del Archivo de Museos
    posicion := 0;
    pos := -1;
    While (Not eof (Museos)) And (pos=-1) Do
        Begin
            LeerM (Museos, Mus, posicion);
            If (Mus.Codigo = codigo_buscado) Then
                Begin
                    pos := posicion;
                End;
            inc(posicion);
        End;
    CerrarM(Museos);
    // Cierre del Archivo de Museos
End;


Procedure Buscar_Museo_Nombre(Var Museos:Archivo_Museos; Var pos:int64; Nombre:
                              String; Var Mus:Museo);

Var 
    posicion :   int64;

Begin
    posicion := 0;
    pos := -1;
    AbrirM(Museos);
    // Apertura del Archivo de Museos
    While (Not eof (Museos)) And (pos = -1) Do
        Begin
            LeerM(Museos, Mus, posicion);
            If (Mus.Nombre = Nombre)Then
                Begin
                    pos := posicion;
                End;
            inc(posicion);
        End;
    CerrarM(Museos);
    // Cierre del Archivo de Museos
End;

{METODOS PARA PRUEBAS
* }

Procedure Barrido_Mus(Var Museos:Archivo_Museos);

Var 
    Punt, Lim :   int64;
    Registro :   Museo;

Begin
    clrscr;
    // borrar!
    Gotoxy(1,25);
    AbrirM(Museos);
    // apertura del archivo
    Lim := FileSize(Museos);
    // tamaño del archivo
    Punt := 0;
    //posicion en el archivo
    While (Not eof) And (punt <> Lim) Do
        Begin
            LeerM(Museos,Registro,Punt);
            If Registro.Activo = True Then
                Begin
                    Writeln(Registro.Nombre);
                End;
            Punt := (Punt+1);
        End;
    CerrarM(Museos);
End;


Begin
End.
