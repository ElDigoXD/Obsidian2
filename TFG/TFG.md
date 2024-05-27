
## 3. Proceso de síntesis de escenas virtuales en 3D mediante hologramas digitales

En este apartado se detallará el proceso de síntesis, dividido en tres secciones:

> No me convencen los nombres de las secciones 3.1 y 3.2. Quizás "Definición de la escena virtual" y "Generación de hologramas \[Digitales]". 

### 3.1. Gráficos: escena virtual

El primer paso para la síntesis de escenas virtuales consiste en definir la escena que se desea producir. La escena contará con tres tipos de componentes:

#### 3.1.1. Geometría

La geometría de la escena se definirá mediante primitivas definidas matemáticamente. Estas primitivas son: triángulos, definidos mediante la posición espacial de sus vértices; y esferas, definidas mediante su radio y la posición espacial de su centro. 

Utilizando la primitiva del triángulo se pueden representar mallas, definidas por una lista de triángulos. El soporte de mallas resulta muy útil ya que la mayoría de modelos 3D se encuentra en este formato. Para la importación de las mallas se ha utilizado la librería "tinyobjloader", la cual permite cargar archivos OBJ y extraer los vertices de sus triángulos.

> Imagen de esfera {c r}, y triangulo {a b c}

#### 3.1.2. Textura

Una vez definida la geometría de la escena, es necesario aplicar texturas a las primitivas. Las texturas que se han utilizado no siguen el significado tradicional de imágenes bidimensionales mapeadas sobre la superficie de la geometría, si no que se emplean distintos tipos de materiales, detallados a continuación:

1. Material difuso (lambertiano): Este material dispersa la luz siguiendo una distribución independiente al ángulo de incidencia y proporcional al coseno del ángulo formado entre la normal de la superficie y la dirección de dispersión. Esta distribución viene dada por la ley del coseno de Lambert. El color y la intensidad de la luz se ven modificados por el color (o albedo) del material. Este material podría describirse como mate.
2. Material normal: Este material dispersa la luz de la misma manera que el material difuso con la diferencia de que el color del material lo establece la dirección de la normal.
3. Material metálico: Al contrario que el material difuso, el material metálico refleja la luz en el mismo ángulo en dirección opuesta respecto al ángulo de incidencia. Este efecto produce un reflejo de la misma manera que un espejo. Este material también cuenta con un parámetro que controla la borrosidad (o fuzziness, en inglés) del reflejo.
4. Material dieléctrico: Este material representa materiales transparentes como agua y cristal. Cuando la luz incide sobre el material, se divide en luz reflejada (como el material metálico) y en luz refractada. La reflectividad se describe según las ecuaciones de Fresnel y la refracción según la ley de Snell. Este material también cuenta con un parámetro que controla el índice de refracción.

También existen otras formas mas completas de definir materiales como las descritas en los modelos de [Disney](https://media.disneyanimation.com/uploads/production/publication_asset/48/asset/s2012_pbs_disney_brdf_notes_v3.pdf), [Autodesk](https://autodesk.github.io/standard-surface/#closures) o [OpenPBR](https://academysoftwarefoundation.github.io/OpenPBR/).

> Imagen de una escena comparativa con esferas de todos los materiales

#### 3.1.3. Iluminación

La ultima sección de la definición de la escena virtual es la iluminación. La iluminación que se utiliza se puede dividir en dos tipos de fuente: el cielo y fuentes puntuales de luz.

El cielo ilumina de manera uniforme la escena mientras que las fuentes de luz puntuales siguen el modelo de reflexión de Blinn-Phong, que describe la forma en la que una superficie refleja la luz como una combinación de la iluminación difusa y la iluminación especular. No se incluye el término ambiental del modelo ya que se utiliza el cielo.

> (NOTA: ¿como afecta esto a los metales? Un metal rojo no debería tener otros colores porque los "atenúa", en cambio refleja el verde de debajo. En la escena el cielo reflejado debería ser negro. Debería almacenar por separado la difusa y la especular y multiplicar como la del cielo. No solo funciona mal con metales, probablemente haya que rehacer la luz puntual. Ya debería estar solucionado aunque sigo sin saber como se debería comportar el material dieléctrico con las sombras)
> 
> Otra cosa relacionada con la iluminación, no se utiliza la ley de la inversa del cuadrado en las fuentes de luz puntuales. Implementarlo no es una prioridad pero, ¿estaría bien comentarlo en el trabajo?

> Imagen de la escena de iluminación con los tres componentes y la suma de ellos

### 3.2. Holograma generado por computador (CGH)

#### 3.2.1. Trazado de rayos

#### 3.2.1. Calculo de amplitud y fase: aproximación escalar de la propagación de ondas electromagnéticas

> El nombre de la sección suena muy complicado



## 4. Técnicas de paralelización

En este apartado se definirán los conceptos de computación paralela, computación distribuida y computación concurrente.

La computación paralela es un tipo de computación en la que muchos cálculos o procesos se llevan a cabo simultáneamente. Existen varias técnicas de paralelización dentro de la computación paralela entre las que se encuentra la que se utilizará en este trabajo, el paralelismo de datos. Esta técnica consiste en dividir los datos entre distintos núcleos de procesamiento, los cuales operan sobre los datos en paralelo. Por ejemplo, se podría dividir una imagen en píxeles, operar sobre ellos y volver a unirlos para obtener otra imagen. 

La computación distribuida...










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
