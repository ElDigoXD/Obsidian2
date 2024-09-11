## Estado del arte

La generación de imágenes sintéticas por computador o CGI es un campo de la computación gráfica bien estudiado que se utiliza en una gran variedad de áreas, como el diseño, la industria, el cine y los videojuegos. 

Consiste, en esencia, en capturar lo que vería un ojo al observar una escena virtual formada por objetos y fuentes de iluminación, a través de una pantalla pixelada obteniendo una imagen (tipo fotográfica) de dicha escena.

Una de las técnicas más utilizadas en CGI es el trazado de rayos. Esta técnica simula la interacción de la luz con una escena para sintetizar escenas virtuales. 

Se considera una técnica computacionalmente costosa, por lo que es utilizada principalmente para renderización offline con dispositivos computacionales habituales, o en tiempo real utilizando granjas de potentes procesadores y GPUs.

---

Un trazador de rayos completo ha de simular al menos  7 objetos y fenómenos:

1. Cámaras: El modelo de una cámara determina cómo y desde dónde la escena se observa, incluyendo como una imagen de la escena es recogida por un sensor.

2. Intersecciones rayo-objeto: Es necesario conocer precisamente cuándo y dónde un rayo intersecta un objeto geométrico, además de determinar algunas propiedades del objeto en el punto de intersección.

3. Fuentes de luz: El trazador de rayos ha de modelar la distribución de la luz en la escena.

4. Visibilidad: Se debe poder conocer si una luz determinada deposita energía en un punto de una superficie.

5. Dispersión de la luz en superficies: Cada objeto ha de proveer información sobre como la luz interactúa con la superficie del objeto.

6. Transporte indirecto de luz: La luz puede llegar a la superficie después de rebotar o atravesar otras superficies.

7. Propagación de rayos: Se necesita conocer el comportamiento de la luz mientras atraviesa un espacio, siendo su velocidad constante en el vacío.

---

Tal y como se ha mencionado anteriormente, se tiene como objetivo generar hologramas sintéticos simulando la captura del frente de ondas de una escena en un plano siendo este proceso más computacionalmente exigente que el CGI y se puede abordar utilizando distintas técnicas.

La técnica de la nube de puntos consiste en discretizar la escena en puntos luminosos y obtener la suma de todas las funciones de dispersión de los puntos en el plano del holograma

---

Se puede observar en la figura la nube de puntos generada a partir de un barco y la función de dispersión de un punto evaluada en el plano H.

---

Las principales limitaciones de esta técnica son la falta de soporte de efectos básicos como la oclusión y el sombreado y el alto coste computacional, aunque el algoritmo es altamente paralelizable.

La técnica de la nube de puntos puede ser utilizada en conjunto con el trazado de rayos, solucionando la falta de soporte de los efectos básicos.

La técnica de trazado de rayos ha de ser adaptada o combinada con otras ya que la holografía se basa en ondas y no en rayos de luz.

---

Por último, en el caso de la propagación de ondas electromagnéticas entre dos planos paralelos, existe la posibilidad de disminuir drásticamente los tiempos de cálculo. En estas condiciones se pueden utilizar los algoritmos de convolución y de transformada de Fourier.

Esto resulta útil a la hora de propagar un holograma almacenado, como se puede ver en la figura.

---

## Proceso de síntesis ...

El proceso de síntesis de escenas virtuales en 3D mediante hologramas digitales se ha dividido en los siguientes pasos:

1. Definición de la escena virtual
2. Generación de imágenes por computador (CGI)
3. Generación de hologramas por computador (CGH)
4. Reconstrucción de la escena

La implementación se ha realizado en C++ y CUDA para la definición de la escena virtual, CGI y CGH y Python para la reconstrucción de la escena.

---

### Definición de la escena virtual

El primer paso para la síntesis de escenas virtuales consiste en definir la escena que se desea producir. 

Veamos el siguiente ejemplo: Esta escena está definida por 

1. el color del cielo, 
2. la posición, el tamaño y el material de las tres esferas,
3. y la posición y color de una fuente de luz puntual.

---

La geometría de la escena se definirá mediante primitivas definidas matemáticamente. Estas primitivas son: esferas, definidas mediante su radio y la posición espacial de su centro; y triángulos, definidos mediante la posición espacial de sus vértices. 

Utilizando la primitiva del triángulo se pueden representar mallas, definidas por una lista de triángulos. El soporte de mallas resulta muy útil ya que la mayoría de modelos 3D se encuentra en este formato.

---

Una vez definida la geometría de la escena, es necesario aplicar texturas a las primitivas.

1. Material difuso (lambertiano): Este material dispersa la luz siguiendo una distribución independiente al ángulo de incidencia y proporcional al coseno del ángulo formado entre la normal de la superficie y la dirección de dispersión. Ley conocida como coseno de Lambert.

---

2. Material metálico: Al contrario que el material difuso, el material metálico refleja la luz en el mismo ángulo en dirección opuesta respecto al ángulo de incidencia. Este efecto produce un reflejo de la misma manera que un espejo. Este material también cuenta con un parámetro que controla la borrosidad del reflejo.

---

3. Material dieléctrico: Este material representa materiales transparentes como agua y cristal. Cuando la luz incide sobre el material, se divide en luz reflejada (como el material metálico) y en luz refractada. La reflectividad se describe según las ecuaciones de Fresnel y la refracción según la ley de Snell. Este material también cuenta con un parámetro que controla el índice de refracción.

---

La última sección de la definición de la escena virtual es la iluminación. La iluminación que se utiliza se puede dividir en dos tipos de fuente: el cielo y fuentes puntuales de luz.

El cielo ilumina de manera uniforme la escena mientras que las fuentes de luz puntuales siguen el modelo de reflexión de Blinn-Phong que describe la forma en la que una superficie refleja la luz como una combinación de la iluminación difusa y la iluminación especular. No se incluye el término ambiental del modelo ya que se utiliza el cielo.

