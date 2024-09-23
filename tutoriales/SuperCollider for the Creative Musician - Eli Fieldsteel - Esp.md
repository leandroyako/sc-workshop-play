# Introducción

Bienvenido a _SuperCollider para el Músico Creativo: Una Guía Práctica_. Espero que encuentres este libro gratificante, revelador para tus oídos y divertido.

Un poco sobre mí: He sido músico durante la mayor parte de mi vida. Tomé clases de piano cuando era joven, aprendí otros instrumentos durante la secundaria y el bachillerato, y me interesé seriamente en la composición musical cuando tenía unos 15 años. Al mismo tiempo, las matemáticas y la informática siempre estuvieron entre mis mayores aptitudes. Tomé algunos cursos universitarios de matemáticas durante mi último año de bachillerato, y había estudiado el manual de mi calculadora TI-83 hasta el punto de poder empezar a programar por mi cuenta programas semi-complejos. Experimenté con software de audio comercial (principalmente GarageBand) en el bachillerato y la universidad, pero no fue hasta que comencé mis estudios de posgrado en composición musical que empecé a darme cuenta de la profundidad con la que se podían combinar artísticamente la música y el pensamiento computacional. Descubrir SuperCollider y ver/escuchar lo que podía hacer abrió puertas creativas que ni siquiera sabía que existían. Sin embargo, lograr que hiciera lo que yo quería... era otra cuestión. Nunca había tenido formación formal en programación informática más allá de algunas clases universitarias tomadas espontáneamente, y en cuanto a plataformas de codificación, SuperCollider es peculiar, así que fue un lento ascenso cuesta arriba para mí. Después de varios años, cuando finalmente empecé a sentirme competente y autosuficiente, comencé a tomar notas sobre cosas que me hubiera gustado saber desde el primer día. Estas notas evolucionaron hasta convertirse en una especie de plan de estudios, que se manifestó como una serie continua de tutoriales en video publicados en YouTube y ahora, este libro.

¿Por qué usar código para hacer música? En el fondo, todo el software de audio está construido con código, pero a menudo se presenta al usuario como una rica capa de interfaz gráfica destinada a proporcionar un medio intuitivo de control, ayudando a los nuevos usuarios a empezar a producir sonidos de forma rápida y sencilla, sin necesidad de saber mucho sobre los principios subyacentes. Es maravilloso que existan estas herramientas, pero para los usuarios que quieren profundizar más en la máquina para hacer cosas más precisas o personalizadas, estas herramientas pueden resultar restrictivas porque los mecanismos internos están "ocultos" tras una gruesa interfaz gráfica de usuario. Programas como SuperCollider, que permiten al usuario trabajar directamente con el código, proporcionan un control, poder y flexibilidad mucho más directos sobre los tipos de sonidos que ocurren, cuándo ocurren y cómo ocurren. Este libro no sólo presenta una serie de sonidos y técnicas interesantes, sino que también intenta desempaquetar y diseccionar detalles importantes, mostrar alternativas, ilustrar malentendidos comunes y contextualizar estas técnicas dentro de un marco creativo más amplio.

Este libro, y otros materiales didácticos que he publicado, existen con el objetivo central de simplificar y acelerar el proceso de aprendizaje para cualquiera que haya descubierto recientemente SuperCollider y sienta una chispa similar. Habiendo enseñado tecnología musical en educación superior durante varios años, me he encontrado con varios tipos de estudiantes para los que creo que este libro sería valioso. Como sugiere el título, es un tutorial estructurado y una guía de referencia para cualquiera que quiera crear música electrónica o arte sonoro experimental con SuperCollider, y asume que los lectores se encuentran en algún punto del continuo entre músico y programador informático. Tal vez seas un músico experimentado con un interés incipiente en la programación, o tal vez seas un desarrollador de software que crea música electrónica como actividad secundaria. Sea cual sea el caso, si tienes alguna familiaridad con la música y el código -aunque sea sólo un poco de cada uno- deberías poder utilizar este libro para aprender lo básico y poner en marcha algunos proyectos creativos nuevos. Ten en cuenta, sin embargo, que este libro no es un sustituto formal de una introducción a la programación, los principios del audio digital o la teoría musical. Estos son temas muy amplios, que van más allá del alcance de esta publicación. Se tratan selectivamente cuando es pertinente, pero el enfoque general de este libro sigue siendo el uso de SuperCollider para desarrollar proyectos de audio creativos.

Este libro se divide en tres partes: La Parte I cubre los fundamentos del uso del lenguaje, la expresión de ideas a través del código, la escritura de programas básicos y la producción de sonidos simples. La Parte II se centra en técnicas de práctica común, incluyendo síntesis, muestreo, secuenciación, procesamiento de señales, controladores externos y diseño de interfaces gráficas de usuario. En resumen, esta segunda parte detalla los "ingredientes" que componen un proyecto típico. La Parte III lo reúne todo y ofrece estrategias concretas para componer, ensayar e interpretar proyectos a gran escala.

Es difícil exagerar el valor del aprendizaje práctico, especialmente para un lenguaje de codificación orientado al sonido. Con este fin, cada capítulo incluye numerosos ejemplos de código SuperCollider en línea, y cada capítulo también se empareja con uno o más archivos de "Código Complementario", que exploran los temas del capítulo con una profundidad significativamente mayor. Todos los Ejemplos de Código y Códigos Complementarios están alojados en un sitio web complementario y se hace referencia a ellos en el texto con el siguiente icono:

¡Utiliza estos recursos! A medida que leas, (con suerte) te entrarán ganas de experimentar. Cuando lo hagas, descarga estos archivos, estudia su contenido y juega con ellos. Estos archivos existen para proporcionar un acceso inmediato y sin problemas, evitando la necesidad de copiar manualmente el código del libro. Aprender SuperCollider es un poco como aprender un idioma extranjero; leer un libro de texto es ciertamente una buena idea, pero si quieres llegar a ser fluido, no hay un sustituto adecuado para sumergirte en el lenguaje. Cometerás algunos errores, pero también harás descubrimientos importantes. Todo es parte del proceso de aprendizaje.

Antes de empezar a leer, descarga el software SuperCollider, que (en el momento de escribir esto) está disponible en _supercollider.github.io_. También puede que quieras visitar/marcar la página del proyecto SuperCollider en GitHub (_github.com/supercollider/supercollider_), que incluye una wiki, enlaces a tutoriales y muchos otros recursos. Recomiendo trabajar con unos auriculares o altavoces de calidad, aunque los altavoces integrados del portátil funcionarán en caso de apuro. Un micrófono de buena calidad y una interfaz de audio pueden ser útiles para explorar los temas del Capítulo 6, pero hay mucho que te mantendrá ocupado si no tienes acceso a estas cosas, y un micrófono integrado en el portátil será suficiente para una exploración básica. Un controlador de teclado MIDI estándar también será útil (aunque no esencial) para explorar algunos de los ejemplos de código de los Capítulos 7-8.

Por último, mientras trabajas con este libro, mantén la mente abierta y sé paciente contigo mismo. Hay mucho que aprender y no ocurrirá de la noche a la mañana, pero con práctica y dedicación, descubrirás que un nuevo y asombroso mundo del sonido empezará a revelarse, lo que puede ser una experiencia increíblemente emocionante y liberadora. ¡Adelante!

# Parte I
**Fundamentos**
----------------------------------------------

En la Parte I, exploraremos los principios y técnicas fundamentales destinados a ayudarte a comenzar a usar SuperCollider a un nivel básico. Específicamente, después de completar estos dos capítulos, deberías ser capaz de escribir programas simples y reproducir sonidos sencillos.

## Capítulo 1  
**Conceptos Básicos de Programación**
--------------------------------------------------------------

### 1.1 Visión general

Este capítulo cubre los aspectos esenciales de la programación en SuperCollider, como navegar por el entorno, familiarizarse con la terminología básica, comprender los tipos de datos comunes, realizar operaciones simples y escribir/ejecutar programas sencillos. El objetivo es familiarizarse con las cosas que encontrarás en el día a día y desarrollar una comprensión fundamental que te apoyará a lo largo del resto de este libro y mientras te embarcas en tu propio viaje con SC.

Los atajos de teclado juegan un papel importante en SC, ya que proporcionan acceso rápido a acciones comunes. A lo largo de este libro, el indicador \[cmd] se refiere a la tecla de comando en sistemas macOS, y a la tecla \[control] en sistemas Windows y Linux.

### 1.2 Un recorrido por el entorno

Antes de empezar a tratar con código, un buen primer paso es entender lo que vemos al abrir SC por primera vez, como se muestra en la Figura 1.1

![imagen](images/000014.jpg)

FIGURA 1.1 El entorno de SuperCollider.

El elemento central del entorno de SC es el editor de código, un área grande en blanco que sirve como tu espacio de trabajo para crear, editar y ejecutar código. Al igual que un navegador web, se pueden abrir varios archivos simultáneamente, seleccionables mediante el sistema de pestañas que aparece sobre el editor. Los archivos de código se pueden guardar y cargar como en cualquier software de edición de texto o procesamiento de palabras. Los archivos de código de SC utilizan la extensión de archivo "scd" (abreviatura de documento SuperCollider). El editor de código está rodeado por tres paneles acoplables: la ventana de publicación, el navegador de ayuda y la lista de documentos. La ventana de publicación es donde SC muestra información para el usuario. La mayoría de las veces, este es el resultado del código evaluado, pero también puede incluir mensajes de error y advertencias. El navegador de ayuda proporciona acceso a archivos de documentación que detallan cómo funciona SC. La lista de documentos muestra los nombres de los archivos que están actualmente abiertos, ofreciendo una opción de navegación práctica si hay muchos documentos abiertos a la vez. En conjunto, estas y otras características constituyen el Entorno de Desarrollo Integrado de SC, comúnmente conocido como IDE. El IDE sirve como interfaz frontal para el usuario, destinado a mejorar el flujo de trabajo proporcionando cosas como atajos de teclado, coloración de texto, autocompletado y más. El panel de preferencias, que se muestra en la Figura 1.2, es donde se pueden realizar algunas de estas personalizaciones. Se puede acceder al panel de preferencias en el menú desplegable "SuperCollider" en macOS, y en el menú desplegable "Edit" en Windows/Linux.

![imagen](images/000015.jpg)

FIGURA 1.2 El panel de preferencias de SuperCollider.

El IDE es uno de los tres componentes que conforman el entorno de SC. Además, está el lenguaje SC (a menudo llamado "el lenguaje" o "el cliente") y el servidor de audio SC (a menudo llamado "el servidor"). Los nombres técnicos de estos componentes son _sclang_ y _scsynth_, respectivamente, y a pesar de ser partes integrales del entorno, permanecen en gran medida invisibles para el usuario.

El lenguaje alberga una biblioteca de objetos, que son los bloques de construcción básicos de cualquier programa. También alberga el intérprete, un componente central que interpreta y ejecuta el código, traduciéndolo en acción. El intérprete se inicia automáticamente cuando se lanza el IDE, y un pequeño cuadro de estado en la esquina inferior derecha del IDE muestra si el intérprete está activo. SC es un lenguaje interpretado, en lugar de un lenguaje compilado. En términos simples, esto significa que el código puede ejecutarse selectiva e interactivamente, línea por línea, en lugar de tener que escribir la totalidad de un programa antes de ejecutarlo. Esto es especialmente útil porque SC se utiliza regularmente para aplicaciones de audio creativo en tiempo real. En algunos escenarios musicales (la improvisación, por ejemplo), no conoceremos todos los detalles por adelantado, por lo que es conveniente poder interactuar con el código "en el momento". Este dinamismo se presenta en ejemplos a lo largo de este libro (muchos de los cuales están divididos en fragmentos separados de código) y se muestra en su totalidad en el último capítulo de este libro, que trata sobre la codificación en vivo.

El servidor de audio es el programa que maneja el cálculo, la generación y el procesamiento de señales de audio. Coloquialmente, es el "motor" que impulsa las capacidades de sonido de SC. No se puede exagerar que el servidor está completamente separado y es fundamentalmente independiente del lenguaje y del IDE. El lenguaje y el servidor se comunican a través de una red utilizando un modelo cliente-servidor. Por ejemplo, para reproducir algo de audio, primero evaluamos algo de código en el lenguaje. El lenguaje, actuando como cliente en la red, envía una solicitud al servidor, que responde produciendo sonido. En cierto sentido, esta configuración es como revisar el correo electrónico en una computadora personal. Un cliente de correo electrónico da la impresión de que tus mensajes están en tu propia máquina, pero en realidad, eres un usuario cliente en una red, enviando solicitudes para descargar información almacenada en un servidor remoto.

A menudo, el lenguaje y el servidor se ejecutan en la misma computadora, y esta "red" es más un concepto abstracto que una verdadera red de dispositivos separados e interconectados. Sin embargo, el diseño cliente-servidor facilita opciones que involucran máquinas separadas y en red. Es posible que una instancia del lenguaje en una computadora se comunique con un servidor de audio que se ejecuta en una computadora diferente. Es igualmente posible que múltiples clientes se comuniquen con un solo servidor (una configuración común para conjuntos de laptops), o que un usuario del lado del lenguaje se comunique con múltiples servidores. Los mensajes pasados entre el lenguaje y el servidor se basan en el protocolo Open Sound Control (OSC), por lo tanto, el servidor puede ser controlado por cualquier software compatible con OSC. La mayoría de los lenguajes de programación modernos y entornos audiovisuales son compatibles con OSC, como Java, Python, Max/MSP y Processing, por nombrar algunos. Incluso algunas estaciones de trabajo de audio digital pueden enviar y recibir OSC. Sin embargo, usar un cliente alternativo no suele proporcionar beneficios sustanciales sobre el lenguaje SC, debido a sus objetos de alto nivel que encapsulan y generan automáticamente mensajes OSC. Además, la división cliente-servidor mejora la estabilidad; si la aplicación cliente se bloquea, el servidor puede continuar reproduciendo sin interrupción mientras se reinicia el cliente.

A diferencia del intérprete, el servidor no se inicia automáticamente cuando se lanza el IDE y debe iniciarse manualmente antes de que podamos empezar a trabajar con sonido, lo cual es el foco del próximo capítulo. Por ahora, nuestro enfoque está en el lenguaje y el IDE.

### 1.3 Una visión del mundo orientada a objetos

El lenguaje SC es un lenguaje orientado a objetos. Aunque es útil entender algunos principios básicos de la programación orientada a objetos (POO), no es necesario profundizar desde una perspectiva musical. Esta sección transmite algunos conceptos esenciales de la POO, basándose principalmente en analogías del mundo real, evitando un enfoque más teórico.

#### 1.3.1 Objetos y Clases

Nuestro mundo está lleno de _objetos_, como plantas, animales, edificios y vehículos. Estos objetos existen dentro de una jerarquía: algunos objetos, como casas, supermercados y estadios, son todos miembros de la misma categoría o _clase_ de objetos, llamados edificios. Aplicando algo de terminología de programación a este ejemplo, los edificios se considerarían la clase padre (o superclase) de casas, supermercados, estadios y muchos otros. De manera similar, las casas, los supermercados y los estadios son cada uno una clase hija (o subclase) de edificios. Esta jerarquía podría extenderse más en cualquier dirección: podríamos tener varias subclases de casas (cabañas, mansiones, etc.), mientras que edificios, vehículos, plantas y animales podrían ser subclases de una superclase aún más abarcadora llamada "cosas". Esta estructura organizativa es como un árbol, con unas pocas ramas grandes y anchas cerca de un extremo, y muchas ramas más pequeñas y específicas hacia el otro extremo.

Al igual que el mundo real, el lenguaje SC está lleno de objetos que existen dentro de una jerarquía de clases similar, llamada _árbol de clases_. Las clases de objetos en SC incluyen cosas como Integers (Enteros), Floats (Números de punto flotante), Strings (Cadenas de texto), Arrays (Arreglos), Functions (Funciones), Buttons (Botones), Sliders (Deslizadores) y mucho más. Cuando se representan con código, el nombre de una clase siempre comienza con una letra mayúscula, que es como SC las distingue. Si algunos de estos términos te son desconocidos, no te preocupes. Los introduciremos adecuadamente más adelante.

#### 1.3.2 Métodos y Herencia

Ciertos tipos de interacciones tienen sentido para ciertos tipos de objetos. Por ejemplo, es razonable preguntar si un animal es un mamífero, pero no tiene sentido cuando se aplica a un vehículo. Por otro lado, algunos tipos de consultas tienen sentido para todos los objetos, como preguntar si algo está vivo. El punto es que un tipo específico de objeto "sabe" cómo responder a ciertos tipos de consultas, a las que responde de manera significativa. Estas consultas se llaman _métodos_ o _mensajes_. Por ejemplo, un entero sabe cómo responder a ser "elevado al cuadrado" (multiplicado por sí mismo). Para un deslizador gráfico, este método no tiene sentido. Más aún, hay algunos métodos que tienen significado tanto para enteros como para deslizadores, como uno que pregunta "¿eres un entero?"

Si un método está definido para una clase, todas sus subclases heredan automáticamente ese método y responden a él de manera similar. También es posible que el mismo método produzca diferentes resultados cuando se aplica a diferentes objetos (esta capacidad se llama _polimorfismo_). Considera el verbo "archivar" \["file"]. Semánticamente, lo que esto significa depende del objeto que se está archivando. Archivar \[file] un documento significa organizarlo en un archivador. Limar \[file] un trozo de metal, por otro lado, significa suavizarlo puliéndolo. Muchos ejemplos de polimorfismo existen dentro de SC. El método "play" (reproducir), por ejemplo, está definido para muchos tipos de objetos, pero produce varios resultados que pueden o no involucrar la producción de sonido.

#### 1.3.3 Clases vs. Instancias

Hay una distinción importante entre un objeto tangible y la idea abstracta de ese objeto. Para ilustrar, considera una casa, comparada con un plano para una casa. El plano representa una casa y proporciona un conjunto de instrucciones para crearla. Pero no es lo mismo que la casa en sí. ¡No puedes vivir en un plano!

En este ejemplo, el plano funciona de manera similar a la _clase_ de casas, mientras que una casa física se consideraría una _instancia_ de esa clase. Podrías, por ejemplo, usar un plano para construir muchas casas. Incluso podría ser posible construir varias casas diferentes usando el mismo plano, haciendo algunos ajustes a las instrucciones antes de cada construcción. Generalmente, una clase puede conjurar a la existencia una versión tangible de lo que representa, pero usualmente son estas instancias con las que estamos interesados en trabajar.

### 1.4 Escribiendo, Entendiendo y Evaluando Código

A medida que comenzamos a traducir estos conceptos abstractos en código concreto, ten en cuenta que escribir código de computadora requiere precisión. Incluso los detalles aparentemente más pequeños, como el uso de mayúsculas y la ortografía, son importantes. El intérprete nunca intentará "adivinar" lo que quieres decir si tu código es vago o sin sentido. Por el contrario, intentará hacer exactamente lo que le instruyes y reportará errores si no puede cumplir.

Escribe lo siguiente en el editor de código, exactamente como aparece:

`4.squared;`

Luego, asegurándote de que el cursor del ratón esté colocado en algún lugar de esta línea, presiona \[shift\]+\[enter\], lo que le dice al intérprete que ejecute la línea actual. Verás un breve destello de color sobre el código, y el número 16 aparecerá en la ventana de publicación. Si esta es tu primera vez usando SC, ¡felicidades! Acabas de ejecutar tu primer programa. Demos un paso atrás y diseccionemos lo que acaba de suceder.

#### 1.4.1 Una Sola Línea de Código, Deconstruida

La expresión **4.squared** contiene un miembro de la clase entero y el método "squared", que está definido para enteros. Decimos que cuatro es el _receptor_ del método. El punto, en este contexto, es el símbolo que aplica el método al receptor. Esta construcción "receptor-punto-método" se usa comúnmente para realizar operaciones con objetos, pero hay una sintaxis alternativa que implica colocar el receptor en un encierro de paréntesis, inmediatamente después del método:

`squared(4);`

¿Por qué elegir un estilo sobre el otro? Esto está últimamente dictado por la preferencia personal y generalmente gobernado por la legibilidad. Por ejemplo, un hablante de inglés probablemente elegiría **4.squared** en lugar de **squared(4)**, porque imita cómo se hablaría la frase.

