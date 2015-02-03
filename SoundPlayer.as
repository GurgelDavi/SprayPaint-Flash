package
{
    import flash.events.Event;
    import flash.media.Sound;
    import flash.media.SoundChannel;
	//var spray:Sound = new spraySoundTwo();
    public class SoundPlayer
    {
        //[Embed(source="spraySound2.mp3")]
        
        private var s:Sound;
        private var ch:SoundChannel;
        public var isSoundPlaying:Boolean;
		public var isSoundPlayingFrom:Boolean;

        public function SoundPlayer(newSound:Sound)
        {
            s = newSound;
            //play();
        }

        public function play():void
        {
            if(!isSoundPlaying)
            {
                ch = s.play();
                ch.addEventListener(
                    Event.SOUND_COMPLETE,
                    handleSoundComplete);
                isSoundPlaying = true;
            }
        }
		
		public function playFrom(n:Number):void
        {
            if(!isSoundPlayingFrom)
            {
                ch = s.play(n);
                ch.addEventListener(
                    Event.SOUND_COMPLETE,
                    handleSoundFromComplete);
                isSoundPlayingFrom = true;
            }
        }
				

        public function stop():void
        {
            if(isSoundPlaying)
            {
                ch.stop();
                isSoundPlaying = false;
            }
        }
		

        private function handleSoundComplete(ev:Event):void
        {
            isSoundPlaying = false;
        }
		private function handleSoundFromComplete(ev:Event):void
        {
            isSoundPlayingFrom = false;
        }
    }
}