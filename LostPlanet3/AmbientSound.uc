class AmbientSound extends Keypoint
    placeable
    hidecategories(AnimDependency,Navigation)
    classgroup(Sounds)
    autoexpandcategories(Audio);

var(*) /*0x02490000-0x00000000*/ private bool bAutoPlay[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsPlaying;
var(*) /*0x03C50000-0x00000400*/ private const export @NULL AudioComponent[720897];

defaultproperties
{
    bAutoPlay=true
    // Reference: AudioComponent'Default__AmbientSound.AudioComponent0'
    begin object name=AudioComponent0 class=Class'AudioComponent'
    end object
    AudioComponent=AudioComponent0
    Components[0]=none
    Components[1]=none
    Components[2]=AudioComponent0
}