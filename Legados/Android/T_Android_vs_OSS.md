---
version: "1"
title: Android Open Source
subtitle: Sistemas legados. Trabajo temático
author: Diego Sanz Fuertes | 825015
date: 17 de Enero de 2024
toc: true
toc-own-page: true
lang: es-ES
table-use-row-colors: false
header-left: "![](eupt.png){width=5cm}"
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

\pagebreak


# Introducción

Android es el sistema operativo para dispositivos móviles más utilizado actualmente. Según datos de la consultora de tecnología IDC, los dispositivos Android representaron algo más del 84% de las unidades enviadas en 2020, iOS representando el resto.

![Gráfico cuota de mercado. Fuente: statista.](Android%20cuota.png){height=65%}

En 2019, EE.UU. incluyo a varias empresas chinas, entre ellas Huawei en su "lista negra" provocando un veto comercial general, repercutiendo, entre otras, a las licencias de Android de Google y Windows de Microsoft, impidiendo actualizaciones de software a cualquier dispositivo Huawei y la prohibición del uso de los Servicios Móviles de Google en sus dispositivos móviles, indispensables para el uso normal de Android.

# Qué es Android

Android Inc. fue fundada por Andy Rubin, Rich Miner, Nick Sears y Chris White en 2003 para desarrollar un sistema operativo para camaras digitales. A finales de 2004, se descartó esa idea para centrarse en un sistema operativo para dispositivos móviles, rivalizando con Symbian y Windows Mobile. La empresa fue comprada en el 2010 por Google, manteniendo a los fundadores como empleados.

Android es un sistema operativo móvil basado en una versión modificada del kernel de Linux, diseñado para dispositivos táctiles y desarrollado principalmente por Google. 

La base de Android, Android Open Source Project (AOSP) es software libre y de código abierto (FOSS). La mayoría de los dispositivos utiliza una versión propietaria de Android desarrollada por Google que contiene software de código cerrado, como por ejemplo Google Mobile Services (GMS), que incluye, entre otros, la Google Play Store, Google Chrome y Google Play Services.

![Pilaa de Android.](Android%20Stack.png){height=65%}

![Arquitectura de GKI (Generic Kernel Image).](Android%20Arquitectura%20GKI.png)

# Qué es software de código abierto

El software de código abierto (OSS) es aquel que ofrece acceso su código fuente y, según la Open Source Initiative, debe de cumplir con otros 10 criterios en su licencia, lo que hace que sea compatible con la definición de software libre.

El concepto de software libre lo acuñó Richard Stallman, fundador de la Free Software Foundation (FSF) y escritor del Manifiesto GNU. Un software es libre cuando se garantizan las siguientes libertades:

- Libertad 0: La libertad de usar el programa, con cualquier propósito (uso).
- Libertad 1: La libertad de estudiar cómo funciona el programa y modificarlo, adaptándolo a las propias necesidades (estudio).
- Libertad 2: La libertad de distribuir copias del programa, con lo cual se puede ayudar a otros usuarios (distribución).
- Libertad 3: La libertad de mejorar el programa y hacer públicas esas mejoras a los demás, de modo que toda la comunidad se beneficie (mejora).

![Logo de Free Software Foundation y Open Source Initiative.](Android%20FSF%20OSI.webp)

La única diferencia entre los dos términos es el punto de vista: el software de código abierto se enfoca en las ventajas técnicas de este modelo y el software libre se centra en las libertades filosóficas que se les ofrecen a los usuarios. El término utilizado para referirse a los dos indistintamente es FOSS (Free and Open Source Software).

Según estas definiciones programas como pueden ser Unreal Engine o Aseprite no se considerarían OSS aunque ofrezcan su código fuente ya que la licencia no permite todas las libertades.

# Licencias en Android

Android se encuentra licenciado principalmente bajo dos licencias:

- Apache 2.0 (y similares como MIT y BSD): Esta es la licencia escogida para el desarrollo del userspace (la parte del sistema operativo que no es kernel). En este caso se puede observar como se ha escogido una licencia desde el punto de vista OSS, su propósito siendo promover la adopción de software de Android y su entorno colaborativo. 
- GPLv2: Esta esta es la licencia bajo la que se encuentra el kernel de Linux. Tiene una propiedad conocida como copyleft, descrita en el Manifiesto GNU, la cual no permite que las modificaciones de código bajo esa licencia se distribuyan bajo otra licencia. En contraste con Apache 2.0 que sí que lo permite. Esta licencia se considera libre ya que su motivación se basa en las libertades filosóficas. CC BY-SA es una licencia similar. Todos los parches que se realizan para modificar Linux han de distribuirse bajo GPLv2.

