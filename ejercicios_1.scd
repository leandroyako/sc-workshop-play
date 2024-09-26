//Conjunto de Problemas Semana 1
//Entrega 3pm CDT 3 de septiembre
//Primero, guarda este archivo scd como un nuevo archivo, renombrándolo con tu Apellido al principio del nombre del archivo (por ejemplo, "Apellido Conjunto de Problemas Semana 1.scd"), y sube este archivo renombrado al sitio web del curso para tu entrega.

//Problema 1
//El siguiente código produce un error. Corrige el error y añade un comentario indicando el problema (los comentarios se crean iniciando una línea con dos barras diagonales, exactamente como esta línea).
(
var manzanas = 3;
manzanas = manzanas * 2;
manzanas = manzanas - 1;
)
// añadir var antes de manzanas

//Problema 2
//El siguiente código produce un error. Corrige el error y añade un comentario indicando el problema.
(
var saldoAntiguo, deposito, saldoNuevo;
saldoAntiguo = 5;
deposito = 100;
saldoNuevo = saldoAntiguo + deposito;
)
// necesita un punto y coma en la primera línea

//Problema 3
//El siguiente código produce un error. Corrige el error y añade un comentario indicando el problema.
(
var tamanoAula, numClases, totalEstudiantes;
tamanoAula = 30;
numClases = 4;
totalEstudiantes = tamanoAula * numClases;
)
// error tipográfico en totalEstudiantes

//Problema 4
//El siguiente código produce un error. Corrige el error y añade un comentario indicando el problema.
(
~func = {
    arg x=5, y=6, z=7;
    var producto;
    producto = x * y * z;
};
)
// eliminar la coma después de la palabra clave arg

//Problema 5
//El siguiente código devuelve un booleano indicando si el cuadrado de 45 es un número impar, y está escrito en el estilo "receptor.metodo". Reescríbelo en el estilo "metodo(receptor)".
45.cuadrado.impar;
impar(cuadrado(45));
// hecho

//Problema 6
//La siguiente comprobación condicional imprime si un número flotante aleatorio entre 0 y 1 es mayor que 0.5 o no, y está escrita en el estilo "metodo(receptor)". Reescríbelo de manera que todas las instancias de este estilo de sintaxis se conviertan al estilo "receptor.metodo".
(
if(
    postln(rand(1.0)) > 0.5,
    {postln("es mayor que 0.5")},
    {postln("no es mayor que 0.5")}
);
)
(rand(1.0).postln > 0.5).if({postln("es mayor que 0.5")},{postln("no es mayor que 0.5")})
// hecho

//Problema 7
//Escribe una función que acepte tres argumentos de entrada. Si los tres inputs son miembros de la misma clase (por ejemplo, 1, 4, 500), devuelve la cadena "igual". Si no (por ejemplo, "hola", 6.1, 99), devuelve la cadena "diferente". Escribe algunas líneas adicionales de código que demuestren el uso de esta función.
(
~func1 = {
    arg x, y, z;
    if(x.class == y.class && (y.class == z.class),
        {postln("igual")},
        {postln("diferente")}
    )
};
)
~func1.value(1, "hola", $y)
~func1.value(1, 2, 3)
~func1.value("yo", "hola", "que tal")

//Problema 8
//Escribe una función que verifique si un número es múltiplo de 100. Si lo es, devuelve ese número. Si no, devuelve el múltiplo de 100 más cercano. Si el input proporcionado no es un número, devuelve la cadena "no es un número". Escribe algunas líneas adicionales de código que demuestren el uso de esta función.
(
~func2 = {
    arg x;
    (x.isKindOf(Number)).if({
            (x % 100 == 0).if(x, (x + 50).div(100) * 100)
        }, "no es un número"
    )
};
)
~func2.value(120);
~func2.value(260);
~func2.value(-75);

//Problema 9
//Escribe una función que verifique si un valor entrante (representando una frecuencia medida en Hz) está dentro del rango generalmente aceptado como audible para el oído humano (no menos de 20 y no más de 20000). Si está dentro del rango, devuelve la cadena: "reproducir tono a xxx Hz". Si no está dentro de este rango, devuelve la cadena "xxx Hz fuera de rango". El número real debe reemplazar el xxx en ambos casos. (Nota: puedes usar el método "asString" para convertir un número a una cadena). Si el input no es un número, la función debe devolver la cadena "entrada inválida". Escribe algunas líneas adicionales de código que demuestren el uso de esta función.
(
~func3 = {
    arg x;
    if(x.isKindOf(Number), {
        if(x > 20 && (x < 20000),
            "reproducir tono a " ++ x.asString ++ " Hz",
            x.asString ++ " Hz fuera de rango")
    },
    "entrada inválida"
    )
};
);
~func3.value(5);
~func3.value('algunos símbolos')
~func3.value(1000)
~func3.value(1000000)