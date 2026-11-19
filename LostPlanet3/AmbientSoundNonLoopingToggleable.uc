class AmbientSoundNonLoopingToggleable extends AmbientSoundSimpleToggleable
    placeable
    hidecategories(AnimDependency,Navigation,Audio)
    autoexpandcategories(Audio,AmbientSoundSimple,AmbientSoundSimpleToggleable);

defaultproperties
{
    // Reference: SoundCue'Default__AmbientSoundNonLoopingToggleable.SoundCue0'
    begin object name=SoundCue0
    end object
    SoundCueInstance=SoundCue0
    // Reference: SoundNodeAmbientNonLoopToggle'Default__AmbientSoundNonLoopingToggleable.SoundNodeAmbientNonLoopToggle0'
    begin object name=SoundNodeAmbientNonLoopToggle0 class=Class'SoundNodeAmbientNonLoopToggle'
    end object
    SoundNodeInstance=SoundNodeAmbientNonLoopToggle0
    // Reference: AudioComponent'Default__AmbientSoundNonLoopingToggleable.AudioComponent0'
    begin object name=AudioComponent0
    end object
    AudioComponent=AudioComponent0
    Components[0]=none
    Components[1]=none
    Components[2]=AudioComponent0
}