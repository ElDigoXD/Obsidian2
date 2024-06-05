
## 1. Introducción y objetivos

> En este apartado se establecerá el contexto y la motivación del trabajo, explicando la importancia de la síntesis de hologramas digitales generados por computador (CGHs) y el papel del trazado de rayos en el proceso. También se definirán los objetivos del TFG, incluyendo la creación de escenas sintéticas, la creación de un trazador de rayos clásico, su adaptación para generar hologramas y la propagación del frente de ondas para validar los resultados.

## 2. Estado del arte

## 3. Proceso de síntesis de escenas virtuales en 3D mediante hologramas digitales

En este apartado se detallará el proceso de síntesis, dividido en tres secciones:

### 3.1. Definición de la escena virtual

El primer paso para la síntesis de escenas virtuales consiste en definir la escena que se desea producir. La escena contará con tres tipos de componentes:

#### 3.1.1. Geometría

La geometría de la escena se definirá mediante primitivas definidas matemáticamente. Estas primitivas son: triángulos, definidos mediante la posición espacial de sus vértices; y esferas, definidas mediante su radio y la posición espacial de su centro. 

Utilizando la primitiva del triángulo se pueden representar mallas, definidas por una lista de triángulos. El soporte de mallas resulta muy útil ya que la mayoría de modelos 3D se encuentra en este formato. Para la importación de las mallas se ha utilizado la librería "tinyobjloader", la cual permite cargar archivos OBJ y extraer los vertices de sus triángulos.

> Imagen de esfera {c r}, y triangulo {a b c}

#### 3.1.2. Textura

Una vez definida la geometría de la escena, es necesario aplicar texturas a las primitivas. Las texturas que se han utilizado no siguen el significado tradicional de imágenes bidimensionales mapeadas sobre la superficie de la geometría, si no que se emplean distintos tipos de materiales, detallados a continuación:

1. Material difuso (lambertiano): Este material dispersa la luz siguiendo una distribución independiente al ángulo de incidencia y proporcional al coseno del ángulo formado entre la normal de la superficie y la dirección de dispersión. Esta distribución viene dada por la ley del coseno de Lambert. El color y la intensidad de la luz se ven modificados por el color (o albedo) del material. Este material podría describirse como mate.
2. Material metálico: Al contrario que el material difuso, el material metálico refleja la luz en el mismo ángulo en dirección opuesta respecto al ángulo de incidencia. Este efecto produce un reflejo de la misma manera que un espejo. Este material también cuenta con un parámetro que controla la borrosidad (o fuzziness, en inglés) del reflejo.
3. Material dieléctrico: Este material representa materiales transparentes como agua y cristal. Cuando la luz incide sobre el material, se divide en luz reflejada (como el material metálico) y en luz refractada. La reflectividad se describe según las ecuaciones de Fresnel y la refracción según la ley de Snell. Este material también cuenta con un parámetro que controla el índice de refracción.

