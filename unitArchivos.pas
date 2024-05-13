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

procedure crear(var archivo: t_archivo);
procedure abrir(var archivo: t_archivo);
procedure cerrar(var archivo: t_archivo);
procedure leer_registro(var archivo: t_archivo; pos: integer; var registro: t_institucion);
procedure guardar_informacion(var archivo: t_archivo; posicion: integer; var registro: t_institucion);
procedure listar1(var archivo: t_archivo);
procedure mostrar_registro(registro: t_institucion); // Agregué el punto y coma faltante al final
procedure cargar_registro(var archivo: t_archivo; var registro: t_institucion; posicion: integer);
procedure listar2 (var archivo: t_archivo; pos: integer); // Corregí el nombre del parámetro
procedure orden_burbuja(var archivo: t_archivo);
procedure bbinaria(var archivo: t_archivo; buscado: t_programa; var posicion: longint); // Cambié el tipo de buscado
procedure borrar_registro(var archivo: t_archivo; pos_borrar: longint);
procedure mostrar_institucion_por_programa(var archivo: t_archivo; buscado: t_programa); // Agregué el punto y coma faltante al final

implementation

// Aquí van las implementaciones de los procedimientos y funciones definidos arriba

end.
