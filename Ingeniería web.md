# Público objetivo

## Visitante / Anónimo
- Ver página de inicio, about me, contacto, etc.

## Cliente / Registrado
- Iniciar sesión
- Consultar dieta
- Consultar evolución
- ¿Añadir seguimiento?
- Contactar con el nutricionista

## Nutricionista / admin
- Gestionar clientes 
- Proveer nivel de actividad (nulo, moderado, elevado, intenso)
- Generar serie de alimentos para 5 comidas
- Gestionar alimentos
- Consultar histórico dietas y evolución del cliente
- Copiar y modificar dietas.
- Variar formulas de calorías necesarias

# Historias de usuario

- **Como** visitante **quiero** ver la pagina de inicio **para** informarme sobre el servicio
	- Criterios:
		- La página de inicio contiene información sobre el servicio
		- Permite acceder a una página de contacto

- **Como** visitante **quiero** contactar con el nutricionista **para** obtener más información y/o convertirme en cliente
	- Criterios:
		- La página de contacto proveerá información de contacto del nutricionista
		- También contendrá un correo electrónico con un "mailto:"

- **Como** cliente **quiero** iniciar sesión **para** acceder al servicio
	- Criterios:
		- Todas las páginas accesibles sin iniciar sesión contendrán una manera de hacerlo.
		- También se deberá poder cerrar sesión desde esas páginas y algunas más. 

- **Como** cliente **quiero** consultar la dieta **para** alimentarme correctamente
	- Criterios:
		- La página del usuario contiene información sobre su dieta activa

- **Como** cliente **quiero** consultar mi evolución **para** comprobar si mi estado mejora
	- Criterios:
		- La página del usuario contiene información sobre su evolución

- **Como** cliente **quiero** contactar con el nutricionista **para** consultar mis dudas
	- Criterios:
		- O existe un formulario para comunicarse con el nutricionista
		- O se realiza todo por teléfono
		- Prioridad baja

- **Como** nutricionista **quiero** gestionar clientes **para** dar de alta, dar de baja y modificar los datos de mis clientes 
	- Criterios:
		- Poder dar de alta clientes con su nombre, teléfono, peso, altura, correo y nivel de actividad
		- Poder dar de baja a clientes
		- Poder modificar los datos de los clientes

- **Como** nutricionista **quiero** poder variar formulas de calorías necesarias del cliente **para** personalizarselas
	- Criterios:
		- Existe un formulario que modifica la formula para un cliente especifico
		- Existe un botón para restablecer la formula

- **Como** nutricionista **quiero** establecer el nivel de actividad del cliente **para** calcular las calorías necesarias
	- Criterios:
		- Existe un formulario para modificar el nivel de actividad del cliente

- **Como** nutricionista **quiero** generar series de alimentos para 5 las comidas del cliente **para** optimizar su ingesta de calorías
- **Como** nutricionista **quiero** gestionar los alimentos **para** modificar sus propiedades 
- **Como** nutricionista **quiero** consultar el histórico dietas y evolución del cliente **para** comprobar que las dietas funcionan
- **Como** nutricionista **quiero** poder copiar y modificar dietas **para** no tener que crearlas desde cero
- **Como** nutricionista **quiero** poder variar las formulas de calorías necesarias **para** que se ajusten mejor al cliente 



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