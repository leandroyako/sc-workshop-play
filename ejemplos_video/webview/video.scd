//basado en https://github.com/yotamorimoto/sclab
(
~bounds = 640@640;
//~bounds = 3840@2160;
w = Window(nil, ~bounds);
v = WebView(w, ~bounds);
v.url = thisProcess.nowExecutingPath.dirname +/+ "index.html";
CmdPeriod.doOnce { w.close };
w.onClose = { k.stop; b.free };
w.front;
w.background = Color(0,0,0,1);
v.pageBackgroundColor = Color(0,0,0,1);
//w.fullScreen;
)


// passing a nested object from javascript to sclang:
v.runJavaScript("document.getElementById('video')"){ |res| res.postln }

v.runJavaScript("JSON.stringify({a: video.play(); b: console()})"){ |res| res.parseJSON.postln }

v.runJavaScript("JSON.stringify({list})"){ |res| res.parseJSON.postln }

v.runJavaScript("JSON.stringify({video: video.src})"){ |res| res.parseJSON.postln }

v.runJavaScript("video.src = list[4]"){ |res| res.postln }


v.onJavaScriptMsg = {|res| res.postln}

v.runJavaScript("video.play()"){ |res| res.postln }
v.runJavaScript("video.playbackRate = 1"){ |res| res.postln }
v.runJavaScript("video.loop = true"){ |res| res.postln }
v.runJavaScript("video.currentTime = 0"){ |res| res.postln }

v.runJavaScript("video.style.opacity = 1");

(
~fade = { |dur = 2, initVal = 1, endVal = 0|
	Routine{
		var currentVal, increment, waitTime, steps;

		steps = 30 * dur;
		currentVal = 0;
		increment = (endVal-initVal)/steps;
		waitTime = 0;
		currentVal = initVal;
		waitTime = dur/steps;

		steps.do({
			v.runJavaScript("video.style.opacity =" ++ currentVal);
			currentVal = currentVal + increment;
			waitTime.wait;
		});
	}.play(clock: AppClock);
}
)

~fade.value(dur: 3, initVal: 1, endVal: 0)

//Unsupported
//v.runJavaScript("video.seekable.start(0)"){ |res| res.postln }
//v.runJavaScript("video.seekable.end(0)"){ |res| res.postln }
//v.runJavaScript("video.seeking"){ |res| res.postln }
//v.runJavaScript("video.controls = true"){ |res| res.postln }
//v.runJavaScript("video.controlller"){ |res| res.postln }

v.reload;