Los paréntesis utilizados para contener el receptor son un tipo de _encierro_ en SC. Otros incluyen \[corchetes\], {llaves}, "comillas dobles" y 'comillas simples'. Cada tipo de encierro tiene su propia importancia, y algunos tienen múltiples usos. Abordaremos los encierros con más detalle a medida que surjan, pero por ahora es importante reconocer que un encierro siempre implica un par de símbolos: uno para comenzar el encierro y otro para terminarlo. A veces, un encierro contiene solo unos pocos caracteres, mientras que otros pueden contener miles de líneas. Si un corchete de apertura no tiene su pareja, tu código no se ejecutará correctamente y probablemente verás un mensaje de error.

El punto y coma es el terminador de un enunciado. Este símbolo le dice al intérprete dónde termina una expresión y, posiblemente, dónde comienza otra. Los puntos y comas son el equivalente en código de los puntos y signos de interrogación en una novela, que ayudan a nuestro cerebro a analizar la escritura en oraciones discretas. En SC, cada enunciado siempre debe terminar con un punto y coma. Omitir un punto y coma está bien cuando se evalúa solo una expresión, pero omitir un punto y coma en una situación de múltiples líneas generalmente producirá un error.

En el caso de **4.squared** o **squared(4)**, el resultado es el mismo. Al evaluar, el intérprete _devuelve un valor_ de 16. Devolver un valor no es lo mismo que imprimirlo en la ventana de publicación. De hecho, el intérprete siempre publica el valor de la última línea evaluada, lo que hace que este comportamiento sea más un subproducto de la evaluación del código que cualquier otra cosa. Devolver un valor es un concepto más profundo y fundamental, que significa que el intérprete ha tomado tu código y lo ha digerido, y te está pasando el resultado. Podemos pensar en la expresión **4.squared** o **squared(4)** como una representación equivalente del número 16. Como tal, podemos tratar toda la expresión como un nuevo receptor y encadenar métodos adicionales para aplicar operaciones adicionales. Por ejemplo, el Ejemplo de Código 1.1 muestra cómo podemos tomar el recíproco (es decir, uno dividido por el receptor) del cuadrado de un número, demostrado usando ambos estilos de sintaxis:

Ejemplo de Código 1.1: Combinando múltiples métodos en un solo enunciado, usando dos estilos de sintaxis diferentes.

`4.squared.reciprocal;`

`reciprocal(squared(4));`

Los métodos encadenados usando el estilo "receptor-punto-método" se aplican de izquierda a derecha. Cuando se usa la sintaxis "método(receptor)", el flujo progresa hacia afuera desde el conjunto más interno de paréntesis.

A diferencia de **squared** o **reciprocal**, algunos métodos requieren información adicional para devolver un valor. Por ejemplo, el método **pow** eleva su receptor a la potencia de algún exponente, que el usuario debe proporcionar. El Ejemplo de Código 1.2 muestra una expresión que devuelve tres elevado a la cuarta potencia, usando ambos estilos de sintaxis. En este contexto, decimos que cuatro es un _argumento_ del método pow. Los argumentos son un concepto de gran alcance que exploraremos más adelante en este capítulo. Por ahora, piensa en un argumento como un valor de entrada necesario para que algún proceso funcione, como una llamada a un método. Los intentos de usar **pow** sin proporcionar el exponente producirán un error. Ten en cuenta que cuando aparecen varios elementos en un encierro de argumentos, deben estar separados por comas.

Ejemplo de Código 1.2: Una expresión de código que involucra un receptor, método y argumento, usando dos estilos de sintaxis diferentes.

`3.pow(4);`

`pow(3, 4);`

#### 1.4.2 Múltiples Líneas de Código, Deconstruidas

Supongamos que continuáramos encadenando métodos adicionales a una de las expresiones en el Ejemplo de Código 1.1. Después de varias docenas de métodos, la línea se volvería bastante larga. Podría extenderse a una nueva línea y también se volvería cada vez más difícil de leer y entender. Por esta razón, frecuentemente dividimos una serie de operaciones en múltiples enunciados, escritas en líneas separadas. Para hacer esto correctamente, necesitamos alguna forma de "capturar" un valor, para que pueda ser referenciado en pasos subsiguientes.

Una _variable_ es un contenedor nombrado que puede contener cualquier tipo de objeto. Una forma de crear una variable es declararla usando una declaración **var**. Un nombre de variable debe comenzar con una letra minúscula. Después de esta letra, el nombre puede incluir letras mayúsculas/minúsculas, números y/o guiones bajos. La Tabla 1.1 contiene ejemplos de nombres de variables válidos e inválidos.

TABLA 1.1 Ejemplos de nombres de variables válidos e inválidos.

| Válidos:             | Inválidos:                                         |
| -------------------- | -------------------------------------------------- |
| `num`<br>`sample_04` | `Num`<br>`myValue`<br>`my#$%&Value`<br>`sample-04` |

Los nombres de las variables deben ser cortos, pero significativos, encontrando un equilibrio entre brevedad y legibilidad. Una vez que se declara una variable, se puede asignar un objeto a una variable usando el símbolo de igual. Una secuencia típica implica declarar una variable, asignar un valor y luego modificar repetidamente el valor y asignar cada nuevo resultado a la misma variable, sobrescribiendo la asignación más antigua en el proceso. Esto inicialmente parece extraño desde una perspectiva "matemática", pero el símbolo de igual no significa igualdad numérica en este caso; en su lugar, denota una acción de almacenamiento. En el Ejemplo de Código 1.3, la expresión `num = num.squared` podría traducirse al español como el siguiente comando: "Eleva al cuadrado el valor actualmente almacenado en la variable llamada `num`, y almacena el resultado en la misma variable, sobrescribiendo el valor antiguo."

Para evaluar un bloque de múltiples líneas, necesitamos aprender una nueva técnica y un nuevo atajo de teclado. El código en el Ejemplo de Código 1.3 ha sido envuelto en un encierro de paréntesis, cada uno en su propia línea arriba y abajo. Aquí, ya estamos viendo que un encierro parentético sirve para múltiples propósitos. En este caso, delimita un bloque de múltiples líneas: una unidad modular que puede ser pasada al intérprete con una sola pulsación de tecla. En lugar de presionar \[shift\]+\[enter\], coloca el cursor en cualquier lugar dentro del encierro y presiona \[cmd\]+\[enter\].

Ejemplo de Código 1.3: Un bloque de código de múltiples líneas.
```supercollider
(
var num;
num = 4;
num = num.squared;
num = num.reciprocal;
)
```

_Tip.rand(); Evaluando Código_

Usar la técnica y la pulsación de tecla correctas para evaluar el código puede ser un punto común de confusión para los nuevos usuarios. Incluso si tu código está escrito correctamente, una mala evaluación producirá errores que sugieren lo contrario, porque hace que el intérprete "vea" tu código incorrectamente. Recuerda que hay dos atajos de teclado para evaluar código: \[shift\]+\[enter\] y \[cmd\]+\[enter\]. Su comportamiento depende de las siguientes condiciones:

• Si hay algún código resaltado:

• tanto \[cmd\]+\[enter\] como \[shift\]+\[enter\] evaluarán el código resaltado.

• Si no se selecciona ningún código, y el cursor está dentro de un encierro de bloque de múltiples líneas:

• \[cmd\]+\[enter\] evaluará todo el bloque.

• \[shift\]+\[enter\] evaluará la línea en la que se coloca el cursor.

• Si no se selecciona ningún código, y el cursor no está dentro de un encierro de bloque de múltiples líneas:

• tanto \[cmd\]+\[enter\] como \[shift\]+\[enter\] evaluarán la línea en la que se coloca el cursor.

También ten en cuenta que en este contexto, la presencia de caracteres de retorno (en lugar de punto y coma) determina lo que constituye una "línea" de código. Por ejemplo, a pesar de contener múltiples enunciados, el siguiente ejemplo se considera una sola línea, por lo que tanto \[cmd\]+\[enter\] como \[shift\]+\[enter\] lo evaluarán:

`var num; num = 4; num = num.squared; num = num.reciprocal;`

Por el contrario, el siguiente ejemplo se considera que ocupa múltiples líneas, a pesar de contener solo un enunciado. Por lo tanto, \[shift\]+\[enter\] no funcionará a menos que se resalte todo el ejemplo, y \[cmd\]+\[enter\] no funcionará a menos que esté contenido en un encierro parentético.

```supercollider
4
.squared;
```

Las variables declaradas usando una declaración **var** son _variables locales_; son locales al código evaluado del que forman parte. Esto significa que una vez que la evaluación se completa, las variables creadas de esta manera ya no existirán. Si más tarde intentas evaluar **num** por sí solo, encontrarás que no solo ha perdido su asignación de valor, sino que también produce un error indicando que la variable no está definida. Las variables locales son transitorias. Son útiles para casos específicos de contexto donde no hay necesidad de retener la variable más allá de su alcance inicial.

Si necesitamos varias variables locales, se pueden combinar en una sola declaración. También se les pueden dar asignaciones de valor durante la declaración. El Ejemplo de Código 1.4 declara tres variables y proporciona asignaciones iniciales a las dos primeras. Elevamos al cuadrado la primera variable, tomamos el recíproco de la segunda y devolvemos la suma, que es 49.2.

Ejemplo de Código 1.4: Un bloque de código de múltiples líneas que declara múltiples variables locales y proporciona asignaciones predeterminadas.
```supercollider
(
var thingA = 7, thingB = 5, result;
thingA = thingA.squared;
thingB = thingB.reciprocal;
result = thingA + thingB;
)
```

_Tip.rand(); Números Negativos como Asignaciones Predeterminadas de Variables_

Si a una variable se le da un valor predeterminado negativo durante la declaración, hay un posible inconveniente. El valor negativo debe estar entre paréntesis o tener un espacio entre él y el símbolo de igual precedente. Si el símbolo de igual y el símbolo de menos están directamente adyacentes, SC interpretará erróneamente el par de símbolos como una operación no definida. Esta misma regla se aplica a una declaración de argumentos, introducida en la siguiente sección. De las siguientes tres expresiones, las dos primeras son válidas, pero la tercera fallará.

`var num = -2;`

`var num =(-2);`

`var num =-2;`

¿Qué pasa si queremos retener una variable, para usarla nuevamente en el futuro como parte de una evaluación de código separada? Podemos usar una _variable de entorno_, creada precediendo el nombre de la variable con un carácter de tilde (~). Alternativamente, podemos usar uno de los veintiséis caracteres alfabéticos en minúscula, que están reservados como _variables del intérprete_. Tanto las variables de entorno como las del intérprete se pueden usar sin una declaración local, y ambas se comportan con alcance global, es decir, mantendrán su valor (incluso a través de múltiples documentos de código) mientras el intérprete permanezca activo. Las variables del intérprete son de uso limitado, ya que solo hay veintiséis de ellas y no pueden tener nombres más largos y significativos. Pero son convenientes para evitar la declaración al esbozar una idea o probar algo rápidamente. Las variables de entorno son generalmente más útiles porque podemos personalizar sus nombres. Los dos bloques de código en el Ejemplo de Código 1.5 son cada uno equivalente al código en el Ejemplo de Código 1.3, pero en cualquier caso, la variable retendrá su asignación después de que se complete la evaluación.

Ejemplo de Código 1.5: Uso de variables del intérprete y de entorno (respectivamente).

```supercollider
(
n = 4;
n = n.squared;
n = n.reciprocal;
)

(
~num = 4;
~num = ~num.squared;
~num = ~num.reciprocal;
)
```

####1.4.3 Publicando un Valor

El método **postln** tiene el efecto de imprimir su receptor en la ventana de publicación, seguido de una nueva línea. Este método simplemente devuelve su receptor, por lo que es "neutral" en el sentido de que no modifica el objeto al que se aplica. Este método es útil para visualizar valores a mitad de un bloque de múltiples líneas, quizás para verificar su corrección. Al evaluar el código en el Ejemplo de Código 1.6, veremos el valor 16 aparecer en la ventana de publicación (el resultado de **postln**), seguido de 0.0625 (el resultado de que el intérprete publique el resultado de la última línea evaluada).

Ejemplo de Código 1.6: Uso del método **postln**.

```supercollider
(
~num = 4;
~num = ~num.squared.postln;
~num = ~num.reciprocal;
)
```
#### 1.4.4 Comentarios

Un comentario es texto que el intérprete ignora. Los comentarios se incluyen normalmente para proporcionar alguna información para un lector humano. El lector imaginado podría ser alguien más, como un amigo o colaborador, ¡pero también podrías ser tú! Dejar notas para ti mismo es una buena manera de refrescar tu memoria si tomas un largo descanso de un proyecto y no recuerdas exactamente dónde lo dejaste.

Hay dos formas de designar texto como comentario. Para comentarios cortos, preceder el texto con dos barras diagonales "comentará" el texto hasta el siguiente carácter de retorno. Para crear comentarios más grandes que incluyan múltiples líneas de texto, encerramos el texto en otro tipo de encierro, comenzando con una barra diagonal-asterisco, y terminando con un asterisco-barra diagonal. Estos estilos se muestran en el Ejemplo de Código 1.7.

Ejemplo de Código 1.7: Uso de dos estilos diferentes de comentarios.
```supercollider
(
/*
este es un comentario de múltiples líneas, que podría
usarse en la parte superior de tu código para
explicar algunas características de tu programa.
*/

var num = 4; // un comentario de una sola línea: declara una variable
num = num.squared;
num = num.reciprocal;
)
```
#### 1.4.5 Espacios en Blanco

Los espacios en blanco se refieren al uso de caracteres de "espacio vacío", como espacios y nuevas líneas. Generalmente, SC es indiferente a los espacios en blanco. Por ejemplo, ambas de las siguientes declaraciones se consideran sintácticamente válidas y producirán el mismo resultado:

`4.squared+2;`

`4 . squared + 2;`

El uso de espacios en blanco es en última instancia una cuestión de gusto, pero parece haber un consenso entre los programadores de que hay un equilibrio que alcanzar. Usar muy pocos espacios en blanco aprieta tu código y no proporciona suficiente espacio para que "respire". Demasiados espacios en blanco, y el código se extiende hasta el punto de ser igualmente difícil de leer. Las elecciones de espacios en blanco hechas a lo largo de este libro se basan en preferencias personales y años de estudio del código de otros programadores.

### 1.5 Obteniendo Ayuda

El IDE incluye recursos para obtener ayuda en varios temas. Esta sección se enfoca en acceder y navegar estos recursos.

#### 1.5.1 El Navegador de Ayuda

El navegador de ayuda es el recurso principal para obtener ayuda dentro del IDE. Proporciona acceso a toda la documentación de SC, que incluye resúmenes, archivos de referencia, guías, algunos tutoriales y archivos de ayuda individuales para cada objeto. Incluye una función de búsqueda, así como una opción de navegación para explorar la documentación por categoría. Es una buena idea pasar algún tiempo navegando para tener una idea de lo que hay. Ten en cuenta que la documentación no está estructurada como un tutorial completo y lógicamente secuenciado (si lo fuera, habría menos necesidad de libros como este); más bien, tiende a ser más útil como una referencia rápida para verificar algún detalle específico.

Hay dos pulsaciones de teclas para acceder rápidamente a una página en el navegador de ayuda: \[cmd\]+\[d\] realizará una búsqueda de la clase o método indicado por la ubicación actual del cursor del ratón, y \[shift\]+\[cmd\]+\[d\] invoca un campo de búsqueda emergente para consultar un término específico. Si hay una coincidencia exacta de clase para tu consulta (la capitalización importa), aparecerá el archivo de ayuda de esa clase. Si no, el navegador mostrará una lista de resultados que cree que son buenas coincidencias. ¡Pruébalo tú mismo! Escribe "Integer" en el editor y presiona \[cmd\]+\[d\] para abrir el archivo de ayuda asociado.

La estructura de un archivo de ayuda de clase aparece en la Figura 1.3. En general, estos archivos comienzan con el nombre de la clase, junto con su linaje de superclases, un resumen de la clase y un puñado de clases y temas relacionados. A continuación, el archivo de ayuda incluye una descripción detallada, métodos de clase, métodos de instancia y a menudo algunos ejemplos que se pueden ejecutar directamente en el navegador y/o copiar en el editor de texto.

![image](images/000016.jpg)

FIGURA 1.3 La estructura de un archivo de ayuda de clase. Las elipsis verticales representan material omitido por claridad y concisión.

#### 1.5.2 Buscando Implementaciones

El navegador de ayuda es el recurso principal para nuevos usuarios, pero a medida que te sientas más cómodo con SC, es posible que quieras mirar directamente el código fuente de una clase o método. Además, como SC es un proyecto de código abierto en desarrollo activo, hay casos en los que el contenido de un archivo de ayuda puede no ser completamente consistente con el comportamiento del objeto que describe. El código fuente, por otro lado, nos permite ver exactamente cómo funciona algo.

Hay dos pulsaciones de teclas para buscar implementaciones de clase o método: \[cmd\]+\[i\] realizará una búsqueda de todas las implementaciones de código fuente de la clase o método indicado por la ubicación actual del cursor del ratón, y \[shift\]+\[cmd\]+\[i\] mostrará una barra de búsqueda. Cuando ingreses tu término de búsqueda, se poblará una lista con los archivos de código fuente en los que aparece ese término (ver Figura 1.4). Seleccionar uno abrirá el archivo fuente y automáticamente se desplazará al lugar relevante. ¡Solo asegúrate de no editar nada!

Para probarlo tú mismo, presiona \[shift\]+\[cmd\]+\[i\], escribe "play" en la barra de búsqueda y presiona enter para ver una lista de clases que implementan este método. Haz clic en uno de estos elementos y presiona enter para abrir el código fuente de esa clase. Si el código fuente te parece totalmente incomprensible, ¡no te preocupes! Ser capaz de leer estos archivos no es esencial, pero a medida que te sientas más cómodo con SC, es posible que te encuentres explorando estos archivos con más frecuencia.

![imagen](images/000017.jpg)

FIGURA 1.4 La ventana de búsqueda para buscar implementaciones de métodos.

#### 1.5.3 El Navegador de Clases

El navegador de clases es una herramienta gráfica para navegar por el árbol de clases. El método **browse** se puede aplicar a cualquier nombre de clase (por ejemplo, **Array.browse**), lo que invoca el navegador y muestra información para esa clase. El navegador de clases, mostrado en la Figura 1.5, muestra la superclase de una clase, sus subclases, métodos y argumentos. Los botones cerca de la parte superior del navegador se pueden usar para navegar hacia atrás y hacia adelante (como un navegador web), así como para navegar a la superclase de una clase, o para mostrar archivos de código fuente. También puedes navegar a una subclase haciendo doble clic en ella en la lista en la esquina inferior izquierda.

![imagen](images/000018.jpg)

FIGURA 1.5 El navegador de clases.

### 1.6 Un Recorrido por Clases y Métodos

Con una comprensión básica de la escritura y evaluación de código detrás de nosotros, estamos listos para dar una mirada más detallada a algunas clases y métodos comúnmente usados, para tener una mejor idea de las operaciones que es probable que encontremos regularmente.

#### 1.6.1 Enteros y Flotantes

Las clases **Integer** y **Float** representan valores numéricos. Ya hemos encontrado enteros, que son números enteros que pueden ser positivos, negativos o cero. Un flotante, por otro lado, es un número que incluye un punto decimal, como 9.02 y -315.67. Incluso el número 1.0 es un flotante, a pesar de ser cuantitativamente igual a uno. Algunos lenguajes de programación son bastante particulares sobre la distinción entre enteros y flotantes, rechazando ciertas operaciones que intentan combinarlos, pero SC es flexible y normalmente convertirá automáticamente según sea necesario. Los enteros y los flotantes están estrechamente relacionados en el árbol de clases y por lo tanto comparten muchos métodos, pero hay algunos métodos que se aplican a uno y no al otro.

Comenzaremos nuestro recorrido introduciendo el método **class**, que devuelve la clase de su receptor. Este método no es exclusivo de enteros y flotantes; de hecho, ¡cada objeto sabe cómo responder a él! Sin embargo, es relevante aquí para mostrar las clases a las que pertenecen diferentes números.

`4.class; // -> Integer`

`4.0.class; // -> Float`

Hay muchos métodos que realizan operaciones matemáticas con números. Aquellos que realizan una operación que involucra dos valores se llaman _operadores binarios_, mientras que aquellos que realizan una operación en un solo receptor, como tomar la raíz cuadrada de un número, se llaman _operadores unarios_. La mayoría de las operaciones existen como llamadas a métodos (por ejemplo, **squared**), pero algunas, como la suma y la multiplicación, son tan comúnmente usadas que tienen una representación simbólica directa (imagina si la multiplicación requiriera escribir **12.multipliedBy(3)** en lugar de **12 \* 3**). Las listas descriptivas de operadores comúnmente usados aparecen en las Tablas 1.2 y 1.3. Una lista más completa se puede encontrar en un archivo de ayuda de SC titulado "Operators".

