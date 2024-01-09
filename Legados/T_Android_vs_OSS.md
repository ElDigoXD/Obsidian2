---
version: "1"
title: Modificación de COBOL Legado
subtitle: SL. Práctica 1
author: Diego Sanz Fuertes | 825015
date: 20 de Octubre de 2023
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

# Qué es Android

Android Inc. fue fundada por Andy Rubin, Rich Miner, Nick Sears y Chris White en 2003 para desarrollar un sistema operativo para camaras digitales. A finales de 2004, se descartó esa idea para centrarse en un sistema operativo para dispositivos móviles, rivalizando con Symbian y Windows Mobile. La empresa fue comprada posteriormente por Google, manteniendo a los fundadores como empleados.

Android es un sistema operativo móvil basado en una versión modificada de Linux, diseñado para dispositivos táctiles y desarrollado principalmente por Google. 

La base de Android, Android Open Source Project (AOSP) es software libre y de código abierto (FOSS). La mayoría de los dispositivos utiliza una versión propietaria de Android desarrollada por Google que contiene software de código cerrado, como por ejemplo Google Mobile Services (GMS), que incluye, entre otros, la Google Play Store, Google Chrome y Google Play Services.

# Qué es software de código abierto

El software de código abierto (OSS) es aquel que ofrece acceso su código fuente y, según la Open Source Initiative, debe de cumplir con otros 10 criterios en su licencia, lo que hace que sea compatible con la definición de software libre.

El concepto de software libre lo acuñó Richard Stallman, fundador de la Free Software Fundation (FSF) y escritor del Manifiesto GNU. Un software es libre cuando se garantizan las siguientes libertades:

- Libertad 0: La libertad de usar el programa, con cualquier propósito (uso).
- Libertad 1: La libertad de estudiar cómo funciona el programa y modificarlo, adaptándolo a las propias necesidades (estudio).
- Libertad 2: La libertad de distribuir copias del programa, con lo cual se puede ayudar a otros usuarios (distribución).
- Libertad 3: La libertad de mejorar el programa y hacer públicas esas mejoras a los demás, de modo que toda la comunidad se beneficie (mejora).

La única diferencia entre los dos términos es el punto de vista: el software de código abierto se enfoca en las ventajas técnicas de este modelo y el software libre se centra en las libertades filosóficas que se les ofrecen a los usuarios. El termino utilizado para referirse a los dos indistintamente es FOSS (Free and Open Source Software).

Según estas definiciones programas como pueden ser Unreal Engine o Aseprite no se considerarían OSS aunque ofrezcan su código fuente ya que la licencia no permite todas las libertades.

# Licencias en Android

Android se encuentra licenciado principalmente bajo dos licencias:

- Apache 2.0 (y similares como MIT y BSD): Esta es la licencia escogida para el desarrollo del userspace (la parte del sistema operativo que no es kernel). En este caso se puede observar como se ha escogido una licencia desde el punto de vista OSS, su propósito siendo promover la adopción de software de Android y su entorno colaborativo. 
- GPLv2: Esta esta es la licencia bajo la que se encuentra el kernel de Linux. Tiene una propiedad conocida como copyleft, descrita en el Manifiesto GNU, la cuál no permite que las modificaciones de código bajo esa licencia se distribuyan bajo otra licencia. En contraste con Apache 2.0 que si que lo permite. Esta licencia se considera libre ya que su motivación se basa en las libertades filosóficas. CC BY-SA es una licencia similar. Todos los parches que se realizan para modificar Linux han de distribuirse bajo GPLv2.

Además de adherirse a las licencias, los contribuyentes han de firmar un acuerdo para su protección como contribuyentes y la protección del proyecto; sin cambiar los derechos sobre las contribuciones.

# Google Mobile Services
- API propietaria, firmas de google, alternativas (microG)



#  Casos de Android sin Google
- Huawei, Amazon fire, ROMs personalizadas, aplicaciones foss

# Conclusiones
# Referencias
https://opensource.org/osd/
https://source.android.com/docs/
https://source.android.com/docs/setup/about/licenses
https://source.android.com/docs/setup/about/faqs
https://en.wikipedia.org/wiki/Android_(operating_system)
https://es.wikipedia.org/wiki/Software_libre
https://en.wikipedia.org/wiki/Mobile_operating_system#Android
https://en.wikipedia.org/wiki/Comparison_of_free_and_open-source_software_licenses
https://www.gnu.org/philosophy/android-and-users-freedom.en.html
https://www.gnu.org/philosophy/free-sw.es.html#four-freedoms
https://www.gnu.org/licenses/copyleft.en.html
https://github.com/offa/android-foss