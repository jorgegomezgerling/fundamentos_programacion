unit unitArchivos;

interface
uses crt;

type
	t_coordenadas = record
		latitud, longitud: real;
	end;
	
	t_programa = (CLP, RAN, PROVINCIA, REFRIGERIO, PRIMERA_INFANCIA, ESPACIOS_DE_CUIDADO, CLUBES, COMUNITARIOS);
	
	t_institucion = record
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
procedure crear_registro(var archivo: t_archivo; institucion: t_institucion);
procedure mostrar_registro(var archivo: t_archivo; pos: integer);

implementation

procedure crear(var archivo: t_archivo);
begin
	assign(archivo, MI_ARCHIVO);
	rewrite(archivo);
end;

procedure abrir(var archivo: t_archivo);
begin
	assign(archivo, MI_ARCHIVO);
	reset(archivo);
end;

procedure cerrar(var archivo: t_archivo);
begin
	close(archivo);
end;

procedure crear_registro(var archivo: t_archivo; institucion: t_institucion);
begin
	assign(archivo, MI_ARCHIVO);
	reset(archivo);
	seek(archivo, filesize(archivo));
	write(archivo, institucion);
	close(archivo);
end;

procedure mostrar_registro(var archivo: t_archivo; pos: integer);
var institucion: t_institucion;

begin
	assign(archivo, MI_ARCHIVO);
	reset(archivo);
	seek(archivo, pos);
	read(archivo, institucion);
    writeln('Institución: ', institucion.nombre_institucion);
    writeln('Directivo a cargo: ', institucion.directivo_cargo);
    writeln('Ingrese ubicación en latitud espacio longitud: ', institucion.ubicacion.latitud, institucion.ubicacion.longitud);
    writeln('Programa que ofrece: ', institucion.programa);
    writeln('¿Se encuentra activo?: ', institucion.activo);
end;

begin
end.
