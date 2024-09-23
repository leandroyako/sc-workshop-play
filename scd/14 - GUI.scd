/*
Introducción a la creación de interfaces gráficas de usuario (GUI) básicas en SuperCollider. Los puntos clave incluyen:

1. Creación de ventanas:
*/

w = Window.new;
w.front;
w.alwaysOnTop_(true);
//w.bounds = Rect(200, 200, 600, 300);

//2. Manejo de objetos GUI (usando Slider como ejemplo):

~slider = Slider(w, Rect(20,20,150,30));

//3. Obtener y establecer valores:

~slider.value;
~slider.value_(0.25);

//4. Definir acciones:
(
~slider.action_({
  arg obj;
  obj.value.postln;
});
)

//5. Personalización visual:

~slider.background_(Color(1,0.5,0));
~slider.knobColor_(Color.white);
~slider.thumbSize_(20);

//6. Ejemplo práctico - control de filtro:

(
SynthDef.new(\simplebpf, {
  arg freq=440;
  var sig;
  sig = PinkNoise.ar(1!2);
  sig = BPF.ar(sig, freq.lag(0.5), 0.2);
  Out.ar(0, sig);
}).add;
)

(
~slider.action_({
  arg obj;
  var cf;
  cf = obj.value.linexp(0,1,100,4000).postln;
  x.set(\freq, cf);
/*
	if(
		x.isPlaying,
		{x.set(\freq, cf)}
	);
*/
});
)

x = Synth(\simplebpf);

//7. Uso de botones:
(
~button = Button(w, Rect(430,20,50,30))
.states_([
  ["OFF", Color.black, Color.gray(0.8)],
  ["ON", Color.white, Color(0.2,0.75,0.95)]
])
.font_(Font("Helvetica", 18))
.action_({
  arg obj;
  if(
    obj.value == 1,
    {
			x = Synth(\simplebpf, [\freq, ~slider.value.linexp(0,1,100,4000)])//.register
		},
    { x.free }
  );
});
)

//w.view.children[0].remove

//8. Manejo de errores y uso de NodeWatcher:
/*
if(
  x.isPlaying,
  {x.set(\freq, cf)}
);
*/

//9. Ejemplo final con múltiples controles:

(
SynthDef.new(\simplebpf, {
  arg freq=440, rq=0.2;
  var sig;
  sig = PinkNoise.ar(1!2);
  sig = BPF.ar(
    sig,
    freq.lag(0.5),
    rq.lag(0.5),
    1/rq.sqrt.lag(0.5)
  );
  Out.ar(0, sig);
}).add;
)

/*
-Importancia de entender la clase View
-Uso apropiado de valueAction vs. value
-Cómo manejar múltiples controles GUI interactuando con un sintetizador.
*/

/*
10. Knobs y NumberBoxes:
-Cómo añadir un Knob y un NumberBox
-Cómo hacer que interactúen entre sí y con un Synth existente.
-Importancia de evitar bucles infinitos al conectar objetos GUI.
*/

//Agreguemos un Knob para controlar el ancho de banda del filtro.
(
SynthDef.new(\simplebpf, {
	arg freq=440, rq=0.2;
	var sig;
	sig = PinkNoise.ar(1!2);
	sig = BPF.ar(
		sig,
		freq.lag(0.5),
		rq.lag(0.5),
		1/rq.sqrt.lag(0.5)
	);
	Out.ar(0, sig);
}).add;
)


(
Window.closeAll;
w = Window("gui", Rect(750,50,500,200))
.front
.alwaysOnTop_(true);

~slider = Slider(w, Rect(20,20,150,30))
.background_(Color(0.2,0.75,0.95))
.action_({
	arg obj;
	var cf;
	cf = obj.value.linexp(0,1,100,4000).postln;
	if(
		x.isPlaying,
		{x.set(\freq, cf)}
	);
	~numberBox.value_(obj.value.linexp(0,1,100,4000));
});

~knob = Knob(w, Rect(180,20,30,30))
.action_({
	arg obj;
	var qual;
	qual = obj.value.linexp(0,1,1,100).reciprocal;
	if(
		x.isPlaying,
		{x.set(\rq, qual)}
	);
});

~button = Button(w, Rect(430,20,50,30))
.states_([
	["OFF", Color.black, Color.gray(0.8)],
	["ON", Color.white, Color(0.2,0.75,0.95)]
])
.font_(Font("Helvetica", 18))
.action_({
	arg obj;
	if(
		obj.value == 1,
		{
			x = Synth(
				\simplebpf,
				[
					\freq,
					~slider.value.linexp(0,1,100,4000),
					\rq,
					~knob.value.linexp(0,1,1,100).reciprocal
				]
		).register},
		{x.free}
	);
});
)

