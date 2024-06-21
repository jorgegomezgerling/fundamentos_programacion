unit unitArchivos;

interface
uses crt;

type
	t_coordenadas = record
		latitud, longitud: real;
	end;
	
	t_programa = (CLP, RAN, PROVINCIA, REFRIGERIO, PRIMERA_INFANCIA, ESPACIOS_DE_CUIDADO, CLUBES, COMUNITARIOS);
	t_institucion = record
		nombre_institucion, directivo_a_cargo: string[60];
		ubicacion: t_coordenadas;
		programa: t_programa;
		activo: boolean;
	end;
	
	t_archivo = file of t_institucion;
	
const MI_ARCHIVO = '.\Archivo_Comedores.DAT';

procedure crear(var archivo: t_archivo); //DONE
procedure abrir(var archivo: t_archivo); //DONE
procedure cerrar(var archivo: t_archivo); //DONE
procedure leer_registro(var archivo: t_archivo; pos: integer; var registro: t_institucion); //
procedure guardar_informacion(var archivo: t_archivo; posicion: integer; var registro: t_institucion);
procedure listar1(var archivo: t_archivo);
procedure mostrar_registro(registro: t_institucion); 
procedure cargar_registro(var archivo: t_archivo; var registro: t_institucion; posicion: integer);
procedure listar2 (var archivo: t_archivo; pos: integer); 
procedure orden_burbuja(var archivo: t_archivo);
procedure bbinaria(var archivo: t_archivo; buscado: t_programa; var posicion: longint); // Ver la cuestión de buscado
procedure borrar_registro(var archivo: t_archivo; pos_borrar: longint);
procedure mostrar_institucion_por_programa(var archivo: t_archivo; buscado: t_programa); 

implementation

procedure crear(var archivo: t_archivo);
begin
	assign(archivo, MI_ARCHIVO);
	rewrite(archivo);
end;

procedure abrir(var achivo: t_archivo);
begin
	assign(archivo, MI_ARCHIVO);
	reset(archivo);
end;

procedure cerrar (var achivo: t_archivo);
begin
	close(archivo);
end;

procedure leer_registro(var archivo: t_archivo; pos: integer; registro: t_institucion);
begin
	seek(archivo, posicion);
	read(archivo, registro);
end;

procedure guardar_registro(var archivo: t_archivo; pos: integer; registro: t_institucion);
begin
	seek(archivo, posicion);
	write(archivo, registro);
end;

procedure cargar_registro(var archivo: t_archivo; pos: integer; registro: t_institucion);
begin
	with registro do
		begin
			id_comedor := posicion;
			
			writeln('Ingrese el nombre del comedor: ');
			readln(nombre_institucion);
			writeln('Ingrese el nombre del Directivo a cargo: ');
			readln(directivo_a_cargo);
			writeln('Ingrese las coordenadas de la Institución: ');
			readln(ubicacion); // ESTO TENGO QUE ARREGLAR, UNA CUESTION DE LATITUD Y LONGITUD. NO CREO QUE SEA DIFICIL.
			writeln('Ingrese el Programa que otorga: ');
			readln(programa);
			writeln('Ingrese si se está activo actualmente: ');
			readln(activo);			
		end;
end;

procedure orden_burbuja(var archivo: t_archivo);
var r1, r2: t_institucion;
	lim, i, j: integer;
	
begin
	lim := filesize(archivo) -1;
	for i := 1 to lim do
	
	for j := 0 to lim -1 do
		begin
		
		end;
end;

end.
