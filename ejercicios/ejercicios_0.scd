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