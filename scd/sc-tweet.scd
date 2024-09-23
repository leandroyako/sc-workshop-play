//tweet original
play{HPF.ar(({|k|({|i|SinOsc.ar(i/96,Saw.ar(2**(i+k))/Decay.ar(Impulse.ar(0.5**i/k),[k*i+1,k*i+1*2],3**k))}!6).product}!32).sum/2,40)}

//indentado
(
play{
	HPF.ar(
		(
			{
				|k|
				(
					{
						|i|
						SinOsc.ar(
							i/96,
							Saw.ar(
								2**(i+k)
							) / Decay.ar(
								    Impulse.ar( 0.5**i/k),
								    [ k*i+1, k*i+1*2 ],
								    3**k
							)
						);
					}!6
				).product
			}!32
		).sum/2,
		40
	)
}
)

//refactorizado
(
var phaseMod, osc, oscBank, sig, mix, filter;

phaseMod = { |i, k|
	var osc1, osc2;
	var trig, decayTime, amp;

	osc1 = Saw.ar(freq: 2**(i+k));
	trig = Impulse.ar(0.5**i/k);
	decayTime = [k*i+1, k*i+1*2];
	amp = 3**k;
	osc2 = Decay.ar(trig, decayTime, amp);

	osc1 / osc2;
};

osc = { |i, k|
	SinOsc.ar(
		freq: i/96,
		phase: phaseMod.value(i, k)
	);
};

oscBank = {	|k|
	{ |i|
		osc.value(i, k)
	}!6
};

sig = {
	{ |k|
		oscBank.value(k).product
	}!32
};

mix = {sig.value.sum/2};

filter = {
	HPF.ar(
		in: mix,
		freq: 40
	)
};

filter.play;
)