TABLA 1.2 Lista de operadores unarios comunes.

| Uso del método   | Descripción                                                             |
| ---------------- | ----------------------------------------------------------------------- |
| `abs(x);`        | Valor absoluto. Valor no-negativos de _x_, ej. distancia desde el cero. |
| `ceil(x);`       | Redondear hacia arriba al entero más cercano.                           |
| `floor(x);`      | <br>Redondear hacia abajo al entero más cercano.                        |
| `neg(x);`        | Negación. Los números positivos se vuelven negativos y viceversa.       |
| `reciprocal(x);` | Devuelve 1 dividido _x_.                                                |
| `sqrt(x);`       | Raíz cuadrada de _x_.                                                   |
| `squared(x);`    | Devuelve _x_ elevado a la potencia de 2.                                |

TABLA 1.3 Lista de operadores binarios comunes.

| Nombre         | Uso del método | Uso del símbolo | Descripción                                             |
| -------------- | -------------- | --------------- | ------------------------------------------------------- |
| Suma           | N/D            | `x + y;`        |                                                         |
| Resta          | N/D            | `x - y;`        |                                                         |
| Multiplicación | N/D            | `x * y;`        |                                                         |
| División       | N/D            | `x / y;`        |                                                         |
| Exponenciación | `x.pow(y);`    | `x ** y;`       | Vuelve _x_ elevado al poder de _y_.                     |
| Módulo         | `x.mod(y);`    | `x % y;`        | Devuelve el resto de _x_ dividido por _y_.              |
| Redondeo       | `x.round(y);`  | N/D             | Devuelve _x_ redondeado al múltiplo más cercano de _y_. |
"Orden de operaciones" se refiere a las reglas que gobiernan la secuencia en la que se deben realizar las operaciones. En la escuela primaria, por ejemplo, típicamente aprendemos que en la expresión 4 + 2 * 3, la multiplicación debe realizarse primero, y luego la suma. SC tiene sus propias reglas para el orden de operaciones, que pueden sorprenderte. Si una expresión incluye múltiples operadores simbólicos, SC los aplicará de izquierda a derecha, sin dar precedencia a ninguna operación. Si una expresión incluye una combinación de llamadas a métodos y operadores simbólicos, SC aplicará primero las llamadas a métodos, y luego los operadores simbólicos de izquierda a derecha. Los paréntesis tienen precedencia sobre las llamadas a métodos y los operadores simbólicos (ver Ejemplo de Código 1.8). En algunos casos, puede ser una buena práctica usar paréntesis, incluso cuando no son necesarios, para proporcionar claridad a los lectores.

Ejemplo de Código 1.8: Ejemplos de cómo se aplica la precedencia a combinaciones de métodos, operadores binarios simbólicos y paréntesis.
```supercollider
// los operadores simbólicos tienen igual precedencia, aplicados de izquierda a derecha:
4 + 2 * 3; // -> 18

// los paréntesis tienen precedencia sobre los operadores simbólicos:
4 + (2 * 3); // -> 10

// los métodos tienen precedencia sobre los operadores simbólicos:
4 + 2.pow(3); // -> 12

// los paréntesis tienen precedencia sobre los métodos:
(4 + 2).pow(3); // -> 216

// primero los paréntesis, luego los métodos, luego los operadores binarios:
1 + (4 + 2).pow(3); // -> 217
```

#### 1.6.2 Cadenas de texto
Una cadena de texto es una secuencia ordenada de caracteres, delimitada por comillas dobles. Una cadena puede contener cualquier texto, incluyendo letras, números, símbolos e incluso caracteres no imprimibles como tabulaciones y nuevas líneas. Las cadenas se usan comúnmente para representar texto y pueden usarse para proporcionar nombres o etiquetas para ciertos tipos de objetos. Varios ejemplos aparecen en el Ejemplo de Código 1.9

Ciertos caracteres necesitan un tratamiento especial cuando aparecen dentro de una cadena. Por ejemplo, ¿qué pasa si queremos poner una comilla doble dentro de una cadena? Si no se hace correctamente, la comilla interna terminará prematuramente la cadena, probablemente causando que el intérprete reporte un error de sintaxis. Los caracteres especiales se ingresan precediéndolos con una barra invertida, que en este contexto se llama el *carácter de escape*. Su nombre se refiere al efecto que tiene en el intérprete, haciendo que "escape" del significado normal del carácter.

Ejemplo de Código 1.9: Ejemplos de cadenas y uso del carácter de escape.
```supercollider
// una cadena típica
"Haz clic en el botón verde para comenzar.";

// usando el carácter de escape para incluir comillas
"La frase \"la práctica hace la perfección\" es una que trato de recordar.";

// usando el carácter de escape para incluir nuevas líneas
"Esta cadena\nse imprimirá en\nmúltiples líneas.";
```


Sabemos que el símbolo más denota suma para enteros y flotantes, pero también tiene significado para las cadenas (el uso de un símbolo para múltiples propósitos se llama _sobrecarga_ y es otro ejemplo de polimorfismo). Un solo más devolverá una sola cadena a partir de dos cadenas, insertando un espacio entre ellas. Un doble más hace casi lo mismo pero omite el espacio. Estos y otros métodos de cadenas aparecen en el Ejemplo de Código 1.10.

Ejemplo de Código 1.10: Métodos y operaciones comunes de cadenas.
```supercollider
"Hola" + "allí!"; // -> "Hola allí!"

"Con" ++ "catenación"; // -> "Concatenación"

"Soy una cadena.".size; // devuelve el número de caracteres en la cadena

"Soy una cadena.".reverse; // invierte el orden de los caracteres

"Soy una cadena.".scramble; // aleatoriza el orden de los caracteres

"Soy una cadena.".drop(2); // elimina los primeros dos caracteres

"Soy una cadena.".drop(-2); // elimina los últimos dos caracteres
```


#### 1.6.3 Símbolos

Un símbolo es como una cadena, en el sentido de que está compuesto por una secuencia de caracteres y se usa comúnmente para nombrar o etiquetar cosas. Donde se usa una cadena, a menudo se puede sustituir por un símbolo, y viceversa. Un símbolo se escribe de una de dos maneras: precediendo la secuencia de caracteres con una barra invertida (por ejemplo, `\freq`), o encerrándola entre comillas simples (por ejemplo, `'freq'`). Estos estilos son en gran medida intercambiables, pero la opción de las comillas es la más segura de las dos. Los símbolos que comienzan con o incluyen ciertos caracteres desencadenarán errores de sintaxis si se usa el estilo de barra invertida. A diferencia de una cadena, un símbolo es una unidad irreducible; no es posible acceder o manipular los caracteres individuales en un símbolo, y todos los símbolos devuelven cero en respuesta al método `size`. Sin embargo, es posible convertir de un lado a otro entre símbolos y cadenas usando los métodos `asSymbol` y `asString` (ver Ejemplo de Código 1.11). Los símbolos, siendo ligeramente más optimizados que las cadenas, son la opción preferible cuando se usan como nombres o etiquetas para objetos.

Ejemplo de Código 1.11: Conversión de cadena a símbolo y viceversa.
```supercollider
"hola".asSymbol.class; // -> Symbol

\hola.asString.class; // -> String
```

#### 1.6.4 Booleanos

Hay exactamente dos instancias de la clase Boolean: **true** y **false**. Estos valores son palabras clave especiales, lo que significa que no podemos usar ninguna de ellas como nombre de variable. Si escribes una de estas palabras clave en el editor de código, notarás que su texto cambiará de color para indicar su importancia. Los booleanos juegan un papel significativo en la lógica condicional, explorada más adelante en este capítulo.

A lo largo de SC, hay métodos y operadores binarios que representan preguntas de verdadero o falso, y que devuelven un valor Booleano que representa la respuesta. Estos incluyen operaciones de menor que/mayor que, y varios métodos que comienzan con la palabra "is" (por ejemplo, **`isInteger`**, **`isEmpty`**), que comprueban si se cumple alguna condición. Algunos ejemplos aparecen en el Ejemplo de Código 1.12, y una lista de operadores binarios comunes que devuelven Booleanos aparece en la Tabla 1.4.

Ejemplo de Código 1.12: Ejemplos de expresiones de código que devuelven valores Booleanos.
```supercollider
1 < 2; // -> true

1 > 2; // -> false

1.isInteger; // -> true

1.0.isInteger; // -> false

"hola".isEmpty; // -> false

"".isEmpty; // -> true

```

TABLA 1.4 Operadores binarios comunes que devuelven valores Booleanos.

Uso simbólico | Descripción
--- | ---
**x == y** | Devuelve **true** si _x_ y _y_ son iguales, **false** en caso contrario.
**x != y** | Devuelve **true** si _x_ y _y_ no son iguales, **false** en caso contrario.
**x > y** | Devuelve **true** si _x_ es mayor que _y_, **false** en caso contrario.
**x < y** | Devuelve **true** si _x_ es menor que _y_, **false** en caso contrario.
**x >= y** | Devuelve **true** si _x_ es mayor o igual que _y_, **false** en caso contrario.
**x <= y** | Devuelve **true** si _x_ es menor o igual que _y_, **false** en caso contrario.

#### 1.6.5 Nil

Al igual que true y false, **`nil`** es una palabra clave reservada en el lenguaje SC, y es la instancia singular de la clase **`Nil`**. Más comúnmente, representa el valor de una variable que no ha recibido una asignación de valor, o algo que no existe. Raramente usamos nil explícitamente, pero aparece con frecuencia, por lo que es útil estar familiarizado. El método **`isNil`**, demostrado en el Ejemplo de Código 1.13], puede ser útil para confirmar si una variable tiene un valor (intentar llamar a métodos en una variable no inicializada es una fuente común de mensajes de error).

Ejemplo de Código 1.13: Uso del método **`isNil`**.
```supercollider
(
var num;
num.isNil.postln; // comprueba la variable — inicialmente, es nil
num = 2; // hace una asignación
num.isNil.postln; // comprueba de nuevo — ya no es nil
)
```


#### 1.6.6 Arrays

Un array es una colección ordenada de objetos. Sintácticamente, los objetos almacenados en un array están separados por comas y rodeados por corchetes. Los arrays son como las cadenas en el sentido de que ambos son listas ordenadas, pero mientras que las cadenas solo pueden contener caracteres de texto, un array puede contener cualquier cosa. De hecho, los arrays pueden (y a menudo lo hacen) contener otros arrays. Los arrays están entre los objetos más frecuentemente utilizados, porque nos permiten expresar una colección arbitrariamente grande como una unidad singular. Los arrays tienen muchas aplicaciones musicales; podríamos usar uno para contener información de tono para una escala musical, una secuencia de valores rítmicos, y así sucesivamente.

Como se muestra en el Ejemplo de Código 1.14, podemos acceder a un elemento almacenado en un array usando el método **at** y proporcionando el índice numérico. Los índices comienzan en cero. Como alternativa, podemos seguir un array con un corchete que contiene el índice deseado.

Ejemplo de Código 1.14: Acceso a elementos almacenados en un array.
```supercollider
x = [4, "freq", \\note, 7.5, true];
x.at(3); // -> 7.5 (devuelve el elemento almacenado en el índice 3)
x[3]; // sintaxis alternativa
```


La mayoría de los operadores unarios y binarios definidos para números también se pueden aplicar a arrays, si contienen números. Varios ejemplos aparecen en el Ejemplo de Código 1.15. Si aplicamos un operador binario a un número y un array, la operación se aplica al número y a cada elemento del array, y se devuelve el nuevo array. Una operación binaria entre dos arrays del mismo tamaño devuelve un nuevo array del mismo tamaño en el que la operación binaria se ha aplicado a cada par de elementos. Si los arrays son de diferentes tamaños, la operación se aplica a los pares correspondientes de elementos, pero el array más pequeño se repetirá tantas veces como sea necesario para acomodar el array más grande (este comportamiento se llama "envoltura").

Ejemplo de Código 1.15: Comportamiento de los arrays en respuesta a operaciones unarias y binarias comunes.
```supercollider
[50, 60, 70].squared;    // -> [2500, 3600, 4900]
1 + [50, 60, 70];    // -> [51, 61, 71]
[1, 2, 3] + [50, 60, 70];    // -> [51, 62, 73]
[1, 2] + [50, 60, 70];    // -> [51, 62, 71]
```

El método **`dup`**, definido para todos los objetos, devuelve un array de copias de su receptor. Un entero, proporcionado como argumento, determina el tamaño del array. El signo de exclamación también se puede usar como un atajo simbólico (ver Ejemplo de Código 1.16).

Ejemplo de Código 1.16: Uso de **`dup`** y su atajo simbólico, el signo de exclamación.
```supercollider
7.dup; // -> [7, 7] (el tamaño predeterminado es 2)
7.dup(4); // -> [7, 7, 7, 7]
7 ! 4; // -> [7, 7, 7, 7] (sintaxis alternativa)
```

