# Índice
- Introducción, Motivación y Objetivos 
- [Público objetivo](#Público-objetivo)
- [Historias de usuario](#Historias-de-usuario)
- [Iteraciones](#Iteraciones)
- [Instalación](#Instalación)
	- [Desarrollo](##Versión-de-desarrollo)
	- [Producción](##Versión-de-producción)
- [Referencias](#Referencias)
- [Mockups](#Mockups)
- [Historial](#Historial)

---

Tareas por hacer

- [x] Revisar historias
- [x] Crear iteraciones
- [x] Numerar las historias
- [x] Indicar las historias / requisitos funcionales en las iteraciones
- [ ] Listar los requisitos no funcionales en limpio
- [ ] ---
- [x] Permitir conexiones 0.0.0.0
- [ ] Añadir admin a static
- [ ] Apache https
- [ ] ---
- [x] Redactar Introducción, Motivación y Objetivos
- [x] Buscar el estado del arte
- [x] Definir arquitectura
- [x] Mapa del sitio web (arbol)
- [x] Despliegue en VM
- [ ] Conclusiones
- [ ] Bibliografía

---

# Introducción, Motivación y Objetivos 

Debido a la importancia de las aplicaciones web en el ámbito del desarrollo de software, permitiendo ser accedidas desde la mayoría de dispositivos, en este proyecto se pretende crear una aplicación web utilizando las principales tecnologías front end (HTML, CSS y JS) y un framework como back end (Django).

Esta práctica se motiva por la necesidad de aprender a diseñar un proyecto web e implementarlo ya que requiere de conceptos realmente útiles para un ingeniero informático.

Los objetivos de este proyecto son:
- Realizar un análisis de requisitos y definir iteraciones
- Crear una aplicación web responsive siguiendo las iteraciones

# Estado del arte

Existen varias páginas web relacionadas con servicios de nutrición online como [Yo Elijo Cuidarme](https://sdo.yoelijocuidarme.es), [Carla Mi Nutricionista](https://carlaminutricionista.com) y [Ana Maté Dietista Nutricionista](https://anamatedietista.com). Éstas se centran en ofrecer un servicio completamente online e incluyen blogs con contenido educacional.

En este proyecto se propone una aplicación web como apoyo a las sesiones presenciales en vez de a sesiones online.

# Presentación de la propuesta

La propuesta se basa en la proporcionada por los profesores sobre un sistema de nutrición.

Se toman las siguientes consideraciones respecto a la propuesta proporcionada:
- Las consultas de los clientes con el nutricionista son presenciales.
- El objetivo del sistema es realizar un seguimiento de los clientes y generar dietas para ellos, las cuales podrán consultar.
- Los alimentos proporcionados se encuentran normalizados, es decir, todas las medidas se realizan sobre 100g, por lo que se tendrán que crear platos o raciones.

Un nutricionista con una clínica quiere un sistema de nutrición web para realizar el seguimiento de sus clientes, a los que les realiza consultas presenciales. 

# Arquitectura propuesta

La arquitectura propuesta se basa en una arquitectura web cliente-servidor, en la que el cliente se comunica con el servidor mediante HTTP.

## Servidor

El servidor (o backend) se desarrollará mediante el framework [Django](https://www.djangoproject.com/), el cuál es el más popular para el lenguaje [Python](https://www.python.org/). Esta elección se motiva por el conocimiento previo del autor y su popularidad. Este framework provee una arquitectura modelo-vista-controlador (MVC) y consta de funcionalidades como enrutamiento, ORM, plantillas y muchas otras funcionalidades que se pueden encontrar en otros frameworks de backend. Además, permite el uso de extensiones para ampliar sus funcionalidades. Las principales extensiones utilizadas son:

- [Django-htmx](https://github.com/adamchainz/django-htmx): conveniencia con la librería del frontend
- [Django-Rosetta](https://django-rosetta.readthedocs.io): interfaz para la internacionalización

## Cliente

El cliente (o frontend) se desarrollará mediante las plantillas ofrecidas por Django, las cuales extienden y generan HTML. CSS para los estilos con la ayuda de la popular librería [Bootstrap](https://getbootstrap.com/), la cuál reduce la necesidad de escribir hojas de estilos gracias a las clases predefinidas. Por último se utilizará JavaScript para ofrecer una interfaz más dinámica y algunas librerías como una extensión para algunas funcionalidades de Bootstrap, [Chart.js](https://www.chartjs.org/) para la creación de gráficos y [htmx](https://htmx.org). Esta última librería permite, principalmente, sustituir partes de la pagina web por HTML ofrecido por el servidor. 

> Posible diagrama de frontend <--> backend como el de SATD.

# Arquitectura de contenidos

Todos los usuarios:
Home -> Quienes somos
Home -> Contacto
Home -> Iniciar Sesión

Usuario registrado (cliente):
Iniciar Sesión -> Perfil
Iniciar Sesión -> Perfil -> Cerrar sesión (home)
Iniciar Sesión -> Perfil -> Dieta

Usuario administrador (dietista)
Iniciar Sesión -> Nutricionista
Iniciar Sesión -> Nutricionista -> Perfil cliente
Iniciar Sesión -> Nutricionista -> Perfil cliente -> Dietas cliente

> Iniciar Sesión -> Nutricionista -> CRUD Cliente 

# Ingeniería de requisitos
## Público objetivo

### Visitante / Anónimo

- Ver página de inicio, about me, contacto, etc.


### Cliente / Registrado

- Iniciar sesión
- Consultar dieta
- Consultar evolución
- ¿Añadir seguimiento?
- Contactar con el nutricionista

### Nutricionista / admin

- Iniciar sesión
- Gestionar clientes 
- Proveer nivel de actividad (nulo, moderado, elevado, intenso)
- Generar serie de alimentos para 5 comidas
- Gestionar alimentos
- Consultar histórico dietas
* Evolución del cliente
- Copiar y modificar dietas.

## Historias de usuario

Los criterios se validarán junto al usuario en pruebas de funcionalidad.

- 1. **Como** visitante **quiero** ver la pagina de inicio **para** informarme sobre el servicio
  - Criterios:
    - La página de inicio contiene información sobre el servicio
    - Permite acceder a una página de contacto
    - Permite acceder a una página de _about me_

- 2. **Como** visitante **quiero** contactar con el nutricionista **para** obtener más información y/o convertirme en cliente
  - Criterios:
    - La página de contacto proveerá información de contacto del nutricionista
    - También contendrá un correo electrónico con un "mailto:"

- 3. **Como** cliente o nutricionista **quiero** iniciar sesión **para** acceder al servicio
  - Criterios:
    - Todas las páginas accesibles sin iniciar sesión contendrán una manera de hacerlo.
    - Se podrá cerrar sesión desde esas páginas una vez iniciada.

- 4. **Como** cliente **quiero** consultar la dieta **para** alimentarme correctamente
  - Criterios:
    - La página del usuario contiene información sobre su dieta activa

- 5. **Como** cliente o nutricionista **quiero** consultar la evolución **para** comprobar si mejora
  - Criterios:
    - La página del usuario contiene información sobre su evolución

- 6. **Como** cliente **quiero** contactar con el nutricionista **para** consultar mis dudas
  - Prioridad: muy baja
  - Criterios:
    - O existe un formulario para comunicarse con el nutricionista
    - O se realiza todo por teléfono

- 7. **Como** nutricionista **quiero** gestionar clientes **para** dar de alta, dar de baja y modificar los datos de mis clientes 
  - Criterios:
    - Poder dar de alta clientes con su:
      - nombre
      - teléfono
      - peso
      - altura
      - correo
      - nivel de actividad
      - formula de calorías personalizada
    - Poder dar de baja a clientes
    - Poder modificar los datos de los clientes

- 8. **Como** nutricionista **quiero** generar series de alimentos para 5 las comidas del cliente **para** optimizar su ingesta de calorías
  - Criterios:
    - Poder generar una lista de alimentos basada en:
      - grasas
      - proteínas 
      - hidratos de carbono

- 9. **Como** nutricionista **quiero** gestionar los alimentos **para** crear, modificar las propiedades y eliminar alimentos.
  - Criterios:
    - Poder:
      - Crear
      - Modificar las propiedades
      - Y eliminar alimentos

- 10. **Como** nutricionista **quiero** ver dietas anteriores del cliente, copiar y modificar dietas **para** no tener que crearlas desde cero
  - Criterios:
    - Poder ver un historico de dietas del cliente
    - Copiar dietas
    - Modificar dietas

## Iteraciones

### Iteración 1

Implementar la página web base funcional que permita a los visitantes anónimos cumplir todas sus historias.

- Historias: 1, 2
- Crear plantilla base de la página
- Implementar página de inicio
- Implementar página about me
- Implementar página contacto

### Iteración 2

Implementar login, sesiones y autenticación para diferenciar los roles.

- Historias: 3
- Implementar pagina de login (o modal)
- Implementar botón de logout
- Crear la base para una página "home" personalizada dependiendo del rol

### Iteración 3 (Revisable) 

Implementar la CRUD de las dietas y el seguimiento

- Historias: 4, 5
- Implementar CRUD de dietas para el nutricionista (nutricionista)
- Implementar copia de dietas (nutricionista)
- Implementar consulta de dietas (cliente y nutricionista)
- Implementar seguimiento del cliente (cliente y nutricionista)
- Modificar la página "home" personalizada del rol con las nuevas funcionalidades
- Cargar los alimentos en la BBDD

### Iteración 4 (Revisable) 

- Historias 7, 9
Crear CRUD de los alimentos y de los usuarios (nutricionista)

- Implementar página de gestión de usuarios con posibilidad de CRUD
- Implementar página de gestión de alimentos con posibilidad de CRUD

### Iteración 5 (Revisable) 

A definir. ¿6, 8, 10?




Requisitos en sucio:

- bbdd
- web de gestion
- web de usuario
- api rest
- multi-idioma
- gráficas de evolución
- búsquedas autocompletadas
- calculo imc
- calculo % grasa corporal
- generar serie de alimentos para 5 comidas basado en ratios y restricciones
- catalogar alimentos
- dias excepcionales (opcional)
- modificación temporal (opcional)
- crear nuevas dietas y modificar las activas
- histórico de dietas y evoluciones
- copiar dietas
- calcular calorías necesarias
- variar formulas calorías

# Referencias

- [Django](https://www.djangoproject.com/)
- [htmx](https://htmx.org/)
- [Extensión django-htmx](https://django-htmx.readthedocs.io/)
- [Extensión django-debug-toolbar](https://django-debug-toolbar.readthedocs.io/)
- [Bootstrap](https://getbootstrap.com/)
- [Plantilla por Start Bootstrap](https://startbootstrap.com/template/modern-business)
- [Generador de personas](https://thispersondoesnotexist.com/)


# Anexo: Instalación

## Versión de desarrollo

1. Instalar python 3.12 y su modulo "venv"
2. Clonar el repositorio y entrar en su carpeta (git clone ...; cd ingeniería-web)
3. Crear un entorno virtual (python3.12 -m venv venv)
4. Activar el entorno virtual (source ./venv/bin/activate)
5. Instalar las dependencias (pip install -r requirements.txt)
6. Ejecutar el servidor de desarrollo (python manage.py runserver)


## Versión de producción

1. Instalar python, dev, apache, dev, mod_wsgi
2. Clonar el repositorio y entrar en su carpeta (git clone ...; cd ingeniería-web)
3. Crear un entorno virtual (python3.12 -m venv venv)
4. Activar el entorno virtual (source ./venv/bin/activate)
5. Instalar las dependencias (pip install -r requirements.txt)
6. Dar permisos a la base de datos y al directorio (chmod o+w ...)
7. Recolectar todos los static (python manage.py collectstatic)
8. Configurar apache con la ruta de la aplicación
9. Reiniciar apache

Fuente: [django](https://docs.djangoproject.com/en/5.0/howto/deployment/wsgi/modwsgi/)


# Anexo: Mockups

## Cliente

### Perfil

```
contexto: Alice (cliente) logueada
url: /profile
-------------------------------------------------------------------
NutriBalance              Home Quienes Somos Contacto    Alice v 
-------------------------------------------------------------------

Alice Martinez


Dieta hoy:              |       Dieta mañana:               
- Desayuno:             |       - Desayuno:              
  - huevo frito         |         - huevo frito          
- Almuerzo:             |       - Almuerzo:              
  - Lomo embuchado     |         - Lomo embuchado      
- Comida:               |       - Comida:                
  - Lentejas           |         - Lentejas            
  - Yogur               |         - Yogur                
- Merienda:             |       - Merienda:              
  - Mandarina           |         - Mandarina            
- Cena:                 |       - Cena:                  
  - Judias verdes       |         - Judias verdes        


[Consultar detalles de la dieta *to: /dieta*]

Evolución

[*campo numerico* kg]  [Añadir peso de hoy] 
*si se ha añadido:*
[*campo numerico* 70kg]  [Actualizar peso de hoy] 


kg
|
|
|
| ____
|     \_____                    __
|           \__________________/
| 
+----------------------------------- dia

-------------------------------------------------------------------
Copyright © Diego Sanz - 2023   GitHub · Privacy · Terms · Contact
-------------------------------------------------------------------
```

### Dieta

```
contexto: Alice (cliente) logueada
url: /dieta
-------------------------------------------------------------------
NutriBalance               Home Quienes Somos Contacto    Bob v 
-------------------------------------------------------------------

Seleccionar día: [<] [*datepicker limitado, default: hoy*] [>]

Dieta:

calorías: 1875/2000 kcal
proteínas: 123g
hidratos: 3g
grasas: 12g

|                | uds | g   | calorías | proteínas | hidratos | grasas |
|:-------------- | --- | --- | -------- | --------- | -------- | ------ |
| Desayuno:      | -   | -   | -        | -         | -        | -      |
| huevo frito    | 1   | 450 | 95       | 15        | 0.4      | 4      |
| Almuerzo:      |     |     |          |           |          |        |
| Lomo embuchado | 10  | 45  | 95       | 15        | 0.4      | 4      |
| Comida         | -   | -   | -        | -         | -        | -      |
| Lentejas       | 1   | 450 | 95       | 15        | 0.4      | 4      |
| yogur          | 1   | 450 | 95       | 15        | 0.4      | 4      |
| Merienda       | -   | -   | -        | -         | -        | -      |
| mandarina      | 1   | 450 | 95       | 15        | 0.4      | 4      |
| cena           | -   | -   | -        | -         | -        | -      |
| judías verdes  | 1   | 450 | 95       | 15        | 0.4      | 4      |


-------------------------------------------------------------------
Copyright © Diego Sanz - 2023   GitHub · Privacy · Terms · Contact
-------------------------------------------------------------------
```

## Nutricionista

### Home nutricionista

```
contexto: Bob (nutricionista) logueado
url: /nutricionist 
-------------------------------------------------------------------
NutriBalance               Home Quienes Somos Contacto    Bob v 
-------------------------------------------------------------------

[*desplegable clientes*]
|----------------------|
| Alice Martinez       |
+----------------------+

-------------------------------------------------------------------
Copyright © Diego Sanz - 2023   GitHub · Privacy · Terms · Contact
-------------------------------------------------------------------
```

### Perfil cliente

```
contexto: Bob (nutricionista) logueado
url: /client/1 (id de alice)
-------------------------------------------------------------------
NutriBalance               Home Quienes Somos Contacto    Bob v 
-------------------------------------------------------------------

Alice Martinez

[Gestionar dieta *to:/dieta/1] [Actualizar cáclulo de calorías *to:modal*]

Dieta hoy:              |       Dieta mañana:               
- Desayuno:             |       - Desayuno:              
  - huevo frito         |         - huevo frito          
- Almuerzo:             |       - Almuerzo:              
  - Lomo embuchado     |         - Lomo embuchado      
- Comida:               |       - Comida:                
  - Lentejas           |         - Lentejas            
  - Yogur               |         - Yogur                
- Merienda:             |       - Merienda:              
  - Mandarina           |         - Mandarina            
- Cena:                 |       - Cena:                  
  - Judias verdes       |         - Judias verdes        


Evolución

kg
|
|
|
| ____
|     \_____                    __
|           \__________________/
| 
+----------------------------------- dia



-------------------------------------------------------------------
Copyright © Diego Sanz - 2023   GitHub · Privacy · Terms · Contact
-------------------------------------------------------------------
```

### Dieta cliente

```
contexto: Bob (nutricionista) logueado
url: /dieta/4 (id de dieta de alice)
-------------------------------------------------------------------
NutriBalance              Home Quienes Somos Contacto    Bob v 
-------------------------------------------------------------------

Alice Martinez

Historial de dietas: [ normal *dropdown*  v]
                     |---------------------|
                     | 1 - hipocalorica    |
                     | 2 - hipercalorica   |
                     | 4 - normal (actual) |
                     +---------------------+

Fecha inicio: 11/11/11
*si* Fecha finalización: 11/11/12



*si dieta=actual*
Seleccionar día: [<] [*datepicker limitado, default: hoy*] [>]

Dieta:

calorías: 1875/2000 kcal
proteínas: 123g
hidratos: 3g
grasas: 12g

|                | uds | g   | calorías | proteínas | hidratos | grasas |
|:-------------- | --- | --- | -------- | --------- | -------- | ------ |
| Desayuno:      | -   | -   | -        | -         | -        | -      |
| huevo frito    | 1   | 450 | 95       | 15        | 0.4      | 4      |
| Almuerzo:      |     |     |          |           |          |        |
| Lomo embuchado | 10  | 45  | 95       | 15        | 0.4      | 4      |
| Comida         | -   | -   | -        | -         | -        | -      |
| Lentejas       | 1   | 450 | 95       | 15        | 0.4      | 4      |
| yogur          | 1   | 450 | 95       | 15        | 0.4      | 4      |
| Merienda       | -   | -   | -        | -         | -        | -      |
| mandarina      | 1   | 450 | 95       | 15        | 0.4      | 4      |
| cena           | -   | -   | -        | -         | -        | -      |
| judías verdes  | 1   | 450 | 95       | 15        | 0.4      | 4      |


-------------------------------------------------------------------
Copyright © Diego Sanz - 2023   GitHub · Privacy · Terms · Contact
-------------------------------------------------------------------
```

---

# Anexo: Historial

20/12/23

- Creación del proyecto Django
- Prueba de la plantilla bs
- Configuración contenido static
- Extensión htmx

21/12/23

- Soporte de traducción estática

22/12/23

- Creación de la plantilla base
- Importación de la pagina de contacto de la plantilla
- htmx boosting
- htmx formularios
- Validación de formularios bs + htmx

29/12/23

- Numerar las historias
- Añadir la numeración de las historias a las iteraciones
- Personalizar el home
- Personalizar la página de contacto (sin funcionalidad)
- Importación de la pagina de _about_ de la plantilla

30/12/23

- Personalizar la pagina de _about_
- Despliegue en apache de la iteración 1
- Implementación del sistema de login

31/12/23

- Editar pagina login cuando se está logeado (¿redireccion en un futuro?)
- Añadir grupos
- Redirección a proto-pagina home por grupo 
- Ampliación about me
- Ampliacion contacto

2/1/24

- Desplegar iteración 2
- Añadir extensión django-admin-panel
- Empezar con los alimentos
- Mockups de:
  - /profile
  - /profile/id
  - /dieta
  - /dieta/id
  - /nutricionist
- Collect static
- Desplegar mockups

3/1/24

- Importar chart.js
- Mockups profile y nutricionist a plantillas

4/1/24
- Mockup diet a plantilla con paginación
- Reunion meet

to do:
- CRUD Usuarios
- Refactorizar urls.py
- Acercarse más a la plantilla
- arreglar formulario de contacto

calculo de comidas:
- Seleccionar platos aceptados 
- Catalogar alimentos aceptados 
- Mostrar calorías objetivo en cal y tipo en %
- Boton de cambiar alimento / comida