Además de adherirse a las licencias, los contribuyentes han de firmar un acuerdo para su protección como contribuyentes y la protección del proyecto; sin cambiar los derechos sobre las contribuciones.

Una lectura muy interesante publicada por Richard Stallman sobre la libertad de los usuarios en android se puede encontrar en el siguiente [link: https://www.gnu.org/philosophy/android-and-users-freedom.en.html](https://www.gnu.org/philosophy/android-and-users-freedom.en.html).

# Google Mobile Services

La mayoría de dispositivos móviles que utilizan Android también incluyen otro software propietario de Google, conocido como Google Mobile Services (GMS). Esta colección de aplicaciones y APIs no está incluida en AOSP y requiere de que los fabricantes de dispositivos obtengan una licencia para incluirla. Algunas de sus aplicaciones son Google Search, Google Chrome, YouTube y Gmail. Y algunas de sus APIs son Google Play Services, Google Sing-in y Google Play Protect. 

![Ejemplos de GMS.](Android%20GMS.png)

Esto hace que un dispositivo con AOSP y sin GMS es incapaz de realizar tareas básicas como realizar fotografías o llamar por teléfono ya que no incluye aplicaciones para esto y cada vez más, Google retira el soporte de las aplicaciones incluidas en AOSP. 

#  Casos de Android sin GMS

En el mercado se pueden encontrar dispositivos con AOSP sin los servicios de Google. El más famoso hasta que EE.UU. vetó a Huawei era Amazon, con sus tablets Fire que incluían aplicaciones y servicios de Amazon en vez de Google, y con Fire TV (dispositivos de streaming) también utilizando AOSP como base.

El veto que impuso EE.UU. a Huawei el 15 de mayo del 2019, restringió la capacidad de empresas estadounidenses de hacer negocios con esta empresa y sus afiliados sin permiso del gobierno. Ya que los GMS requieren de ser licenciados por Google (empresa estadounidenses), Huawei dejó de poder utilizar Android con estos servicios. Esto hace que, aunque gran parte de las aplicaciones existentes se puedan seguir instalando desde fuera de la Google Play Store, existe una parte que, al requerir de los GMS, no funciona. 

Huawei anunció HarmonyOS, otro sistema operativo basado en AOSP con sus propios servicios y, posteriormente, HarmonyOS Next que ya diverge de AOSP y no permitirá la instalación de aplicaciones para Android.

Gracias a que AOSP es de código abierto, existe una comunidad de desarrolladores que se dedica a realizar modificaciones y publicar versiones personalizadas (conocidas como ROMs) de Android. Algunas de las mas famosas son LineageOS (formalmente CyanogenMod), Resurrection Remix y Graphene OS, ninguna de las cuales incluye GMS incluido por defecto (por motivos legales y/o filosóficos).

![Diagrama de la plataforma AOSP.](Android%20AOSP%20Tree.png)

Se pueden encontrar aplicaciones FOSS a traves de [F-Droid](https://f-droid.org/en/), un catalogo de aplicaciones para Android o a través del repositorio [offa/android-foss](https://github.com/offa/android-foss).

\pagebreak

# Conclusiones

\pagebreak

# Referencias

- https://opensource.org/osd/
- https://source.android.com/docs/
- https://source.android.com/docs/setup/about/licenses
- https://source.android.com/docs/setup/about/faqs
- https://en.wikipedia.org/wiki/Android_(operating_system)
- https://es.wikipedia.org/wiki/Software_libre
- https://en.wikipedia.org/wiki/Mobile_operating_system#Android
- https://en.wikipedia.org/wiki/Comparison_of_free_and_open-source_software_licenses
- https://en.wikipedia.org/wiki/Google_Mobile_Services
- https://es.wikipedia.org/wiki/Crisis_de_Huawei
- https://www.gnu.org/philosophy/android-and-users-freedom.en.html
- https://www.gnu.org/philosophy/free-sw.es.html#four-freedoms
- https://www.gnu.org/licenses/copyleft.en.html
- https://github.com/offa/android-foss
- https://f-droid.org/en/
- https://es.statista.com/grafico/18920/cuota-de-mercado-mundial-de-smartphones-por-sistema-operativo/