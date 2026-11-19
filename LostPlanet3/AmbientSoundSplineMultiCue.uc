class AmbientSoundSplineMultiCue extends AmbientSoundSpline
    placeable
    hidecategories(AnimDependency,Navigation)
    autoexpandcategories(Audio,AmbientSoundSpline);

var(*) /*0x02540000-0x00000000*/ private int EditedSlot[65537];

defaultproperties
{
    // Reference: MultiCueSplineAudioComponent'Default__AmbientSoundSplineMultiCue.AudioComponent2'
    begin object name=AudioComponent2 class=Class'MultiCueSplineAudioComponent'
    end object
    AudioComponent=AudioComponent2
    Components[0]=none
    Components[1]=none
    // Reference: SplineComponentSimplified'Default__AmbientSoundSplineMultiCue.SplineComponent0'
    begin object name=SplineComponent0
    end object
    Components[2]=SplineComponent0
    Components[3]=AudioComponent2
}