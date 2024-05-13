{
   unitArchivos.pas
   
   Copyright 2024 Jorge <jorge@jorge-C14C>
   
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
   MA 02110-1301, USA.
   
   
}


unit unitArchivos;

interface
uses crt;

type
	t_coordenadas = record
		latitud = real
		longitud = real
	end;
	
	t_institucion = record
		nombre_institucion, directivo_a_cargo = string[60];
		domicio = t_coordenadas;
		activo = boolean;
	end;
	
	t_archivo = file of t_institucion;
	
	procedure crear(var archivo: t_archivo);
	
	
	
	
		
	
	
