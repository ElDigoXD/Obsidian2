- [ ] SIMD 
- [ ] Otras formas de representar triángulos
- [ ] 




## 3. Proceso de síntesis de escenas virtuales en 3D mediante hologramas digitales

En este apartado se detallará el proceso de síntesis, dividido en tres secciones:

### Gráficos: escena virtual

El primer paso para la síntesis de escenas virtuales consiste en definir la escena que se desea producir. La escena contará con tres tipos de componentes:

#### Geometría

La geometría de la escena se definirá mediante primitivas definidas matemáticamente. Estas primitivas son: triángulos, definidos mediante la posición espacial de sus vértices; y esferas, definidas mediante su radio y la posición espacial de su centro. 

Utilizando la primitiva del triángulo se pueden representar mallas, definidas por una lista de triángulos. El soporte de mallas resulta muy útil ya que la mayoría de modelos 3D se encuentra en este formato. Para la importación de las mallas se ha utilizado la librería "tinyobjloader", la cual permite cargar archivos OBJ y extraer los vertices de sus triángulos.

<< Imagen de esfera c r, y triangulo a b c >>

#### Textura

Una vez definida la geometría de la escena, es necesario aplicar texturas a las primitivas. Las texturas que se han utilizado no siguen el significado tradicional de imágenes bidimensionales mapeadas sobre la superficie de la geometría, si no que se emplean distintos tipos de materiales, detallados a continuación:

1. Material difuso (lambertiano): Este material dispersa la luz siguiendo una distribución independiente al ángulo de incidencia y proporcional al coseno del ángulo formado entre la normal de la superficie y la dirección de dispersión. Esta distribución viene dada por la ley del coseno de Lambert. El color y la intensidad de la luz se ven modificados por el color (o albedo) del material.
2. Material normal: Este material dispersa la luz de la misma manera que el material difuso con la diferencia de que el color de la luz lo establece la dirección de la normal.
3. Material metálico: 
4. Material dieléctrico:

<< otra forma de definir los materiales podría ser basado en los parámetros de Disney [link](https://media.disneyanimation.com/uploads/production/publication_asset/48/asset/s2012_pbs_disney_brdf_notes_v3.pdf)
<< imagen de una escena comparativa con esferas de todos los materiales >>

#### Iluminación




## 4. Técnicas de paralelización

En este apartado se definirán los conceptos de computación paralela, computación distribuida y computación concurrente.

La computación paralela es un tipo de computación en la que muchos cálculos o procesos se llevan a cabo simultáneamente. Existen varias técnicas de paralelización dentro de la computación paralela entre las que se encuentra la que se utilizará en este trabajo, el paralelismo de datos. Esta técnica consiste en dividir los datos entre distintos núcleos de procesamiento, los cuales operan sobre los datos en paralelo. Por ejemplo, se podría dividir una imagen en píxeles, operar sobre ellos y volver a unirlos para obtener otra imagen. 

La computación distribuida












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
