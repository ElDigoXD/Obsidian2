---
version: "1"
title: Ingeniería Inversa
subtitle: SL. Práctica 2
author: Diego Sanz Fuertes | 825015
date: 27 de Octubre de 2023
toc: true
toc-own-page: true
header-left: "![](eupt.png){width=5cm}"
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

# Resumen ejecutivo


# Introducción

En esta práctica se pretende modificar una aplicación protegida para que pueda ser ejecutada sin su clave hardware. No se conoce el sistema operativo ni la arquitectura para los que fue desarrollada. 

El objetivo es modificar el ejecutable binario para que pueda ser ejecutado sin problemas mediante varias técnicas de ingeniería inversa.

# Herramientas utilizadas

Para la realización de esta práctica se han utilizado las siguientes herramientas:
+ Desensambladores:
	+ [Ghidra](https://ghidra-sre.org/)
		+ Script [Noop This S\*\*t](https://github.com/nullteilerfrei/reversing-class/blob/master/scripts/java/NopThisShit.java)
	+ [Binary ninja demo](https://binary.ninja/)
	+ [IDA Free](https://hex-rays.com/ida-free/)
	+ [Radare](https://www.radare.org/n/radare2.html) / [iaito](https://www.radare.org/n/iaito.html)
	+ [Cutter](https://cutter.re/) / [Rizin](https://rizin.re/)
+ Otras herramientas:
	+ file
	+ strings
	+ ltrace
	+ [lurk](https://github.com/JakWai01/lurk) (alternativa a strace)

Las herramientas utilizadas para la realización de la memoria han sido [Obsidian](https://obsidian.md/) y [pandoc](https://pandoc.org/).
# Paso 1: Análisis preliminar del binario

Antes de poder ser ejecutado, se necesita conocer la plataforma para la que el binario fue compilado. La manera mas sencilla para comprobar el tipo de un archivo es mediante la herramienta `file`:

```
$ file legado_original

legado_original: ELF 64-bit LSB pie executable, 
x86-64, version 1 (SYSV), dynamically linked, 
interpreter /lib64/ld-linux-x86-64.so.2, 
for GNU/Linux 3.2.0, 
BuildID[sha1]=9ac025a5231d0f6eb4e0e43922632967340fe7a5, 
stripped
```

Gracias a la salida de esta herramienta se puede observar que, entre otra información, es un archivo ELF (Executable and Linking Format), el formato de los binarios estándar en Linux. También se indica que la arquitectura para la que fue compilado es x86-64, la más común en los ordenadores personales.

Otra herramienta con la que se puede obtener información a partir de un binario es `strings`, que lista las cadenas de caracteres que se encuentran en el archivo. Algunas de las más relevantes han sido:

```
$ strings legado_original --encoding S # utf-8

...
ls -l %s
Stocks v 3.03
clear
Opción:
GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
...
```

Entre las cadenas se encuentran nombres de llamadas al sistema, funciones internas de linux y los nombres de las secciones del ELF. Las cadenas mas relevantes ofrecen información que ha muy útil en los siguientes pasos.

# Paso 2: Ejecución del programa

Una vez obtenida la información sobre el programa, se puede intentar ejecutar el binario: 

```
$ ./legado_original

Stocks v 3.03
Error de permisos de ejecución
```

Al ejecutarlo se muestra la cadena previamente descubierta `Stocks v 3.03` y una cadena desconocida `Error de permisos de ejecución` por lo que se puede deducir que existe ofuscación en el programa. El código de retorno ha sido -1 por lo que la ejecución no ha terminado satisfactoriamente, como era esperable. También se ha intentado ejecutar como usuario root siguiendo el mensaje de error, obteniendo el mismo resultado. Como ultima prueba de ejecución, se le han otorgado todos los permisos mediante `chmod 777 legado_original` sin éxito.

# Paso 3: Exploración del código

Para comprender como funciona el programa y las comprobaciones de la clave hardware se ha desensamblado el código. Se han probado las diferentes herramientas listadas en la sección de [[#herramientas utilizadas]] y los problemas encontrados con ellas en [[#problemas encontrados]]. En esta sección se explica el uso de el desensamblador ghidra para explorar el código y en la siguiente sección se modificará el programa con dicha herramienta.

Ghidra es una suite de herramientas para ingeniería inversa de código libre desarrollada por la NSA. Soporta multiples arquitecturas y plataformas. En esta practica se ha utilizado para un ejecutable para x64 y Linux.



# Paso 4: Parcheo del programa



# Problemas encontrados

Algunos de los problemas encontrados han sido los siguientes:
+ El desconocimiento de los desensambladores, tanto el como utilizarlos como el sobrestimar sus capacidades. Esto ha causado frustración y ha llevado tiempo probar las diferentes herramientas para comprobar sus funcionalidades y decidir cuál utilizar principalmente.
+ No se ha conseguido depurar instrucción por instrucción mediante un desensamblador. Se ha intentado mediante gdb, lldb y/o frida en las diferentes herramientas tanto en local como en remoto, desde linux nativo y WSL sin éxito.
+ Ninguno de los desensambladores permitía decompilar a código en C compilable, IDA Free lo permitía función a función, pero la calidad del código generado era muy baja. Leyendo algunas opiniones, IDA Pro es la única herramienta que exporta el programa completo a lenguaje compilable, pero es de pago. 

# Conclusiones


# Referencias