Los arrays son una característica que es imprescindible aprender, rica en muchos métodos y usos convenientes, demasiados para incluir en esta sección. El [Código Complementario 1.1](https://global.oup.com/us/companion.websites/9780197617007/res/c_code/ch1/) proporciona una "hoja de trucos" de arrays, que cubre muchos de estos usos.

#### 1.6.7 Funciones

Inevitablemente escribiremos algún pequeño programa que realice una tarea útil, como crear acordes a partir de tonos o convertir valores métricos en duraciones. Sea lo que sea que haga este código, ciertamente no queremos tener la carga de copiarlo y pegarlo por todo nuestro archivo, o peor aún, escribirlo varias veces, porque esto consume tiempo y espacio. Las funciones abordan este problema encapsulando algún código y permitiéndonos reutilizarlo fácil y concisamente. Las funciones son especialmente valiosas ya que proporcionan una opción para modularizar el código, es decir, expresar un programa grande como unidades de código más pequeñas e independientes, en lugar de tener que lidiar con un archivo grande y desordenado. Un programa modular es generalmente más fácil de leer, entender y depurar.

Una función está delimitada por llaves. Si escribes la función que aparece en el Ejemplo de Código 1.17 de arriba a abajo, notarás que el IDE automáticamente indentará el código encerrado para mejorar la legibilidad. Si escribes tu código en un orden inusual, es posible que la función de auto-indentación no funcione como se espera, pero siempre puedes resaltar tu código y presionar la tecla \[tab\] para invocar la función de auto-indentación. Una vez que se define una función, podemos evaluarla con **`value`**, o siguiéndola con un punto y un paréntesis. Cuando se evalúa, una función devuelve el valor de la última expresión que contiene.

Ejemplo de Código 1.17: Definición y evaluación de una función.
```supercollider
(
f = {
   var num = 4;
   num = num.squared;
   num = num.reciprocal;
};
)

f.value; // -> 0.0625
f.(); // sintaxis alternativa para evaluar
```


La función en el Ejemplo de Código 1.17 no es particularmente útil, porque produce el mismo resultado cada vez. Usualmente, queremos una función cuya salida dependa de alguna entrada proporcionada por el usuario. Por ejemplo, supongamos que queremos que nuestra función eleve al cuadrado y tome el recíproco de un valor arbitrario.

Ya hemos visto un comportamiento similar con **`pow`** (que es, en sí mismo, una especie de función). Proporcionamos el exponente como un argumento, lo que influye en el valor devuelto. Entonces, en nuestra función, podemos declarar un argumento propio usando una declaración **`arg`**. Al igual que una variable, un argumento es un contenedor nombrado que contiene un valor, pero que también sirve como entrada a una función, permitiendo que un valor especificado por el usuario sea "pasado" en el momento de la ejecución. Si no se proporciona ningún valor en el momento de la ejecución, se utilizará el valor predeterminado del argumento (definido en la declaración). Proporcionar valores predeterminados para los argumentos no es obligatorio, pero a menudo es una buena idea.

Ejemplo de Código 1.18: Definición y evaluación de una función con un argumento.
```supercollider
(
f = {
   arg input = 4;
   var num;
   num = input.squared;
   num = num.reciprocal;
};
)

f.(5); // -> 0.04 (evalúa, pasando un valor diferente como entrada)
f.(); // -> 0.0625 (evalúa usando el valor predeterminado)
```


El Ejemplo de Código 1.19 muestra una sintaxis alternativa que reemplaza la palabra clave **`arg`** con un cierre de caracteres de barra vertical (a veces llamados "pipes") y declara múltiples argumentos, convirtiendo el código del Ejemplo de Código 1.4 en una función. Al ejecutar una función con múltiples argumentos, los valores de los argumentos deben estar separados por comas y se interpretarán en el mismo orden en que aparecen en la declaración.

Ejemplo de Código 1.19: Definición y evaluación de una función con múltiples argumentos, declarados usando la sintaxis de "pipe".
```supercollider
(
g = { |thingA = 7, thingB = 5|
   var result;
   thingA = thingA.squared;
   thingB = thingB.reciprocal;
   result = thingA + thingB;
};
)

g.(3, 2); // -> 9.5 (thingA = 3, thingB = 2);
```

Tip.rand() Argumentos y Variables

Los nuevos usuarios pueden preguntarse sobre las diferencias precisas entre argumentos y variables, y qué "reglas" podrían aplicarse. En algunos aspectos, son similares: cada uno es un contenedor nombrado que contiene un valor. Las variables son contenedores ordinarios nombrados que proporcionan la conveniencia de almacenar y referenciar datos. Un argumento, por otro lado, solo puede declararse al principio de una función, y sirve para el propósito específico de permitir alguna entrada que pueda ser pasada o dirigida a la función durante la ejecución. Las declaraciones de variables solo pueden ocurrir al principio de un bloque de código de múltiples líneas encerrado entre paréntesis, o al principio de una función. Si una función declara argumentos y variables, la declaración de argumentos debe venir primero. No es posible declarar espontáneamente variables o argumentos adicionales en algún lugar en medio de tu código.

#### 1.6.8 Obteniendo y Estableciendo Atributos

Los objetos tienen atributos. Como ejemplo simplificado del mundo real, un coche tiene un color, un número de puertas, una transmisión que puede ser manual o automática, etc. En SC, interactuamos con los atributos de un objeto aplicando métodos a ese objeto. Recuperar un atributo se llama _obtener_, y cambiar un atributo se llama _establecer_. Para obtener un atributo, simplemente llamamos al método que devuelve el valor de ese atributo. Para establecer un atributo, hay dos opciones: podemos seguir el método getter con un símbolo de igual para asignar un nuevo valor, o podemos seguir el método getter con un guion bajo y el nuevo valor encerrado entre paréntesis. El siguiente pseudo-código demuestra estilos de sintaxis esenciales para obtener y establecer, que reaparecen a lo largo de este libro. Ten en cuenta que una ventaja de la sintaxis de guion bajo es que nos permite encadenar múltiples llamadas de setter en una sola expresión.
```supercollider
x = Car.new; // crea un nuevo coche
x.color = "rojo"; // establece el color
x.numDoors_(4).transmission_("manual"); // establece dos atributos más
x.numDoors; // obtiene el número de puertas (devuelve 4)
```

#### 1.6.9 Literales

En la Sección 1.3.3, comparamos una casa con el plano de una casa para entender mejor la diferencia conceptual entre clases e instancias. Si este ejemplo se tradujera a código SC, podría verse algo así:
```supercollider
x = House.new(30, 40); // crea una casa con dimensiones específicas
x.color_("azul"); // establece el color
x.hasGarage_(true); // establece si tiene garaje
```
En este ejemplo imaginario, hacemos una nueva casa, la pintamos de azul y le añadimos un garaje. Este flujo de trabajo general—crear una cosa nueva, almacenarla en una variable e interactuar con ella a través de métodos de instancia—es bastante común. De hecho, la mayoría de los objetos que introduciremos a partir de este punto involucrarán un flujo de trabajo que sigue este patrón básico. No necesariamente usaremos **`new`** en todos los casos (algunas clases esperan diferentes métodos de creación), pero la idea general es la misma.

Curiosamente, no hemos estado usando este flujo de trabajo para las clases introducidas en esta sección. Por ejemplo, no tenemos que escribir **`Float.new(5.2)`** o **`Symbol.new(\freq)`**. En su lugar, simplemente escribimos el objeto tal como es. Las clases como estas, que tienen una representación directa y sintáctica a través del código, se llaman _literales_. Cuando escribimos el número siete, es literalmente el número siete. Pero un objeto como una casa no puede ser representado directamente con código; no hay un símbolo de "casa" en nuestro conjunto de caracteres estándar. Así que debemos usar el enfoque más abstracto de escribir **`x = House.new`**, mientras su representación literal permanece en nuestra imaginación.

Los enteros, flotantes, cadenas, símbolos, booleanos y funciones son todos ejemplos de literales. Los arrays, para que conste, existen en una especie de área gris; tienen una representación directa a través de corchetes, pero a veces podemos crear uno con **`Array.new`** o un método relacionado. También hay una distinción entre arrays literales y arrays no literales, pero que no es relevante para nuestra discusión actual. El punto es que muchos de los objetos que encontraremos en este libro no son literales y requieren creación a través de alguna llamada de método a su clase.

Consejo.rand() Omitiendo el método "new"

El método **`new`** se usa tan comúnmente para crear nuevas instancias de clases que generalmente podemos omitirlo, y el intérprete hará la suposición correcta. Por ejemplo, usando nuestra clase imaginaria "house", podríamos escribir **`x = House(30, 40)`** en lugar de **`x = House.new(30, 40)`**. Sin embargo, si creamos una nueva instancia sin proporcionar argumentos, podemos omitir **`new`** pero no podemos omitir los paréntesis, incluso si están vacíos. Por ejemplo, **`x = House.new()`** y **`x = House()`** son ambos válidos, pero **`x = House`** será problemático. En este tercer caso, el intérprete almacenará la clase house, en lugar de una nueva instancia de house.

### 1.7 Aleatoriedad

Los lenguajes de programación son bastante buenos generando aleatoriedad. Bueno, no exactamente—los lenguajes de programación son buenos produciendo comportamientos que los humanos encuentran convincentemente aleatorios. La mayoría de los algoritmos aleatorios son pseudo-aleatorios; comienzan con un valor "semilla", que alimenta un suministro determinista de números que parecen aleatorios. Independientemente de cómo se generen, los valores aleatorios pueden ser útiles en aplicaciones musicales. Podemos, por ejemplo, generar melodías aleatorias a partir de una escala, mezclar valores métricos para crear variaciones rítmicas, o aleatorizar la posición estereofónica de un sonido.

#### 1.7.1 Eligiendo de un Rango

El método **`rrand`** (abreviatura de "ranged random") devuelve un valor aleatorio entre un mínimo y un máximo, con una distribución uniforme, lo que significa que cada valor en el rango tiene la misma probabilidad de aparecer. Si el mínimo y el máximo son enteros, el resultado será un entero. Si cualquiera de los límites es un flotante, el resultado será un flotante. El método **`exprand`** también devuelve un valor dentro de un rango, pero aproxima una distribución exponencial, lo que significa que en promedio, los valores de salida tenderán hacia el mínimo. Este método siempre devuelve un flotante, y el valor mínimo y máximo deben tener el mismo signo (ambos positivos o ambos negativos, y ninguno puede ser cero). Estos métodos se demuestran en el Ejemplo de Código 1.20. Este libro favorece la sintaxis "método(receptor)" para estos métodos porque resalta más claramente su naturaleza de rango.

Ejemplo de Código 1.20: Devolviendo un número aleatorio de un rango.
```supercollider
rrand(1, 9);         // entero aleatorio entre 1 – 9,
                     // distribución uniforme

rrand(40.0, 90.0);   // flotante aleatorio entre 40 – 90,
                     // distribución uniforme

exprand(1, 100);     // flotante aleatorio entre 1 – 100,
                     // distribución exponencial
```

¿Cuál de estos dos métodos deberías usar? Depende de para qué se utilizará la salida. Un lanzamiento de dados o el lanzamiento de una moneda, en los que todos los resultados son igualmente probables, pueden simularse con precisión con **`rrand`**. Sin embargo, nuestros oídos perciben ciertos parámetros musicales de manera no lineal, como la frecuencia y la amplitud. Por lo tanto, usar una distribución uniforme para generar valores para estos parámetros puede producir un resultado que suene desequilibrado. Considera, por ejemplo, generar una frecuencia aleatoria entre 20 y 20,000 Hz. Si usamos **`rrand`**, entonces la salida caerá en la mitad superior de este rango aproximadamente la mitad del tiempo, (entre aproximadamente 10,000 y 20,000 Hz). Esto puede parecer un rango amplio, pero desde una perspectiva musical, es solo una octava, ¡y una octava muy aguda! La otra mitad de este rango abarca aproximadamente 9 octavas, por lo que el resultado sonoro parecería saturado de altas frecuencias, mientras que las frecuencias verdaderamente bajas serían raras. En contraste, **`exprand`** proporcionaría una distribución más natural. Así que, ¡no elijas uno de estos dos métodos al azar (sin juego de palabras)! En su lugar, piensa en cómo se utilizarán los valores y toma una decisión informada.

#### 1.7.2 Eligiendo Aleatoriamente de una Colección

A veces queremos seleccionar un valor aleatorio de una colección, en lugar de un rango. Si los posibles resultados están almacenados en un array, podemos usar **`choose`** para devolver uno de ellos (ver Ejemplo de Código 1.21). Este método no elimina el elemento de la colección; simplemente informa una selección mientras deja la colección sin alterar.

Ejemplo de Código 1.21: Seleccionando un elemento aleatorio de una colección.
```supercollider
(
var scale, note;
scale = [0, 2, 4, 5, 7, 9, 11, 12];
note = scale.choose;
)
```

Supongamos que tenemos una bolsa con 1,000 canicas. 750 son rojas, 220 son verdes y 30 son azules. ¿Cómo simularíamos sacar una canica al azar? Podríamos crear un array de 1,000 símbolos y usar **`choose`**, pero esto es torpe. En su lugar, podemos usar **`wchoose`** para simular una elección ponderada, como se muestra en el Ejemplo de Código 1.22. Este método requiere un array de valores de peso, que deben sumar uno y ser del mismo tamaño que la colección de la que estamos eligiendo. Para evitar hacer los cálculos en nuestra cabeza, podemos usar **`normalizeSum`**, que escala los pesos para que sumen uno, manteniendo sus proporciones relativas intactas.

Ejemplo de Código 1.22: Aleatoriedad ponderada.
```supercollider
(
var bag, pick;
bag = [\red, \green, \blue];
pick = bag.wchoose([750, 220, 30].normalizeSum);
)
```

#### 1.7.3 Generando un Array de Valores Aleatorios

Como hemos visto, **`dup`** devuelve un array de copias de su receptor y puede usarse para generar un array de valores aleatorios. Sin embargo, hay una trampa: si simplemente llamamos **`dup`** en un método que genera una elección aleatoria, duplicará el resultado de esa elección aleatoria. La solución implica encerrar el generador aleatorio entre llaves—creando así una función—y luego duplicar esa función. Esto funciona porque el comportamiento de **`dup`** es ligeramente diferente cuando se aplica a una función. En lugar de simplemente duplicar la función, **`dup`** duplicará y evaluará cada copia de función que crea. Por lo tanto, el proceso aleatorio se realizará una vez para cada elemento que puebla el array devuelto.

Ejemplo de Código 1.23: Uso de **`dup`** con métodos que generan aleatoriedad.
```supercollider
rrand(40, 90).dup(8); // 8 copias de 1 valor aleatorio
{rrand(40, 90)}.dup(8); // 8 valores aleatorios elegidos de forma única
```

### 1.8 Lógica Condicional

La vida está llena de elecciones basadas en ciertas condiciones. Si hace buen día, iré en bicicleta al trabajo. Si el helado está en oferta, compraré dos. En programación de computadoras, la lógica condicional se refiere a mecanismos utilizados para tomar decisiones similares, con muchas posibles aplicaciones musicales. Por ejemplo, si una sección de una pieza musical ha estado sonando durante al menos tres minutos, transicionar a la siguiente sección. Si la amplitud de un sonido es demasiado alta, reducirla. Esta sección se enfoca en expresiones de la forma "si-entonces-sino", que tienden a ser relativamente comunes. Otros mecanismos condicionales están documentados en un archivo de referencia llamado "Estructuras de Control".

#### 1.8.1 If

Uno de los métodos condicionales más comunes es **`if`**, que incluye tres componentes: (1) una expresión que representa la condición de prueba, que debe devolver un valor booleano, (2) una función que se evaluará si la condición es verdadera, y (3) una función opcional que se evaluará si es falsa. El Ejemplo de Código 1.24 demuestra el uso de lógica condicional para modelar el lanzamiento de una moneda (un valor de 1 representa "cara"), en tres estilos que varían en sintaxis y espacio en blanco. El segundo estilo tiende a ser preferible al primero, porque coloca el "if" al principio de la expresión, reflejando cómo se hablaría la oración que representa en inglés. Debido a que toda la expresión es algo larga, el enfoque de múltiples líneas puede mejorar la legibilidad. Ten en cuenta que en la primera expresión, los paréntesis alrededor de la condición de prueba son necesarios para dar precedencia al operador binario **`==`** sobre el método **`if`**. Sin paréntesis, el método **`if`** se aplica al número 1 en lugar de a la expresión booleana completa, lo que produce un error.

Ejemplo de Código 1.24: Uso de **`if`** para modelar el lanzamiento de una moneda.
```supercollider
// sintaxis "receptor-punto-método":
([0, 1].choose == 1).if({\\heads.postln}, {\\tails.postln});

// sintaxis "método(receptor)":
if([0, 1].choose == 1, {\\heads.postln}, {\\tails.postln});

// estructurado como un bloque de múltiples líneas:
(
if(
   [0, 1].choose == 1,
   {\\heads.postln},
   {\\tails.postln}
);
)
```

#### 1.8.2 And/Or

Los métodos **`and`** y **`or`** (representables usando operadores binarios **`&&`** y **`||`**), nos permiten comprobar múltiples condiciones. Por ejemplo, si el helado está en oferta, y tienen chocolate, entonces compraré dos. El Ejemplo de Código 1.25 modela un lanzamiento de dos monedas en el que ambas deben ser "cara" para que el resultado se considere verdadero. Nuevamente, los paréntesis alrededor de cada prueba condicional son necesarios para asegurar el orden correcto de las operaciones.

Ejemplo de Código 1.25: Uso del operador binario **&&** para modelar un lanzamiento de dos monedas.
```supercollider
(
if(
   ([0, 1].choose == 1) && ([0, 1].choose == 1),
   {"ambas caras".postln},
   {"al menos una cruz".postln}
);
)
```

#### 1.8.3 Case y Switch

Digamos que lanzamos un dado de seis caras y queremos realizar una de seis acciones únicas dependiendo del resultado. Una sola declaración **`if`** es insuficiente porque solo prevé dos resultados. Si insistiéramos en usar **`if`**, tendríamos que "anidar" varios **`if`** uno dentro del otro. Incluso con un pequeño puñado de resultados posibles, el código rápidamente se convierte en un lío ilegible. Alternativamente, una declaración **case** (ver Ejemplo de Código 1.26) acepta un número arbitrario de pares de funciones. La primera función en cada par debe contener una expresión booleana, y la segunda función contiene código que se evaluará si su función asociada es verdadera. Si una condición de prueba es falsa, el intérprete pasa al siguiente par e intenta de nuevo. Tan pronto como una prueba devuelve verdadero, el intérprete ejecuta la función asociada y sale del bloque **case**, abandonando cualquier prueba condicional restante. Si todas las pruebas son falsas, el intérprete devuelve **`nil`**.

Ejemplo de Código 1.26: Uso de **case** para simular un lanzamiento de dado de seis caras.
```supercollider
(
var roll = rrand(1, 6);
case(
   {roll == 1}, {\\red.postln},
   {roll == 2}, {\\orange.postln},
   {roll == 3}, {\\yellow.postln},
   {roll == 4}, {\\green.postln},
   {roll == 5}, {\\blue.postln},
   {roll == 6}, {\\purple.postln}
);
)
```

Una declaración **`switch`** es similar a **`case`**, pero con una sintaxis ligeramente diferente, mostrada en el Ejemplo de Código 1.27. Comenzamos con algún valor—no necesariamente un booleano—y proporcionamos un número arbitrario de pares valor-función. El intérprete comprobará la igualdad entre el valor inicial y cada uno de los valores emparejados. Para la primera comparación que devuelve verdadero, se evalúa la función correspondiente.

Ejemplo de Código 1.27: Uso de **`switch`** para simular el lanzamiento de un dado de seis caras.

```supercollider
(
var roll = rrand(1, 6);

switch(
   roll,
   1, {\red.postln},
   2, {\orange.postln},
   3, {\yellow.postln},
   4, {\green.postln},
   5, {\blue.postln},
   6, {\purple.postln}
);
)
```

### 1.9 Iteración

Uno de los aspectos más atractivos de la programación informática es su capacidad para manejar tareas repetitivas. La iteración se refiere a técnicas que permiten expresar y ejecutar una tarea repetitiva de manera concisa. La música está llena de estructuras repetitivas y se beneficia enormemente de la iteración. En general, si alguna vez te encuentras escribiendo un fragmento de código casi idéntico muchas veces, o dependiendo mucho de copiar y pegar, esto podría ser una señal de que deberías estar utilizando la iteración.

Dos métodos de iteración de propósito general, **`do`** y **`collect`**, suelen ser buenas opciones para tareas iterativas. Ambos se aplican a alguna colección —generalmente un array— y ambos aceptan una función como su único argumento. La función se evalúa una vez para cada elemento de la colección. Una diferencia principal entre estos dos métodos es que **do** devuelve su receptor, mientras que **`collect`** devuelve una colección modificada del mismo tamaño, poblada usando valores devueltos por la función. Por lo tanto, **`do`** es una buena opción cuando no nos importan los valores devueltos por la función, y en su lugar simplemente queremos "hacer" alguna acción un cierto número de veces. Por otro lado, **`collect`** es una buena opción cuando queremos modificar o interactuar con una colección existente y capturar el resultado. Al comienzo de una función de iteración, opcionalmente podemos declarar dos argumentos, que representan cada elemento de la colección y su índice a medida que la función se ejecuta repetidamente. Al declarar estos argumentos, nos damos acceso a los elementos de la colección dentro de la función.

En el Ejemplo de Código 1.28(a), iteramos sobre un array de cuatro elementos, y para cada elemento, publicamos una cadena de texto. En este caso, los elementos del array son irrelevantes; el resultado será el mismo siempre que el tamaño del array sea cuatro. Realizar una acción un número determinado de veces es tan común que **`do`** también está definido para enteros. Cuando **`do`** se aplica a un entero **`n`**, el receptor se interpretará como el array **`[0, 1, … n-1]`**, proporcionando así una alternativa más corta, representada en el Ejemplo de Código 1.28(b). En el Ejemplo de Código 1.28(c), declaramos dos argumentos y los publicamos para visualizar los valores de estos argumentos.

Ejemplo de Código 1.28: Uso de **`do`** para realizar tareas iterativas simples.

```supercollider
/* (a) */ [30, 40, 50, 60].do({"esto es una prueba".postln});

/* (b) */ 4.do({"esto es una prueba".postln});

/* (c) */ [30, 40, 50, 60].do({|item, index| [item, index].postln});
```

Un uso simple de **`collect`** aparece en el Ejemplo de Código 1.29. Iteramos sobre el array y, para cada elemento, devolvemos el elemento multiplicado por su índice. **`collect`** devuelve este nuevo array.

Ejemplo de Código 1.29: Uso de **`collect`** para iterar sobre un array y devolver un nuevo array.

```supercollider
x = [30, 40, 50, 60].collect({|item, index| item * index});

// -> el array [0, 40, 100, 180] ahora está almacenado en x
```

Existen numerosos otros métodos de iteración, varios de los cuales se muestran en el Ejemplo de Código 1.30]. Aquí se presenta el método **`isPrime`**, que devuelve verdadero si su receptor es un número primo, y falso en caso contrario.

Ejemplo de Código 1.30: Ejemplos de métodos de iteración adicionales.

```supercollider
x = [101, 102, 103, 104, 105, 106, 107];

// devolver el subconjunto del array para el cual la función devuelve verdadero:
x.select({ |n| n.isPrime }); // -> [101, 103, 107]

// devolver el primer elemento para el cual la función devuelve verdadero:
x.detect({ |n| n.isPrime }); // -> 101

// devolver verdadero si la función devuelve verdadero para al menos un elemento:
x.any({ |n| n.isPrime }); // -> true

// devolver verdadero si la función devuelve verdadero para todos los elementos:
x.every({ |n| n.isPrime }); // -> false

// devolver el número de elementos para los cuales la función devuelve verdadero:
x.count({ |n| n.isPrime }); // -> 3
```

### 1.10 Resumen

Los temas presentados en este capítulo proporcionan un apoyo fundamental a lo largo del resto de este libro, y esperamos que también a lo largo de tus propias exploraciones con SC. Debido a la naturaleza fundamental de estos conceptos, algunos de los ejemplos de código en este capítulo pueden parecer un poco áridos, abstractos o difíciles de digerir completamente. Si no entiendes completamente cómo y por qué estas técnicas podrían aplicarse en un entorno práctico, es comprensible. A medida que sigas leyendo, estos conceptos surgirán una y otra vez, reflejados a través de aplicaciones en síntesis, muestreo, secuenciación y composición. Por ahora, para proporcionar un contexto práctico, el [Código Complementario 1.2](https://global.oup.com/us/companion.websites/9780197617007/res/c_code/ch1/) explora una posible aplicación que une varios de estos conceptos: crear una función que convierta un nombre de nota musical y octava al número de nota MIDI correspondiente.

## Capítulo 2
**Fundamentos de la creación de sonido**
---------------------------------------------------------------

### 2.1 Visión general

En este capítulo, iremos más allá de los conceptos básicos del lenguaje SC y comenzaremos a enfocarnos en características específicas del sonido. Principalmente, introduciremos clases y métodos centrales diseñados explícitamente para soportar audio, así como algunos métodos y herramientas auxiliares que mejoran el flujo de trabajo creativo.

### 2.2 Iniciando el servidor de audio

Antes de crear sonido, es bueno asegurarse de que la configuración de su hardware de audio esté correctamente establecida. Si está usando auriculares, conéctelos a su computadora. Si está usando una interfaz de audio externa, debe estar conectada y encendida. Puede usar los altavoces integrados de su computadora, pero tienden a no reproducir bien las frecuencias bajas. Si está en macOS o Windows, configure su sistema operativo para usar el dispositivo de salida preferido, y SC adoptará automáticamente su selección. Si está en Linux, necesitará iniciar el servidor de audio JACK antes de iniciar el servidor SC. Puede encontrar información adicional sobre la configuración del hardware en un archivo de documentación titulado "Selección de dispositivo de audio".

En cuanto a las cosas que hay que hacer antes de iniciar el servidor, hay varias opciones para configurarlo, como el número de canales de salida que proporciona su configuración de hardware, la cantidad de memoria en tiempo real que se le permite asignar al servidor, y así sucesivamente. Todas estas son accesibles a través de la clase **ServerOptions**. Cualquier cambio aplicado a través de esta clase solo tendrá efecto después de reiniciar el servidor. En la mayoría de los casos, no es necesario modificar la configuración del servidor. Algunos ejemplos de reconfiguraciones del servidor aparecen a lo largo del Capítulo 6, y el archivo de ayuda de **ServerOptions** contiene ejemplos e información adicional.

Una vez que esté todo listo, puede iniciar el servidor evaluando:

`s.boot;`

Por defecto, el atajo de teclado \cmd\]+\[b\] también iniciará el servidor. Al ejecutar esta línea, aparecerá información en la ventana de publicación. Si el inicio es exitoso, los números en la barra de estado del servidor en la esquina inferior derecha del IDE se volverán verdes, y la ventana de publicación debería verse como la imagen en la Figura 2.1. Si los números del servidor no se vuelven verdes, el servidor no se ha iniciado con éxito. Los fallos de inicio son relativamente poco comunes, pero cuando ocurren, rara vez son motivo de alarma y casi siempre se pueden rectificar rápidamente. Por ejemplo, si está usando dispositivos de hardware separados para entrada/salida de audio, el servidor no se iniciará si estos dispositivos están funcionando a diferentes tasas de muestreo. Alternativamente, si un servidor en funcionamiento se interrumpe inesperadamente (por ejemplo, si el cable USB de su interfaz de audio se desconecta), un intento de reinicio puede producir un error que dice "Exception in World\_OpenUDP: unable to bind udp socket", o "ERROR: server failed to start". Este mensaje aparece porque probablemente hay una instancia colgada de la aplicación del servidor de audio que debe ser destruida, lo cual se puede hacer evaluando **Server.killAll** antes de reiniciar. En casos más raros, un fallo de inicio puede resolverse recompilando la biblioteca de clases SC, cerrando y reabriendo el entorno SC, o —como último recurso— reiniciando su computadora.

