class LPCrouchVolume extends LPTriggerVolume
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

var(0.25_Pct) /*0x7CDF0000-0x00000000*/ private @NULL CrouchCSA[65537];

simulated event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x81
    if(LPPlayerPawn(Other) != none)
    {
        // End:0x81
        if(LPPlayerController(LPPlayerPawn(Other).Controller) != none)
        {
            LPPlayerPawn(Other).ChangePosture(true, CrouchCSA);
        }
    }
    //return;    
}

simulated event UnTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];

    // End:0x79
    if(LPPlayerPawn(Other) != none)
    {
        // End:0x79
        if(LPPlayerController(LPPlayerPawn(Other).Controller) != none)
        {
            LPPlayerPawn(Other).ChangePosture(false);
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: BrushComponent'Default__LPCrouchVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    CollisionComponent=BrushComponent0
}