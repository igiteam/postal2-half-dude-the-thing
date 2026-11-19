class LPStruggleExclusionVolume extends LPTriggerVolume
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

simulated event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x41
    if(LPPlayerPawn(Other) != none)
    {
        LPPlayerPawn(Other).EnteredStruggleExclusionVolume(self);
    }
    //return;    
}

simulated event UnTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];

    // End:0x41
    if(LPPlayerPawn(Other) != none)
    {
        LPPlayerPawn(Other).ExitedStruggleExclusionVolume(self);
    }
    //return;    
}

defaultproperties
{
    // Reference: BrushComponent'Default__LPStruggleExclusionVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    CollisionComponent=BrushComponent0
}