![imagen](images/000019.jpg)

FIGURA 2.1 La ventana de publicación y la barra de estado después de que el servidor se ha iniciado con éxito.

Sabemos que las letras minúsculas de la a a la z están disponibles como variables del intérprete, pero no almacenamos nada en **s**. Entonces, ¿cómo funciona **s.boot**? Cuando iniciamos el entorno SC, se asigna automáticamente una referencia al servidor a esta variable. Evalúela, y verá que el intérprete devuelve "localhost", el nombre predeterminado de su aplicación de servidor local. Esta asignación es una conveniencia para el usuario, proporcionando acceso al servidor a través de un solo carácter. Si accidentalmente sobrescribe esta variable, puede rehacer la asignación manualmente, evaluando:

`s = Server.local;`

El servidor también se puede iniciar evaluando:

`Server.local.boot;`

O bien, puede hacer clic en los números del servidor en la barra de estado para acceder a un menú emergente, desde el cual se puede iniciar el servidor. Puede cerrar el servidor desde este mismo menú emergente, o evaluando una de las siguientes dos expresiones:

`s.quit;`

`Server.local.quit;`

Algunos ejemplos en este libro omiten **s.boot** y asumen que su servidor ya está en funcionamiento. Si intenta trabajar con sonido mientras el servidor está desconectado, la ventana de publicación mostrará una advertencia amistosa de que el servidor no está funcionando.

### 2.3 Generadores de unidad

Los generadores de unidad (**UGens**) son objetos que representan cálculos de señal digital en el servidor de audio. Son los bloques de construcción básicos para los procesos de sonido, similares a los módulos en un sintetizador analógico. Cada UGen realiza una tarea específica, como generar una onda de sierra, aplicar un filtro de paso bajo, reproducir un archivo de audio, y así sucesivamente. La Tabla 2.1 muestra una lista aproximadamente categorizada de algunos de los UGens más simples y comúnmente utilizados. Los propósitos de algunos UGens son obvios por sus nombres (**WhiteNoise** genera ruido blanco), mientras que otros, como **Dust**, son más crípticos. La documentación incluye un archivo guía titulado "Tour de UGens".

TABLA 2.1 Una selección de UGens comúnmente utilizados.

| Categoría                           | UGens                                                                                   |
| ----------------------------------- | --------------------------------------------------------------------------------------- |
| Osciladores                         | **SinOsc**, **Pulse**, **Saw**, **Blip**, **LFPulse**, **LFSaw**, **LFTri**, **VarSaw** |
| Generadores de ruido                | **LFNoise0**, **LFNoise1**, **PinkNoise**, **WhiteNoise**                               |
| Envolventes                         | **Line**, **XLine**, **EnvGen**                                                         |
| Filtros                             | **LPF, HPF, BPF**, **BRF**                                                              |
| Triggers                            | **Impulse**, **Dust**, **Trig**                                                         |
| Reproductores de archivos de sonido | **PlayBuf**, **BufRd**                                                                  |
| Espacializadores Stereo             | **Pan2**, **Balance2**                                                                  |

La fluidez musical no exige una familiaridad íntima con cada UGen. Los UGens son un medio para un fin, por lo que solo necesitará familiarizarse con aquellos que le ayuden a lograr sus objetivos. Este libro se centra en un conjunto básico de UGens que son ampliamente aplicables en síntesis, muestreo y procesamiento de señales.

#### 2.3.1 Una rápida revisión de los conceptos de audio digital

Una señal de audio digital se representa como una secuencia de muestras. Una muestra, en este contexto, es un número —específicamente, un float— que representa el valor de la señal en un momento instantáneo en el tiempo. Todo el software de audio digital y los dispositivos de hardware operan a una tasa de muestreo, que determina el número de muestras que ocurren en un segundo. Por lo tanto, un UGen generalmente puede ser visto como un número que cambia rápida y constantemente. Es probable que su hardware esté funcionando a 44,100 o 48,000 muestras por segundo, dos de las tasas más comunes. Cuando el servidor se inicia, adoptará la tasa de muestreo de su sistema.

La tasa de muestreo de un sistema determina la frecuencia más alta que se puede representar con precisión, llamada frecuencia de Nyquist. Es igual a la mitad de la tasa de muestreo, porque dos muestras por ciclo es el mínimo absoluto para capturar el comportamiento cíclico esencial de una señal periódica. Si la frecuencia de una señal excede la frecuencia de Nyquist, el sistema no tiene suficientes muestras por ciclo para representarla fielmente. El resultado es generalmente una medición errónea, produciendo una señal cuya frecuencia es menor que la frecuencia de Nyquist. Este fenómeno se llama aliasing, o plegado, representado en la Figura 2.2.

![image](images/000020.jpg)

FIGURA 2.2 Un diagrama simplificado del aliasing, incluyendo (a) una señal periódica continua cuya frecuencia excede la frecuencia de Nyquist, (b) el resultado de muestrear esta señal periódica, y (c) el intento erróneo de reconstruir la señal original usando datos de muestra. Las líneas punteadas indican los momentos en que se toman las muestras.

El audio digital se procesa en bloques de muestras, en lugar de uno por uno. El procesamiento por bloques es menos exigente en términos de potencia de procesamiento pero introduce una pequeña cantidad de latencia (un bloque entero debe ser calculado antes de que pueda ser renderizado). El tamaño de un bloque varía pero casi siempre es una potencia de dos. A medida que el tamaño del bloque aumenta, la carga de la CPU disminuye y la latencia aumenta, y viceversa. Al igual que las muestras y las tasas de muestreo, el concepto de bloques de muestras no es exclusivo de SC; es ubicuo en todo el ámbito del audio digital. En SC, un bloque de muestras se suele llamar "bloque de control" o "ciclo de control".

Suponiendo que ya ha iniciado el servidor, puede verificar la tasa de muestreo y el tamaño del bloque evaluando las siguientes expresiones:

`s.sampleRate;`

`s.options.blockSize;`

#### 2.3.2 Tasas de UGen

Un UGen funciona a una tasa particular, dependiendo del método de clase utilizado para crear la instancia. En lugar de usar **new** para crear una instancia de UGen, usamos **ar**, **kr**, o **ir**, que representan tasa de audio, tasa de control y tasa de inicialización.

Un UGen de tasa de audio produce valores de salida a la tasa de muestreo, que es la señal de mayor resolución disponible para nosotros. Si quiere escuchar una señal a través de sus altavoces, debe funcionar a la tasa de audio. Generalmente, si requiere una señal de alta frecuencia, una señal de movimiento rápido, o cualquier cosa que quiera monitorear directamente, debe usar **ar**.

Los UGens de tasa de control funcionan a la tasa de control. Esta tasa es igual a la tasa de muestreo dividida por el tamaño del bloque. Si la tasa de muestreo es 48,000 y el tamaño del bloque es 64, entonces la tasa de control calcula 48,000 ÷ 64 = 750 muestras por segundo, produciendo una al inicio de cada ciclo de control. Los UGens de tasa de control tienen una resolución más baja pero consumen menos potencia de procesamiento. Son útiles cuando necesita una señal de movimiento relativamente lento, como una envolvente gradual o un oscilador de baja frecuencia. Debido a que la tasa de control es una tasa de muestreo proporcionalmente reducida, la frecuencia de Nyquist se reduce de manera similar. En este caso, la frecuencia de tasa de control más alta que se puede representar fielmente es 750 ÷ 2 = 375 Hz. Por lo tanto, si requiere un oscilador con una frecuencia superior a 375 Hz, **kr** es una mala elección. De hecho, la integridad de la señal se degrada a medida que la frecuencia de una señal se acerca a la frecuencia de Nyquist, por lo que **ar** es una buena elección incluso si la frecuencia de un UGen está ligeramente por debajo de la frecuencia de Nyquist.

Considere un oscilador sinusoidal con una frecuencia de 1 Hz, usado para controlar la frecuencia de corte de un filtro. Es posible ejecutar este oscilador a la tasa de audio, pero esto proporcionaría más resolución de la que necesitamos. Si usamos la tasa de control en su lugar, calcularíamos 750 muestras por ciclo, lo cual es más que suficiente para representar visualmente un ciclo de una onda sinusoidal. De hecho, tan solo 20 o 30 puntos probablemente serían suficientes para "ver" una forma sinusoidal. Este es un ejemplo en el que podemos aprovechar los UGens de tasa de control para reducir la carga de procesamiento del servidor, sin sacrificar la calidad del sonido. La Figura 2.3 muestra un oscilador sinusoidal de 120 Hz funcionando a la tasa de audio y a la tasa de control. Si no está seguro de qué tasa usar en una situación particular, **ar** es generalmente la elección más segura.

![image](images/000001.jpg)

FIGURA 2.3 Unos pocos centisegundos de una onda sinusoidal de 120 Hz funcionando a la tasa de audio y a la tasa de control.

Los UGens de tasa de inicialización son los más raros de los tres. De hecho, muchos UGens no entenderán el método **ir**. Un UGen a la tasa de inicialización produce exactamente una muestra cuando se crea y mantiene ese valor indefinidamente. Por lo tanto, la tasa de inicialización no es realmente una tasa en absoluto; es simplemente un medio para inicializar un UGen de modo que se comporte como una constante. Los ahorros de CPU que proporciona **ir** son obvios, pero ¿cuál es el punto de una señal que está atascada en un valor específico? Hay algunas situaciones en las que esta elección tiene sentido. Un ejemplo es el UGen **SampleRate**, un UGen que produce la tasa de muestreo del servidor. En algunos algoritmos de señal, necesitamos realizar un cálculo que involucre la tasa de muestreo, que puede variar de un sistema a otro. Generalmente, la tasa de muestreo no cambia (y no debería cambiar) mientras el servidor está iniciado, por lo que es ineficiente e innecesario calcularla repetidamente.

#### 2.3.3 Argumentos de UGen

En el capítulo anterior, observamos que algunos métodos, como **pow**, requieren argumentos para funcionar correctamente. Los UGens no son diferentes. La expresión **SinOsc.ar()** no produce errores, pero quedan preguntas. ¿Cuál es la frecuencia de este oscilador sinusoidal? ¿Cuál es su amplitud? Los argumentos específicos que **ar**, **kr**, e **ir** aceptan, y sus valores predeterminados, dependen del tipo de UGen.

En la sección "Class Methods" del archivo de ayuda de **SinOsc** (mostrado en la Figura 2.4), vemos que este UGen puede funcionar a la tasa de audio o de control, y los argumentos son los mismos para ambos métodos. Se esperan cuatro valores de entrada: **freq**, **phase**, **mul**, y **add**. **freq** determina la frecuencia del oscilador, medida en Hz. **phase** controla una cantidad de desplazamiento, medida en radianes, utilizada para hacer que el oscilador comience en un punto específico dentro de su ciclo. **mul** es un valor que se multiplica por cada muestra en la señal de salida, y **add** es un valor que se suma a cada muestra en la señal de salida.

![image](images/000021.jpg)

FIGURA 2.4 Una captura de pantalla de la sección de métodos de clase del archivo de ayuda de **SinOsc**.

_Tip.rand(); Trabajando con pi_

En el caso de **SinOsc**, un ciclo es igual a 2π radianes. En SC, usamos la palabra clave especial **pi** para representar π. Expresiones como **pi/4**, **3pi/2**, etc., son válidas.

**freq** y **phase** son relativamente específicos de **SinOsc**. La mayoría de los UGens osciladores tienen un argumento de frecuencia, pero no todos tienen un argumento de fase. Aquellos que lo tienen podrían medirlo usando una escala diferente. El oscilador de onda triangular **LFTri**, por ejemplo, espera un valor de fase entre 0 y 4. El generador de onda de pulso **Pulse** no tiene entrada de fase pero tiene un argumento **width** que determina su ciclo de trabajo (el porcentaje de cada ciclo que es "alto" vs. "bajo"). Más aún, un generador de ruido como **PinkNoise** no tiene ni argumento de frecuencia ni de fase.

Por el contrario, **mul** y **add** son casi ubicuos en toda la familia UGen, y casi siempre ocurren como los dos últimos argumentos. La mayoría de los UGens son bipolares o unipolares; el rango de salida predeterminado de un UGen bipolar es de -1 a +1, mientras que el rango predeterminado de un UGen unipolar está limitado entre 0 y +1. Estos rangos se consideran "nominales", y se registran en o cerca de 0 decibelios en un medidor de señal digital. Este es el nivel más alto que se puede representar en un sistema digital, ¡así que debe visualizar una señal nominal como bastante fuerte!

En virtud de su comportamiento multiplicativo, **mul** corresponde a la amplitud de la señal. El valor predeterminado de **mul** es uno, lo cual no tiene efecto. Un valor de **mul** de 0.5, por ejemplo, reduce la amplitud a la mitad. Especificar un valor de **mul** mayor que uno empujará la amplitud de la señal más allá de los límites de representación, y puede ocurrir distorsión. Cuando se monitorea directamente la salida de un UGen, un valor de **mul** alrededor de 0.05 o 0.1 es un buen rango "aproximado", que es suficientemente fuerte sin ser desagradable, y que proporciona un amplio margen de maniobra.

_Tip.rand(); Calibración de su configuración de hardware_

La discusión sobre **mul** plantea consideraciones importantes con respecto al nivel de monitoreo y el volumen. Cuando se usa SC (o realmente cualquier plataforma de audio digital), es inteligente calibrar el volumen de su sistema antes de empezar a crear. Primero, baje el volumen de su sistema hasta que esté casi en silencio, luego ejecute la siguiente línea de código, que reproduce una señal de ruido rosa de dos canales:

``` supercollider
{PinkNoise.ar(mul: 1) ! 2}.play;
```
Mientras se reproduce el ruido, suba lentamente el volumen de su sistema hasta que el ruido suene fuerte y saludable. No debería ser doloroso, pero debería ser inequívocamente fuerte, quizás incluso ligeramente molesto. Una vez que haya establecido este nivel de volumen, considere su sistema "calibrado" y no modifique sus niveles de hardware nuevamente. Esta configuración le animará a crear niveles de señal en SC que sean cómodos y presenten un riesgo mínimo de distorsión.

Por el contrario, un mal flujo de trabajo implica configurar el volumen de su sistema demasiado bajo, lo que fomenta la compensación con valores **mul** más altos. Esta configuración da la impresión engañosa de que sus niveles de señal son bajos, cuando en realidad son bastante altos, con casi ningún margen de maniobra. En esta configuración, inevitablemente se encontrará en la frustrante situación de tener señales que parecen demasiado silenciosas, pero con niveles que están constantemente "en rojo".

**add** tiene por defecto el valor cero, en cuyo caso (al igual que **mul**) no tiene ningún efecto en la señal de salida de un UGen. Cuando se reproduce un UGen a través de sus altavoces, generalmente no es útil ni recomendable especificar un valor **add** distinto de cero. Si **add** no es cero, toda la forma de onda se desplaza verticalmente, de modo que su punto de "equilibrio" ya no coincide con el cero verdadero. Una señal desplazada verticalmente puede no sonar diferente al oído humano, pero si se enruta a través de un altavoz, el cono del altavoz vibrará asimétricamente, lo que puede fatigar o estresar el altavoz durante largos períodos de tiempo, posiblemente degradando su integridad y vida útil.

Estas "reglas" para **mul** y **add** se aplican principalmente a situaciones en las que estamos escuchando directamente un UGen. Hay otros casos, como modular una señal con otra, donde es deseable especificar valores personalizados de **mul/add**.

_Tip.rand(); Orden de operaciones con mul/add_

Al especificar valores de **mul/add**, tenga en cuenta que estas operaciones siempre ocurren en un orden específico: La multiplicación ocurre primero, luego la adición.

La principal conclusión de esta discusión es que cada UGen es único, no solo en su propósito, sino también en términos de los argumentos de entrada que acepta, sus valores predeterminados y sus rangos esperados. Cuando empiece a trabajar con sonido, ¡no adivine ni haga suposiciones! Tómese el tiempo para leer los archivos de ayuda y asegúrese de que los valores que proporciona sean consistentes con lo que el UGen espera. ¡Pocas cosas en este mundo son tan sorprendentes como proporcionar accidentalmente un valor de frecuencia para un argumento de amplitud! Para obtener contexto adicional, puede resultarle útil leer los primeros párrafos del archivo de ayuda de la clase "UGen", así como un archivo guía titulado "Unit Generators and Synths".

### 2.4 Funciones UGen

#### 2.4.1 Reproducción y detención de sonidos simples

_función-punto-play_ se refiere a una estructura de código simple que nos permite hacer sonido rápidamente. Esta construcción implica una función que contiene uno o más UGens y recibe el método **play**. En el Ejemplo de Código 2.1, tenemos un UGen sinusoidal de tasa de audio con argumentos especificados por el usuario. Si evalúa esta línea, debería escuchar un tono de 300 Hz en su altavoz izquierdo.

Ejemplo de Código 2.1: Un ejemplo de uso de función-punto-play para crear sonido.
``` supercollider
{SinOsc.ar(300, 0, 0.1, 0)}.play;
```
Presione \[cmd\]+\[punto\] para detener el sonido. ¡Tómese un momento para memorizar este atajo de teclado! Incorpórelo a su memoria muscular. Grábelo en las paredes de su dormitorio. Sueñe con él por la noche. Es su botón de pánico confiable.

Analicemos la expresión en el Ejemplo de Código 2.1 y examinemos algunas variaciones. Primero, reconozcamos que escuchar sonido en un solo altavoz puede ser incómodo, particularmente con auriculares. SC interpreta una matriz de UGens como una señal multicanal. Entonces, si la función contiene una matriz de dos UGens **SinOsc**, la primera señal se enrutará al altavoz izquierdo y la segunda al derecho. El atajo de duplicación, mostrado en el Ejemplo de Código 2.2, es una forma rápida de crear tal matriz. Las señales multicanal se explorarán más adelante en este capítulo.

Ejemplo de Código 2.2: Uso de la duplicación de objetos para crear un sonido de dos canales.
``` supercollider
{SinOsc.ar(300, 0, 0.1, 0) ! 2}.play;
```
Sabemos que **SinOsc** espera cuatro argumentos, y hemos proporcionado cuatro valores. La frecuencia es 300, la fase es cero, y así sucesivamente. Cuando se proporcionan de esta manera, somos responsables del orden correcto. SC no es lo suficientemente inteligente como para determinar cuál es cuál si mezclamos las cosas. Un usuario experimentado puede recordar lo que significan estos números, pero para un recién llegado, este estilo mínimo puede implicar mucho ir y venir entre el código y los archivos de ayuda. El Ejemplo de Código 2.3 muestra una alternativa, utilizando un estilo más detallado:

