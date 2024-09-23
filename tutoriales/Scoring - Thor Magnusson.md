# 1.1 Los conceptos básicos de SuperCollider
# El lenguaje SuperCollider

Este capítulo introducirá los fundamentos para crear y ejecutar un programa simple en SuperCollider. Presentará los conceptos básicos necesarios para una exploración más profunda y será el único capítulo silencioso del libro. Aprenderemos las prácticas básicas de orientación clave en SuperCollider, es decir, cómo ejecutar código, publicar en la ventana de publicación y utilizar el sistema de documentación. También discutiremos las cosas fundamentales necesarias para entender y escribir código en SuperCollider, a saber: variables, arreglos, funciones y la sintaxis básica de flujo de datos. Después de comprender los temas introducidos en este capítulo, deberías ser capaz de escribir prácticamente cualquier cosa que desees, aunque más adelante abordaremos la Programación Orientada a Objetos, lo que hará que las cosas sean considerablemente más efectivas y quizás más fáciles.

## El punto y coma, los corchetes y la ejecución de un programa

El punto y coma ";" es lo que divide una instrucción de la siguiente. Define una *línea* de código. Después del punto y coma, el intérprete pasa a la siguiente línea. Tiene que haber un punto y coma después de cada línea de código. Olvidarlo provocará errores que se imprimirán en la consola de publicación.

Este código funcionará bien si evalúas solo esta línea:

    "Hello World".postln

Pero no este, si evalúas ambas líneas (resaltando ambas y evaluándolas con Shift+Return):

    "Hello World".postln
    "Goodbye World".postln;

¿Por qué no? Porque el intérprete (el lenguaje SC) no entenderá

    "Hello World".postln"Goodbye World".postln; 

Sin embargo, esto funcionará:

    "Hello World".postln; "Goodbye World".postln; 

Depende de ti cómo formatear tu código, pero típicamente querrás mantenerlo legible para ti mismo en el futuro y también para otros lectores. Sin embargo, hay un estilo de codificación en SC utilizado para tuitear, donde el límite de 140 caracteres introduce restricciones interesantes para los compositores. A continuación se muestra una composición de Twitter de Tim Walters, pero como puedes ver, no es buena para la legibilidad humana aunque suena bien (al lenguaje no le importa la legibilidad humana, pero a nosotros sí):

```supercollider
play{HPF.ar(({|k|({|i|SinOsc.ar(i/96,Saw.ar(2**(i+k))/Decay.ar(Impulse.ar(0.5**i/k),[k*i+1,k*i+1*2],3**k))}!6).product}!32).sum/2,40)}
```
   

Puede resultar cansador tener que seleccionar muchas líneas de código y aquí es donde los corchetes resultan útiles, ya que pueden crear un ámbito para el intérprete. Entonces, el siguiente código:

```supercollider
var freq = 440;
var amp = 0.5;
{SinOsc.ar(freq, 0, amp)}.play;
```
    
no funcionará a menos que resaltes las tres líneas. Imagina si fueran 100 líneas: tendrías que hacer un tedioso desplazamiento hacia arriba y hacia abajo en el documento. Entonces, usando corchetes, simplemente puedes hacer doble clic después o antes de un corchete, y resaltará todo el texto entre los corchetes coincidentes.

```supercollider
(
var freq = 440;
var amp = 0.5;
{SinOsc.ar(freq, 0, amp)}.play;
)
```

## Corchetes coincidentes

A menudo, al escribir código en SuperCollider, experimentarás errores cuyo origen no puedes identificar. Hacer doble clic entre corchetes y observar si coinciden correctamente es uno de los métodos clave para depurar el código de SuperCollider.

```supercollider
(
"ejecutaste el programa y ".post; 
(44+77).post; " es la suma de 44 y 77".postln;
"la siguiente línea el intérprete la publica dos veces ya que es la última línea".postln;
)
```
    
Lo siguiente no funcionará. ¿Por qué no? Observa la ventana de publicación.

```supercollider
(
    (44+77).postln
    55.postln;
)
```
    
Nota que el signo • indica donde el intérprete encuentra el error.

## La ventana de publicación

Ya has publicado en la ventana de publicación (en muchos otros lenguajes se utiliza “print” y “println” para este propósito). Pero exploremos un poco más la ventana de publicación.

```supercollider
(
"hola".post; // publica algo
"uno, dos, tres".post;
)

(
"buenas".postln; // publica algo y añade un salto de línea
"uno, dos, tres".postln;
)

1+4; // devuelve 5

Scale.minor.degrees // devuelve un array con los grados de la escala menor
```

También puedes usar `postf`:

```supercollider
"el primer valor es %, y el segundo es % \n".postf(1111, 9999);
```

Si estás publicando una lista larga, es posible que no obtengas todo el contenido usando `.postln`, ya que SC es perezoso y no le gusta imprimir estructuras de datos demasiado largas, como listas.

Para este propósito, utiliza lo siguiente:

```supercollider
Post << "hey"
```

Ejemplo:

```supercollider
Array.fill(1000, {100.rand}).postln; // verás que obtienes ...etc...
```

Mientras que,

```supercollider
Post << Array.fill(1000, {100.rand}) // obtendrás la lista completa
```

### El sistema de documentación (El sistema de ayuda)

El sistema de documentación en SuperCollider es una buena fuente de información y aprendizaje. Incluye tutoriales introductorios, resúmenes y documentación para casi todas las clases en SuperCollider. Los archivos de documentación suelen contener ejemplos de cómo utilizar la clase/UGen específica, y por lo tanto, son una excelente fuente para aprender y comprender. Muchos usuarios de SC van directamente a la documentación cuando empiezan a escribir código, usándola como plantilla y copiando y pegando los ejemplos en sus proyectos.

Así que si resaltas la palabra `Array` en un documento de SC y presionas Cmd+d o Ctrl+d (d de documentación), obtendrás la documentación para esa clase. Verás las superclases/subclases y aprenderás sobre todos los métodos que tiene la clase `Array`.

Además, si deseas leer y explorar toda la documentación, puedes abrir un navegador de ayuda: `Help.gui` o simplemente Cmd+D o Ctrl+D (D mayúscula).

## Comentarios

Los comentarios son información escrita para los humanos, pero ignorada por el intérprete del lenguaje. Es una buena práctica escribir comentarios donde pienses que podrías olvidar lo que hace un cierto bloque de código. También es una forma de comunicación con otro programador que podría leer tu código. Siéntete libre de escribir tantos comentarios como desees, pero a menudo puede ser una mejor práctica nombrar tus variables y funciones (más adelante en esta sección aprenderemos qué significan estas palabras) de tal manera que no necesites añadir un comentario.

```supercollider
// Esto es un comentario

/*
Y esto también es 
un comentario
*/
```

Los comentarios son rojos por defecto, pero pueden ser de cualquier color (en el menú Formato elige ‘syntax colorize’).

---

## Variables

Aquí tienes un mantra para memorizar: Las variables son contenedores de algún valor. Son nombres o referencias a valores que pueden cambiar (su valor puede variar). Así que podríamos crear una variable que sea una propiedad tuya llamada `edad`. Cada año esta variable aumentará en un entero (un número entero). Vamos a probar esto ahora:

```supercollider
var edad = 33;
edad = edad + 1; // aquí la variable 'edad' obtiene un nuevo valor, o 33 + 1
edad.postln; // y publica 34
```

SuperCollider no es fuertemente tipado, por lo que no es necesario declarar el tipo de dato de las variables. Los tipos de datos (en otros lenguajes) incluyen: entero, flotante, doble, cadena, objetos personalizados, etc. Pero en SuperCollider puedes crear una variable que contenga un entero en un momento dado, pero más tarde contenga una referencia a una cadena o a un número flotante. Esto puede ser útil, pero hay que tener cuidado, ya que esto puede introducir errores en tu código.

Arriba, creamos una variable `edad`, y *declaramos* esa variable escribiendo `var` delante de ella. Todas las variables deben ser declaradas antes de poder usarlas. Hay dos excepciones: todas las letras minúsculas de la `a` a la `z` (observa que `s` es una variable especial que se usa por defecto como referencia al servidor SC) pueden ser usadas sin declaración, y también las variables ‘de entorno’ (que pueden considerarse globales dentro de un cierto contexto) que comienzan con el símbolo `~`. Hablaremos más sobre eso más adelante.