También existen otras formas mas completas de definir materiales como las descritas en los modelos de [Disney](https://media.disneyanimation.com/uploads/production/publication_asset/48/asset/s2012_pbs_disney_brdf_notes_v3.pdf), [Autodesk](https://autodesk.github.io/standard-surface/#closures) o [OpenPBR](https://academysoftwarefoundation.github.io/OpenPBR/).

> Imagen de una escena comparativa con esferas de todos los materiales

#### 3.1.3. Iluminación

La ultima sección de la definición de la escena virtual es la iluminación. La iluminación que se utiliza se puede dividir en dos tipos de fuente: el cielo y fuentes puntuales de luz.

El cielo ilumina de manera uniforme la escena mientras que las fuentes de luz puntuales siguen el modelo de reflexión de Blinn-Phong, que describe la forma en la que una superficie refleja la luz como una combinación de la iluminación difusa y la iluminación especular. No se incluye el término ambiental del modelo ya que se utiliza el cielo.

> Imagen de la escena de iluminación con los tres componentes y la suma de ellos

### 3.2. Generación de hologramas digitales (DH)

#### 3.2.1. Trazado de rayos

> En este apartado se detallará el algoritmo de trazado de rayos utilizado para generar imágenes, explicando cómo se simulan los rayos de luz desde la fuente hasta el detector y las principales diferencias con la realidad. (cámara, generación de rayos, muestreo, intersección, interacción con materiales, número máximo de rebotes, iluminación) (Referencias a los libros) (Imágenes de los resultados, la del final del primer libro y alguna malla)

#### 3.2.2. Calculo de amplitud y fase: aproximación escalar de la propagación de ondas electromagnéticas

> En este apartado se explicará el proceso de modificación del trazador de rayos descrito en el apartado anterior para el cálculo de la amplitud y la fase de las ondas electromagnéticas. (SLM, nubes de puntos, obtención de la amplitud y fase) (Referencias a los estudios) (Imágenes de los resultados, preferiblemente con poco ruido)

> El nombre de la sección suena muy complicado

### 3.3 Reconstrucción de la escena

> En este apartado se explicará brevemente el proceso de propagación de ondas electromagnéticas entre dos planos mediante convolución y el uso de las transformadas de Fourier. (Referencia al estudio) (Imágenes de los resultados a diferentes distancias)

> Quizás introducir el setup del laboratorio.



## 4. Técnicas de paralelización

En este apartado se definirán los conceptos de computación paralela, computación distribuida y computación concurrente.

La computación paralela es un tipo de computación en la que muchos cálculos o procesos se llevan a cabo simultáneamente. Existen varias técnicas de paralelización dentro de la computación paralela entre las que se encuentra la que se utilizará en este trabajo, el paralelismo de datos. Esta técnica consiste en dividir los datos entre distintos núcleos de procesamiento, los cuales operan sobre los datos en paralelo. Por ejemplo, se podría dividir una imagen en píxeles, operar sobre ellos y volver a unirlos para obtener otra imagen. 

> Recortar contenido no relevante

### 4.1 CPU

> En este apartado explicará el modelo de ejecución de las CPUs y de cómo aprovechar los diferentes núcleos mediante el uso de hilos (threads) y grupos de hilos (threadpools). (Comparación entre ambos en el caso de trazado de rayos tradicional y CGH) (Hablar de SIMD (Single Instruction Multiple Data) en algún momento o que el compilador optimiza.

### 4.2 GPU

> En este apartado se explicará el modelo de ejecución de las GPUs junto con las distintas formas de comunicarse con la gpu (shaders, openCL, CUDA, otros lenguajes), centrándose en la utilización de CUDA y sus limitaciones. (diferencia código y memoria host/device, limitación a tarjetas Nvidia, cálculos fp64 vs fp32) (Referencia a tabla de arquitecturas CUDA)

## 5. Resultados

### 5.1. Tablas comparativas de tiempos.

> En este apartado se detallará el hardware utilizado (CPUs y GPUs) y se realizaran comparativas entre distintas combinaciones. (CPU1 vs CPU2 vs GPU1 vs GPU2) Tanto RT como CGH (con y sin VBH (optimización Volume Binding Hierarchy)) (Diferentes resoluciones o número de puntos)

> Buscar otro nombre

### 5.2. Imágenes simuladas

> (Imágenes con más calidad, Imágenes utilizadas en el apartado anterior)

### 5.3. Imágenes obtenidas en el laboratorio

> (Comparativa entre laboratorio y simulación (CGI con blur?))

## 6. Conclusiones

## 7. Trabajo futuro

## 8. Bibliografía

- https://pbr-book.org/
- https://raytracing.github.io/
- https://developer.nvidia.com/blog/accelerated-ray-tracing-cuda/

---

- https://en.wikipedia.org/wiki/General-purpose_computing_on_graphics_processing_units

## 9. Anexos

### 9.1. Licencias

### 9.2. Repositorios




---
## Notas
### Precios HW
Obtenidos a 23/05/2024 
* 9900K 
	* Fecha de salida: Q4'18
	* Precio de salida: 560 €
	* Precio actual (11900F): 275€ [Fuente](https://www.pccomponentes.com/intel-core-i9-11900f-25-ghz)
* 7700K
	* Fecha de salida: Q1'17
	* Precio de salida: 410€
	* Precio actual (11700K): 248€ [Fuente](https://www.pccomponentes.com/intel-core-i7-11700k-36-ghz) 
* 2060
	* Fecha de salida: Q1'19
	* Precio de salida: 349€
	* Precio actual (3060):  290€ [Fuente](https://www.pccomponentes.com/asus-dual-geforce-rtx-3060-oc-edition-v2-12gb-gddr6)
* 3070
	* Fecha de salida: Q4'20
	* Precio de salida: 519€
	* Precio actual: 526€ [Fuente](https://www.pccomponentes.com/gigabyte-geforce-rtx-3070-gaming-oc-lhr-v2-8gb-gddr6)