Ejemplo de Código 2.3: Especificación de valores de argumentos utilizando un estilo "de palabras clave" más detallado.
``` supercollider
{SinOsc.ar(freq: 300, phase: 0, mul: 0.1, add: 0) ! 2}.play;
```
Este enfoque más largo pero más descriptivo para especificar valores de argumentos se aplica a todos los métodos, no solo a los asociados con UGens. [Código Complementario 2.1](https://global.oup.com/us/companion.websites/9780197617007/res/c_code/ch2/) detalla algunas variaciones y reglas a tener en cuenta al usar este estilo de palabras clave.

#### 2.4.2 Cambiar un sonido mientras se reproduce

Supongamos que queremos cambiar la frecuencia de un oscilador mientras se está reproduciendo. Para permitir cambios en tiempo real en un sonido, necesitamos hacer algunos cambios en los ejemplos de la sección anterior. Primero, debemos declarar un argumento al principio de la función UGen (tal como lo hicimos con las funciones ordinarias en el capítulo anterior) e incorporarlo en el UGen apropiado. Los nombres de los argumentos son flexibles y no tienen que coincidir con el nombre del argumento UGen para el que se están utilizando. Sin embargo, "freq" es ciertamente una buena elección, porque es corto y significativo a primera vista. También es aconsejable proporcionar un valor predeterminado en la declaración. Al llamar a **play**, debemos asignar el proceso de sonido resultante a una variable, para poder comunicarnos con él más tarde. Mientras el sonido se está reproduciendo, podemos alterarlo usando el método **set** y proporcionando el nombre y el valor del parámetro que queremos cambiar. El Ejemplo de Código 2.4 muestra esta secuencia de acciones.

Ejemplo de Código 2.4: Reproducción de una función UGen y uso de set para cambiar el sonido.
``` supercollider
(
x = { |freq = 300|
 SinOsc.ar(freq, mul: 0.1) ! 2;
}.play;
)

x.set(\freq, 400); // cambiar la frecuencia
```
Podemos declarar tantos argumentos como necesitemos. El Ejemplo de Código 2.5 añade un segundo argumento que controla la amplitud de la señal y demuestra una variedad de mensajes **set**.

Ejemplo de Código 2.5: Uso de mensajes set con una función UGen que contiene múltiples argumentos.
``` supercollider
(
x = { |freq = 300, amp = 0.1|
 SinOsc.ar(freq, mul: amp) ! 2;
}.play;
)

x.set(\freq, 400, \amp, 0.4); // modificar ambos argumentos
x.set(\amp, 0.05, \freq, 500); // el orden de los pares nombre/valor no importa
x.set(\freq, 600); // modificar solo un argumento
```
A menudo es deseable separar la creación y la reproducción de una función UGen en dos acciones discretas. En el Ejemplo de Código 2.6, definimos una función UGen y la almacenamos en la variable del intérprete **f**. Luego, la reproducimos, almacenando el proceso de sonido resultante en la variable del intérprete **x**. La primera es simplemente el objeto que define el sonido, mientras que la segunda es el proceso de sonido activo que entiende los mensajes **set**. Es importante no confundir los dos.

Ejemplo de Código 2.6: La construcción función-punto-play, separada en dos acciones discretas de definir y reproducir el sonido.
``` supercollider
(
// definir el sonido
f  { |freq = 300, amp = 0.1|

 SinOsc.ar(freq, mul: amp) ! 2;
};
)

x = f.play; // reproducir el sonido
x.set(\freq, 400, \amp, 0.3); // cambiar el sonido
f.set(\freq, 500, \amp, 0.05); // sin efecto si se aplica a la función
``` 

Incluso si los argumentos en una función UGen tienen valores predeterminados, podemos anularlos al reproducir la función. El método **play** tiene un argumento **args**, que acepta una matriz de pares nombre-valor, como se muestra en el Ejemplo de Código 2.7.

Ejemplo de Código 2.7: Anulación de valores de argumentos al llamar a play en una función UGen.
``` supercollider
(
f = { |freq = 300, amp = 0.1|
 SinOsc.ar(freq, mul: amp) ! 2;
};
)

x = f.play(args: [freq: 800, amp: 0.2]); // anular argumentos predeterminados

x.set(\freq, 600, \amp, 0.05); // los mensajes set funcionan normalmente
```

#### 2.4.3 Otras formas de detener un sonido

El atajo \[cmd]+\[periodo] es útil para detener el sonido, pero es indiscriminado. Como alternativa, podemos llamar al método **.free** en un proceso de sonido. Con este método, podemos tener múltiples procesos de sonido reproduciéndose simultáneamente y eliminarlos uno por uno, como se muestra en el Ejemplo de Código 2.8. Este ejemplo también destaca el valor de definir una función y reproducirla por separado; específicamente, podemos generar múltiples procesos de sonido a partir de una función.

Ejemplo de Código 2.8: Uso de free para detener procesos de sonido individualmente.
``` supercollider
(
f = { |freq = 300, amp = 0.1|
 SinOsc.ar(freq, mul: amp) ! 2;
};
)

x = f.play(args: [freq: 350]);
y = f.play(args: [freq: 450]);

y.free;
x.free;
```
Al igual que \cmd]+[periodo], liberar un proceso de sonido también resulta en una parada abrupta, lo cual puede no ser lo que queremos. Cuando usamos función-punto-play, también podemos usar **.release** para crear un desvanecimiento gradual, opcionalmente proporcionando una duración de desvanecimiento medida en segundos (ver Ejemplo de Código 2.9).

Ejemplo de Código 2.9: Uso de release para desvanecer un sonido creado por función-punto-play.
``` supercollider
(
f = { |freq = 300, amp = 0.1|
 SinOsc.ar(freq, mul: amp) ! 2;
};
)

x = f.play;
x.release(2);
``` 

#### 2.4.4 Operaciones matemáticas con UGens

Ya hemos establecido que un UGen es esencialmente una secuencia de números, por lo tanto, la mayoría de las operaciones matemáticas definidas para floats y enteros también se pueden aplicar a UGens. La suma de señales, por ejemplo, es una técnica fundamental que forma la base de la mezcla de audio y la síntesis aditiva. Cuando se suman dos señales, sus muestras correspondientes se suman, y el resultado es una nueva forma de onda en la que generalmente se pueden percibir ambas señales. El Ejemplo de Código 2.10 y la Figura 2.5 muestran la suma de una onda sinusoidal con ruido rosa.

Ejemplo de Código 2.10: Uso de la adición para mezclar una onda sinusoidal con ruido rosa.
``` supercollider
(
x = {
 var sig;
 sig = SinOsc.ar(300, mul: 0.15);
 sig = sig + PinkNoise.ar(mul: 0.1);
 sig = sig ! 2;
}.play;
)

x.release(2);
```
![image](images/000022.jpg)

FIGURA 2.5 Una representación gráfica de la suma de una onda sinusoidal con ruido rosa.

Cuando se usa un operador binario entre un número y un UGen, la operación se aplica al número y a cada valor de muestra producido por el UGen. Siendo este el caso, la multiplicación y la adición se pueden usar en lugar de proporcionar valores de argumento para **mul** y **add**. El Ejemplo de Código 2.11 reescribe el código del Ejemplo de Código 2.10 usando este enfoque.

Ejemplo de Código 2.11: Uso de operadores binarios como alternativa a especificar mul y add.
``` supercollider
(
x = {
   var sig;
   sig = SinOsc.ar(300) * 0.15;
   sig = sig + (PinkNoise.ar * 0.1);
   sig = sig ! 2;
}.play;
)

x.release(2);
``` 

_Tip.rand(); Una función UGen reproduce la última expresión_

Así como las funciones ordinarias devuelven el valor de su última expresión cuando se evalúan, la señal de salida de una función UGen también está determinada por su última expresión. En la primera de las siguientes dos funciones, solo escucharemos ruido rosa, a pesar de crear una onda sinusoidal. En la segunda función, la última expresión es la suma de ambas señales, que es lo que escuchamos.
``` supercollider
(
{
   var sig0, sig1;
   sig0 = SinOsc.ar(300, mul: 0.15) ! 2;
   sig1 = PinkNoise.ar(mul: 0.1) ! 2;
}.play;
)

(
{
   var sig0, sig1;
   sig0 = SinOsc.ar(300, mul: 0.15) ! 2;
   sig1 = PinkNoise.ar(mul: 0.1) ! 2;
   sig0 + sig1;
}.play;
)
``` 

Multiplicar una señal por otra también es común. El código en el Ejemplo de Código 2.12 multiplica el ruido rosa por una onda sinusoidal de baja frecuencia, produciendo un sonido como olas del océano. Este es un ejemplo simple de modulación de señal, que implica el uso de una señal para influir en algún aspecto de otra. Un valor de fase de 3π/2 hace que el oscilador sinusoidal comience en el punto más bajo de su ciclo, y los valores de multiplicación/adición escalan y desplazan los valores de salida a un nuevo rango entre 0 y 0.2. Los efectos de estos valores de argumento se visualizan en la Figura 2.6.

Ejemplo de Código 2.12: Modulación de la amplitud del ruido rosa con un oscilador de baja frecuencia.
``` supercollider
(
x = {
   var sig, lfo;
   lfo = SinOsc.kr(freq: 1/5, phase: 3pi/2, mul: 0.1, add: 0.1)
   sig = PinkNoise.ar * lfo;
   sig = sig ! 2;
}.play;
)

x.release(2);
``` 

![image](images/000023.jpg)

FIGURA 2.6 Una visualización incremental de cómo los valores de los argumentos influyen en la forma de onda de un UGen **SinOsc**.

Cuando queremos que la salida de un UGen oscile entre algún mínimo y máximo arbitrarios, usar **mul/add** a veces implica cálculos mentales engorrosos. Peor aún, el rango real del UGen no está inmediatamente claro al mirar el código. Un mejor enfoque implica usar uno de varios métodos de mapeo de rango, como **range**, demostrado en el Ejemplo de Código 2.13. Este método nos permite proporcionar explícitamente un mínimo y un máximo, evitando la necesidad de lidiar con **mul/add**. La Tabla 2.2 enumera algunos métodos comunes de mapeo de rango.

Ejemplo de Código 2.13: Uso de range para especificar límites de salida personalizados de un UGen.
``` supercollider
(
x = {
   var sig, lfo;
   lfo = SinOsc.kr(freq: 0.2, phase: 3pi/2).range(0, 0.2);
   sig = PinkNoise.ar * lfo;
   sig = sig ! 2;
}.play;
)

x.release(2);
``` 

TABLA 2.2 Métodos comunes de mapeo de rango de UGen.

Método | Descripción
--- | ---
**.range(x, y)** | Mapea linealmente el rango de salida entre _x_ e _y_.
**.exprange(x, y)** | Mapea exponencialmente el rango de salida entre _x_ e _y_. Los argumentos deben ser ambos positivos o ambos negativos, y ninguno puede ser 0.
**.curverange(x, y, n)** | Mapea el rango de salida entre _x_ e _y_ usando un valor de curvatura personalizado _n_. Los valores positivos crean un comportamiento similar al exponencial, los valores negativos crean un comportamiento similar al logarítmico.
**.unipolar(x)** | Mapea el rango de salida entre 0 y _x_.
**.bipolar(x)** | Mapea el rango de salida entre ±_x_.

_Tip.rand(); Mapeo de rango vs. mul/add_

Los métodos de mapeo de rango están diseñados como alternativas a los argumentos **mul/add**, y asumen que el rango del UGen al que se aplican no ha sido alterado previamente. Puede especificar el rango de un UGen usando un enfoque u otro, pero nunca debe aplicar ambos enfoques al mismo tiempo. Si lo hace, se aplicará una operación de mapeo de rango dos veces seguidas, produciendo números erróneos y posiblemente un sonido sorprendente.

A medida que comience a explorar funciones UGen por su cuenta, recuerde que el hecho de que se pueda usar una operación matemática no significa necesariamente que deba usarse. Dividir una señal por otra, por ejemplo, ¡es peligroso! Este cálculo puede implicar la división por un valor extremadamente pequeño (o incluso cero), lo que probablemente generará un pico de amplitud dramático, o algo igualmente desagradable. Se fomenta la experimentación, pero debe proceder con propósito y atención. Silencie o baje el volumen de su sistema primero antes de probar algo impredecible.

### 2.5 Envolventes

Si reproducimos una función que contiene algún oscilador o generador de ruido, y luego nos alejamos para tomar un café, regresaríamos un tiempo después para encontrar que el sonido aún continúa. En música, un sonido de duración infinita no es particularmente útil. En su lugar, generalmente preferimos que los sonidos tengan principios y finales definidos, para poder estructurarlos en el tiempo.

Una _envolvente_ es una señal con una forma y duración personalizables, típicamente construida a partir de segmentos de línea individuales unidos de extremo a extremo. Las envolventes se utilizan a menudo para controlar la amplitud de otra señal, permitiendo fundidos en lugar de inicios y paradas abruptas. Al usar **release**, ya hemos estado confiando en una envolvente incorporada que acompaña a la construcción función-punto-play. Al controlar la amplitud de la señal, una envolvente típicamente comienza en cero, sube hasta algún valor positivo, posiblemente permanece allí por un tiempo, y eventualmente vuelve a cero. El primer segmento se llama "ataque", la porción estable en el medio es el "sostenimiento", y el descenso final es la "liberación". Existen muchas variaciones; una envolvente "ADSR", por ejemplo, tiene un segmento de "decaimiento" entre el ataque y el sostenimiento (ver Figura 2.7).

![imagen](images/000024.jpg)

FIGURA 2.7 Una visualización de una envolvente ADSR.

Es importante reconocer que la envolvente ADSR es solo un ejemplo específico que resulta útil para modelar características de envolvente de muchos sonidos del mundo real. En última instancia, una envolvente es solo una señal con una forma personalizable, que puede usarse para controlar cualquier aspecto de un algoritmo de señal, no solo la amplitud.

#### 2.5.1 Line y XLine

Los UGens **Line** y **XLine** proporcionan formas de envolvente simples. **Line** genera una señal que viaja linealmente de un valor a otro durante una duración en segundos. **XLine** es similar pero presenta una trayectoria curvada exponencialmente. Al igual que los métodos **exprand** y **exprange**, los valores de inicio y fin para **XLine** deben tener el mismo signo y ninguno puede ser cero. El Ejemplo de Código 2.14 y la Figura 2.8 muestran el uso y los resultados visuales de usar estos UGens como envolventes de amplitud. Ten en cuenta que **XLine** no puede terminar en cero, pero puede acercarse lo suficiente como para que la diferencia sea imperceptible.

Ejemplo de Código 2.14: Uso de Line y XLine como envolventes de amplitud simples.
``` supercollider
(
{
   var sig, env;
   env = Line.kr(start: 0.3, end: 0, dur: 0.5);
   sig = SinOsc.ar(350) * env;
   sig = sig ! 2;
}.play;
)

(
{
   var sig, env;
   env = XLine.kr(start: 0.3, end: 0.0001, dur: 0.5);
   sig = SinOsc.ar(350) * env;
   sig = sig ! 2;
}.play;
)
```

![imagen](images/000025.jpg)

FIGURA 2.8 Resultado visual de **Line** (arriba) y **XLine** (abajo) cuando se usan como envolventes de amplitud para una señal de oscilador.

#### 2.5.2 DoneActions

**Line** y **XLine** incluyen un argumento, llamado **doneAction**, que aparece en UGens que tienen una duración inherentemente finita. En SC, un doneAction representa una acción que el servidor de audio toma cuando el UGen que contiene el doneAction ha terminado. Estas acciones pueden especificarse mediante un entero, y una lista completa de acciones disponibles y sus significados aparece en el archivo de ayuda para el UGen **Done**. La mayoría de las descripciones en esta tabla pueden parecerte completamente sin sentido, pero si es así, no te preocupes. En la práctica, rara vez empleamos un doneAction que no sea cero (no hacer nada) o dos (liberar el synth que lo contiene). El doneAction predeterminado es cero, y aunque no tomar ninguna acción suena inofensivo, conlleva consecuencias. Para demostrarlo, evalúa cualquiera de los dos ejemplos de código en el Ejemplo de Código 2.14 muchas veces seguidas. Al hacerlo, notarás que el uso de tu CPU aumentará gradualmente.

¿Por qué sucede esto? Porque un doneAction de cero le dice al servidor que no haga nada cuando la envolvente esté completa, la envolvente permanece activa en el servidor y continúa produciendo su valor final indefinidamente. Estos valores de cero o casi cero se multiplican por el oscilador sinusoidal, lo que resulta en una señal silenciosa o casi silenciosa. El servidor es indiferente a si un proceso de sonido es silencioso; solo sabe que se le instruyó que no hiciera nada cuando la envolvente terminara. Si evalúas este código una y otra vez, crearás más y más procesos de sonido que no terminan. Eventualmente, el servidor se sobrecargará y los sonidos adicionales comenzarán a tener fallos (si has seguido estas instrucciones y has aumentado tus números de CPU, ahora es un buen momento para presionar \[cmd\]+\[punto\] para eliminar estos sonidos "fantasma").

Desde una perspectiva práctica, cuando nuestra envolvente llega a su fin, consideramos que el sonido está totalmente terminado. Por lo tanto, tiene sentido especificar 2 para el doneAction. Al ejecutar el código en el Ejemplo de Código 2.15, el servidor automáticamente libera el sonido cuando la envolvente ha terminado. Evalúa este código tantas veces como quieras, y aunque no sonará diferente, notarás que el uso de CPU no aumentará como lo hizo antes.

Ejemplo de Código 2.15: Uso de un **doneAction** terminante para eliminar un proceso de sonido cuando su envolvente está completa.

``` supercollider
(
{
   var sig, env;
   env = XLine.kr(start: 0.3, end: 0.0001, dur: 0.5, doneAction: 2);
   sig = SinOsc.ar(350) * env;
   sig = sig ! 2;
}.play;
)
``` 

Saber qué doneAction especificar es una habilidad importante, esencial para automatizar la limpieza de sonidos obsoletos y optimizar el uso de los recursos del servidor de audio.

#### 2.5.3 Env y EnvGen

Las líneas son útiles para envolventes simples, pero no proporcionan mucha flexibilidad. Una vez que una **Line** o **XLine** comienza, no puede reiniciarse, modificarse o repetirse en bucle; simplemente viaja del inicio al final, y activa un doneAction cuando termina. En la mayoría de los casos, es preferible usar el **EnvGen** más flexible. La forma de un **EnvGen** está determinada por una instancia de una clase del lado del lenguaje llamada **Env**, proporcionada como el primer argumento de la señal de envolvente. Una instancia de **Env** creada con **new** espera tres argumentos: un array de valores de nivel, un array de duraciones de segmento y un array de especificaciones de curva. También podemos **plot** un **Env** para visualizar su forma. El Ejemplo de Código 2.16 y la Figura 2.9 demuestran la creación de un **Env** y su apariencia visual.

Ejemplo de Código 2.16: Creación y trazado de una instancia de Env.
``` supercollider
(
e = Env.new(
   levels: [ 0, 1, 0],
   times: [ 1, 3],
   curve: [ 0, 0]
);

e.plot;
)
```

![imagen](images/000026.jpg)

FIGURA 2.9 Visualización del **Env** del Ejemplo de Código 2.16.

Analicemos el significado de los números en el Ejemplo de Código 2.16. El primer array contiene niveles de envolvente, que son valores que la señal de envolvente visitará a medida que pasa el tiempo: la envolvente comienza en 0, viaja a 1 y regresa a 0. El segundo array especifica las duraciones de los segmentos entre estos niveles: el ataque dura 1 segundo y la liberación dura 3 segundos. El array final determina las curvaturas de los segmentos. Cero representa linealidad, mientras que los valores positivos/negativos "doblarán" los segmentos. Ten en cuenta que cuando un **Env** se crea de esta manera, el tamaño del primer array es siempre uno más que cualquiera de los otros dos arrays. Tómate un momento para modificar el código del Ejemplo de Código 2.16, para entender mejor cómo los números influyen en la forma de la envolvente. El Ejemplo de Código 2.17 ilustra cómo **EnvGen** y **Env** trabajan juntos para crear una señal de envolvente en una función UGen. Se usan palabras clave para mayor claridad. Debido a que es inherentemente finito, **EnvGen** acepta un doneAction. Como antes, tiene sentido especificar un doneAction de 2 para automatizar el proceso de limpieza.

Tip.rand(); Entendiendo las Curvas de Envolvente

Cuando se usan números para especificar curvas de segmento, puede ser difícil recordar cómo se doblará un segmento dependiendo del signo del número. La regla es: los valores positivos hacen que un segmento sea más horizontal al principio y más vertical hacia el final. Los valores negativos hacen que el segmento sea más vertical al principio, volviéndose más horizontal hacia el final.

También se pueden usar ciertos símbolos para especificar una curva de segmento, como **\\lin**, **\\exp**, **\\sin**, y otros. Una tabla de opciones válidas aparece en el archivo de ayuda de **Env**, en la sección que explica el método de clase **new**.

Ejemplo de Código 2.17: Uso de Env y EnvGen para crear una señal de envolvente de amplitud personalizada.
``` supercollider
(
{
   var sig, env;
   env = EnvGen.kr(
   envelope: Env.new(
   levels: [ 0, 1, 0],
   times: [ 1, 3],
   curve: [ 0, 0]
   ),
   doneAction: 2
   );
   sig = SinOsc.ar(350) * 0.3;
   sig = sig * env;
   sig = sig ! 2;
}.play;
)
``` 

Las envolventes se pueden dividir en dos categorías: aquellas con duraciones fijas y aquellas que pueden sostenerse indefinidamente. Las envolventes que hemos visto hasta ahora pertenecen a la primera categoría, pero en el mundo real, muchos sonidos musicales tienen envolventes de amplitud con duraciones indefinidas. Cuando un violinista toca una cuerda con el arco, no sabremos cuándo se detendrá el sonido hasta que se levante el arco. Una envolvente que modela este comportamiento se llama envolvente con puerta. Tiene un parámetro, llamado "puerta", que determina cómo y cuándo la señal de envolvente progresa a lo largo de su trayectoria. Cuando el valor de la puerta pasa de cero a positivo, la envolvente comienza y se sostiene en un punto a lo largo del camino. Cuando la puerta vuelve a ser cero, la envolvente continúa desde su punto de sostenimiento y termina el resto de su viaje. Al igual que una puerta del mundo real, describimos este parámetro como abierto (positivo) o cerrado (cero).

