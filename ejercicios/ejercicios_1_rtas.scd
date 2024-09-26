//Problema 1
(
var manzanas = 3;
manzanas = manzanas * 2;
manzanas = manzanas - 1;
)
// añadir var antes de manzanas

//Problema 2
(
var saldoAntiguo, deposito, saldoNuevo;
saldoAntiguo = 5;
deposito = 100;
saldoNuevo = saldoAntiguo + deposito;
)
// necesita un punto y coma en la primera línea

//Problema 3
(
var tamanoAula, numClases, totalEstudiantes;
tamanoAula = 30;
numClases = 4;
totalEstudiantes = tamanoAula * numClases;
)
// error tipográfico en totalEstudiantes

//Problema 4
(
~p4 = {
    arg x=5, y=6, z=7;
    var producto;
    producto = x * y * z;
};
)
// eliminar la coma después de la palabra clave arg

//Problema 5
45.squared.odd;
odd(squared(45));


//Problema 6
(
if(
    postln(rand(1.0)) > 0.5,
    {postln("es mayor que 0.5")},
    {postln("no es mayor que 0.5")}
);
)

(
(1.0.rand.postln > 0.5)
.if(
	{"es mayor que 0.5".postln},
	{"no es mayor que 0.5".postln}
);
)

//Problema 7
(
~p7 = {
    arg x, y, z;
    if(
		(x.class == y.class) && (y.class == z.class),
        {
			"igual".postln;
		},
        {
			"diferente".postln;
		}
    )
};
)
~p7.value(13, "Festival", \play);
~p7.value(1, 2, 3);
~p7.value($x, [10,11,12], pi);


//Problema 8
(
~p8 = {
    arg x;
    if(
		x.isKindOf(Number),
		{
            if(
				x % 100 == 0,
				{x},
				{x.round(100)}
			)
		},
		{
			"no es un número".postln;
		}
    )
};
)

~p8.value(120);
~p8.value(260);
~p8.value(-75);
~p8.value(\75);


//Problema 9
(
~p9 = {
	arg x;
	if(
		x.isKindOf(Number),
		{
			if(
				(x > 20) && (x < 20000),
				{
					("reproducir tono a " ++ x.asString ++ " Hz").postln;
				},
				{
					(x.asString ++ " Hz fuera de rango").postln;
				}
			)
		},
		{
			"entrada inválida".postln;
		}
	)
};
);
~p9.value(5);
~p9.value("texto")
~p9.value(1000)
~p9.value(1000000)