```supercollider
a = 3; // asignamos el número 3 a la variable "a"
a = "hola"; // también podemos asignarle una cadena.
a = 0.333312; // o un número de punto flotante;
a = [1, 34, 55, 0.1, "cadena en una lista", \simbolo, pi]; // o un array con tipos mixtos

a // ejecuta esta línea y veremos en la ventana de publicación lo que "a" contiene
```

SuperCollider tiene ámbito (scope), por lo que si declaras una variable dentro de un cierto ámbito, como una función, pueden tener un valor local dentro de ese ámbito. Así que intenta ejecutar este código (haciendo doble clic detrás del primer paréntesis).

```supercollider
(
var v, a;
v = 22;
a = 33;
"El valor de a es : ".post; a.postln;
)
"El valor de a ahora es : ".post; a.postln; // luego ejecuta esta línea
```

Así que `a` es una variable global. Esto es bueno para prototipado y pruebas, pero no se recomienda como un buen diseño de software. Una variable con el nombre `mivariable` no podría ser global: solo caracteres en minúscula.

Si queremos nombres de variables más largos, podemos usar variables de entorno (usando el símbolo `~`): se pueden ver como variables globales, accesibles desde cualquier lugar en tu código.

```supercollider
~mivariable = 333;

~mivariable // publícalo
```

Pero típicamente, solo declaramos la variable (`var`) al principio del programa y asignamos su valor donde sea necesario. Las variables de entorno no son necesarias, aunque pueden ser útiles, y este libro no las usará extensivamente.

Pero ¿por qué usar variables? ¿Por qué no simplemente escribir los números o el valor donde los necesitamos? Tomemos un ejemplo que debería demostrar claramente por qué son útiles:

```supercollider
{
    // declara las variables
    var frecuencia, oscilador, filtro, senal;
    frecuencia = 130; // establece la variable de frecuencia
    // crea un oscilador de onda de sierra con dos canales
    oscilador = Saw.ar([frecuencia, frecuencia+2]);
    // usa un filtro paso bajo resonante en el oscilador
    filtro = RLPF.ar(oscilador, frecuencia*4, 0.25);
    // multiplica la señal por 0.5 para bajar la amplitud
    senal = filtro * 0.5;
}.play;
```

Como puedes ver, la variable `frecuencia` se usa en varios lugares en el sintetizador anterior. Ahora puedes cambiar el valor de la variable a algo como 500, y la frecuencia se convertirá "automáticamente"  en 500 Hz en el canal izquierdo, 502 Hz en el derecho, y la frecuencia de corte será de 2000 Hz. Así que en lugar de cambiar estas variables a lo largo del código, la cambias en un solo lugar y su valor se aplica mágicamente en cada ubicación donde se usa esa variable.

## Funciones