Para crear una envolvente sostenida, podemos agregar un cuarto argumento a **Env.new()**: un entero que representa un índice en el array de niveles, indicando el valor en el que la envolvente se sostendrá. En la terminología de SC, este nivel se llama el "nodo de liberación". En el Ejemplo de Código 2.18, el nodo de liberación es 2, lo que significa que la señal de envolvente se sostendrá en un nivel de 0.2 mientras la puerta permanezca abierta. Debido a que **gate** es un parámetro que nos gustaría cambiar mientras el sonido se está reproduciendo, debe declararse como un argumento y suministrarse al **EnvGen**. En efecto, este ejemplo crea una envolvente ADSR, similar a la Figura 2.7: el ataque viaja de 0 a 1 en 0.02 segundos, el decaimiento cae a un nivel de 0.2 en los siguientes 0.3 segundos, y la señal permanece en 0.2 hasta que la puerta se cierra, lo que activa una liberación de un segundo.

Ejemplo de Código 2.18: Uso de Env y EnvGen para crear una envolvente con puerta.
``` supercollider
(
f = { |gate = 1|
  var sig, env;
  env = EnvGen.kr(
  envelope: Env.new(
  [ 0, 1, 0.2, 0],
  [ 0.02, 0.3, 1],
  [ 0, -1, -4],
  2
  ),
  gate: gate,
  doneAction: 2
  );
  sig = SinOsc.ar(350) * 0.3;
  sig = sig * env;
  sig = sig ! 2;
};
)

x = f.play;

x.set(\\gate, 0);
```

En algunos casos, es posible que queramos reactivar una envolvente, abriendo y cerrando su puerta a voluntad, para permitir selectivamente que el sonido pase. Si es así, un doneAction de 2 es una mala elección, porque no necesariamente queremos que el proceso de sonido sea destruido si la envolvente llega a su fin. En su lugar, un doneAction de 0 (el predeterminado) es la elección correcta, demostrada en el Ejemplo de Código 2.19, que hace que la envolvente "espere" en su punto final hasta que se reactive.

Vale la pena ser extra claro sobre el comportamiento específico de una envolvente en respuesta a los cambios de puerta cuando se ha especificado un nodo de liberación:2

• Una transición de puerta de cero a positivo hace que la envolvente se mueva de su nivel actual al segundo nivel en el array de niveles, usando su primera duración y primer valor de curva. Ten en cuenta que la envolvente nunca vuelve a visitar su primer nivel, que solo se usa para la inicialización.

• Una transición de puerta de positivo a cero hace que la envolvente se mueva de su valor actual al valor inmediatamente después del nodo de liberación, usando los valores de duración y curva en el mismo índice que el nodo de liberación.

Ejemplo de Código 2.19: Una envolvente con puerta reactivable.
``` supercollider
(
f = { |gate = 1|
var sig, env;
env = EnvGen.kr(
Env.new(
[ 0, 1, 0.2, 0],
[ 0.02, 0.3, 1],
[ 0, -1, -4],
2
),
gate
);
sig = SinOsc.ar(350) * 0.3;
sig = sig * env;
sig = sig ! 2;
};
)

x = f.play;
x.set(\\gate, 0); // desvanecerse hasta el silencio pero sin liberar
x.set(\\gate, 1); // reabrir la compuerta para reiniciar la envolvente
x.set(\\gate, 0); // desvanecerse hasta el silencio otra vez
x.free; // liberar cuando se termina
``` 

Esta capacidad de reactivación también puede ser útil para envolventes de duración fija. Es posible pero poco práctico reactivar una envolvente de duración fija con un argumento de puerta estándar, porque requiere cerrar manualmente la puerta antes de reabrirla. Como solución, podemos anteponer al nombre del argumento de puerta **t_**, lo que lo transforma en un argumento de "tipo disparador", que responde de manera diferente a los mensajes **set**. Cuando un argumento de tipo disparador se establece en un valor no nulo, mantiene ese valor durante un solo ciclo de control, y luego casi inmediatamente "vuelve" a cero. Es como una puerta del mundo real que ha sido aumentada con un poderoso resorte, cerrándose de golpe inmediatamente después de ser abierta. El Ejemplo de Código 2.20 muestra el uso de argumentos de tipo disparador. Ten en cuenta que el valor predeterminado de la puerta es cero, lo que significa que la envolvente permanecerá inactiva en su nivel inicial (cero) hasta que se abra la puerta.

Ejemplo de Código 2.20: Uso de argumentos de tipo disparador para crear una envolvente de duración fija reactivable.
``` supercollider
(
x = { |t_gate = 0|
   var sig, env;
   env = EnvGen.kr(
      Env.new(
         [ 0, 1, 0],
         [ 0.02, 0.3],
         [ 0, -4],
      ),
      t_gate,
   );
   sig = SinOsc.ar(350) * 0.3;
   sig = sig * env;
   sig = sig ! 2;
}.play;
)

x.set(\\t_gate, 1); // evaluar repetidamente
x.free; // liberar cuando termine
``` 

