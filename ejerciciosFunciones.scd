// Ejercicios

/*
Recordar: Las letras minusculas de la "a" a la "z" son variables globales (ya fueron definidas por el entorno al iniciar sclang), la variable "s" esta reservada para manejar el servidor actual y no debe ser usada para hacer calculos.
*/


/*
Analizar la estructura del siguiente bloque de codigo.
Que es lo que se asigna a la variable f?
Cuantas variables hay?
Cuantos argumentos hay?
Que operaciones se realizan?
*/

(
f = { arg num1, num2;
	var res;
	res = num1 + num2;
	res;
};
)

/*
Que valores retornan las siguientes sentencias y por que?
Que son .class y .value?
*/

f.class;
f.value(3, 4);
f.value(8, 16);
f.value(1, 1);
f.value(10.2, 27.9);

/*
Que errores hay en los siguientes bloques de codigo y cual es la solucion?
Nota: Hay solo uno por bloque.
Nota: Si no puede verlos a simple vista ejecute el codigo y analice el mensaje de error.
Nota: Algunos pueden ser muy dificiles, no se quede en uno, siga adelante y vuelva despues.
*/

( // 0
f = { arg num, mun;
	res = num + mun;
	res;
};
)

( // 1
f = { arg num, mun;
	var res;
	res = num + mun;
	var res2;
	res2 = res * 2;
};
)

( // 2
f = { arg num mun;
	var res;
	res = num - mun;
	res;
};
)

( // 3
f = { var num, mun;
	arg res;
	res = num + mun;
};
)

( // 4
f = { arg num, mun;
	var res;
	res = num * mun
	res;
};
)

( // 5
f = { arg num1, mun2;
	var res;
	res = num1 / num2;
	res;
};
)

( // 6
f = { arg num1, num2;
	var res;
	res = num1 + num2;
	res;
)

( // 7
f = { arg num1, num2
	var res;
	res = num1 + num2;
	res;
};
)

( // 8
f { arg num1, num2;
	var res;
	var res2;
	res = num1 + num2;
	res2 = res * 2;
};
)

( // 9
f = { arg num1, num2;
	var res;
	res = num1 + num2;
	res;
)
)

( // 10
f = { arg num1, num2;
	arg res;
	arg res2;
	res = num1 + num2;
	res2 = res * 2;
	res2;
};
)

( // 11
f = { arg num1, num2;
	var res;
	var res2;
	res = num1 + num2;
	res2 = res * 2 };
res2;
)



/* 12
Escribir una funcion que realice las siguientes operaciones:
- reciba tres numeros
- realice la suma los tres numeros
- imprima el resultado en pantalla
- retorne el primer parametro
Nota: asignar la funcion a la variable global f para luego evaluarla
Nota: utilice variables para manejar los datos internamente
*/



/* 13
Escribir una funcion que retorne el intervalo (en semitonos) entre dos notas midi.
- las notas midi se pasan como parametros (argumentos).
- Utilice el metodo '.abs' para o btener el valor absoluto de su resultado.
Nota: los valores midi van de 0 a 127, 60 es el do central, 108 es la nota mas aguda del piano, 21 es su nota mas grave.
*/



/* 14
Escribir una funcion que retorne un valor midi pasado como argumento pero transpuesto una quinta justa descendente. Escriba esta funcion de manera tal que le sirva para transportar a otros intervalos en el futuro.
*/



/* 15
Escribir una funcion que retorne valores midi entre un minimo y un maximo,
el valor retornado deben ser distinto cada vez que se llama a la funcion.
Nota: Usar la funcion rrand(min, max) para generar los valores aleatorios.
- los valores minimo y maximo se pasan como parametros.
*/


/* 16
Modificar la funcion anterior de manera que:
- reciba un solo parametro, el rango
- genere los valores aleatorios dentro del rango especificado a partir de la nota midi 60 (do central).
*/


/******************** Respuestas ***********************/
//12
(
f = { arg num1, num2, num3;
	var res;
	res = num1 + num2 + num3;
	res.postln;
	num1;
};
)
f.value(1,2,3);

//13
(
f = { arg nota1, nota2;
	var res;
	res = nota1 - nota2;
	"El intervalo es de " ++ res.abs ++ " semitonos";
};
)
f.value(60,62);

/***variación: f averigua el nombre del intervalo ****/
(
f = { arg nota1, nota2;
	var res;
	res = nota1 - nota2;
	res = res.abs;
	"El intervalo es ".post;
	switch(res,
		0,{ "unísono" },
		1,{ "segunda menor" },
		2,{ "segunda mayor" },
		3,{ "tercera menor" },
		4,{ "tercera mayor" },
		5,{ "cuarta justa" },
		6,{ "cuarta aumentada" },
		7,{ "quinta justa" },
		8,{ "sexta menor" },
		9,{ "sexta mayor" },
		10,{ "séptima menor" },
		11,{ "séptima mayor" },
		12,{ "octava" },
		{
			if ( (res/12) >= 1 && (res%12) != 0,
				{
					var octava = "octava";
					if ((res/12) >= 2, {octava = "octavas"});
					(res/12).asInteger + octava + "+" + f.value(0, res%12)
				},
				{
					res/12.asInteger + "octavas"
				}
			);
	});
};
)
f.value(60,68);

//14
(
f = { arg nota, intervalo = 7, direccion = -1;
	var res;
	res = nota + (intervalo * direccion);
	"La nota traspuesta es " ++ res;
};
)
f.value(50); //transpone 5° justa descendente por defecto
f.value(50,2,1); //transponer tono ascendente

//15
(
f = { arg minimo = 20, maximo = 108;
	var res;
	res = rrand(minimo,maximo);
	res;
};
)
f.value;

//16
(
f = { arg rango = 20;
	var res, nota;
	nota = 60;
	res = rrand(nota-rango,nota+rango);
	res;
};
)
f.value

