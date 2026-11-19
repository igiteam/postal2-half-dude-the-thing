class AmbientSoundSimpleSplineNonLoop extends AmbientSoundSimpleSpline
    placeable
    hidecategories(AnimDependency,Navigation)
    autoexpandcategories(Audio,AmbientSoundSpline);

defaultproperties
{
    // Reference: SimpleSplineNonLoopAudioComponent'Default__AmbientSoundSimpleSplineNonLoop.AudioComponent3'
    begin object name=AudioComponent3 class=Class'SimpleSplineNonLoopAudioComponent'
    end object
    AudioComponent=AudioComponent3
    Components[0]=none
    Components[1]=none
    // Reference: SplineComponentSimplified'Default__AmbientSoundSimpleSplineNonLoop.SplineComponent0'
    begin object name=SplineComponent0
    end object
    Components[2]=SplineComponent0
    Components[3]=AudioComponent3
}