**EnvGen**, en asociación con **Env**, es uno de los UGens más complejos en la biblioteca de clases, con muchas variaciones y sutilezas. Ambos archivos de ayuda contienen información adicional, y el [Código Complementario 2.2](https://global.oup.com/us/companion.websites/9780197617007/res/c_code/ch2/) explora usos y características adicionales de las envolventes.

### 2.6 Señales Multicanal

La percepción espacial es un componente central del sistema auditivo humano. Nuestra capacidad para localizar el origen de un sonido en nuestro entorno es instintiva; naturalmente giramos la cabeza hacia algo inesperado. Esta capacidad se deriva de tener dos oídos en dos puntos diferentes de nuestra cabeza. A menos que una fuente de sonido esté en el plano vertical que divide simétricamente el cuerpo, una onda sonora que se propaga llega a un oído ligeramente antes que al otro, creando un retraso de tiempo binaural que el cerebro interpreta para crear una sensación de conciencia espacial. La localización del sonido no está determinada únicamente por este retraso de tiempo (las discrepancias de espectro y amplitud entre los oídos proporcionan información adicional), pero es un factor significativo.

La música sería mucho menos interesante sin la capacidad de simular la ilusión del espacio físico. En el proceso de mezclar la grabación de un conjunto, es deseable "colocar" los instrumentos en ubicaciones específicas, dando al oyente la impresión de estar físicamente presente en una actuación en vivo. Del mismo modo, en la música electrónica, las elecciones espaciales creativas pueden tener efectos emocionantes e inmersivos. El proceso de manipular una señal para cambiar su ubicación espacial percibida se suele llamar "panoramización".

La ilusión del espacio se logra utilizando señales de audio multicanal, reproducidas a través de múltiples altavoces. En un formato estereofónico, comenzamos con dos señales, que quizás fueron grabadas por dos micrófonos posicionados en puntos ligeramente diferentes en el espacio. En la reproducción, las dos señales se enrutan individualmente a los altavoces izquierdo y derecho. Si estamos sentados equidistantes de los altavoces, y ni demasiado cerca ni demasiado lejos de ellos, experimentamos la ilusión auditiva de una "imagen fantasma" que parece emanar del espacio entre los altavoces.

El formato estereofónico es conveniente porque aproxima razonablemente bien nuestra experiencia auditiva natural, y solo requiere dos canales de audio. ¡Pero no hay razón para detenerse ahí! Existen varios formatos multicanal estandarizados que involucran altavoces que rodean al oyente, así como formatos más nuevos y emergentes para codificar "campos sonoros" tridimensionales, como los formatos Ambisonic.3 Realísticamente, si tienes _n_ altavoces, entonces puedes usarlos para reproducir una señal de _n_ canales, y puedes posicionar estos altavoces como quieras. Construye una torre de altavoces, arreglarlos en una larga línea, colgarlos del techo, montarlos en brazos robóticos gigantes que se agiten salvajemente. ¡No hay reglas!

SC puede expresar y manipular fácilmente señales multicanal arbitrariamente grandes. Con una corta línea de código y una CPU razonablemente potente, puedes crear una señal de 500 canales en cuestión de segundos. Incluso si no tienes 500 altavoces para escuchar esta señal en su verdadera forma, hay UGens capaces de mezclar señales multicanal a formatos con menos canales. La conclusión es que el servidor de audio interpreta un array de UGens como una señal multicanal e intentará enrutar los canales individuales a un bloque contiguo de canales de salida.

#### 2.6.1 Expansión Multicanal

En esta sección, será útil echar un vistazo a los medidores del servidor, una herramienta gráfica incorporada que nos permite monitorear visualmente los niveles de salida. Podemos acceder a los medidores iniciando el servidor y evaluando **s.meter**. Mantener los medidores visibles mientras trabajas es útil en general, no solo para esta sección.

Anteriormente, notamos que un UGen individual produce una señal de un canal, que se escucha en un solo altavoz. Ahora podemos ejecutar la siguiente línea y confirmar visualmente el tamaño del canal en los medidores del servidor (ver Figura 2.10).
``` supercollider
{SinOsc.ar(300, mul: 0.1)}.play;
```
Cuando se aplica a un UGen, el método **dup** (o su atajo simbólico) devuelve un array de copias de UGen, interpretado como una señal multicanal. Cuando ejecutamos la siguiente línea, aparecerá nivel en ambos medidores de salida.
``` supercollider
{SinOsc.ar(300, mul: 0.1) ! 2}.play;
```
![image](images/000027.jpg)

FIGURA 2.10 Señales de uno y dos canales mostradas en los medidores del servidor.

Cuando la última línea de una función UGen es un array de señales, SC intenta enrutar la señal en el índice 0 al canal de salida de hardware de número más bajo, y el elemento en el índice 1 al siguiente canal de salida de hardware más alto, y así sucesivamente, para cada señal en el array. Si estás usando la tarjeta de sonido incorporada de tu computadora, los canales de salida 0 y 1 corresponden a tus altavoces incorporados o auriculares. Si estás usando una interfaz de audio externa, estos canales corresponden a las dos salidas de número más bajo en esa interfaz. Algunas interfaces externas son capaces de manejar más de dos canales de salida simultáneos. SC puede (y debe) configurarse para que su número de canales de entrada/salida coincida con tu configuración de hardware. La configuración de entrada/salida se discute más extensamente en el Capítulo 6.

Cuando proporcionamos un array de números para un argumento de UGen, ese UGen se transformará en un array de UGens, distribuyendo cada número al UGen correspondiente. Este comportamiento de transformación se llama _expansión multicanal_ y es una de las características más únicas y poderosas de SC. Considera la cadena de declaraciones de código en el Ejemplo de Código 2.21, que muestra cómo se comporta la expansión multicanal paso a paso. En particular, observa cómo el array **[350, 353]** hace que el UGen se "expanda" en un array de UGens. El resultado es un tono de 350 Hz en el altavoz izquierdo y un tono de 353 Hz en el derecho.

Ejemplo de Código 2.21: Una representación paso a paso de la expansión multicanal, en la que un argumento de array produce un array de UGens.
``` supercollider
{SinOsc.ar([350, 353]) * 0.2}.play;

{[SinOsc.ar(350), SinOsc.ar(353)] * 0.2}.play;

{[SinOsc.ar(350) * 0.2, SinOsc.ar(353) * 0.2]}.play;
```
Cuando se realiza una operación binaria que involucra dos señales multicanal, como se muestra en el Ejemplo de Código 2.22, las operaciones se aplican a pares correspondientes de canales. Si una señal multicanal es más grande que la otra, la señal más pequeña "envolverá" sus canales para acomodar la señal más grande. Estos son los mismos comportamientos que ya hemos visto con arrays de números en el capítulo anterior.

Ejemplo de Código 2.22: Una función UGen que involucra una operación binaria entre dos señales multicanal. El tono de 450 Hz es modulado por un oscilador de 1 Hz, y el tono de 800 Hz es modulado por un oscilador de 9 Hz.
``` supercollider
(
{
   var sig, mod;
   sig = SinOsc.ar([450, 800]);
   mod = SinOsc.kr([1, 9]).range(0, 1);
   sig = sig * mod;
   sig = sig * 0.2;
}.play;
)
``` 
Cuando se aplica la expansión multicanal a un UGen determinista, no importa si duplicamos un argumento o el UGen mismo; el resultado es el mismo de cualquier manera. Sin embargo, este no es el caso con los UGens estocásticos, como los generadores de ruido. Cuando aplicamos la duplicación a un UGen estocástico, creamos una copia exacta del generador. Cuando se reproduce, la misma señal se envía a ambos altavoces, creando la ilusión de una única fuente directamente entre los altavoces. Por el contrario, cuando duplicamos el argumento de un UGen estocástico, la expansión multicanal produce múltiples instancias únicas de ese UGen, cada una de las cuales produce una señal aleatoria única. El resultado sonoro en este caso tiene un sentido más pronunciado de ancho y espacio. El Ejemplo de Código 2.23 muestra la diferencia entre estas dos versiones de expansión multicanal.

Ejemplo de Código 2.23: Duplicar un UGen vs. un argumento de UGen, lo que produce diferentes comportamientos cuando se aplica a señales estocásticas.
``` supercollider
// estas dos expresiones producen la misma señal:

{SinOsc.ar(300 ! 2, mul: 0.1)}.play;

{SinOsc.ar(300, mul: 0.1) ! 2}.play;

// estas dos expresiones producen señales diferentes:

{PinkNoise.ar(mul: 0.2) ! 2}.play; // fuente "puntual" entre los altavoces

{PinkNoise.ar(mul: 0.2 ! 2)}.play; // fuente "ancha" entre los altavoces
```

Puede que recuerdes que hemos visto una versión similar de este comportamiento en el capítulo anterior, al crear arrays de números aleatorios:
``` supercollider
rrand(1, 9) ! 8; // ocho copias de un número aleatorio
{ rrand(1, 9) } ! 8; // ocho números aleatorios generados únicamente
```
#### 2.6.2 Un Inconveniente Común en Audio Multicanal

Es fácil caer en el hábito automático de añadir **! 2** a tus señales para que algo se reproduzca a través de ambos altavoces. Para una señal de un canal, esto está bien, pero es problemático cuando se aplica a una señal que ya es una señal multicanal.

Ejemplo de Código 2.24: Aplicación errónea de duplicación a una señal multicanal.
``` supercollider
(
{
   var sig;
   sig = [SinOsc.ar(300), PinkNoise.ar];
   sig = sig * 0.1;
   sig = sig ! 2;
}.play;
)
```

En el Ejemplo de Código 2.24, comenzamos con una señal de dos canales que contiene una onda sinusoidal en el canal izquierdo y ruido rosa en el derecho. Esta señal se escala para producir un nivel de monitoreo cómodo, y luego se duplica erróneamente, produciendo un array de arrays, escrito aquí en un estilo de pseudo-código simplificado:
``` supercollider
[[SinOsc, PinkNoise], [SinOsc, PinkNoise]]
```
¿Cómo debería reaccionar SC a esto? En la capa más externa, el servidor de audio ve un array que contiene dos elementos, por lo que intenta reproducir el elemento 0 en el altavoz izquierdo y el elemento 1 en el altavoz derecho. Pero, cada uno de estos elementos es un array, cada uno conteniendo dos UGens. El resultado, para bien o para mal, es que el servidor suma los UGens en cada array interno, resultando en lo siguiente (de nuevo escrito como pseudo-código):
``` supercollider
[[SinOsc + PinkNoise], [SinOsc + PinkNoise]]
```
Así, escuchamos ambos UGens en ambos altavoces, y nuestra separación estéreo pretendida de estas dos señales se pierde. La conclusión aquí es ser consciente del tamaño del canal de tus señales en cada paso de una función UGen, y aplicar operaciones multicanal solo cuando sea apropiado hacerlo.

#### 2.6.3 UGens Multicanal

Algunos UGens están específicamente diseñados para procesar señales de tal manera que se altera su tamaño de canal. Uno de los más simples es **Pan2**, un panoramizador estéreo de potencia igual que acepta una señal de entrada de un canal y produce una señal de dos canales basada en un argumento **pan**. Cuando este argumento es negativo o positivo 1, la señal está presente solo en uno de los dos canales de salida (es decir, panoramizada "completamente a la izquierda" o "completamente a la derecha"). Cuando es 0, la señal está igualmente presente en ambos canales. El Ejemplo de Código 2.25 proporciona un ejemplo en el que la posición de panoramización es modulada por un LFO, produciendo un sonido que parece "rebotar" de un lado a otro.

Ejemplo de Código 2.25: Uso de Pan2 para "mover" un sonido en el campo estereofónico.
``` supercollider
(
{
   var sig, pan;
   pan = SinOsc.kr(0.5) * 0.8;
   sig = PinkNoise.ar * 0.2;
   sig = Pan2.ar(sig, pan);
}.play;
)
``` 
Pan2 siempre debe recibir una señal de entrada de un canal. Si recibe una señal de entrada multicanal, la señal de salida será un array de arrays, similar al problema ilustrado en la sección anterior.

¿Qué pasa si creamos una señal multicanal con más de dos canales? En el Ejemplo de Código 2.26, creamos una señal de 50 canales que consiste en ondas sinusoidales con frecuencias aleatorias. Si reproducimos esta señal tal cual, solo escucharemos los primeros dos canales, porque en condiciones típicas solo hay dos canales que corresponden a los altavoces.

Ejemplo de Código 2.26: Un intento de reproducir una señal de 50 canales. Solo se escucharán los dos canales más bajos.
``` supercollider
(
{
   var sig, freq;
   freq = {exprand(200, 2000)} ! 50;
   sig = SinOsc.ar(freq) * 0.1;
}.play;
)
```
**Splay**, demostrado en el Ejemplo de Código 2.27, es un UGen que mezcla una señal multicanal a un formato de dos canales en el que los canales de entrada se "colocan" en puntos equidistantes de izquierda a derecha. Es una opción conveniente para escuchar cada canal de una señal multicanal arbitrariamente grande.

Ejemplo de Código 2.27: Uso de Splay para mezclar 50 canales a un formato de dos canales.
``` supercollider
(
{
   var sig, freq;
   freq = {exprand(200, 2000)} ! 50;
   sig = SinOsc.ar(freq) * 0.1;
   sig = Splay.ar(sig);
}.play;
)
```
La exploración de variaciones se deja como un ejercicio abierto para el lector. Es posible crear sonidos multicanal intrincados con estos principios simples, y encontraremos muchos de estos sonidos a lo largo de este libro. También puedes querer leer el archivo de guía titulado "Multichannel Expansion" para refinar tu comprensión.

### 2.7 SynthDef y Synth

El enfoque "función-punto-play" es un atajo para el proceso más formal y flexible de hacer sonido, que implica el uso de **SynthDef** y **Synth**. Un SynthDef es una especie de "receta" para un algoritmo de señal, mientras que un Synth es un objeto que ejecuta ese algoritmo. Cuando reproducimos una función UGen, el objeto devuelto es en realidad un Synth, al que nos hemos referido como un "proceso de sonido" hasta este punto. Como analogía para usar estas dos clases, considera hornear un pastel. Un SynthDef es como un libro de recetas, que contiene instrucciones para hornear una variedad de pasteles. Un Synth es como un pastel, creado siguiendo una receta del libro. De este único libro, es posible crear muchos pasteles diferentes, pero el libro en sí no es un pastel (y no es ni de lejos tan delicioso). Si quisieras hacer veinte pasteles, no necesitarías veinte libros. En otras palabras, dos copias del mismo libro son redundantes, pero dos pasteles idénticos no son necesariamente redundantes (tal vez tus invitados están extra hambrientos). Como un buen libro de recetas, un SynthDef debe ser lo más flexible posible, para que pueda usarse para generar una colección maximalmente diversa de resultados tangibles. Si un SynthDef está mal diseñado (es decir, con un conjunto limitado de recetas), los sonidos que se pueden producir serán igualmente limitados. El diseño flexible de SynthDef implica principalmente declarar muchos argumentos, para que numerosos parámetros de UGen puedan ser personalizados y controlados.

Para ejemplos cortos y pruebas rápidas, función-punto-play es conveniente y ahorra tiempo. Sin embargo, en casos donde la reutilización y flexibilidad de los algoritmos de señal son de mayor importancia, es preferible usar SynthDef y Synth. De hecho, usar Synth y SynthDef es la única manera de crear sonido en SuperCollider. Cuando invocamos función-punto-play, se crean un SynthDef y un Synth para nosotros en segundo plano.

#### 2.7.1 Creando un SynthDef

Ejemplo de Código 2.28: Una función UGen simple usada para ilustrar el proceso de conversión a un SynthDef.

```supercollider
(
x = {
   var sig;
   sig = SinOsc.ar([350, 353]);
   sig = sig * 0.2;
}.play;
)

x.free;
```

Considera la función UGen en el Ejemplo de Código 2.28. Podemos convertirla en un SynthDef usando unos pocos pasos simples, resumidos aquí y detallados a continuación:

1. Proporcionar un nombre y una función UGen.
2. Especificar la señal de salida y el destino.
3. 'añadir' el SynthDef.

Un nuevo SynthDef espera dos argumentos: un símbolo, que representa el nombre del SynthDef, y una función UGen que define su algoritmo de señal. La mayoría de los algoritmos, particularmente aquellos que generan o procesan una señal, producen alguna señal de salida. Cuando este es el caso, debemos designar explícitamente la señal de salida y su destino, incluyendo un UGen de salida en la función. Hay varios tipos de UGens de salida, pero **Out** es bastante común. El primer argumento de **Out** indica el bus de destino (0 corresponde a tu canal de hardware de menor número, generalmente tu altavoz izquierdo). El segundo argumento es la señal que se enviará a ese bus. Si la señal de salida es una señal multicanal, los canales adicionales se enrutarán a buses con índices de bus incrementalmente más altos. Por ejemplo, si **Out** se usa para enviar una señal de dos canales al bus 0, los canales se enrutarán a los buses 0 y 1. Finalmente, cerramos el encapsulamiento SynthDef.new, y usamos el método **add** para hacer que el SynthDef esté disponible para el servidor de audio. El Ejemplo de Código 2.29 muestra el resultado de este proceso.

Ejemplo de Código 2.29: Un SynthDef creado a partir de la función UGen en el Ejemplo de Código 2.28.

```supercollider
(
SynthDef(\test, {
   var sig;
   sig = SinOsc.ar([350, 353]);
   sig = sig * 0.2;
   Out.ar(0, sig);
}).add;
)
```

Una vez que se ha añadido un SynthDef, permanecerá disponible mientras el entorno SC permanezca abierto y el servidor permanezca iniciado. Si quieres hacer cambios al SynthDef, puedes reevaluar el código, y la nueva definición sobrescribirá la antigua. Solo puede haber un SynthDef con un nombre específico, así que si tienes múltiples SynthDefs, asegúrate de darles nombres únicos.

#### 2.7.2 Creando un Synth

Podemos ejecutar un algoritmo SynthDef instanciando un Synth. Como mínimo, el Synth necesita saber el nombre del SynthDef a utilizar. Si asignamos el Synth a una variable, podemos comunicarnos con él en un punto futuro (ver Ejemplo de Código 2.30). Ten en cuenta que no necesitamos "reproducir" explícitamente un Synth; simplemente crear un Synth lo pone en un estado activo en el servidor de audio.

Ejemplo de Código 2.30: Creando y liberando un Synth.

```supercollider
x = Synth(\test);
x.free;
```

Cuando usamos función-punto-play, SC no solo crea un SynthDef y un Synth en segundo plano, sino que también añade algunas conveniencias. Si nuestra función no incluye una envolvente con puerta, SC crea una automáticamente, con un argumento llamado "gate". El método **release**, cuando se aplica a un Synth, asume que hay un argumento "gate" usado para controlar una envolvente sostenida. Además, SC añade un UGen **Out** si no existe uno ya.

Cuando usamos SynthDef y Synth nosotros mismos, no se aplican tales conveniencias. En su lugar, obtenemos exactamente lo que especificamos. Si no incluimos una envolvente de amplitud, el método **release** no tendrá efecto. De manera similar, si no incluimos un UGen de salida, el Synth no producirá ningún sonido.

#### 2.7.3 Argumentos de SynthDef

Continuando con nuestra analogía de hornear pasteles, el SynthDef de la sección anterior es como un libro de cocina con exactamente una receta de pastel. Cada Synth **\test** suena exactamente igual. Una mejor elección de diseño implica declarar argumentos para los parámetros que nos gustaría controlar. Hacerlo hace que el SynthDef sea ligeramente más costoso computacionalmente, pero ofrece mucha más flexibilidad. El Ejemplo de Código 2.31 aumenta el SynthDef con una envolvente de amplitud y declara argumentos para casi todos los parámetros modulables.

Ejemplo de Código 2.31: Un SynthDef diseñado de manera más flexible con numerosos argumentos.

```supercollider
(
SynthDef.new(\test, {
arg freq = 350, amp = 0.2, atk = 0.01, dec = 0.3,
slev = 0.4, rel = 1, gate = 1, out = 0;
var sig, env;
env = EnvGen.kr(
    Env.adsr(atk, dec, slev, rel),
    gate,
    doneAction: 2
);
sig = SinOsc.ar(freq + [0, 1]);
sig = sig * env;
sig = sig * amp;
Out.ar(out, sig);
}).add;
)

x = Synth(\test);
x.set(\freq, 450);
x.set(\amp, 0.5);
x.set(\gate, 0, \rel, 3);
```

Para instanciar un Synth cuyos valores iniciales de argumentos difieren de los valores por defecto del SynthDef, proporcionamos un array de pares nombre-valor de argumentos, mostrado en el Ejemplo de Código 2.32, similar al enfoque mostrado en el Ejemplo de Código 2.7. El array es el segundo argumento que **Synth.new()** espera, por lo que no se necesita la palabra clave **args:**.

Ejemplo de Código 2.32: Creando un Synth con valores iniciales de argumentos personalizados.

```supercollider
x = Synth(\test, [freq: 800, amp: 0.1, atk: 4, slev: 1]);
x.set(\gate, 0);
```

Es difícil exagerar el valor de los argumentos en un SynthDef. Incluso si declaras un argumento pero nunca lo manipulas, el hecho de que exista proporciona la flexibilidad para hacerlo, si cambias de opinión. Si quieres que el glaseado de tu pastel sea a veces de vainilla y a veces de chocolate, necesitarás declarar un argumento de sabor.

En este punto, somos capaces de empezar a hacer sonidos algo interesantes y musicales, por ejemplo, usando iteración para crear clústeres de tonos. Un breve ejemplo aparece en el Ejemplo de Código 2.33. Modificar este ejemplo se deja como un ejercicio abierto para el lector.

Ejemplo de Código 2.33: Un par de expresiones de código que generan y desvanecen un clúster de tonos.

```supercollider
(
// devuelve un array de cuatro Synths, asignado a x
x = [205, 310, 525, 700].collect({ |f|
    Synth.new(\test, [\freq, f, \amp, 0.1]);
});
)

// desvanece cada Synth
x.do({ |n| n.set(\gate, 0, \rel, 5) });
```

A pesar de todos sus argumentos, este SynthDef representa un libro de recetas relativamente pequeño. No nos permitirá reproducir una muestra de audio o añadir un efecto de reverberación. Sin embargo, ningún SynthDef individual debería ser diseñado para producir cada sonido imaginable, al igual que ningún libro de recetas individual te proporcionará cada receta de pastel conocida por la humanidad. De hecho, a medida que tus proyectos se vuelvan más complejos, necesitarán una modesta colección de SynthDefs, cada uno con un propósito diferente, al igual que podrías acumular una biblioteca de libros de cocina de pasteles con el tiempo. Crear SynthDefs lo suficientemente flexibles como para producir una amplia variedad de sonidos, pero no tan complejos que se vuelvan difíciles de manejar, es una habilidad que se desarrolla con el tiempo. Sin embargo, no hay reglas estrictas, y puede haber situaciones que requieran un SynthDef inusualmente grande/complejo, y otras que requieran un diseño más mínimo.

_Tip.rand(); Aleatoriedad en un SynthDef_

Hemos visto que la aleatoriedad puede ser utilizada dentro de una función UGen para crear resultados interesantes (por ejemplo, en los Ejemplos de Código 2.26 y 2.27). Los métodos del lado del lenguaje **rrand** y **exprand** pueden ser utilizados dentro de un SynthDef, pero generalmente es mejor usar los UGens **Rand** y **ExpRand**. Los métodos del lado del lenguaje generan un valor aleatorio exactamente una vez, cuando el SynthDef se añade por primera vez, pero los UGens generarán un nuevo valor aleatorio cada vez que se cree un Synth a partir de ese SynthDef. Ten en cuenta también que los UGens **Rand** y **ExpRand** usan el método de creación **new** en lugar de **ar/kr/ir**, que también se puede omitir. El siguiente código demuestra la diferencia entre estos dos enfoques:

```supercollider
(
SynthDef(\rand_lang, {
   var sig = SinOsc.ar({exprand(200, 2000)} ! 30);
   sig = Splay.ar(sig) * 0.05;
   Out.ar(0, sig);
}).add;
)

Synth(\rand_lang); // misma aleatoriedad cada vez

(
SynthDef(\rand_ugen, {
   var sig = SinOsc.ar({ExpRand(200, 2000)} ! 30);
   sig = Splay.ar(sig) * 0.05;
   Out.ar(0, sig);
}).add;
)

Synth(\rand_ugen); //aleatoriedad única cada vez
```

### 2.8 Expresión Alternativa de Frecuencia y Amplitud

Los osciladores con un parámetro de frecuencia esperan un valor en Hertz. Cuando se piensa en el tono musical, los Hertz no siempre son la unidad de medida preferida. Usar números de nota MIDI puede ser una alternativa conveniente. En este sistema, 60 corresponde al do central (aproximadamente 261.6 Hz), y un incremento/decremento de uno corresponde a un cambio de semitono en la temperación igual de 12 tonos. Podemos convertir de MIDI a Hertz usando **midicps** y convertir en la otra dirección con **cpsmidi**. Los números de nota MIDI no enteros son válidos y representan un tono proporcionalmente entre dos semitonos de temperación igual.

```supercollider
60.midicps; // -> 261.6255653006
500.cpsmidi; // -> 71.213094853649
```

**midiratio** y **ratiomidi** son métodos igualmente útiles que convierten de ida y vuelta entre un intervalo, medido en semitonos, y la relación de frecuencia que representa ese intervalo. Por ejemplo, **3.midiratio** representa la relación entre un Fa y el Re inmediatamente debajo de él, porque estos dos tonos están separados por tres semitonos. Los valores de semitonos negativos representan el movimiento del tono en la dirección opuesta.

```supercollider
// la relación que eleva una frecuencia en un semitono
1.midiratio; // -> 1.0594630943591

// la relación 8/5 es ligeramente más de 8 semitonos de temperación igual
(8/5).ratiomidi // -> 8.1368628613517
```

De manera similar, al expresar la amplitud de la señal, un rango normalizado entre cero y uno no siempre es la elección más intuitiva. El método **ampdb** convierte una amplitud normalizada a un valor de decibelios y **dbamp** hace lo contrario. Un valor de cero dB corresponde a un valor de amplitud nominal de uno. Si tu sistema de audio está correctamente calibrado, un valor de decibelios alrededor de -20 dB debería producir un nivel de monitoreo cómodo, y una señal típica se volverá inaudible alrededor de -80 dB.

```supercollider
-15.dbamp; // -> 0.17782794100389
0.3.ampdb; // -> -10.457574905607
```


Por razones de eficiencia, es preferible no construir estos métodos dentro de un SynthDef, y en su lugar llamarlos cuando se crea o modifica un Synth, de modo que el servidor no tenga que realizar repetidamente estos cálculos. Algunos ejemplo aparecen en el Ejemplo de Código 2.34

Ejemplo de Código 2.34: Usos de métodos de conversión de frecuencia y amplitud.

```supercollider
(
SynthDef.new(\test, {
	arg freq = 350, amp = 0.2, atk = 0.01, dec = 0.3,
	slev = 0.4, rel = 1, gate = 1, out = 0;
	var sig, env;
	env = EnvGen.kr(
		Env.adsr(atk, dec, slev, rel),
		gate,
		doneAction: 2
	);
	sig = SinOsc.ar(freq + [0, 1]);
	sig = sig * env;
	sig = sig * amp;
	Out.ar(out, sig);
}).add;
)

x = Synth(\test, [freq: 60.midicps, amp: -20.dbamp]);

x.set(\freq, 62.midicps); // increase pitch by 2 semitones

x.set(\amp, -12.dbamp); // increase level by 8 dB

x.set(\gate, 0);
```

### 2.9 Herramientas útiles del servidor

Trabajar con sonido en una interfaz basada en código puede resultar intimidante, especialmente en ausencia de herramientas gráficas que ayuden a visualizar tu trabajo. Afortunadamente, hay varias herramientas incorporadas que proporcionan dicha asistencia (introdujimos los medidores del servidor en la Sección 2.6.1). Varias de estas herramientas son accesibles desde el menú desplegable "Server", y también haciendo clic en la barra de estado del servidor en la esquina inferior derecha del IDE. La Figura 2.11 muestra varias de estas herramientas.

![image](images/000028.jpg)

FIGURA 2.11 Varias herramientas gráficas del servidor. En sentido horario desde la parte superior izquierda: Estetoscopio, Medidores del Servidor, GUI del Servidor, Control deslizante de Volumen, Árbol de Nodos y FreqScope (también llamado Analizador de Espectro o Analizador de Frecuencia).

#### 2.9.1 Sondeo de un UGen

Podemos **sondear** cualquier UGen, lo que imprime sus valores de salida en la ventana de publicación mientras se ejecuta, como se muestra en el Ejemplo de Código 2.35. Es una herramienta de resolución de problemas, como **postln**, pero para UGens. Obviamente, no podemos (y no deberíamos) imprimir cada valor que sale de un UGen, que son decenas de miles de números por segundo. Solo unos diez valores por segundo pueden ser suficientes para obtener la información que necesitamos. Aun así, sondear un UGen, incluso a baja frecuencia, es relativamente exigente para tu CPU, y solo debe usarse para depuración. El primer argumento de **poll** es la frecuencia a la que se muestrea y muestra el valor del UGen, que rara vez necesita ser mayor que 20. Valores excesivamente altos pueden hacer que SC deje de responder.

Ejemplo de Código 2.35: Sondeando un UGen.

```supercollider
(
x = {
   var sig, freq;
   freq = SinOsc.kr(0.2).exprange(200, 800).poll(20);
   sig = SinOsc.ar(freq);
   sig = sig * 0.2;
   sig = sig ! 2;
}.play;
)
```

#### 2.9.2 Graficando una función UGen

La señal de salida de una función UGen puede visualizarse llamando a **plot** en lugar de **play**, y proporcionando un argumento de duración (ver Ejemplo de Código 2.36). Esta es una característica en tiempo real, lo que significa que debe transcurrir una cantidad de tiempo igual a la duración especificada antes de que se muestre el gráfico, por lo que los gráficos más largos son cada vez más poco prácticos. Graficar es una excelente manera de aprender visualmente más sobre el comportamiento de un UGen con el que no estás familiarizado, sin el riesgo de sonidos inesperadamente fuertes. Si la salida del UGen es una señal multicanal, el resultado será un gráfico multicanal.

Ejemplo de Código 2.36: Graficando funciones UGen.

```supercollider
{SinOsc.ar(110)}.plot(0.05); // 0.05 segundos de una onda sinusoidal de 110 Hz
{SinOsc.ar([110, 220, 330, 440])}.plot(0.05); // gráfico multicanal
```

Graficar una función UGen devuelve una instancia de una clase llamada **Plotter**, una visualización gráfica que responde a una variedad de métodos que alteran su apariencia. Estos cambios pueden invocarse a través del código, pero es más simple confiar en un puñado de atajos de teclado, habilitados cuando un gráfico de señal es la ventana superior. Una lista de atajos de teclado aparece en el archivo de ayuda de **Plotter**. Si un gráfico contiene un número especialmente grande de puntos de datos, los intentos de mover o redimensionar la ventana pueden producir un comportamiento lento. Los gráficos UGen son más ágiles y útiles cuando grafican un conjunto relativamente pequeño de datos.

#### 2.9.3 Estetoscopio

La clase **Stethoscope** proporciona un osciloscopio digital en tiempo real, útil para monitorear visualmente la forma y el comportamiento de una señal. Suponiendo que el servidor esté iniciado, esta herramienta puede crearse evaluando:

```supercollider
s.scope;
```

Por defecto, el osciloscopio monitorea los buses de audio 0 y 1. En una configuración típica, cualquier cosa enviada a los altavoces aparecerá en el osciloscopio. Al igual que **Plotter**, una instancia de **Stethoscope** responde a métodos que alteran su comportamiento y apariencia, la mayoría de los cuales pueden invocarse mediante interacción del ratón o atajos de teclado. Una tabla de estos atajos aparece en el archivo de ayuda de **Stethoscope**.

Las señales periódicas pueden parecer inestables o saltarinas, o moverse hacia adelante/atrás en el osciloscopio. Este es un ejemplo del "efecto rueda de auto", que es el mismo fenómeno que hace que los neumáticos parezcan girar hacia atrás o estar quietos en los comerciales de automóviles. La ilusión resulta de la superposición de dos procesos periódicos. En nuestro caso, la frecuencia de cuadros del osciloscopio interfiere con la frecuencia aparente de la señal. Puedes intentar armonizar estos dos procesos periódicos ajustando el nivel de zoom horizontal usando el control deslizante inferior. Cuando está correctamente "sintonizado", el movimiento de la señal parecerá detenerse, y se vuelve mucho más fácil entender su forma y comportamiento.

#### 2.9.4 FreqScope

La clase **FreqScope** es como **Stethoscope** pero proporciona un analizador espectral en tiempo real en lugar de una visualización de forma de onda. Esta herramienta se crea evaluando:

```supercollider
FreqScope.new;
```

Un **FreqScope** solo puede monitorear un canal a la vez y analiza el bus de audio cero por defecto. Es posible monitorear un bus diferente usando el cuadro numérico en el lado derecho de la ventana del analizador.

#### 2.9.5 Control deslizante de volumen principal

**Volume** es una clase que el servidor de audio utiliza para ajustar el nivel general de su salida. Incluye un componente gráfico incorporado que hace que esta funcionalidad esté disponible para el usuario a través de un control deslizante y un cuadro numérico, que se puede crear evaluando:

```supercollider
s.volume.gui;
```

Si ajustas este control deslizante y luego cierras la ventana del control deslizante, el cambio de volumen permanecerá en efecto.

#### 2.9.6 Grabación en un archivo de audio

Algunos usuarios pueden desear usar SC por sus ricas capacidades algorítmicas y usar un DAW para composición, ensamblaje, mezcla y masterización. Esto es razonable, considerando que los entornos DAW están específicamente diseñados para este tipo de trabajo. Para usar un término relacionado con DAW, es posible realizar un "bounce" de sonidos de SC y renderizarlos como un archivo de audio. Para hacer esto, primero podemos materializar una ventana gráfica que representa el estado del servidor:

```supercollider
s.makeGui;
```

Al hacer clic en el botón "record", SC comenzará a grabar cualquier señal que se reproduzca en los buses 0 y 1. Cuando se hace clic nuevamente, la grabación se detendrá y se escribirá un archivo de audio en tu disco duro. La ventana de publicación muestra la ruta al archivo de audio recién creado, y la ubicación de tu directorio de grabación predeterminado se puede imprimir evaluando:

```supercollider
Platform.recordingsDir;
```

Tu grabación puede incluir uno o dos segundos de silencio al principio del archivo, debido al tiempo que pasa entre hacer clic en el botón y ejecutar tu código de sonido, pero este silencio se recorta fácilmente en cualquier editor de forma de onda. El proceso de grabación también puede iniciarse y detenerse evaluando **s.record** y **s.stopRecording**.

#### 2.9.7 El árbol de nodos

El árbol de nodos es una representación gráfica en tiempo real de los procesos activos en el servidor de audio. Se puede invocar evaluando:

```supercollider
s.plotTree;
```

Cuando se crea un Synth, estará representado por una caja blanca que aparece en la ventana del árbol de nodos (¡pruébalo tú mismo!). El árbol de nodos puede ser útil para investigar ciertos tipos de problemas. Por ejemplo, si estás tratando de crear un sonido pero no escuchas nada, verifica el árbol de nodos. Si ves la caja blanca que representa tu Synth, puedes estar bastante seguro de que el problema está relacionado con algo en tu función SynthDef. Si no ves una caja blanca, entonces significa que el problema está relacionado con el código destinado a crear el Synth.