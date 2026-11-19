class AmbientSoundSimple extends AmbientSound
    placeable
    hidecategories(AnimDependency,Navigation,Audio)
    autoexpandcategories(Audio,AmbientSoundSimple);

var(*) /*0x024F0000-0x00000400*/ private const @NULL AmbientProperties[65537];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize @NULL SoundCueInstance[655361];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize @NULL SoundNodeInstance[655361];

defaultproperties
{
    // Reference: SoundCue'Default__AmbientSoundSimple.SoundCue0'
    begin object name=SoundCue0 class=Class'SoundCue'
        SoundClass="Ambient"
    end object
    SoundCueInstance=SoundCue0
    // Reference: SoundNodeAmbient'Default__AmbientSoundSimple.SoundNodeAmbient0'
    begin object name=SoundNodeAmbient0 class=Class'SoundNodeAmbient'
    end object
    SoundNodeInstance=SoundNodeAmbient0
    // Reference: AudioComponent'Default__AmbientSoundSimple.AudioComponent0'
    begin object name=AudioComponent0
    end object
    AudioComponent=AudioComponent0
    Components[0]=none
    Components[1]=none
    Components[2]=AudioComponent0
}