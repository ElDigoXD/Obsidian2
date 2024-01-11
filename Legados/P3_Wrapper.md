---
version: "1"
title: Wrapper
subtitle: SL. Práctica 2
author: Diego Sanz Fuertes | 825015
date: 10 de Enero de 2024
toc: true
toc-own-page: true
lang: es-ES
table-use-row-colors: false
header-left: "![](eupt.png){width=5cm}"
titlepage: true
colorlinks: true
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


# Herramientas utilizadas

Para la realización de esta práctica se han utilizado las siguientes herramientas:

+ [x3270](http://x3270.bgp.nu/): Un emulador de la terminal IBM 3270.
+ Java 19 y swing.
+ IntelliJ IDEA: IDE y editor de interfaces.

Herramientas no utilizadas: [filipesimoes/j3270](https://github.com/filipesimoes/j3270): un wrapper sobre x3270 para Java.

Las herramientas utilizadas para la realización de la memoria han sido [Obsidian](https://obsidian.md/) y [pandoc](https://pandoc.org/).

# Paso 1: Aprender a utilizar el mainframe

El primer paso para realizar la práctica ha sido aprender como funciona el mainframe. A través del emulador x3270, se ha realizado una conexión al mainframe siguiendo los pasos indicados en la práctica. 

Una vez comprendido como funciona, se ha utilizado s3270, la version "headless" del emulador en el que el mainframe se controla mediante comandos como "connect", "string" y "ascii".

# Paso 2: Crear un wrapper de x3270

Para este paso se ha creado un paquete en Java con el fin de encapsular el comportamiento del emulador, permitiendo llamar a los comandos desde Java para poder comunicarse con el Mainframe.

Para interactuar con s3270, se ha utilizado la clase `Process` la cual permite ejecutar un programa y leer/escribir su entrada/salida estándar. Para leer se ha utilizado `BufferedReader` y para escribir `Printwriter`.

```java 
Process process = new ProcessBuilder()  
		        .command(ws3270_path)  
		        .start();    
Printwriter writer = new PrintWriter(process.outputWriter(), true);  
BufferedReader reader = process.inputReader();
```

Se han implementado métodos para interactuar con la entrada/salida de manera mas cómoda y proveer información de depuración. Estos métodos son: `printfln`, `ignoreLine`, `readLine` y `emptyReader`. Para gestionar los errores se ha implementado un método `throwIfNotOk` que, si s3270 no devuelve "ok", lanza una excepción y vacía el reader.

Una vez implementados estos métodos, se ha procedido a implementar los diferentes comandos que se han utilizado de s3270. Como se puede observar a continuación, los comandos que no devuelven datos se han implementado de manera similar.

```java
public void string(String string) throws IOException {  
    printfln("string(\"%s\")", string);  
    throwIfNotOk(format("Couldn't use string(\"%s\")", string));  
}  
  
public void enter() throws IOException {  
    printfln("enter");  
    throwIfNotOk("Couldn't enter");  
}

public String ascii() throws IOException {  
    int lines = 43;  
    printfln("ascii");  
    var sb = new StringBuilder();  
  
    for (int i = 0; i < lines - 1; i++) {  
        sb.append(reader.readLine().replace("data: ", ""));  
        sb.append("\n");  
    }    
    sb.append(reader.readLine().replace("data: ", ""));  
  
    throwIfNotOk("Couldn't ascii");  
    return sb.toString();  
}
```

Por último se han creado métodos que combinan varios comandos para aumentar la legibilidad del código. Por ejemplo:

```java
public String waitAscii() throws IOException {  
    waitOutput();  
    waitSeconds(0.5);  
    return ascii();  
}  
  
public void stringEnterWait(String string) throws IOException {  
    string(string);  
    enter();  
    waitSeconds(0.3);  
}
```

# Paso 3: Crear una interfaz

Una vez desarrollado el wrapper, se ha procedido a crear una interfaz de depuración y otra interfaz del programa de tareas mediante Java Swing. La interfaz de depuración ha resultado realmente útil para navegar por el mainframe, validar el wrapper, calcular tiempos de espera y salir de errores al utilizar la interfaz del programa de tareas.

![Interfaz de depuración](Pasted%20image%2020240111133933.png)

Para la interfaz del programa de tareas se ha utilizado el IDE IntelliJ IDEA, que permite posicionar los elementos de forma gráfica sin tener que compilar y utiliza xml para describir las interfaces, lo que hace que el código Java resultante sea mas limpio.

![Interfaz de programa de tareas](Pasted%20image%2020240111134338.png)

![Crear tareas IDE](Pasted%20image%2020240111134442.png)

Una vez diseñadas las interfaces, se le ha añadido la funcionalidad al abrirse y a los botones. Al abrirse el programa se intenta conectar a la dirección IP a través del emulador s3270, ambas rutas definidas como constantes en el archivo fuente principal.

```java 
// MainForm::MainForm()
...
try {  
    w = new Wrapper(WS3270_PATH);  
} catch (Exception e) {  
    JOptionPane.showMessageDialog(this.mainPanel,  
            "Error loading ws3270 in path: " + WS3270_PATH);  
            
    System.exit(0);  
}  
  
try {  
    // Connect  
    w.connect(IP);  
} catch (Exception ex) {  
    JOptionPane.showMessageDialog(this.mainPanel,  
            "Cannot connect to " + IP);  
            
    System.exit(0);  
}  

try {  
    // Login  
    w.enter();  
    w.waitSeconds(0.3);  
    w.string("prog");  
    w.tab();  
    w.waitSeconds(0.3);  
    w.stringEnterWait("prog123");  
    w.enter();  
    w.waitSeconds(0.3);  
    // Open the program  
    w.stringEnterWait("tasks2.job");  
  
    updateTaskNumber();  
  
} catch (Exception ex) {  
	JOptionPane.showMessageDialog(this.mainPanel,  
            "Error while logging-in");
}
```


# Problemas encontrados

Algunos de los problemas encontrados han sido los siguientes:



# Conclusiones

\pagebreak

# Referencias

