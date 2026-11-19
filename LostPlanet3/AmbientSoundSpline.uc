class AmbientSoundSpline extends AmbientSound
    placeable
    hidecategories(AnimDependency,Navigation)
    autoexpandcategories(Audio,AmbientSoundSpline);

var(*) /*0x02540000-0x00000000*/ private float DistanceBetweenPoints[65537];
var(*) /*0x02540000-0x00000400*/ private export @NULL SplineComponent[589825];
var(*) /*0x35EA0000-0x00000000*/ private @NULL TestPoint;

defaultproperties
{
    // Reference: SplineAudioComponent'Default__AmbientSoundSpline.AudioComponent1'
    begin object name=AudioComponent1 class=Class'SplineAudioComponent'
    end object
    AudioComponent=AudioComponent1
    Components[0]=none
    Components[1]=none
    // Reference: SplineComponentSimplified'Default__AmbientSoundSpline.SplineComponent0'
    begin object name=SplineComponent0 class=Class'SplineComponentSimplified'
    end object
    Components[2]=SplineComponent0
    Components[3]=AudioComponent1
}