Las funciones son una característica importante de SuperCollider y de la mayoría de los lenguajes de programación. Se utilizan para encapsular algoritmos o funcionalidades que solo queremos escribir una vez, pero usar en diferentes lugares en varios momentos. Se pueden ver como una caja negra o una máquina que toma una entrada, la procesa, y devuelve una salida. Así como una máquina de café sofisticada podría tomar granos de café y agua como entrada, luego muele los granos, hierve el agua, prepara el café, y finalmente produce una deliciosa bebida. El punto clave es que no necesitas (o quieres) saber precisamente cómo sucede todo esto. Es suficiente saber dónde llenar los granos y el agua, y luego cómo operar los botones de la máquina (intensidad, número de tazas, etc.). La máquina de café es una [caja negra](http://es.wikipedia.org/wiki/Caja_negra_(sistemas)).

Las funciones en SuperCollider se escriben con llaves `{}`

Vamos a crear una función que publique el valor 44. La guardamos en una variable `f`, para que podamos *llamarla* más tarde.

```supercollider
f = { 44.postln };
```

Cuando ejecutas esta línea de código, verás que la ventana de publicación de SuperCollider te notifica que se le ha dado una función. No publica 44 en la ventana de publicación. Para eso, tenemos que llamar a la función, es decir, pedirle que realice su cálculo y nos devuelva algún valor.

```supercollider
f.value // para llamar a la función necesitamos obtener su valor
```

Escribamos una función más compleja:

```supercollider
f = {
    69 + ( 12 * log( 220/440 ) / log(2) )
};
f.value // devuelve la nota MIDI 57 (la nota MIDI para 220 Hz)
```

Esta es una función típica que calcula la nota MIDI de una frecuencia dada en Hz (o ciclos por segundo). La mayoría de los músicos electrónicos saben que la nota MIDI 60 es C, y que la 69 es A, y que A es 440 Hz. Pero ¿cómo se calcula esto? Bueno, la función anterior devuelve la nota MIDI de 220 Hz. Pero esta es una función sin ninguna entrada (o *argumento* como se llama en la jerga). Vamos a abrir este canal de entrada, perforando un agujero en la caja negra, y llamemos a este argumento `freq` ya que eso es lo que queremos poner dentro.

```supercollider
f = { arg freq;
    69 + ( 12 * log( freq/440 ) / log(2) )
}
```

Ahora tenemos una *entrada* en nuestra función, un argumento llamado `freq`. Nota que este argumento ha sido puesto en la posición correcta dentro del cálculo. Ahora podemos poner cualquier frecuencia y obtener la nota MIDI relevante.

```supercollider
f.value(440) // devuelve 69
f.value(880) // devuelve 81
f.value(261) // devuelve 59.958555396543 (una nota MIDI fraccional, cerca de C (o 60))
```

Lo anterior es un buen ejemplo de por qué las funciones son tan geniales. El algoritmo de calcular la nota MIDI a partir de la frecuencia es algo complejo (¿o desagradable?), y realmente no queremos memorizarlo o escribirlo más de una vez. Simplemente hemos creado una caja negra que pusimos en la variable `f` y ahora podemos llamarla cuando queramos sin saber qué hay dentro de la caja negra.

Usaremos funciones todo el tiempo en los próximos capítulos. Es vital entender cómo reciben argumentos, procesan los datos y devuelven un valor.

Lo último que decir sobre las funciones en esta etapa es que pueden tener valores predeterminados en sus argumentos. Esto significa que no necesitamos *pasar* todos los argumentos de la función.

```supercollider
f = { arg salario, impuesto=20;
    var despuesDeImpuestos;
    despuesDeImpuestos = salario - (salario * (impuesto/100) )
}
```

Así que aquí arriba hay una función que calcula el salario después de impuestos, con la tasa de impuestos predeterminada en 20%. Por supuesto, no podemos estar seguros de que esta sea la tasa de impuestos para siempre, o en diferentes países, por lo que esto necesita ser un argumento que se pueda establecer en diferentes contextos.

```supercollider
f.value(2000) // aquí usamos la tasa de impuestos predeterminada del 20%
f.value(2000, 35) // y aquí el porcentaje de impuestos se ha convertido en 35%
```

## Consejo

SuperCollider contiene bastantes ejemplos de "azúcar sintáctica", es decir, donde puedes escribir las cosas de manera ligeramente diferente por brevedad (¿o quizás estética?). Exploraremos estos atajos más adelante en el libro, pero por ahora basta con mencionar algunos relacionados con la función.

Verás lo siguiente:

```supercollider
f = { arg cadena; cadena.postln; } // publicaremos la cadena que entra en la función
f.value("hola") // y aquí llamamos a la función pasando "hola" como argumento.
```

A menudo se escribe en esta forma:

```supercollider
f = {|cadena| cadena.postln;} // los argumentos se pueden definir dentro de dos barras '|'
f.("hola") // y puedes omitir el .value y solo escribir un punto (.)
```

## Arreglos, Listas y Diccionarios

Los arreglos son una de las herramientas más útiles para entender y utilizar en la música por computadora. Aquí es donde podemos almacenar una gran cantidad de datos (ya sean tonos, escalas, sintetizadores u otra información que puedas necesitar). Un error común que suele cometer un programador principiante es crear muchas variables para datos que podrían almacenarse en un arreglo, así que vamos a aprender a usar arreglos y listas.

Un arreglo puede verse como un espacio de almacenamiento para cosas que necesitas usar más tarde. Como una bolsa o una caja donde guardas tus cosas. Normalmente guardamos la referencia al arreglo en una variable para poder acceder a él en cualquier parte de nuestro código:

```supercollider
a = [11, 22, 33, 44, 55]; // creamos un arreglo con estos cinco números
```

Verás que la ventana de mensajes publica el arreglo cuando ejecutas esta línea. Ahora vamos a jugar un poco con el arreglo:

```supercollider
a[0]; // obtenemos el primer elemento del arreglo (la mayoría de los lenguajes de programación indexan desde cero)
a[4] // devuelve 55, ya que el índice 4 en el arreglo contiene el valor 55
a[1]+a[4] // devuelve 77 ya que 22 más 55 es igual a 77
a.reverse // podemos invertir el arreglo
a.maxItem // el arreglo puede decirnos cuál es el valor más alto
```

y así sucesivamente. El arreglo que creamos arriba tenía cinco elementos definidos. Pero podemos crear arreglos de manera diferente, donde los llenamos algorítmicamente con cualquier dato que nos interese:

```supercollider
a = Array.fill(5, { 100.rand }); // crea un arreglo con cinco números aleatorios entre 0 y 100
```

Lo que ocurrió aquí es que le decimos a la clase Array que llene un nuevo arreglo con cinco elementos, pero luego le pasamos una función (introducida anteriormente) y la función se evaluará cinco veces. Compáralo con:

```supercollider
a = Array.fill(5, 100.rand ); // crea un arreglo con UN número aleatorio entre 0 y 100
```

Ahora podemos jugar un poco con esa función que pasamos a la creación del arreglo:

```supercollider
a = Array.fill(5, { arg i; i }); // crea una función con el argumento iterador ('i')
a = Array.fill(5, { arg i; (i+1)*11 }); // lo mismo que el primer arreglo que creamos
a = Array.fill(5, { arg i; i*i });
a = Array.series(5, 10, 2); // un nuevo método (series).
// Llena el arreglo con 5 elementos, comenzando en 10, sumando 2 en cada paso.
```

Podrías preguntarte por qué esto es tan fantástico o importante. El hecho es que los arreglos se utilizan en todas partes en la música por computadora. El archivo de sonido que cargarás más adelante en este libro se almacenará en un arreglo, con cada muestra en su propio espacio dentro de un arreglo. Luego puedes saltar hacia adelante y hacia atrás en el arreglo, hacer scratching, cortar, hacer breakbeats o lo que quieras hacer, pero el hecho es que todo esto se hace con datos (las muestras de tu archivo de sonido) almacenados en un arreglo. O quizás quieras tocar una escala determinada.

```supercollider
m = Scale.minor.degrees; // la clase Scale devolverá los grados de la escala menor
```

Aquí `m` es un arreglo con los siguientes valores: `[0, 2, 3, 5, 7, 8, 10]`. Entonces, en una escala de Do, 0 sería Do, 2 sería Re (dos semitonos por encima de Do), 3 sería Mi bemol, y así sucesivamente. Podríamos representar esos valores como notas MIDI, donde 60 es la nota Do (~ 261Hz). E incluso podríamos ver las frecuencias reales en Hertz de esas notas MIDI (esas frecuencias se pasarían a los osciladores, ya que esperan frecuencias y no notas MIDI como argumentos).

```supercollider
m = Scale.minor.degrees; // la clase Scale devuelve los grados de la escala menor
m = m ++ 12; // es posible que quieras agregar la octava (12) a tu arreglo
m = m+60 // aquí simplemente agregamos 60 a todos los valores en el arreglo
m = m.midicps // y aquí convertimos las notas MIDI en sus valores de frecuencia
m = m.cpsmidi // pero volvamos a convertirlas en valores MIDI por ahora
```

Ahora podríamos jugar un poco con el arreglo `m`. En una composición algorítmica, por ejemplo, podrías querer elegir una nota aleatoria de la escala menor.

```supercollider
n = m.choose; // elige una nota MIDI aleatoria y guárdala en la variable 'n'
x = m.scramble; // podríamos crear una melodía mezclando aleatoriamente el arreglo
x = m.scramble[0..3] // mezcla la lista y selecciona las primeras 4 notas
p = m.mirror // invierte el arreglo (como una escala ascendente y descendente)
```

Notarás que en `x = m.scramble` arriba, la variable `x` contiene un arreglo con una versión mezclada del arreglo `m`. El arreglo `m` todavía está intacto: no lo has mezclado, simplemente dijiste "pon una versión mezclada de `m` en la variable `x`". Entonces, el `m` original todavía está allí. Si realmente quisieras mezclar `m`, tendrías que hacer:

```supercollider
m = m.scramble; // una versión mezclada del arreglo 'm' se guarda de nuevo en la variable 'm'
// Pero ahora está todo mezclado. Ordenémoslo en números ascendentes nuevamente:
m = m.sort
```

Los arreglos pueden contener cualquier cosa, y en SuperCollider, pueden contener valores de tipos mixtos, como enteros, cadenas, flotantes, y así sucesivamente.

```supercollider
a = [1, "dos", 3.33, Scale.minor] // mezclamos tipos en el arreglo.
// Esto puede ser peligroso ya que lo siguiente
a[0]*10 // funcionará
a[1]*10 // pero esto no, ya que no puedes multiplicar la palabra "dos" por 10
```

Los arreglos pueden contener otros arreglos, que a su vez pueden contener otros arreglos de cualquier dimensión.

```supercollider
// una función que creará un arreglo de 5 elementos con números aleatorios entre 0 y 10
f = { Array.fill(5, { 10.rand }) }; // función generadora de arreglos
a = Array.fill(10, f.value);  // crea otro arreglo con 10 elementos del arreglo anterior
// Pero lo anterior se evaluó solo una vez. ¿Por qué?
// Porque necesitas pasar una función para obtener un arreglo diferente cada vez. Así:
a = Array.fill(10, { f.value });  // crea otro arreglo con 10 elementos del arreglo anterior
// Podemos acceder al primer arreglo y ver que es diferente del segundo arreglo
a[0]
a[1]
// Podríamos poner un nuevo arreglo en a[0] (esa ranura contiene un arreglo)
a[0] = f.value
// Podríamos poner un nuevo arreglo en a[0][0] (un entero)
a[0][0] = f.value
```

Arriba agregamos 12 a un arreglo, la escala menor en el caso anterior.

```supercollider
m = []    // Comenzamos con un arreglo nuevo, vacío
m.add(12) // pero si ejecutas esta línea muchas veces, el arreglo no crecerá indefinidamente
```

### Listas

Aquí es donde la clase List se vuelve útil.

```supercollider
l = List.new;   // Comienza con una nueva lista vacía
l.add(100.rand) // intenta ejecutar esto varias veces y observa cómo crece la lista
```

Las listas son como arreglos e implementan muchos de los mismos métodos, pero son un poco más costosas que los arreglos. En el ejemplo anterior podrías simplemente hacer `a = a.add(100.rand)` si `a` fuera un arreglo, pero a muchas personas les gustan las listas por razones que discutiremos más adelante.

### Diccionarios

Un diccionario es una colección de elementos donde las *claves* están asociadas a *valores*. Aquí, las claves son palabras clave que actúan como identificadores para espacios en la colección. Puedes pensar en esto como nombres para valores. Esto puede ser bastante útil. Vamos a explorar dos ejemplos:

```supercollider
a = Dictionary.new
a.put(\C, 60)
a.put(\Cs, 61)
a.put(\D, 62)
a[\Ds] = 63

 // lo mismo que .put
// y ahora, obtengamos los valores
a.at(\D)
a[\Ds] // lo mismo que .at

a.keys
a.values
a.getPairs
a.findKeyForValue(60)
```

Imagina cómo harías esto con un arreglo. Una forma sería:

```supercollider
a = [\C, 60, \Cs, 61, \D, 62, \Ds, 63]
// encontramos el espacio de una clave:
x = a.indexOf(\D) // 4
a[x+1]
// o simplemente
a[a.indexOf(\D)+1]
```

pero usando un arreglo, necesitas llevar un seguimiento de cómo están organizadas e indexadas las cosas.

Otro ejemplo de Diccionario:

```supercollider
b = Dictionary.new
b.put(\major, [ 0, 2, 4, 5, 7, 9, 11 ])
b.put(\minor, [ 0, 2, 3, 5, 7, 8, 10 ])
b[\minor]
```

## ¿Métodos?

Ahora hemos visto cosas como `100.rand` y `a.reverse`. ¿Cómo funcionan `.rand` y `.reverse`? Bueno, SuperCollider es un [lenguaje orientado a objetos](https://es.wikipedia.org/wiki/Programaci%C3%B3n_orientada_a_objetos) y estos son *métodos* de las clases respectivas. Entonces, un entero (como 100) tiene métodos como `.rand`, `.midicps` o `.neg`. No tiene un método `.reverse`. ¿Por qué no? Porque no puedes invertir un número. Sin embargo, un arreglo (como `[11,22,33,44,55]`) puede ser invertido o sumado. Exploraremos esto más adelante en el capítulo sobre programación orientada a objetos en SuperCollider, pero por ahora es suficiente pensar que el objeto (una instancia de la clase) tiene métodos relevantes. O para usar una analogía: digamos que tenemos una clase llamada Car. Esta clase es la información necesaria para construir el automóvil. Cuando construimos un Car, instanciamos la clase y tenemos un automóvil real. Este automóvil puede tener algunos métodos, por ejemplo: start, drive, turn, putWipersOn. Y estos métodos podrían tener argumentos, como speed(60), o turn(-60). Podrías pensar en el objeto como el sustantivo, el método como el verbo y el argumento como el adjetivo. (Como en: John (objeto) camina (método) rápido (adjetivo)).

```supercollider
// creamos un nuevo automóvil. 4 indica, por ejemplo, el número de asientos
c = Car.new(4); 
c.start;
c.drive(40); // el automóvil conduce a 40 millas por hora
c.turn(-60); // el automóvil gira 60 grados a la izquierda
```

Entonces, para entender realmente una clase como Array o List, necesitas leer la documentación y explorar los métodos disponibles. Nota también que Array es una subclase (o hereda métodos de su superclase) de la clase ArrayedCollection. Esto significa que tiene todos los métodos de su superclase. Como una clase “Car” podría tener una superclase llamada “Vehicle” de la cual una “Motorbike” también sería una subclase (un hermano de “Car”). Puedes explorar esto echando un vistazo bajo el capó de SuperCollider:

```supercollider
Array.openHelpFile // obtiene la documentación de la clase Array
Array.dumpInterface // obtiene la interfaz o los métodos de la clase Array
Array.dumpFullInterface // obtiene también los métodos de las superclases de Array.
```

Puedes ver que en el método `.dumpFullInterface` te dirá todos los métodos que Array *hereda* de sus superclases.

Ahora, esto podría darte un poco de dolor de cabeza, pero no te preocupes, gradualmente aprenderás esta terminología y lo que significa para ti en tu práctica musical o sonora con SuperCollider. Wikipedia es un buen lugar para comenzar a leer sobre [Programación Orientada a Objetos](https://es.wikipedia.org/wiki/Programaci%C3%B3n_orientada_a_objetos).

## Condicionales, flujo de datos y control

Lo último que debemos discutir antes de comenzar a hacer sonidos con SuperCollider es cómo controlamos los datos y tomamos decisiones. Esto trata de la lógica, del pensamiento humano y de cómo codificar tales decisiones en forma de código. Dicha lógica es la base de todos los sistemas inteligentes, por ejemplo, en la inteligencia artificial. En resumen, se trata de establecer condiciones y luego decidir qué hacer con ellas. Por ejemplo: si está lloviendo y voy a salir, llevo mi paraguas; de lo contrario, lo dejo en casa. Es lógica básica que los humanos usamos todo el tiempo a lo largo del día. Los lenguajes de programación tienen formas de formalizar tales condiciones, típicamente con una declaración if-else.

En pseudocódigo, se ve así:
```plaintext
if( condición, { entonces haz esto }, { sino haz esto });
```
como en:
```plaintext
if( llueve, { paraguas }, { sin paraguas });
```

La condición representa un estado que es verdadero o falso. Si es verdadero (hay lluvia), entonces evalúa la primera función; si es falso (no hay lluvia), evalúa la segunda condición.

Otra forma es una simple declaración if donde no necesitas especificar qué hacer si es falso:
```plaintext
if( hambre, { comer } );
```

Entonces, juguemos con esto:

```supercollider
if( true, { "la condición es VERDADERA".postln;}, {"la condición es FALSA".postln;});
if( false, { "la condición es VERDADERA".postln;}, {"la condición es FALSA".postln;});
```

Puedes ver que `true` y `false` son palabras clave en SuperCollider. Son los llamados valores booleanos. No deberías usarlos como variables (bueno, no puedes). En los sistemas digitales, operamos en código binario, en 1s y 0s. `true` se asocia con 1 y `false` con 0.

```supercollider
true.binaryValue;
false.binaryValue;
```

La lógica booleana lleva el nombre de George Boole, quien escribió un importante artículo en 1848 ("El Cálculo de la Lógica") sobre expresiones y razonamiento. En resumen, involucra las declaraciones AND, OR, y NOT.

Una simple tabla de verdad booleana podría verse así:

```plaintext
true AND true = true
true AND false = false
false AND false = false
true OR true = true
true OR false = true
false OR false = false
true AND NOT false = true
```

etc. Probemos esto en código SuperCollider y observemos la ventana de post. Pero primero necesitamos aprender la sintaxis básica para los operadores booleanos:

- `==`  significa *igual*
- `!=`  significa *diferente de*
- `&&`  significa *y*
- `||`  significa *o*

También usamos operadores de comparación:

- `>`  significa *mayor que*  
- `<`  significa *menor que*  
- `>=`  significa *mayor o igual que*  
- `<=`  significa *menor o igual que*

Ejemplos:

```supercollider
true == true // devuelve true
true != true // devuelve false (ya que true es igual a true)
true == false // devuelve false
true != false // devuelve true (ya que true no es igual a false)
3 == 3 // sí, 3 es igual a 3
3 != 4 // true, 3 no es igual a 4
true || false // devuelve true, ya que uno de los elementos es true
false || false // devuelve false, ya que ambos elementos son false
3 > 4 // false, ya que 3 es menor que 4
3 < 4 // true
3 < 3 // false
3 <= 3 // true, ya que 3 es menor o igual a 3
```

Quizás no te des cuenta aún, pero saber lo que ahora sabes es muy poderoso y es algo que usarás todo el tiempo para síntesis, composición algorítmica, construcción de instrumentos, instalaciones sonoras, y más. Asegúrate de entender esto correctamente. Juguemos un poco más con esto en declaraciones if:

```supercollider
if( 3==3, { "la condición es VERDADERA".postln;}, {"la condición es FALSA".postln;});

if( 3==4, { "la condición es VERDADERA".postln;}, {"la condición es FALSA".postln;});

// y las cosas pueden ser un poco más complejas:
if( (3 < 4) && (true != false), {"VERDADERO".postln;}, {"FALSO".postln;});
```

¿Qué pasó en esa última declaración? Pregunta: ¿es 3 menor que 4? Sí. ¿Y es true diferente de false? Sí. Entonces ambas condiciones son verdaderas, y eso es lo que se publica. Nota que, por supuesto, los valores en la cadena (dentro de las comillas) podrían ser cualquier cosa; solo estamos publicando ahora. Así que podrías escribir:

```supercollider
if( (3 < 4) && (true != false), {"VERDAD".postln;}, {"FALSO".postln;}); 
```

en español si lo deseas, pero no podrías escribir esto:

```supercollider
verdad == verdad
```

ya que el lenguaje SuperCollider está en inglés.

Pero, ¿y si tienes muchas condiciones para comparar? Aquí podrías usar una declaración *switch*:

```supercollider
(
a = 4.rand; // a será un número de 0 a 4;
switch(a)
{0} {"a es cero".postln;} // se ejecuta si a es cero
{1} {"a es uno".postln;} // se ejecuta si a es uno
{2} {"a es dos".postln;} // etc.
{3} {"a es tres".postln;};
)
```

Otra forma es usar la declaración case, y podría ser más rápida que switch.

```supercollider
(
a = 4.rand; // a será un número de 0 a 4;
case
{a == 0} {"a es cero".postln;} // se ejecuta si a es cero
{a == 1} {"a es uno".postln;} // se ejecuta si a es uno
{a == 2} {"a es dos".postln;} // etc.
{a == 3} {"a es tres".postln;};
)
```

Nota que tanto en switch como en case, el punto y coma solo va después de la última condición.

## Bucles e iteración

Lo último que necesitamos aprender en este capítulo es el bucle. El bucle es uno de los trucos clave en la programación. Digamos que queremos generar 1000 sintetizadores a la vez. Sería tedioso escribir y evaluar 1000 líneas de código una tras otra, pero es fácil hacer un bucle con una línea de código 1000 veces.

En muchos lenguajes de programación, esto se hace con un [bucle for](http://es.wikipedia.org/wiki/Bucle_for):

```c
for(int i = 0; i > 10, i++) {
    println("i es ahora" + i);		
}
```

El código anterior funcionará en Java, C, JavaScript y muchos otros lenguajes. Pero SuperCollider es un lenguaje completamente orientado a objetos, donde todo es un objeto, que puede tener métodos, por lo que un entero puede tener un método como `.neg`, o `.midicps`, pero también `.do` (el bucle).

Así que en SuperCollider podemos simplemente hacer:

```supercollider
10.do({ "REVUELVE ESTO 10 VECES".scramble.postln; })
```

Lo que sucede es que hace un bucle a través del comando 10 veces y evalúa la función (que revuelve y publica la cadena que escribimos) cada vez. Podríamos entonces hacer un contador:

```supercollider
(
var counter = 0;
10.do({ 
	counter = counter + 1;
	"el contador ahora es: ".post; 
	counter.postln; 
})
)
```

Pero en lugar de tal contador, podemos usar el argumento pasado a la función en un bucle:

```supercollider
10.do({arg counter; counter.postln;});

// puedes llamar a este argumento como quieras:
10.do({arg num; num.postln;});

// y la convención típica es usar el carácter "i" (para iteración):
10.do({arg i; i.postln;});
```

Ahora intentemos hacer un pequeño programa que nos dé todos los números primos de 0 a 10000. Hay un método de la clase Integer llamado `isPrime` que resulta útil aquí. Usaremos muchas de las cosas aprendidas en este capítulo, es decir, crear una List, hacer un bucle `do` con una función que tiene un argumento de iteración, y luego preguntaremos si el iterador es un número primo, usando una declaración if. Si lo es

 (es decir, verdadero), lo añadimos a la lista. Finalmente, publicamos el resultado en la ventana de post. Pero nota que solo publicamos después de haber hecho las 10000 iteraciones.

```supercollider
(
p = List.new;
10000.do({ arg i; // i es la iteración de 0 a 10000
	if( i.isPrime, { p.add(i) }); // sin condición else - no la necesitamos
    });
Post << p;
)
```

También podemos recorrer un Array o una List. Luego el bucle `do` recogerá todos los elementos de la matriz y los pasará a la función que escribas dentro del bucle `do`. Además, añadirá un iterador. Así que tenemos dos argumentos para la función:

```supercollider
(
[ 11, 22, 33, 44, 55, 66, 77, 88, 99 ].do({arg item, counter; 
item.post; " está en la matriz en la posición: ".post; counter.postln;
});
)
```

Así que publica la posición (el contador/iterador siempre empieza en cero) y el elemento en la lista. Por supuesto, puedes llamar a los argumentos como quieras. Ejemplo:

```supercollider
[ 11, 22, 33, 44, 55, 66, 77, 88, 99 ].do({arg aa, bb; aa.post; " está en la matriz en la posición: ".post; bb.postln });
```

Otra técnica de bucle es usar el `for-loop`:

```supercollider
for(startValue, endValue, function); // esta es la sintaxis

for(100, 130, { arg i; i = i+10; i.postln; }) // ejemplo
```

También podríamos querer usar el `forBy-loop`:

```supercollider
forBy(startValue, endValue, stepValue, function); // la sintaxis

forBy(100, 130, 4, { arg i; i = i+10; i.postln; }) // ejemplo
```

`while` es otro tipo de bucle:

```supercollider
while (testFunc, bodyFunc); // sintaxis

(
i = 0;
while ({ i < 30 }, {  i = i + 1; i.postln; });
)
```

Esto es suficiente sobre el lenguaje. Ahora es el momento de sumergirse en la creación de sonidos y explorar las capacidades de síntesis de SuperCollider. Pero primero, aprendamos algunos trucos para echar un vistazo bajo el capó del lenguaje SuperCollider:

## Examinando los detalles internos

Cada UGen o Clase en SuperCollider tiene una definición de clase en un archivo de clase. Estos archivos se compilan cada vez que se inicia SuperCollider y se convierten en el entorno de la aplicación que estamos utilizando. SC es un lenguaje "interpretado" (a diferencia de un lenguaje "compilado" como C o Java). Si agregas una nueva clase a SuperCollider, necesitas *recompilar* el lenguaje (hay un elemento de menú para eso), o simplemente reiniciar.

- Para verificar el archivo de origen, escribe ctrl + i (o cmd + i en Mac) cuando una clase esté resaltada (por ejemplo, SinOsc).
- Para verificar las implementaciones de un método (qué clases lo soportan), escribe ctrl + Y.
- Para verificar las referencias a un método (qué clases lo soportan), escribe shift + ctrl + Y.

```supercollider
UGen.dumpSubclassList // UGen es una clase. Intenta volcar LFSaw, por ejemplo.
UGen.browse  // examina los métodos de forma interactiva en una GUI
SinOsc.dumpFullInterface  // lista todos los métodos de la clase jerárquicamente
SinOsc.dumpMethodList  // lista los métodos de instancia alfabéticamente
SinOsc.openHelpFile
```

--------------------------------------
# 1.2 El Sintetizador
# El Servidor de SuperCollider

El Servidor de SuperCollider, o SC Synth como también se le conoce, es un motor de audio elegante y de gran sonido. Como se mencionó anteriormente, SuperCollider se divide tradicionalmente entre un servidor y un cliente, es decir, un servidor de audio (el SC Synth) y el cliente del lenguaje de SuperCollider (sc-lang). Cuando se inicia el servidor, este se conecta al dispositivo de audio predeterminado (como tarjetas de audio internas o externas), pero se puede configurar para usar cualquier dispositivo de audio disponible en tu computadora (por ejemplo, utilizando software de enrutamiento de audio virtual como Jack).

El SC Synth genera audio y tiene una estructura elegante de Buses, Grupos, Synths y una multitud de UGens. Funciona un poco como un sintetizador modular, donde la salida de una cadena de osciladores y filtros se puede enrutar a otro módulo. El audio se crea mediante la creación de gráficos llamados Definiciones de Synth. Estas son definiciones de sintetizadores, pero en un sentido amplio, ya que pueden hacer prácticamente cualquier cosa relacionada con el audio (por ejemplo, realizar análisis de audio en lugar de síntesis).

El SC Synth es un programa que se ejecuta independientemente del IDE o lenguaje de SuperCollider. Puedes usar cualquier software para controlarlo, como C/C++, Java, Python, Lua, Pure Data, Max/MSP u otros.

Este capítulo presentará el servidor de SuperCollider para los propósitos más básicos de comenzar con este increíble motor para trabajos de audio. Esta sección será fundamental para los capítulos siguientes.

## Iniciando el Servidor

Cuando "inicias el servidor", básicamente estás iniciando un nuevo proceso en tu computadora que no tiene una interfaz gráfica de usuario (GUI). Si observas la lista de procesos en ejecución en tu computadora, verás que cuando inicias el servidor, aparece un nuevo proceso (intenta escribir "top" en una Terminal Unix o revisar el Administrador de tareas de Windows). El servidor se puede iniciar mediante un comando del menú (Server -> <span style="text-decoration: underline">B</span>oot Server), con Ctrl-B (o Cmd/Apple-B) o mediante una línea de comandos.

## La Variable 's'

La variable 's' es única en SuperCollider, ya que existe la convención de que el servidor de SC está asignado a esta variable. Por lo tanto, nunca asignes nada más a esta variable.

```supercollider
// exploremos la variable 's', que representa el sintetizador:
s.postln; // vemos que contiene un sintetizador localhost
s.addr // la dirección del sintetizador (dirección IP y puerto)
s.name // el servidor localhost es el servidor predeterminado (ver archivo Main.sc)
s.serverRunning // ¿está en funcionamiento?
s.avgCPU // ¿cuánto CPU está usando en este momento?

// Iniciemos el servidor. Mira la ventana de mensajes
s.boot
```


Podemos explorar la creación de nuestros propios servidores con puertos y direcciones IP específicos:

```supercollider
n = NetAddr("127.0.0.1", 57200); // IP y puerto
p = Server.new("hoho", n); // crear un servidor con la dirección de red específica
p.makeWindow; // crear una ventana GUI
p.boot; // iniciarlo

// probar el servidor:
{SinOsc.ar(444)}.play(p);
// detenerlo
p.quit;
```


Con lo anterior, podrías empezar a pensar en la posibilidad de tener el servidor ejecutándose en una computadora remota con varios clientes comunicándose con él a través de la red, y sí, esa es precisamente una de las ideas innovadoras de SuperCollider 3. Podrías poner cualquier servidor (con una dirección IP y puerto remotos) en tu variable de servidor y comunicarte con él a través de la red. O tener muchos servidores en diversas computadoras, instruyendo a cada uno para que genere audio. Todo esto es común en la práctica de SuperCollider, pero la configuración más común es usar el IDE de SuperCollider para escribir código de SC Lang para controlar un servidor de audio localhost (localhost significa "en la misma computadora"). Y en eso nos centraremos por un tiempo.

## Los Generadores de Unidad (UGens)

Los Generadores de Unidad han sido los bloques clave de los sistemas de síntesis digital desde los sistemas Music N de Max Matthews en la década de 1960. Escrito en C/C++ y compilado como plugins para el Servidor de SC, encapsulan cálculos complejos en una caja negra simple que nos devuelve lo que buscamos, es decir, una salida que podría ser en forma de onda o un filtro. Los Generadores de Unidad, o UGens como comúnmente se les llama, son modulares y la salida de uno puede ser la entrada de otro. Puedes pensar en ellos como unidades en un sintetizador modular, por ejemplo, el Moog:

![Un sintetizador modular Moog](imgs/ch2_moog.webp)

Los UGens típicamente tienen métodos de tasa de audio (.ar) y tasa de control (.kr). Algunos también tienen una tasa de inicialización. La diferencia aquí es que un UGen de **tasa de audio** generará tantas muestras como la tasa de muestreo por segundo. Una computadora con una tasa de muestreo de 44.1 kHz requerirá que cada UGen calcule 44100 muestras por segundo. La **tasa de control** es mucho más baja que la tasa de muestreo y ofrece al diseñador del sintetizador la posibilidad de ahorrar potencia de cálculo (o ciclos de CPU) si se usa sabiamente.

## Tasa de Control

La frecuencia de la tasa de control se puede encontrar dividiendo la tasa de muestreo entre el tamaño del bloque del servidor. El tamaño del bloque es el número de muestras que el servidor calcula de una vez, típicamente 64 muestras, pero esto se puede aumentar o disminuir. Entonces, por ejemplo, si tu tasa de muestreo es de 44.1 kHz y el tamaño del bloque es de 64, tu tasa de control será de ~689 Hz (es decir, 44100/64 = 689.0625). Esto también significa que la latencia del procesamiento de audio con este tamaño de bloque es de ~1.5 ms (es decir, 64/44100).

La tasa de control se usa cuando estamos controlando parámetros que no necesitan estar a tasa de audio. Por ejemplo, la frecuencia de un oscilador. Es perfectamente adecuado controlar cambios de frecuencia con la tasa de control, ya que nuestro oído no detectaría ninguna diferencia si la resolución fuera de tasa de audio o no.

```supercollider
// Aquí hay un generador de ondas seno
// tiene un método de tasa de audio (el .ar)
// y su orden de argumentos es frecuencia, fase y multiplicación
{SinOsc.ar(440, 0, 1)}.play
// ahora intenta ejecutar un SinOsc con tasa de control:
{SinOsc.kr(440, 0, 1)}.play // y es inaudible
```

El SinOsc de tasa de control es inaudible, pero está funcionando bien en el servidor. Usamos UGens de tasa de control para **controlar** otros UGens, por ejemplo, frecuencia, amplitud o frecuencia de filtro. Vamos a explorar eso un poco:

```supercollider
// Una onda seno de 1 Hz modula la frecuencia de 440 Hz
{SinOsc.ar(440*SinOsc.kr(1), 0, 1)}.play
// Una onda seno de tasa de control de 3 Hz modula la amplitud
{SinOsc.ar(440, 0, SinOsc.kr(3))}.play
// Una onda seno de tasa de audio de 3 Hz modula la amplitud
{SinOsc.ar(440, 0, SinOsc.ar(3))}.play
// y como puedes escuchar, no hay diferencia

// Modulación de 2 Hz de la frecuencia de corte de un Filtro Pasa Bajos (LPF)
// agregamos 1002, para que el filtro no entre en el rango negativo
// lo cual podría hacer explotar el filtro
{LPF.ar(Saw.ar(440), SinOsc.kr(2, 0, 1000)+1002)}.play
```

La belleza de los UGens radica en cómo se puede conectar la salida de uno a la entrada de otro. Los UGens de osciladores típicamente generan valores entre -1 y 1, en un patrón determinado (por ejemplo, onda seno, onda diente de sierra o onda cuadrada) y en una frecuencia determinada. Otros UGens, como filtros o procesamiento FFT, realizan cálculos en una señal entrante y generan una nueva señal. Exploremos un ejemplo más de UGens conectados que demuestra su poder modular:

```supercollider
{
    // creamos un oscilador lento en tasa de control
    a = SinOsc.kr(1);
    // la salida de 'a' se usa para multiplicar la frecuencia de una onda diente de sierra
    // resultando en una frecuencia de 220 a 660. ¿Por qué?
    b = Saw.ar(220*(a+2), 0.5);
    // y aquí usamos 'a' para controlar la amplitud (de -0.5 a 0.5)
    c = Saw.ar(110, a*0.5);
    // sumamos b y c, y usamos a para controlar la frecuencia de corte del filtro
    // simplemente agregamos un método .range a a, por lo que ahora genera
    // valores entre 100 y 2000 a 1 Hz
    d = LPF.ar(b+c, a.range(100, 2000));
    	Out.ar(0, Pan2.ar(d, 0));
}.play
```

Este es un simple estudio de caso de cómo los UGens pueden ser sumados (b+c) y utilizados en cualquier cálculo (como a*0.5 - que es una modulación de amplitud, creando un efecto de trémolo) de la señal. Para divertirnos un poco, intentemos usar un micrófono y hacer un pequeño efecto con tu voz:

```supercollider
{
    // tomamos sonido de la tarjeta de sonido
    a = SoundIn.ar(0);
    // y modulamos en anillo usando el ratón para controlar la frecuencia
    b = a * SinOsc.ar(MouseX.kr(100, 3000));
    // también usamos el ratón (vertical) para controlar el delay
    c = b + AllpassC.ar(b, 1, MouseY.kr(0.001, 0.2), 2);
    // y aquí, en lugar de Pan2, simplemente usamos un array [c, c]
    Out.ar(0, [c, c]);
}.play
```

Una buena manera de explorar los UGens es navegando por la documentación.

```supercollider
UGen.browse;
```

## El SynthDef

Arriba exploramos los UGens envolviéndolos en una función y llamando a .play en esa función ({}.play). Lo que esto hace es convertir la función (indicada por {}, como aprendimos en el capítulo 1) en una definición de sintetizador que se envía al servidor y luego se reproduce. El {}.play (o Function:play, si quieres echar un vistazo al código fuente – resaltando "Function:play" y presionando Cmd+I (Win: Ctrl-I) – y explorar cómo SC compila la función en un SynthDef bajo el capó) es cómo muchas personas esbozan sonido en SuperCollider, y es útil para fines de demostración, pero para la construcción real de sintetizadores, necesitamos crear una definición de sintetizador, o un SynthDef.

Un SynthDef es un gráfico precompilado de generadores de unidades. Este gráfico se escribe en un archivo binario y se envía al servidor a través de OSC (Open Sound Control - Ver capítulo XXX). Este archivo se almacena en la carpeta "synthdefs" en tu sistema. De cierta manera, podrías verlo como tu propio plugin VST para SuperCollider, y no necesitas el código fuente para que funcione (aunque no tiene sentido deshacerse de él).

Se recomienda leer detenidamente y comprender bien el archivo de ayuda del SynthDef. El SynthDef es una clase clave de SuperCollider y muy importante. Añade sintetizadores al servidor o escribe archivos de definición de sintetizador en el disco, entre muchas otras cosas. Comencemos explorando cómo podemos convertir una función de gráfico de generador de unidades en una definición de sintetizador:

```supercollider
// este simple sintetizador
{Saw.ar(440)}.play
// se convierte en esta definición de sintetizador
SynthDef(\mysaw, {
    Out.ar(0, Saw.ar(440));
}).add;
```

Te darás cuenta de que hemos hecho dos cosas: hemos dado un nombre a la función (\mysaw), y hemos envuelto nuestra onda de sierra en un UGen 'Out' que define a qué 'Bus' se envía el audio. Si tienes una tarjeta de sonido de 8 canales, podrías enviar audio a cualquier bus del 0 al 7. También podrías enviarlo al bus número 20, pero entonces no podríamos escucharlo. Sin embargo, podríamos poner otro sintetizador allí que enrute el audio de vuelta a los buses de la tarjeta de sonido, por ejemplo, del 0 al 7.

```supercollider
// puedes usar el UGen 'Out' en Function:play
{Out.ar(1, Saw.ar(440))}.play // salida en el altavoz derecho
```

NOTA: Hay una diferencia en el código de Function-play y el SynthDef, en la que **necesitamos** el UGen 'Out' en una definición de sintetizador para indicar al servidor a qué bus de audio debe salir el sonido. (0 es izquierda, 1 es derecha).

Pero volviendo a nuestro SynthDef, ahora podemos intentar instanciarlo y crear un sintetizador. (Un Synth es una instancia (hijo) de un SynthDef). Este sintetizador luego se puede controlar si lo referenciamos con una variable.

```supercollider
// crear un sintetizador y colocarlo en la variable 'a'
a = Synth(\mysaw);
// crear otro sintetizador y colocarlo en la variable 'b'
b = Synth(\mysaw);
a.free; // matar a
b.free; // matar b
```

Este es obviamente un sintetizador no muy interesante. Está "codificado de forma rígida", es decir, los parámetros en él (como la frecuencia y la amplitud) son estáticos y no podemos cambiarlos. Esto solo se hace en situaciones muy específicas, ya que normalmente nos gustaría especificar los valores de nuestro sintetizador tanto al iniciarlo como después de que haya comenzado.

Para poder abrir el SynthDef a parámetros específicos y permitir que se cambie, necesitamos agregar argumentos en el gráfico de la función del UGen. Recuerda en el capítulo 1 cómo creamos una función con argumentos:

```supercollider
f = {arg a, b; 
    c = a + b; 
    postln("c es ahora: " + c)
};
f.value(2, 3);
```

Nota que no puedes escribir 'f.value', ya que obtendrás un error al intentar sumar 'nil' a 'nil' ('a' y 'b' son ambos nil en las ranuras de argumento en la función). Para solucionar eso, podemos darles valores predeterminados:

```supercollider
f = {arg a=2, b=3; 
    c = a + b; 
    postln("c es ahora: " + c)
};
f.value(22, 33);
f.value;
```

Así que agregamos los argumentos para el SynthDef y agregamos un UGen Pan2 que nos permite hacer paneo del sonido desde la izquierda (-1) a la derecha (1). El centro es 0:

```supercollider
SynthDef(\mysaw, { arg freq=440, amp=0.2, pan=0;
    Out.ar(0, Pan2.ar(Saw.ar(freq, amp), pan));
}).add;
// esto ahora nos permite crear un nuevo sintetizador:
a = Synth(\mysaw); // explora el archivo de ayuda de Synth
// y controlarlo, usando el método .set del Synth:
a.set(\freq, 220);
a.set(\amp, 0.8);
a.set(\freq, 555, \amp, 0.4, \pan, -1);
```

Esta definición de sintetizador podría escribirse de una manera mejor y más comprensible. Supongamos que quisiéramos agregar un filtro al sintetizador, podría verse así:

```supercollider
SynthDef(\mysaw, { arg freq=440, amp=0.2, pan=0, cutoff=880, rq=0.3;
    Out.ar(0, Pan2.ar(RLPF.ar(Saw.ar(freq, amp), pan), cutoff, rq));
}).add;
```

Pero esto empieza a ser difícil de leer. Hagamos que el SynthDef sea más fácil de leer (aunque para la computadora es lo mismo, ya que solo le importa dónde están los puntos y comas (;)).

```supercollider
// lo mismo que arriba, pero más legible
SynthDef(\mysaw, { arg freq=440, amp=0.2, pan=0, cutoff=880, rq=0.3;
    var signal, filter, panned;
    signal = Saw.ar(freq, amp);
    filter = RLPF.ar(signal, cutoff, rq);
    panned = Pan2.ar(filter, pan);
    Out.ar(0, panned);
}).add;
```

Así es aproximadamente cómo escribirás y verás que otras personas escriben definiciones de sintetizadores a partir de ahora. Las partes individuales de un gráfico de UGen generalmente se colocan en variables para que sean más legibles para los humanos y más fáciles de entender. La excepción son los tweets de SuperCollider (#supercollider), donde tenemos el límite de 140 caracteres. Ahora podemos explorar un poco más la definición del sintetizador:

```supercollider
a = Synth(\mysaw); // creamos un sintetizador con los argumentos predeterminados
b = Synth(\mysaw, [\freq, 880, \cutoff, 12000]); // pasamos argumentos
a.set(\cutoff, 500);
b.set(\freq, 444);
a.set(\freq, 1000, \cutoff, 1200);
b.set(\cutoff, 4000);
b.set(\rq, 0.1);
```

## Observando la actividad del servidor (Poll, Scope y FreqScope)

SuperCollider tiene varias formas de explorar lo que está sucediendo en el servidor, además de la más obvia: el sonido en sí. Debido a la separación entre el servidor SC y el sc-lang, esto significa que los datos deben enviarse desde el servidor de regreso al lenguaje, ya que es el lenguaje el que imprime o muestra los datos. El servidor es solo una máquina de sonido eficiente y no se preocupa por nada más. Primero podemos intentar hacer una encuesta (obtener) los datos de un UGen y publicarlos en la ventana de mensajes:

```supercollider
// podemos explorar la salida del SinOsc
{SinOsc.ar(1).poll}.play // no podrás escuchar esto
// y comparar con ruido blanco:
{WhiteNoise.ar(1).poll}.play // ¡Escucharás esto! El primer argumento del ruido es la amplitud
// podemos explorar el ratón:
{MouseX.kr(10, 1000).poll}.play // nada que escuchar

// podemos encuestar la frecuencia de un sonido:
{SinOsc.ar(LFNoise2.ar(1).range(100, 1000).poll)}.play
// o encuestamos su amplitud
{SinOsc.ar(LFNoise2.ar(1).range(100, 1000)).poll}.play
// y podemos agregar una etiqueta (el primer argumento es la tasa de encuesta, el segundo es la etiqueta)
{SinOsc.ar(LFNoise2.ar(1).range(100, 1000).poll(10, "freq"))}.play
```

La gente suele usar `poll` para explorar lo que está sucediendo en el sintetizador, para depurar o intentar entender por qué algo no está funcionando. Pero típicamente no se usa en una obra o actuación terminada. Otra forma de explorar el estado del servidor es usar `scope`:

```supercollider
// podemos explorar la salida del SinOsc
{SinOsc.ar(1)}.scope // no podrás escuchar esto
// y comparar con ruido blanco:
{WhiteNoise.ar(1)}.scope // el primer argumento del ruido es la amplitud
// podemos observar el estado del ratón (pero ten en cuenta la tasa de control):
{MouseX.kr(-1, 1)}.scope // nada que escuchar
// el método range mapea la salida de -1 a 1 en 100 a 1000
{SinOsc.ar(LFNoise2.ar(1).range(100, 1000))}.scope;
// lo mismo aquí, exploramos la forma de onda de la sierra a diferentes frecuencias
{Saw.ar(220*SinOsc.ar(0.5).range(1, 10))}.scope
```

El `scope` muestra la amplitud a lo largo del tiempo, es decir: el eje horizontal es **tiempo** y el eje vertical es **amplitud**. Esto se llama a menudo una vista en el dominio del tiempo de la señal. Pero también podemos explorar el contenido de frecuencia del sonido, una vista que llamamos vista en el dominio de la frecuencia. Esto se logra realizando un análisis FFT de la señal, que luego se muestra en el `scope` (no te preocupes, esto sucede "bajo el capó" y aprenderemos sobre esto en el capítulo XXX). Ahora exploremos el `freqscope`:

```supercollider
// vemos la onda a 1000 Hz, con modulación de amplitud
{SinOsc.ar(1000, 0, SinOsc.ar(0.25))}.freqscope
// algo de ruido blanco nuevamente:
{WhiteNoise.ar(1)}.freqscope // valores aleatorios en todo el espectro
// y ahora podemos experimentar el poder del `scope`
{RLPF.ar(WhiteNoise.ar(1), MouseX.kr(20, 12000), MouseY.kr(0.01, 0.99))}.freqscope
// ahora podemos explorar varias formas de onda:
{Saw.ar(440*XLine.ar(1, 10, 5))}.freqscope // revisa el archivo de ayuda de XLine
// LFTri es un UGen no limitado en banda, así que explora el reflejo o 'aliasing'
{LFTri.ar(440*XLine.ar(1, 10, 25))}.freqscope
```

Además, hay un Quark de Spectrogram que muestra una vista de espectrograma de la señal de audio, pero esto no forma parte de la distribución de SuperCollider. Sin embargo, es fácil de instalar y lo cubriremos en el capítulo sobre los Quarks.

### Una breve introducción a los buses y la expansión multicanal

Más adelante profundizaremos en los buses, los grupos y cómo enrutar las señales de audio a través del servidor de SuperCollider. Sin embargo, es importante entender cómo funciona el servidor en términos de canales (o buses) en esta etapa. Primero, todos los osciladores son mono. Muchos recién llegados a SuperCollider encuentran extraño escuchar una señal solo en el oído izquierdo cuando usan auriculares con un `SinOsc`. Sería extraño tenerlo en estéreo, cuadrafónico, 5.1 o cualquier otro formato, a menos que lo especifiquemos. Por lo tanto, necesitamos copiar la señal en el siguiente bus si queremos estéreo.

Podemos ver que, por defecto, SuperCollider tiene 8 canales de salida, 8 canales de entrada y 112 canales de bus de audio privados (donde podemos ejecutar efectos y otras cosas). Esto significa que, si tienes una tarjeta de sonido de 8 canales, puedes enviar una señal a cualquiera de los primeros 8 buses. Si tienes una tarjeta de sonido de 16 canales, debes ingresar a la clase `ServerOptions` y cambiar la variable `numOutputBusChannels` a 16. Hablaremos más sobre esto más adelante, pero veamos ahora algunos ejemplos:

```supercollider
// sonido en diferentes buses
{ Out.ar(0, LFPulse.ar(220, 0, 0.5, 0.3)) }.play; // altavoz izquierdo (bus 0)
{ Out.ar(1, LFPulse.ar(220, 0, 0.5, 0.3)) }.play; // altavoz derecho (bus 1)
{ Out.ar(2, LFPulse.ar(220, 0, 0.5, 0.3)) }.play; // tercer altavoz (bus 2)

// Pan2 convierte la señal en una matriz de dos señales
{ Out.ar(0, Pan2.ar(PinkNoise.ar(1), 0)) }.scope(8)
// o podemos reproducirlo en el bus 6 (probablemente no lo escucharás)
{ Out.ar(6, Pan2.ar(PinkNoise.ar(1), 0)) }.scope(8)
// pero lo anterior es lo mismo que:
{ a = PinkNoise.ar(1); Out.ar(0, [a, a]) }.scope(8)
// y (donde los primeros seis canales están en silencio):
{ a = PinkNoise.ar(1); Out.ar(0, [0, 0, 0, 0, 0, 0, a, a]) }.scope(8)
// sin embargo, no es lo mismo que:
{ Out.ar(0, [PinkNoise.ar(1), PinkNoise.ar(1)]) }.scope(8)
// ¿por qué no? -> porque ahora tenemos DOS señales en lugar de una
```

Queda claro cómo los buses del servidor se representan como una matriz que contiene señales (como en: `[señal, señal, señal, señal, etc.]`). Ahora podemos tomar una señal mono y "expandirla" en otros buses. Esto se llama expansión multicanal:

```supercollider
{ SinOsc.ar(440) }.scope(8)
{ [SinOsc.ar(440), SinOsc.ar(880)] }.scope(8)
// lo mismo que:
{ SinOsc.ar([440, 880]) }.scope(8)
// un truco para 'expandir en una matriz'
{ SinOsc.ar(440) ! 2 }.scope(8)
// si eso fue extraño, prueba esto:
123 ! 30
```

Suficiente por ahora. Exploraremos los buses y el enrutamiento de señales de audio en el capítulo XXX más adelante. Sin embargo, es importante entender esto en esta etapa.

### Obtener valores de vuelta al lenguaje

Como hemos discutido, el lenguaje y el servidor de SuperCollider son dos aplicaciones separadas. Se comunican a través del protocolo OSC. Esto significa que la comunicación entre los dos es **asíncrona**, o en otras palabras, que no se puede saber con precisión cuánto tiempo tomará que llegue un mensaje. Si queremos hacer algo con datos de audio en el lenguaje, como visualizarlos o publicarlos, necesitamos enviar un mensaje al servidor y esperar a que responda. Esto puede suceder de varias maneras, pero una forma típica de hacerlo es usar el UGen `SendTrig`:

```supercollider
// esto sucede en el lenguaje
OSCdef(\listener, {arg msg, time, addr, recvPort; msg.postln; }, '/tr', n);
// y esto sucede en el servidor
{
    var freq;
    freq = LFSaw.ar(0.75, 0, 100, 900);
    SendTrig.kr(Impulse.kr(10), 0, freq);
    SinOsc.ar(freq, 0, 0.5)
}.play
```

Lo que vemos arriba es `SendTrig` enviando 10 mensajes por segundo al lenguaje (el `Impulse` desencadena esos mensajes). Envía un mensaje OSC '/tr' al puerto 57120 localmente. (No te preocupes, exploraremos esto más adelante en un capítulo sobre OSC). El `OSCdef` tiene una función que publica el mensaje del servidor.

Un ejemplo un poco más complejo podría involucrar una GUI (las interfaces gráficas son parte del lenguaje) y la síntesis en el servidor:

```supercollider
(
    // esto sucede en el lenguaje
    var win, freqslider, mouseslider;
    win = Window.new.front;
    freqslider = Slider(win, Rect(20, 10, 40, 280));
    mouseslider = Slider2D(win, Rect(80, 10, 280, 280));
    
    OSCdef(\sliderdef, {arg msg, time, addr, recvPort; 
        {freqslider.value_(msg[3].linlin(600, 1400, 0, 1))}.defer; 
    }, '/slider', n); // el mensaje OSC que escuchamos
    OSCdef(\sliderdef2D, {arg msg, time, addr, recvPort; 
        { mouseslider.x_(msg[3]); mouseslider.y_(msg[4]); }.defer; 
    }, '/slider2D', n); // el mensaje OSC que escuchamos
    
    // y esto sucede en el servidor
    {
        var mx, my, freq;
        freq = LFSaw.ar(0.75, 0, 400, 1000); // emite de 600 a 1400 Hz. ¿Por qué?
        mx = LFNoise2.kr(2).range(0,1);
        my = LFNoise2.kr(2).range(0, 1);
        SendReply.kr(Impulse.kr(10), '/slider', freq); // envía el mensaje OSC 
        SendReply.kr(Impulse.kr(10), '/slider2D', [mx, my]); 
        (SinOsc.ar(freq, 0, 0.5) + RLPF.ar(WhiteNoise.ar(0.3), mx.range(100, 3000), my))!2 ;
    }.play;
)
```

También podríamos escribir valores en un bus de control en el servidor, desde donde podemos leer en el lenguaje. Aquí tienes un ejemplo:

```supercollider
b = Bus.control(s, 1); // creamos un bus de control
{Out.kr(b, MouseX.kr(20,22000))}.play // y escribimos la salida de algún UGen en el bus
b.get({arg val; val.postln;}); // sondeamos el bus desde el lenguaje
// o incluso:
fork{loop{ b.get({arg val; val.postln;}); 0.1.wait; }}
```

Revisa la fuente de `Bus` (presionando Cmd+I / Ctrl+I en Win) y localiza el método `.get`. Verás que el método `.get` de `Bus` utiliza un `OSCresponder` (XXX, ¿es ese el caso en 3.6?) debajo. Por lo tanto, es "asíncrono", lo que significa que no sucederá en el orden lineal de tu código. (El lenguaje solicita el valor al servidor, y el servidor luego lo envía de vuelta al lenguaje. Esto lleva tiempo).

Aquí tienes un programa que demuestra la naturaleza asíncrona de `b.get`. El `{}.play` de arriba debe estar en ejecución. Nota cómo las líneas numeradas de código aparecen en la ventana de mensajes "en el orden incorrecto". (En lugar de una publicación síncrona de 1, 2 y 3, obtenemos el orden de 1, 3 y 2). Toma entre 0.1 y 10 milisegundos obtener el valor en una computadora Intel de 2.8 GHz.

```supercollider
(
x = 0; y= 0;
b = Bus.control(s,1); // creamos un bus de control
{Out.kr(b, MouseX.kr(20,22000))}.play;
t = Task({
    inf.do({
        "1 - antes de b.get : ".post; x = Main.elapsedTime.postln;
        b.get({|val| 
            "2 - ".post; val.postln; 
            y = Main.elapsedTime.postln;
            "el proceso asíncrono tomó : ".post; 
            (y-x

).postln; });
        "3 - después de b.get".postln;
        0.2.wait; })
    });
t.start;
)
```

Este tipo de comunicación del servidor al lenguaje no es muy común. Sin embargo, la comunicación en la dirección opuesta (del lenguaje al servidor) sí lo es. Por lo tanto, esta sección no es vital para tu trabajo en SuperCollider, pero en algún momento te encontrarás con la cuestión de la comunicación sincrónica y asincrónica con el servidor, y esta sección debería prepararte para eso.