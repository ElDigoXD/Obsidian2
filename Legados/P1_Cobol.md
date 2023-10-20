---
version: "1"
title: Modificación de Cobol Legado
subtitle: SL. Práctica 1
author: Diego Sanz Fuertes | 825015
date: 20 de Octubre de 2023
toc: true
toc-own-page: true
#header-left: "![](eupt.png){width=5cm}"
lang: es-ES
table-use-row-colors: false

titlepage: true
output:
  pdf:
    template: eisvogel
    output: output.pdf
    from: markdown
    listings: true
    citeproc: true
  # html:
  #   output: output.html

#header-includes: |
#  \renewcommand\spanishtablename{Tabla}
---

# Práctica 1: Modificación de Cobol Legado

## Resumen ejecutivo

## Introducción

En esta práctica se pretende modificar una aplicación para la gestión de recursos humanos desarrollada en el lenguaje Cobol. Las modificaciones requeridas son las siguientes:

+ Migrar el código de dialecto desconocido a GnuCOBOL.
+ Sustituir la interfaz de usuario por una que utilize formularios mediante `SCREEN SECTION`.
+ Añadir la funcionalidad de dar de baja a los empleados.

## Parte 1: Migración del código

El desarrollo de esta práctica se ha llevado a cabo en Arch Linux con la versión 3.2.0 de GnuCOBOL.

El archivo fuente proporcionado para la práctica no compilaba sin realizar ninguna modificación, por lo que se ha utilizado el compilador para guiar la migración.

El primer error indica un fallo en la sintaxis de la directiva `DISPLAY`. Mediante el uso de la [documentación oficial](https://gnucobol.sourceforge.io/faq/master.html) se ha desarrollado un script en python para sustituir las sentencias incorrectas mediante expresiones regulares a sentencias siguiendo la documentación. 

Para corregir todos los errores dados por las directivas `DISPLAY` y `ACCEPT` las cuales son muy similares se han utilizado las siguientes sustituciones:

+ Para limpiar toda la pantalla: 

```python
line = re.sub(r"DISPLAY ?\(.*\) ?ERASE", "DISPLAY \" \" AT 0101 ERASE EOS", line)
```

+ Para escribir `DISPLAY` en una sola linea:

```python
if re.search(r"DISPLAY ?\(.*\)\n", line):
	line = line + file.readline().lstrip()
```

+ Para colocar la fila y columna en la posición correcta:

```python
line = re.sub(r"DISPLAY ?\((.*)\) ?\n?(.*)\.", r"DISPLAY \2 AT \1.", line)
line = re.sub(r"DISPLAY ?\((.*)\) ?\n?(.*)", r"DISPLAY \2 AT \1.", line)

line = re.sub(r"ACCEPT ?\((.*)\) ?(.*)\.", r"ACCEPT \2 AT \1.", line)
```

+ Para separar varios valores en un `DISPLAY` a varios `DISPLAY`s porque no acepta más de 1 valor por directiva:

```python
if match := re.search(r"DISPLAY ? \"(.*)\" (.*) AT (.*) (.*)\.", line):
	a = (f"           DISPLAY \"{match[1]}\" AT {match[3]} {match[4]}.\n")
	a = re.sub(r"AT (\d\d) (\d\d)", r"AT \1\2", a)
	a = re.sub(r"AT (\d\d) (\d)", r"AT \g<1>0\2", a)
	a = re.sub(r"AT (\d) (\d\d)", r"AT 0\1\2", a)
	a = re.sub(r"AT (\d) (\d)", r"AT 0\g<1>0\2", a)
	outfile.write(a)
	line = (
	  f"DISPLAY {match[2]} AT {match[3]} {int(match[4])+ 1 +len(match[1])}.\n")
```

+ Para evitar sobrescribir con `ACCEPT` la primera linea:

```python
line = re.sub(r"ACCEPT (\w+)", r"ACCEPT \1 AT 0201", line)
```

+ Para sustituir la fila y columna por el formato en 4 cifras FFCC:

```python
line = re.sub(r"AT (\d\d) (\d\d)", r"AT \1\2", line)
line = re.sub(r"AT (\d\d) (\d)", r"AT \g<1>0\2", line)
line = re.sub(r"AT (\d) (\d\d)", r"AT 0\1\2", line)
line = re.sub(r"AT (\d) (\d)", r"AT 0\g<1>0\2", line)
```

Una vez arregladas las directivas `DISPLAY` y `ACCEPT` el compilador indica que los bloques `PROGRAM` no terminan. Al inspeccionar el código se ha detectado la necesidad de terminar el bloque mediante `END PROGRAM`. El cambio se ha llevado a cabo en el script de python para poder hacer el código original compilable de una manera automatizada que permite iterar en el proceso, en este caso, tres versiones del script.

```python
current_program: str | None = None
while line := old.readline():
	...
	if line.lstrip().startswith("IDENTIFICATION DIVISION."):
		if current_program is not None:
			new.write(f"       END PROGRAM {current_program}")
			current_program = None
	elif line.lstrip().startswith("PROGRAM-ID."):
		current_program = line.lstrip().split(' ')[1]

	new.write(line)

if current_program is not None:
	new.write(f"       END PROGRAM {current_program}")
```

Una vez realizados todos estos cambios, el código ha podido ser compilado y ejecutado.

## Parte 2: Interfaz de usuario 




## Conclusiones

## Referencias