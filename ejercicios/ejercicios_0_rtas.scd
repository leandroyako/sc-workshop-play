// Ejercicios

( // 0
f = { arg num, mun;
	res = num + mun;  //variable "res" no está definida. 'var res = num + mun;'
	res;
};
)

( // 1
f = { arg num, mun;
	var res;
	res = num + mun;
	var res2;   //las variables se definen antes que las operaciones
	res2 = res * 2;
};
)

( // 2
f = { arg num mun; //falta ",": arg num, mun;
	var res;
	res = num - mun;
	res;
};
)

( // 3
f = { var num, mun;  //la función espera los argumentos antes que las variables: arg num, mun;
	arg res; //var res;
	res = num + mun;
};
)

( // 4
f = { arg num, mun;
	var res;
	res = num * mun //falta cerrar linea ";"
	res;
};
)

( // 5
f = { arg num1, mun2;
	var res;
	res = num1 / num2; //"num2" no existe, debería ser "mun2"
	res;
};
)

( // 6
f = { arg num1, num2;
	var res;
	res = num1 + num2;
	res;
}; //falta cerrar } la función
)

( // 7
f = { arg num1, num2 //falta cerrar línea. ";"
	var res;
	res = num1 + num2;
	res;
};
)

( // 8
f { arg num1, num2; //no se le está asignando nada a f. "f = {"
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
); // ) no cierra función. sería "};"
)

( // 10
f = { arg num1, num2;
	arg res; //los argumentos solo se declaran en la primera linea, luego declaran variables locales. "var res; var res2;" o "var res, res2";
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
	res2 = res * 2 }; // "}" está demás
    res2;
};//falta "};" cerrar función
)


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