/*
12. StaticText:
Introducción del objeto StaticText para etiquetar otros objetos GUI.
-Propiedades principales como string, font, align, background y stringColor.
*/
(
~freqLabel = StaticText(w, Rect(20,60,80,20))
.string_("freq")
.font_(Font("Helvetica", 14))
.align_(\center)
.background_(Color.white) //remove these two later
.stringColor_(Color.red);
)
(
~numberBox = NumberBox(w, Rect(20,90,80,30))
.value_(100)
.clipLo_(100)
.clipHi_(4000)
.font_(Font("Helvetica", 16))
.decimals_(2)
.action_({
	arg obj;
	~slider.valueAction_(obj.value.explin(100,4000,0,1))
});
)

/*
13. Enfoque de objetos GUI:
Se explica cómo los objetos GUI pueden recibir el foco y las acciones de teclado asociadas a cada tipo de objeto.
Presionar c coloca al objeto en su posición central, x en su máximo, n en su mínimo, y r elige un valor aleatorio.
*/

/*
14. Otros objetos GUI comunes:
Se mencionan brevemente otros objetos GUI útiles como PopUpMenu, RangeSlider, TextField, TextView, Slider2D, MultiSliderView, SoundFileView y LevelIndicator.
*/

//PopUpMenu proporciona una lista desplegable de elementos
(
~obj.remove;
~obj = PopUpMenu(w, Rect(20,120,120,30))
.items_(["", "one", "two", "three"])
)

//RangeSlider es similar a Slider pero en lugar de un valor, tiene un valor mínimo y máximo que son independientes entre sí.
(
~obj.remove;
~obj = RangeSlider(w, Rect(20,120,120,30))
)

//TextField es un cuadro de entrada de texto de una línea
(
~obj.remove;
~obj = TextField(w, Rect(20,120,120,30))
)

//TextView es similar, pero permite múltiples líneas de texto
(
~obj.remove;
~obj = TextView(w, Rect(20,120,120,80))
)

(
~obj.remove;
~obj = Slider2D(w, Rect(20,120,120,80))
)

(
~obj.remove;
~obj = MultiSliderView(w, Rect(20,120,120,80))
.size_(9)
)

/*
15. Flujo de trabajo y eficiencia:
Se discute la dificultad de diseñar interfaces en SuperCollider comparado con otros entornos, y se sugieren estrategias para mejorar la eficiencia, como planificar en papel cuadriculado y usar Window.closeAll para evitar la acumulación de ventanas.
*/
/*
16. Decoradores y FlowLayout:
Se introduce el concepto de decoradores, específicamente FlowLayout, para organizar automáticamente los objetos GUI en una ventana.
*/
(
Window.closeAll;
w = Window.new("flow", Rect(850,50,400,400))
.front
.alwaysOnTop_(true);

w.view.decorator_(FlowLayout(w.bounds, 15@15, 7@7));
)

Knob(w, 40@40);
Knob(w, 80@80);
w.view.decorator.nextLine;
20.do{Knob(w,40@40)};
w.view.children.collect(_.value_(rrand(0.0,1.0)));
w.view.children.do(_.remove)
w.view.decorator.reset;

/*
17. Vistas anidadas y CompositeView:
Cómo usar CompositeView para crear jerarquías más significativas en el diseño de la interfaz, permitiendo agrupar objetos GUI relacionados.
*/

(
Window.closeAll;
w = Window.new("nested views", Rect(750,50,500,500))
.front
.alwaysOnTop_(true);

w.view.decorator_(FlowLayout(w.bounds, 30@30, 30@30));

c = Array.fill(4, {
	arg view;
	view = CompositeView(w, 200@200)
	.background_(Color.rand);
	view.decorator_(FlowLayout(view.bounds,5@5,5@5));
});

Array.fill(5, {Slider(c[0], 30@150)});
Array.fill(8, {Knob(c[1], 40@40)});
)

c[0].children[2].value_(0.5);

c[1].children.collect(_.value_(0.75));

/*
Podrías querer intentar agregar más objetos a las vistas compuestas en la mitad inferior de la ventana. Y también, podrías preferir usar otro tipo de clase de colección, como Dictionary, en caso de que quieras referirte a objetos GUI por un nombre simbólico en lugar de un índice entero ordenado.
*/