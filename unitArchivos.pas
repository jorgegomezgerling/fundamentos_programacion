unit unitArchivos;

interface
uses crt, SysUtils;

type
	t_coordenadas = record
		latitud, longitud: real;
	end;
	
	t_programa = (CLP, RAN, PROVINCIA, REFRIGERIO, PRIMERA_INFANCIA, ESPACIOS_DE_CUIDADO, CLUBES, COMUNITARIOS);
	
	t_institucion = record
		numero_institucion: integer;
		nombre_institucion, directivo_cargo: string[60];
		ubicacion: t_coordenadas;
		programa: t_programa;
		activo: char;
	end;
	
	t_archivo = file of t_institucion;
	
const MI_ARCHIVO = './Archivo_Comedores.DAT';

procedure crear(var archivo: t_archivo); 
procedure abrir(var archivo: t_archivo); 
procedure cerrar(var archivo: t_archivo); 
procedure mostrar_archivo(var archivo: t_archivo);
procedure crear_registro(var archivo: t_archivo; institucion: t_institucion);
procedure mostrar_registro(var archivo: t_archivo; pos: integer);
procedure mostrar_registro_acotado(var archivo: t_archivo; pos: integer);
procedure modificar_registro(var archivo: t_archivo; pos: integer);
procedure ordenamiento_burbuja(var archivo: t_archivo; var ascendente: char);
procedure eliminar_registro(var archivo: t_archivo; pos: integer);
procedure leer_institucion(var archivo: t_archivo; var institucion: t_institucion; posicion: integer);
procedure escribir_institucion(var archivo: t_archivo; var institucion: t_institucion; posicion: integer);


implementation


procedure leer_institucion(var archivo: t_archivo; var institucion: t_institucion; posicion: integer);
begin
	seek(archivo, posicion);
	read(archivo, institucion);
end;
		
procedure escribir_institucion(var archivo: t_archivo; var institucion: t_institucion; posicion: integer);
begin
	seek(archivo, posicion);
	write(archivo, institucion);
end;

procedure crear(var archivo: t_archivo);
begin
	assign(archivo, MI_ARCHIVO);
	rewrite(archivo);
	writeln('Archivo creado.');
end;

procedure abrir(var archivo: t_archivo);
begin
	assign(archivo, MI_ARCHIVO);
	reset(archivo);
	writeln('Archivo abierto exitosamente.');
end;

procedure cerrar(var archivo: t_archivo);
begin
	close(archivo);
	writeln('Archivo cerrado exitosamente.');
end;

procedure crear_registro(var archivo: t_archivo; institucion: t_institucion);
begin
	seek(archivo, filesize(archivo));
	write(archivo, institucion); 
end;

procedure mostrar_registro(var archivo: t_archivo; pos: integer);
var institucion: t_institucion;

begin
	seek(archivo, pos);
	read(archivo, institucion);
	textcolor(LightRed);
	writeln('Institucion N°: ', institucion.numero_institucion, ' ', institucion.nombre_institucion);
	writeln();
    //writeln('Institución: ', institucion.nombre_institucion);
    textcolor(White);
    writeln('Directivo a cargo: ', institucion.directivo_cargo);
    writeln('Ubicación en coordenadas: ', institucion.ubicacion.latitud:0:6, ', ', institucion.ubicacion.longitud:0:6);
    writeln('Programa que ofrece: ', institucion.programa);
    if UpCase(institucion.activo) = 'S' then
		writeln('Estado: Activo.')
	else if UpCase(institucion.activo) = 'N' then
		writeln('Estado: Inactivo');
end;

procedure mostrar_archivo(var archivo: t_archivo);
var
    i: integer;
begin
	textcolor(LightRed);
    writeln('*******************************');
    textcolor(White);
    writeln('*        Instituciones        *');
	textcolor(LightRed);
    writeln('*******************************');
    writeln();
    for i := 0 to filesize(archivo) - 1 do
    begin
        mostrar_registro_acotado(archivo, i);
    end;
end;

procedure mostrar_registro_acotado(var archivo: t_archivo; pos: integer);
var institucion: t_institucion;

begin
	seek(archivo, pos);
	read(archivo, institucion);
	textcolor(White);
	//writeln('* Índice: ', pos, ' |-|-|-| N° ', institucion.numero_institucion, ' ', institucion.nombre_institucion);
	writeln('* Índice: |', pos, '| --- N° ', institucion.numero_institucion, ' ', institucion.nombre_institucion);
	textcolor(LightCyan);
	writeln('--------------------------------');
end;

procedure modificar_nombre(var institucion: t_institucion);

var nuevo_nombre_institucion: string;

begin
	textcolor(White);
    write('Nuevo nombre de la Institución: ');
    readln;
    textcolor(LightGreen);
    readln(nuevo_nombre_institucion);
    institucion.nombre_institucion := nuevo_nombre_institucion;
end;

procedure modificar_numero(var institucion: t_institucion);
var nuevo_numero: integer;
begin
	textcolor(White);
    write('Nuevo número de la Institución: ');
    readln;
    textcolor(LightGreen);
    readln(nuevo_numero);
    institucion.numero_institucion := nuevo_numero;
end;

procedure modificar_directivo(var institucion: t_institucion);
var nuevo_directivo: string;
begin
	textcolor(White);
    write('Nuevo Directivo a cargo: ');
    readln;
    textcolor(LightGreen);
    readln(nuevo_directivo);
    institucion.directivo_cargo := nuevo_directivo;
end;

