import flash.events.Event;
import flash.events.MouseEvent;
import fl.motion.MotionEvent;
import flash.display.BitmapData;
import flash.display.MovieClip;
import flash.geom.Rectangle;
import flash.net.FileReference;
import com.adobe.images.PNGEncoder;
import flash.utils.ByteArray;
import fl.motion.Color;
import flash.display.StageDisplayState;
import flash.media.Sound;
import flash.net.URLRequest;
import flash.net.Socket;
import SoundPlayer;

//root.addEventListener(Event.ENTER_FRAME , paint);
stage.addEventListener(MouseEvent.CLICK , paint);
//stage.addEventListener(Event.FULLSCREEN , fullScreenRedraw);
btnClear.addEventListener (MouseEvent.CLICK, clean);
btnSave.addEventListener (MouseEvent.CLICK , save);
//btnColor.addEventListener (MouseEvent.CLICK , rotateCol);

var spray:Sound = new spraySoundTwo();
var sp:Sound = new sprayLoop();
var spSound:SoundPlayer = new SoundPlayer(sp);
var sound:SoundPlayer = new SoundPlayer(spray);
var raio:Number = 20;
var colors = new Array ("0x000000","0xFFFFFF", //Preto, Branco
						"0x9384BE","0x04B497", //lilás , Verde
						"0xFAA61A","0xF15C22", //aMARELO ,lARANJA, 
						"0xC41329","0x00BAF2");//VerMELHO , AZUL
var drawPlane:MovieClip = new MovieClip();
addChild(drawPlane);
var color:Number = 0;

/*function rotateCol (e:MouseEvent):void {
	btnColor.rotation += 45;
	color++;
	if (color>7)
		color = 0;
	
}*/
function colorBlack (e:MouseEvent):void {
	color = 0;
}
btnBlack.addEventListener (MouseEvent.CLICK, colorBlack);
function colorWhite (e:MouseEvent):void {
	color = 1;
}
btnWhite.addEventListener (MouseEvent.CLICK, colorWhite);
function colorRed (e:MouseEvent):void {
	color = 6;
}
btnRed.addEventListener (MouseEvent.CLICK, colorRed);
function colorOrange (e:MouseEvent):void {
	color = 5;
}
btnOrange.addEventListener (MouseEvent.CLICK, colorOrange);
function colorYellow(e:MouseEvent):void {
	color = 4;
}
btnYellow.addEventListener (MouseEvent.CLICK, colorYellow);
function colorBlue (e:MouseEvent):void {
	color = 7;
}
btnBlue.addEventListener (MouseEvent.CLICK, colorBlue);
function colorPurple (e:MouseEvent):void {
	color = 2;
}
btnPurple.addEventListener (MouseEvent.CLICK, colorPurple);
function colorGreen (e:MouseEvent):void {
	color = 3;
}
btnGreen.addEventListener (MouseEvent.CLICK, colorGreen);
function clean(e:MouseEvent):void {
	MovieClip(drawPlane).graphics.clear();
	stage.displayState = StageDisplayState.FULL_SCREEN;
}

function save(e:MouseEvent):void {
	var post:BitmapData = 
			new BitmapData (stage.width,stage.height);
	var myEncoder:PNGEncoder = new PNGEncoder();
	var	picture:FileReference = new FileReference;
		post.draw(MovieClip(root),null,null,null, 
				  new Rectangle (0,0,
								 stage.width,stage.height)
								 );
	var byteArray:ByteArray = PNGEncoder.encode(post);
	var today = new Date();
	var minutes = today.getMinutes();
	var hours = today.getHours();
	var dat = today.getDate();
	var month = today.getMonth()+1;
	var year = today.getFullYear();
	var dayN = today.getDay();
		picture.save(byteArray ,(dayN+""+year+""+month+""+dat+""+minutes+""+hours+""+".png"+".png"));
}

function paintWall(e:Event):void {
	MovieClip(drawPlane).graphics.lineStyle(1, colors[0], 100);
}

function paint (e:Event):void {
	MovieClip(drawPlane).graphics.lineStyle(1, colors[color], 100);
	
	if (sound.isSoundPlaying )
	{
	spSound.play();
	//spSound.play();
	} else {
		sp.play();
	}
	for (var i=0; i<20; i++) {
		
		var y1 = Math.random()*2*raio-raio;
		var x1 = Math.sqrt(raio*raio-y1*y1);
		
		var x2 = Math.random()*x1-0;
		var y2 = Math.random()*y1-0;
				
		//MovieClip(root).graphics.moveTo(mouseX+x1, mouseY + y1);
		//MovieClip(root).graphics.lineTo(mouseX+1+x1, mouseY+1+y1);
		
		MovieClip(drawPlane).graphics.moveTo(mouseX+x2, mouseY + y2);
		MovieClip(drawPlane).graphics.lineTo(mouseX+1+x2, mouseY+1+y2);
		
		MovieClip(drawPlane).graphics.moveTo(mouseX-x2, mouseY - y2);
		MovieClip(drawPlane).graphics.lineTo(mouseX-1-x2, mouseY-1-y2);
		
		//MovieClip(root).graphics.moveTo(mouseX-x1, mouseY - y1);
		//MovieClip(root).graphics.lineTo(mouseX+1-x1, mouseY+1-y1);
		
	} 
}

/*
function fullScreenRedraw(event:FullScreenEvent):void 
{ 
    if (event.fullScreen) 
    { 
        //btnClear.x = stage.width;
		//btnClear.y = stage.height;
		
		//btnSave.x = 100;
		//btnSave.y = stage.height -100;
    } 
    else 
    { 
        btnClear.x = 1100;
		btnClear.y = 850;
		
		btnSave.x = 100;
		btnSave.y = 850;
    } 
} 
*/

