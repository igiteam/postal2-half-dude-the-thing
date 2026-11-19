class AmbientSoundMovable extends AmbientSound
    placeable
    hidecategories(AnimDependency,Navigation)
    autoexpandcategories(Audio);

defaultproperties
{
    // Reference: AudioComponent'Default__AmbientSoundMovable.AudioComponent0'
    begin object name=AudioComponent0
    end object
    AudioComponent=AudioComponent0
    Components[0]=none
    Components[1]=none
    Components[2]=AudioComponent0
    Physics=EPhysics.PHYS_Interpolating
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    bStatic=false
}