procedure modificar_ubicacion(var institucion: t_institucion);
var nueva_latitud, nueva_longitud: real;
begin
	readln;
	textcolor(White);
    write('Nueva latitud: ');
    textcolor(LightGreen);
    readln(nueva_latitud);
    textcolor(White);
    write('Nueva longitud: ');
    textcolor(LightGreen);
    readln(nueva_longitud);
    institucion.ubicacion.latitud := nueva_latitud;
    institucion.ubicacion.longitud := nueva_longitud;
end;

procedure modificar_programa(var institucion: t_institucion);
var nuevo_programa: integer;
begin
	textcolor(White);
    writeln();
    writeln('0: CLP');
    writeln('1: RAN');
    writeln('2: PROVINCIA');
    writeln('3: REFRIGERIO');
    writeln('4: PRIMERA_INFANCIA');
    writeln('5: ESPACIOS_DE_CUIDADO');
    writeln('6: CLUBES');
    writeln('7: COMUNITARIOS');
    writeln();
    textcolor(Yellow);
    write('Nuevo programa: ');
    textcolor(LightGreen);
    readln(nuevo_programa);
    
    case nuevo_programa of
        0: institucion.programa := CLP;
        1: institucion.programa := RAN;
        2: institucion.programa := PROVINCIA;
        3: institucion.programa := REFRIGERIO;
        4: institucion.programa := PRIMERA_INFANCIA;
        5: institucion.programa := ESPACIOS_DE_CUIDADO;
        6: institucion.programa := CLUBES;
        7: institucion.programa := COMUNITARIOS;
    else
		textcolor(LightRed);
        writeln('Programa inválido.');
    end;
end;

procedure modificar_activo(var institucion: t_institucion);
var nuevo_estado: char;
begin
	textcolor(White);
    write('¿Activo? (S/N): ');
    readln;
    textcolor(LightGreen);
    readln(nuevo_estado);
    institucion.activo := nuevo_estado;
end;

procedure modificar_registro(var archivo: t_archivo; pos: integer);
var institucion: t_institucion;
	campo: integer;
begin
	//assign(archivo, MI_ARCHIVO); // Repensar si son necesarias el assign y reset acá;
	//reset(archivo);
	seek(archivo, pos);
	read(archivo, institucion);
	writeln();
	textcolor(White);
	writeln('0: Número Institución');
	writeln('1: Nombre Institución');
	writeln('2: Nombre Encargado');
	writeln('3: Programa');
	writeln('4: Ubicación');
	writeln('5: Estado');
	writeln();
	//textcolor(LightGreen);
	//write('Campo: ');
	write('Ingrese el índice del campo a modificar: ');
	writeln();
	textcolor(LightGreen);
    read(campo);
    case campo of
		0: modificar_numero(institucion);
        1: modificar_nombre(institucion);
        2: modificar_directivo(institucion);
        3: modificar_programa(institucion);
        4: modificar_ubicacion(institucion);
        5: modificar_activo(institucion);
    else
    writeln('Campo inválido.');
    end;
	seek(archivo, pos);
	write(archivo, institucion);
end;

procedure ordenamiento_burbuja(var archivo: t_archivo; var ascendente: char);
	var i, j: integer;
		institucion_i, institucion_j: t_institucion;
	
		procedure intercambiar(var a, b: t_institucion);
		var aux: t_institucion;
		begin	
			aux := a;
			a := b;
			b := aux;
		end;
		
		begin
		for i := 0 to filesize(archivo) -2 do
			begin
				for j := i + 1 to filesize(archivo) -1 do
					begin
					leer_institucion(archivo, institucion_i, i);
					leer_institucion(archivo, institucion_j, j);
					if UpCase(ascendente) = 'A' then
						begin
							if institucion_i.numero_institucion > institucion_j.numero_institucion then
								begin
									intercambiar(institucion_i, institucion_j);
									escribir_institucion(archivo, institucion_i, i);
									escribir_institucion(archivo, institucion_j, j);
								end;
						end
					else if UpCase(ascendente) = 'D' then
						begin
							if institucion_i.numero_institucion < institucion_j.numero_institucion then
								begin
									intercambiar(institucion_i, institucion_j);
									escribir_institucion(archivo, institucion_i, i);
									escribir_institucion(archivo, institucion_j, j);
								end;
						end
					end;
				end;
			end;

procedure eliminar_registro(var archivo: t_archivo; pos: integer);
	var institucion: t_institucion;
		archivo_aux: t_archivo;
		i, j: integer;
	
	procedure crear_archivo_auxiliar(var arch: t_archivo);
		const ARCHIVO_AUX = './Archivo_Comedores_AUX.DAT';
		begin
			assign(arch, ARCHIVO_AUX);
			rewrite(arch);
			writeln();
			textcolor(LightGreen);
			writeln('Archivo auxiliar creado exitosamente.');
		end;
		
	begin
		crear_archivo_auxiliar(archivo_aux);
		j := 0;
		
			for i := 0 to filesize(archivo) -1 do
				begin
					if i <> pos then
						begin
						leer_institucion(archivo, institucion, i);
						escribir_institucion(archivo_aux, institucion, j);
						inc(j);
						end;
				end;
			close(archivo_aux);
			close(archivo);
			
			// Reemplazar archivo original con el archivo auxiliar
			assign(archivo, './Archivo_Comedores.DAT');
			erase(archivo);
			rename(archivo_aux, './Archivo_Comedores.DAT');
			textcolor(LightGreen);
			writeln('Registro eliminado exitosamente.');
	end;
begin
end.
