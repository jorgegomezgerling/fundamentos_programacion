unit unitArchivos;

interface
uses crt;

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
procedure ordenamiento_burbuja(var archivo: t_archivo);

implementation

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
	close(archivo);
end;

procedure mostrar_registro(var archivo: t_archivo; pos: integer);
var institucion: t_institucion;

begin
	seek(archivo, pos);
	read(archivo, institucion);
	writeln('Numero Institucion: ', institucion.numero_institucion);
    writeln('Institución: ', institucion.nombre_institucion);
    writeln('Directivo a cargo: ', institucion.directivo_cargo);
    writeln('Ingrese ubicación en latitud espacio longitud: ', institucion.ubicacion.latitud, institucion.ubicacion.longitud);
    writeln('Programa que ofrece: ', institucion.programa);
    writeln('¿Se encuentra activo?: ', institucion.activo);
end;

procedure mostrar_archivo(var archivo: t_archivo);
var
    i: integer;
begin
    writeln('Instituciones: ');
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
	writeln('Posición: ', pos, ' ---- ', institucion.numero_institucion, ' ', institucion.nombre_institucion, ' ----');
end;


procedure modificar_nombre(var institucion: t_institucion);
var nuevo_nombre: string;
begin
    writeln('Nuevo nombre de la Institución: ');
    readln(nuevo_nombre);
    institucion.nombre_institucion := nuevo_nombre;
end;

procedure modificar_numero(var institucion: t_institucion);
var nuevo_numero: integer;
begin
    writeln('Nuevo número de la Institución: ');
    readln(nuevo_numero);
    institucion.numero_institucion := nuevo_numero;
end;

procedure modificar_directivo(var institucion: t_institucion);
var nuevo_nombre: string;
begin
    writeln('Nuevo Directivo a cargo: ');
    readln(nuevo_nombre);
    institucion.directivo_cargo := nuevo_nombre;
end;

procedure modificar_ubicacion(var institucion: t_institucion);
var nueva_latitud, nueva_longitud: real;
begin
    writeln('Nueva latitud: ');
    readln(nueva_latitud);
    writeln('Nueva longitud: ');
    readln(nueva_longitud);
    institucion.ubicacion.latitud := nueva_latitud;
    institucion.ubicacion.longitud := nueva_longitud;
end;

procedure modificar_programa(var institucion: t_institucion);
var nuevo_programa: integer;
begin
    writeln('Nuevo programa:');
    writeln('0: CLP');
    writeln('1: RAN');
    writeln('2: PROVINCIA');
    writeln('3: REFRIGERIO');
    writeln('4: PRIMERA_INFANCIA');
    writeln('5: ESPACIOS_DE_CUIDADO');
    writeln('6: CLUBES');
    writeln('7: COMUNITARIOS');
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
        writeln('Programa inválido.');
    end;
end;

procedure modificar_activo(var institucion: t_institucion);
var nuevo_estado: char;
begin
    writeln('¿Activo? (S/N): ');
    readln(nuevo_estado);
    institucion.activo := nuevo_estado;
end;

procedure modificar_registro(var archivo: t_archivo; pos: integer);
var institucion: t_institucion;
	campo: integer;
begin
	assign(archivo, MI_ARCHIVO);
	reset(archivo);
	seek(archivo, pos);
	read(archivo, institucion);
	writeln('Campo a modificar:');
	writeln('0: Nombre Institución');
	writeln('1: Nombre Encargado');
	writeln('2: Programa');
	writeln('3: Ubicación');
	writeln('4: Estado');
    readln(campo);
    case campo of
        0: modificar_nombre(institucion);
        1: modificar_directivo(institucion);
        2: modificar_programa(institucion);
        3: modificar_ubicacion(institucion);
        4: modificar_activo(institucion);
    else
    writeln('Campo inválido.');
    end;
	seek(archivo, pos);
	write(archivo, institucion);
end;

procedure ordenamiento_burbuja(var archivo: t_archivo);
	var i, j: integer;
		institucion_i, institucion_j: t_institucion;
	
		procedure intercambiar(var a, b: t_institucion);
		var aux: t_institucion;
		begin	
			aux := a;
			a := b;
			b := aux;
		end;
		
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
		
		begin
		for i := 0 to filesize(archivo) -2 do
			begin
				for j := i + 1 to filesize(archivo) -1 do
					begin
					leer_institucion(archivo, institucion_i, i);
					leer_institucion(archivo, institucion_j, j);
					if institucion_i.numero_institucion > institucion_j.numero_institucion then
						begin
							intercambiar(institucion_i, institucion_j);
							escribir_institucion(archivo, institucion_i, i);
							escribir_institucion(archivo, institucion_j, j);
						end;
					end;
				end;
			end;

begin
end.
