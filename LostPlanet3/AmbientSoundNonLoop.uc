class AmbientSoundNonLoop extends AmbientSoundSimple
    placeable
    hidecategories(AnimDependency,Navigation,Audio)
    autoexpandcategories(Audio,AmbientSoundSimple);

defaultproperties
{
    // Reference: SoundCue'Default__AmbientSoundNonLoop.SoundCue0'
    begin object name=SoundCue0
    end object
    SoundCueInstance=SoundCue0
    // Reference: SoundNodeAmbientNonLoop'Default__AmbientSoundNonLoop.SoundNodeAmbientNonLoop0'
    begin object name=SoundNodeAmbientNonLoop0 class=Class'SoundNodeAmbientNonLoop'
    end object
    SoundNodeInstance=SoundNodeAmbientNonLoop0
    // Reference: AudioComponent'Default__AmbientSoundNonLoop.AudioComponent0'
    begin object name=AudioComponent0
    end object
    AudioComponent=AudioComponent0
    Components[0]=none
    Components[1]=none
    Components[2]=AudioComponent0
    DrawScale=2.0000000
}