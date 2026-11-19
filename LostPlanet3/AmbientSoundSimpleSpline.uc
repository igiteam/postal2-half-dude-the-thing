class AmbientSoundSimpleSpline extends AmbientSoundSpline
    placeable
    hidecategories(AnimDependency,Navigation)
    autoexpandcategories(Audio,AmbientSoundSpline);

var(*) /*0x02540000-0x00000000*/ private int EditedSlot[65537];

defaultproperties
{
    // Reference: SimpleSplineAudioComponent'Default__AmbientSoundSimpleSpline.AudioComponent2'
    begin object name=AudioComponent2 class=Class'SimpleSplineAudioComponent'
    end object
    AudioComponent=AudioComponent2
    Components[0]=none
    Components[1]=none
    // Reference: SplineComponentSimplified'Default__AmbientSoundSimpleSpline.SplineComponent0'
    begin object name=SplineComponent0
    end object
    Components[2]=SplineComponent0
    Components[3]=AudioComponent2
}