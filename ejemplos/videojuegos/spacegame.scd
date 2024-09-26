(
s = Server.local;
s.options.sampleRate_(44100);
s.newBusAllocators;
s.waitForBoot({
	var win = Window.new("", Window.screenBounds, false).fullScreen
	.front
	.onClose_({CmdPeriod.run;})
	.background_(Color.blue(0.1));
	var winW = win.view.bounds.width, winH = win.view.bounds.height, hudH=50, hud, hudRect = Rect(0, winH-hudH, winW, hudH);

	var keycodes = Platform.case(
		//<-, ->, ↓, ↑
		\osx, {[123,124,125,126,49]},
		\linux, {[65361,65363,65364,65362,32]},
		\windows, {[37,39,40,38,32]}
	);

	var alienLaserArray = Array.newClear;

	//colors

	var spriteSize=36, radius = spriteSize/2;

	var enemyArray = [Rect.aboutPoint(win.view.bounds.width.rand@0,radius, radius)], explosions = Array.newClear;

	var numLives=3;

	var sqrtHalfPi = sqrt(pi/2);
	
	var level = 1;

	var score = 0;


	//more vars

	var laserHitBox = Array(40), canFire=true, playerState=\alive;

	var starSpeed = 20;

	var playerSpeed = 6, enemySpeed = 4;

	var laserArray = Array(40);

	var laserSpeed = playerSpeed*4, laserLen = spriteSize/2.4, alienLaserSpeed=(laserSpeed-enemySpeed)*0.75;

	var enemyX = win.view.bounds.width.rand, enemyY=0, enemyRectArray;

	var cannonWidth = spriteSize/12, cannonLength=0.6*spriteSize;

	var livesView, levelView, scoreView;

	var collision;

			//draw stars
	var starArray = 500.collect({
		x = winW.rand;
		z = winH.rand;
		r = exprand(0.3,2.0);
		[[x,z,r],[x,(win.view.bounds.height.neg+z),r]];
	}).flatten(1);

	var starY = 0;

	var board = UserView(win, Rect(0, 0, win.view.bounds.width, hudRect.top))
	.animate_(true)
	.frameRate_(15)
	.drawFunc_({
		starY = (starY+1).wrap(0,hudRect.top);
		Pen.translate(0, starY);
		Pen.use({
			starArray.do({
				arg item;
				Pen.addOval(Rect(
					item.at(0), item.at(1),
					item.at(2), item.at(2)
				)
				)
				.color_([Color.grey(exprand(0.8,1.0)), Color.white].wchoose([0.1,0.8]))
				.fill;
			});
		});
	});

	var playerX=board.bounds.width/2-(spriteSize/2), playerY=board.bounds.height-(spriteSize*2), playerDir = Set(1), playerRect=Rect(playerX, playerY, spriteSize, spriteSize);


	~flashAlpha = 0.0;
	~flashSize = 0;
	~fireDelay = 0.25;

	~frameRate = 30;

	//sounds

	~lfoBus = Bus.control(s,1);
	~revIn = Bus.audio(s,1);

	s.sync;


	SynthDef(\engine, {
		arg freq=90, amp=0.5, gate=1, pan=0.5, filtFreq=1500, in=0, out=0;
		var sig, env, detune, pitch, width, noise;
		detune = 3.collect({0.5.rand2.midiratio});
		width = LFNoise1.ar(LFNoise0.ar.range(1.0,4.0)).range(0.01,0.99);
		pitch = freq*detune;
		noise = WhiteNoise.ar(0.18);
		noise = RLPF.ar(noise, 2000, 0.8);
		sig = LFPulse.ar(pitch, 0, width, 1/6);
		env = EnvGen.ar(Env.asr, gate, doneAction:2);
		sig = HPF.ar(sig, 500);
		sig = Mix.ar(sig);
		sig = Mix.ar([sig, noise]);
		sig = BPF.ar(sig, LFNoise1.ar(2).range(800,1000));
		sig = RLPF.ar(sig, 500, 0.5);
		sig = sig*amp*env;
		// sig = LeakDC.ar(sig);
		sig = Pan2.ar(sig, pan);
		Out.ar(out, sig);
	}).add;

	SynthDef(\pow, {
		arg freq1=2000, freq2=20, dur=0.3, pan=0.5, gate=1, amp = 0.5, out=0;
		var sig, env, line;
		line = XLine.ar(freq1,freq2,dur);
		sig =
		4.collect({
			arg i;
			LFPulse.ar((line*(1.rand2).midiratio), 0)/2
		});
		sig = Mix.ar(sig).fold(-1.0,1.0);
		env = EnvGen.ar(Env.perc(0.01,dur*2), gate, doneAction:2);
		sig = BPF.ar(sig);
		sig = (sig * amp * env);
		sig = Pan2.ar(sig, pan);
		Out.ar(out, sig);
	}).add;



	SynthDef(\explosion, {
		arg amp=0.6, pan=0, freq=30, noiseAmp=0.16, noiseAmp2=0.5, lpfFreq=1748, hpfFreq=40, dur=3, out=0;
		var sig, env, noise, fold;
		noise = Mix.ar([ClipNoise.ar(noiseAmp), BrownNoise.ar(noiseAmp2)]);
		sig = 7.collect({
			LFPulse.ar(LFNoise1.ar.range(21.0,35.0), 1.0.rand, LFNoise1.ar(1).range(0.01,0.99));
		});
		fold = EnvGen.ar(Env([0.1,0.8],[0.4],-4.0.rand));
		sig = Splay.ar(sig);
		sig = Mix.ar([sig,noise]);
		sig = sig.fold(fold.neg,fold);
		sig = sig.round(2.pow(-4.rand));
		env = EnvGen.ar(Env.perc(0.001,dur), doneAction:2);
		sig = sig.clip(-1,1);
		sig = CombL.ar(sig, 0.2, 0.2, 1.0);
		sig = sig*env*amp;
		sig = LPF.ar(sig, lpfFreq);
		sig = HPF.ar(sig, hpfFreq);
		sig = LeakDC.ar(sig);
		sig = Pan2.ar(sig, pan);
		Out.ar(out, sig);
	}).add;

	SynthDef(\alien, {
		arg amp=1, pan=0, freq=60, detun=0.5, fFreqLo=20, fFreqHi=1500, dur=5, depth=0, out=0;
		var sig, env, filtMod, lfo;
		filtMod = In.kr(~lfoBus).exprange(fFreqLo, fFreqHi);

		env = EnvGen.ar(Env([0,1,0], [0,dur,0]), doneAction:2);
		sig = 7.collect({
			LFSaw.ar(freq*rand2(detun).midiratio, 4.0.rand);
		});
		sig = Mix.ar(sig/sig.size);
		sig = RLPF.ar(sig, filtMod, 0.3);
		sig = Pan2.ar(sig, pan);
		sig = sig * amp * env;
		Out.ar(out, sig);
	}).add;


	//borrowed from Designing Sound in SuperCollider

	SynthDef(\red, {

		arg amp = 0.05;

	var env, redAlert, dfbe, aIn, bIn, cIn, aOut, bOut, cOut;

	# aIn, bIn, cIn = LocalIn.ar(7).clumps([5,1,1]);

	env = [EnvGen.ar(Env.new([0,1,1,0], [0.9, 0.3, 0.0]), doneAction:2), EnvGen.ar(Env.new([0,1,1,0], [0.01, 0.88, 0.01]))];
	env[0] = LFSaw.ar(env[0].sqrt * 487 + 360, 1, 0.5, 0.5);
	env[0] = (env[0] - 0.5) + ((env[0] * 2 * 2pi).cos * 0.3);
	redAlert = (env[0] - OnePole.ar(env[0], exp(-2pi * (1 * SampleDur.ir)))) * env[1];
	redAlert = redAlert + (cIn * 0.006) * 0.2;


	dfbe = 0!6;
	redAlert = redAlert + (aIn * 0.7);
	5.do{|i| dfbe[i] = DelayN.ar(redAlert[i], 0.1, [0.015, 0.022, 0.035, 0.024, 0.011][i])};
	aOut = dfbe[0..4];

	redAlert = redAlert[0..4].sum;
	redAlert = (redAlert - OnePole.ar(redAlert, exp(-2pi * (12 * SampleDur.ir))));

	dfbe[5] = redAlert + (bIn * 0.7);
	dfbe[5] = DelayN.ar(dfbe[5], 0.1, 0.061);
	# bOut, cOut = dfbe[5]!2;
	LocalOut.ar(aOut ++ bOut ++ cOut);

	redAlert = Clip.ar(redAlert * 4, -1, 1);
	redAlert = BPF.ar(redAlert, [740, 1400, 1500, 1600], (12!4).reciprocal) ++ (redAlert * 0.5);
	Out.ar(0, (redAlert.sum * amp)!2);

}).add;

SynthDef(\laser2, {
		arg freq1=3154, freq2=16, dur=0.3, pan=0, gate=1, amp = 0.3, out=0;
		var sig, env, line;
		line = XLine.ar(freq1,freq2,dur);
		sig =
		10.collect({
			arg i;
		LFSaw.ar((line*(1.rand2).midiratio), 0, SinOsc.ar(400).range(0,1))/5
		});
		sig = Mix.ar(sig).fold(-1.0,1.0);
		env = EnvGen.ar(Env.perc(0.01,dur*2), gate, doneAction:2);
		sig = BPF.ar(sig);
		sig = (sig * amp * env);
		sig = Pan2.ar(sig, pan);
		Out.ar(out, sig);
	}).add;

	// SynthDef(\verb, {
	// 	arg in=~revIn, out=0, mix=0.33, room=0.5, damp=0.5;
	// 	var sig;
	// 	sig = In.ar(~revIn);
	// 	sig = FreeVerb.ar(sig, mix, room, damp);
	// 	Out.ar(out, sig);
	// }).add;

	SynthDef(\lfo, {
		arg cpm = 440, out=~lfoBus;
		var freq = cpm/60, sig;
		sig = LFTri.kr(freq);
		Out.kr(~lfoBus, sig);
	}).add;


	s.sync;

	Synth(\lfo);

	~alienSynth = {Synth(\alien, [\dur, 2, \amp, 0.125, \pan, x.linlin(radius, winW-radius, -1.0, 1.0)])};

	~explosionSynth = {Synth(\explosion, [\amp, 0.3])};


	//////////////////////////Sound Functions


	~engineSynth = Synth(\engine);

	~laserSynth = {Synth(\pow, [\pan, playerX.linlin(0, win.view.bounds.width,-0.9,0.9)]);};




	//////////////////////////Drawing Functions




	~playerDraw = {
		var cockpitH = spriteSize/3, cockpitW = spriteSize/7;
		var numLines = 4;
		var propulsionSize = rrand(15.0,20.0);
		var delta=rrand(0.1, 0.3)*spriteSize/6, height = exprand(0.4,(1/4))*spriteSize, tip = radius+rand2(delta/2)@(spriteSize+height);
		playerRect=Rect(playerX, playerY, spriteSize, spriteSize);
		//movement
		playerDir.do({
			arg item;
			case
			{item == (\left)} {playerX=playerX-playerSpeed}
			{item == (\right)} {playerX=playerX+playerSpeed}
			{item == (\down)} {playerY=playerY+playerSpeed}
			{item == (\up)} {playerY=playerY-playerSpeed};
		});
		playerY=playerY.clip(0, board.bounds.height-spriteSize);
		playerX=playerX.clip(0, board.bounds.width-spriteSize);
		Pen.translate(playerX, playerY);

		//draw

		//propulsion
		Pen.use({
			Pen
			.moveTo((radius)-(spriteSize/15) @ (spriteSize))
			.quadCurveTo((radius)+(spriteSize/15) @ (spriteSize), (tip.x) @ (tip.y*sqrtHalfPi))
			.lineTo((radius)-(spriteSize/15) @ (spriteSize))
			.fillAxialGradient((radius) @ (spriteSize), (spriteSize/2) @ (tip.y), Color.cyan(1,1.0), Color.cyan(1.0,0));

			Pen
			.addOval(Rect.aboutPoint(radius @ (spriteSize), spriteSize/propulsionSize, spriteSize/propulsionSize)).color_(Color.cyan).fill;
		});

		2.do{
			arg i;
			Pen
			.moveTo(radius + [delta.neg, delta].at(i) @ spriteSize)
			.quadCurveTo(tip, radius + [delta.neg, delta].at(i) @ (spriteSize+delta.rand))
			.lineTo(radius + [delta, delta.neg].at(i)@spriteSize)
			.fillAxialGradient(tip, radius @ (spriteSize-delta), Color.blue, Color.cyan(1.5))
		};
		Pen.addOval(Rect.aboutPoint(radius@spriteSize, delta, delta)).fillAxialGradient(tip, radius @ (spriteSize-delta), Color.cyan, Color.white);
		Pen.use({

			//cannons
			2.do({
				arg i;
				Pen
				.line(((i*spriteSize)+[(cannonWidth/2),(cannonWidth/2).neg].at(i))  @ spriteSize, ((i*spriteSize)+[(cannonWidth/2),(cannonWidth/2).neg].at(i)) @ (cannonLength))
				.strokeColor_(Color.grey)
				.width_(cannonWidth)
				.stroke
			});

			//wings

			Pen.use({
				2.do({
					arg i;
					var ratio = (5/8);
					Pen
					.moveTo(spriteSize/2 @ (0.875*spriteSize))
					.lineTo(i*spriteSize @ spriteSize)
					.lineTo(i*spriteSize @ (15*spriteSize/16))
					.quadCurveTo(spriteSize/2 @ (spriteSize/4.neg), spriteSize/2 @ (spriteSize*ratio))
					.fillColor_(Color.grey(0.3))
					.fill
				});

				//decor
				numLines.do({
					arg i;
					Pen
					.line(spriteSize/numLines*(i+0.5) @ spriteSize, spriteSize/numLines*(i+0.5) @ (7*spriteSize/10))
					.strokeColor_(Color.grey)
					.width_(spriteSize/18)
					.stroke
				});
			});

			~flashAlpha = ~flashAlpha - (0.1);


			//cannon flash
			2.do({
				arg i;
				~flashSize = exprand(spriteSize/12.0, spriteSize/24.0);
				Pen
				.addOval(~flashRect = Rect.aboutPoint(((i*spriteSize)+[(cannonWidth/2),(cannonWidth/2).neg].at(i))@((0.6*spriteSize)-(~flashSize)), ~flashSize, ~flashSize*1.5) )
				.color_(Color.cyan(1.8, ~flashAlpha))
				.fillAxialGradient(((i*spriteSize)+[(cannonWidth/2),(cannonWidth/2).neg].at(i))@(cannonLength), ((i*spriteSize)+[(cannonWidth/2),(cannonWidth/2).neg].at(i))@(cannonLength-(~flashSize*2)),Color.white.alpha_(~flashAlpha), Color.cyan(1,0.5*~flashAlpha));
			});

			Pen.use({

				//body
				2.do({
					arg i;
					Pen
					.moveTo((spriteSize/2) @ 0)
					.quadCurveTo(spriteSize/2 @ (spriteSize), spriteSize/4+(i*spriteSize/2) @ (spriteSize/2))
					.width_(spriteSize/36)
					.fillAxialGradient(spriteSize/2 @ 0, spriteSize/2 @ spriteSize, Color.grey(0.6), Color.grey(0.3))
				});

				//jet

				Pen
				.addRoundedRect(~jetRect = Rect.aboutPoint(spriteSize/2 @ (0.9*spriteSize), spriteSize/15, spriteSize/8), ~jetRect.width/2, ~jetRect.height/4)
				.fillAxialGradient(~jetRect.left@(~jetRect.height/2), ~jetRect.right@(~jetRect.height/2), Color.grey(0.7), Color.grey(0.5));


				//cockpit
				Pen.addOval(Rect(spriteSize-cockpitW/2, (0.4*spriteSize), cockpitW, cockpitH))
				.fillAxialGradient(spriteSize-cockpitW/2 @ (4*spriteSize/10), spriteSize-(cockpitW/2+cockpitW) @ ((4*spriteSize/10)+cockpitH), Color.white, Color.cyan(0.5))
				.strokeColor_(Color.grey(0.7))
				.width_(2)
				.stroke;
			});
		});
	};
















	~playerExplodeDraw = {
		playerRect.do{
			arg inval;
			50.do{
				var delta = spriteSize.rand;
				var rect = Rect.aboutPoint(inval.center, delta, delta);
				var
				topLeft = rrand(rect.left, rect.center.x) @ rrand(rect.top, rect.center.y),
				topRight = rrand(rect.right, rect.center.x) @ rrand(rect.top, rect.center.y),
				bottomRight = rrand(rect.right, rect.center.x) @ rrand(rect.bottom, rect.center.y),
				bottomLeft = rrand(rect.left, rect.center.x) @ rrand(rect.bottom, rect.center.y);
				Pen.moveTo(topLeft)
				.quadCurveTo(topRight, rect.center)
				.quadCurveTo(bottomRight, rect.center)
				.quadCurveTo(bottomLeft, rect.center)
				.quadCurveTo(topLeft, rect.center)
				.fillRadialGradient(rect.center, rect.center, 1, spriteSize/2, Color.red, Color.yellow);
			};
		};
	};



/////////////////////////////Views

	hud = UserView(win, hudRect)
	.background_(Color.grey(0.9))
	.drawFunc_{
		var bounds = Rect(0,0,hudRect.width, hudRect.height);
		Pen.addRect(bounds)
		.fillAxialGradient(
			bounds.center.x@(bounds.height*0.8),
			bounds.center.x@(bounds.bottom),
			Color.clear,
			Color.black
		)
	};

	scoreView = StaticText(hud, Rect(0,0,hud.bounds.width,hud.bounds.height))
	.string_("Score: "++score).font_(Font("Futura", 18)).stringColor_(Color.black).align_(\center);

	livesView = UserView(hud, Rect(hud.bounds.height/10, hud.bounds.height/10, 3.2*hud.bounds.height, 0.8*hud.bounds.height))
	.drawFunc_{
		numLives.do{
			arg i;
			var rect = Rect(0, 0, 0.8*livesView.bounds.height, 0.8*livesView.bounds.height);
		var cockpitH = rect.width/3, cockpitW = rect.width/7;
		var numLines = 4;

			Pen.translate(livesView.bounds.height, 0);

		//movement

		//draw

			//cannons
			2.do({
				arg i;
				Pen
				.line(((i*rect.width)+[(cannonWidth/2),(cannonWidth/2).neg].at(i))  @ rect.width, ((i*rect.width)+[(cannonWidth/2),(cannonWidth/2).neg].at(i)) @ (0.6*rect.height))
				.strokeColor_(Color.grey)
				.width_(cannonWidth)
				.stroke
			});

			//wings

			Pen.use({
				2.do({
					arg i;
					var ratio = (5/8);
					Pen
					.moveTo(rect.width/2 @ (0.875*rect.width))
					.lineTo(i*rect.width @ rect.width)
					.lineTo(i*rect.width @ (15*rect.width/16))
					.quadCurveTo(rect.width/2 @ (rect.width/4.neg), rect.width/2 @ (rect.width*ratio))
					.fillColor_(Color.grey(0.3))
					.fill
				});

				//decor
				numLines.do({
					arg i;
					Pen
					.line(rect.width/numLines*(i+0.5) @ rect.width, rect.width/numLines*(i+0.5) @ (7*rect.width/10))
					.strokeColor_(Color.grey)
					.width_(rect.width/18)
					.stroke
				});
			});

			Pen.use({

				//body
				2.do({
					arg i;
					Pen
					.moveTo((rect.width/2) @ 0)
					.quadCurveTo(rect.width/2 @ (rect.width), rect.width/4+(i*rect.width/2) @ (rect.width/2))
					.width_(rect.width/36)
					.fillAxialGradient(rect.width/2 @ 0, rect.width/2 @ rect.width, Color.grey(0.6), Color.grey(0.3))
				});

				//jet

				Pen
				.addRoundedRect(~jetRect = Rect.aboutPoint(rect.width/2 @ (0.9*rect.width), rect.width/15, rect.width/8), ~jetRect.width/2, ~jetRect.height/4)
				.fillAxialGradient(~jetRect.left@(~jetRect.height/2), ~jetRect.right@(~jetRect.height/2), Color.grey(0.7), Color.grey(0.5));


				//cockpit
				Pen.addOval(Rect(rect.width-cockpitW/2, (0.4*rect.width), cockpitW, cockpitH))
				.fillAxialGradient(rect.width-cockpitW/2 @ (4*rect.width/10), rect.width-(cockpitW/2+cockpitW) @ ((4*rect.width/10)+cockpitH), Color.white, Color.cyan(0.5))
				.strokeColor_(Color.grey(0.7))
				.width_(2)
				.stroke;
			});
		};
			};

	fork{loop{k = enemyArray.choose; alienLaserArray = alienLaserArray.add(k); Synth(\laser2, [\pan, k.left.linlin(radius, winW-spriteSize, -1, 1)]); rrand(1.0,0.2).wait;}};


	~laserView = UserView.new(board, win.view.bounds)
	.animate_(true)
	.drawFunc_({
		var collisions;
		alienLaserArray = alienLaserArray.select({
				arg rect;
				board.bounds.intersects(rect);
			});
		laserArray = laserArray.select({
			arg rect;
			board.bounds.intersects(rect);
		});
		collisions=laserArray.collect{
			arg inval;
			enemyArray.select({
				arg enemy;
				enemy.intersects(inval)
			});
		}.flat;
		if (collisions.isEmpty.not, {explosions = explosions.add(collisions).flat; score = score+25; scoreView.string_("Score: "++score); scoreView.refresh; Synth(\explosion); enemyArray.removeEvery(collisions);});
		laserArray.do{
			arg inval;
			2.do({
				arg i;
				Pen.line([inval.right-(cannonWidth/2) @ inval.center.y, inval.left+(cannonWidth/2) @ inval.center.y].at(i), [inval.right-(cannonWidth/2) @ (inval.center.y-laserLen), inval.left+(cannonWidth/2) @ (inval.center.y-laserLen)].at(i));
			});
			Pen.width_(cannonWidth).capStyle_(1).color_(Color.cyan).stroke;
		};
		laserArray.collectInPlace({
			arg rect;
			rect.moveBy(0, laserSpeed.neg)
		});

		alienLaserArray.do{
				arg inval;
			2.do({
				arg i;
				Pen.line([inval.right-(cannonWidth/2) @ inval.center.y, inval.left+(cannonWidth/2) @ inval.center.y].at(i), [inval.right-(cannonWidth/2) @ (inval.center.y-laserLen), inval.left+(cannonWidth/2) @ (inval.center.y-laserLen)].at(i));
			});
				Pen.width_(cannonWidth).capStyle_(1).color_(Color.red).stroke;
		};
		alienLaserArray=alienLaserArray.collect({
				arg i;
				i.moveBy(0, alienLaserSpeed)
					});
	});


	~playerSprite = UserView(board, win.view.bounds)
	.animate_(true)
	.drawFunc_{~playerDraw.value};

	~rot=0;
	~rotationSpeed = 30;
	~enemySpriteFx = {loop{~rot = ~rot + ~rotationSpeed; (1/30).wait;}}.fork;

	~enemySprites = UserView(board, win.view.bounds)
	.animate_(true)
	.drawFunc_({

		enemyArray = enemyArray.collectInPlace({
			arg inval;
			inval.moveBy(0, enemySpeed);
		});

		enemyArray = enemyArray.select({
			arg inval;
			board.bounds.intersects(inval);
		});

		enemyArray.do{
			arg inval;
			var num = 12, cockpit = Rect.aboutPoint(inval.center, radius/2, radius/2);
			Pen.color_(Color.grey);
			num.do{
				arg i;
				var outer = rrand(radius, cockpit.height/2), inner = rrand(outer, cockpit.height/2);
				Pen.addAnnularWedge(inval.center, inner, outer, ((360/num)*i+~rot).degrad, (360/num).degrad)
				.color_(Color.red).fill;
			};
			Pen.addWedge_Deg(inval.center, radius, 315, 270).color_(Color.grey(0.5)).fill;
			Pen.addOval(cockpit).fillRadialGradient(cockpit.rightTop, cockpit.center, cockpit.height/2, cockpit.height, Color.grey(0.9), Color.grey(0.1));
		};
		explosions.do{
			arg inval;
			50.do{
				var delta = spriteSize.rand;
				var rect = Rect.aboutPoint(inval.center, delta, delta);
				var
				topLeft = rrand(rect.left, rect.center.x) @ rrand(rect.top, rect.center.y),
				topRight = rrand(rect.right, rect.center.x) @ rrand(rect.top, rect.center.y),
				bottomRight = rrand(rect.right, rect.center.x) @ rrand(rect.bottom, rect.center.y),
				bottomLeft = rrand(rect.left, rect.center.x) @ rrand(rect.bottom, rect.center.y);
				Pen.moveTo(topLeft)
				.quadCurveTo(topRight, rect.center)
				.quadCurveTo(bottomRight, rect.center)
				.quadCurveTo(bottomLeft, rect.center)
				.quadCurveTo(topLeft, rect.center)
				.fillRadialGradient(rect.center, rect.center, 1, spriteSize/2, Color.red, Color.yellow);
			};
		};
	});


	~fireFunc = {
		{canFire = false;
			~laserSynth.value;
			laserArray = laserArray.add(Rect.fromPoints(playerX @ (playerY-laserLen+cannonLength), playerX+spriteSize @ (playerY+spriteSize)));
			~flashSize = (spriteSize/24.0);
			~flashAlpha = 1.0;
			0.2.wait;
			canFire=true;
		}.fork(AppClock)
	};

	View.globalKeyDownAction_({
		arg view, char, mod, uni, keycode;
		case
		{keycode == keycodes[0]} {playerDir.add(\left);}
		{keycode == keycodes[1]} {playerDir.add(\right);}
		{keycode == keycodes[2]} {playerDir.add(\down);}
		{keycode == keycodes[3]} {playerDir.add(\up);}
		{keycode == keycodes[4] && canFire==true} {~fireFunc.value}
		// {mod.isShift} {playerSpeed = 16}
		{uni == 27} {win.close};
	});
	View.globalKeyUpAction_({
		arg view, char, mod, uni, keycode;
		case
		{keycode == keycodes[0]} {playerDir.remove(\left);}
		{keycode == keycodes[1]} {playerDir.remove(\right);}
		{keycode == keycodes[2]} {playerDir.remove(\down);}
		{keycode == keycodes[3]} {playerDir.remove(\up);}
		{keycode == keycodes[4]} {}
	});

	~enemySpawn = fork {
		loop { var x = rrand(winW-spriteSize, spriteSize);
			enemyArray = enemyArray.add(Rect.aboutPoint(x@0,radius, radius));
			~alienSynth.value;
			rrand(2.0,0.5).wait;
		}
	};

	~explosionClear = {if (explosions.isEmpty.not, {0.2.wait; explosions.removeAt(0)})};

	~playerDeath =
	{
		~playerSprite.drawFunc_(~playerExplodeDraw);
		numLives = numLives - 1;
		0.2.wait;
		livesView.refresh;


		case
		{numLives == 1.neg} {~playerSprite.remove;
			playerRect = Rect(-1000,-1000,0,0);
			View.globalKeyDownAction_{arg view, char, mod, uni, keycode;
		case {uni == 27} {win.close};};
			View.globalKeyUpAction_{nil};
			g = UserView(board, win.view.bounds)
			.background_(Color.red(1.0,0.2));
			StaticText(g, g.bounds).font_(Font("Futura", 30)).align_(\center).stringColor_(Color.white).string_("GAME OVER");
		}

		{numLives >= 0} {
			if (numLives == 0, {Synth(\red)});
			playerX=board.bounds.width/2-(spriteSize/2);
			playerY=board.bounds.height-(spriteSize*2);
		playerRect=Rect(playerX, playerY, spriteSize, spriteSize);
		~playerSprite.drawFunc_(~playerDraw);
		1.wait;
			playerState=\alive;}
	};


	~playerCollisionTest =
	fork{
		loop{
			c = (enemyArray++alienLaserArray).collect{
				arg hazard;
				hazard.intersects(playerRect);
			};
			~explosionClear.value;
			if (c.includesEqual(true) && playerState==\alive, {playerState=\dead; ~explosionSynth.value; ~playerDeath.fork(AppClock)});
			(1/60).wait;
		}
	};


	win.refresh;
});
)
)
