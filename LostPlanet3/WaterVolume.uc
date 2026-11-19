class WaterVolume extends PhysicsVolume
    notplaceable
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

var(*) /*0x505D0000-0x00000000*/ private @NULL EntrySound[65537];
var(*) /*0x505D0000-0x00000000*/ private class EntryActor[65537];
var(*) /*0x505D0000-0x00000000*/ private @NULL ExitSound[65537];
var(*) /*0x505D0000-0x00000000*/ private class ExitActor[65537];

simulated event @NULL Touch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    super.Touch(Other, OtherComp, HitLocation, HitNormal);
    // End:0x63
    if(Other.CanSplash())
    {
        PlayEntrySplash(Other);
    }
    //return;    
}

function PlayEntrySplash()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    // End:0x7E
    if(EntrySound != none)
    {
        Other.PlaySound(EntrySound);
        // End:0x7E
        if(Other.Instigator != none)
        {
            Other.MakeNoise(1.0000000);
        }
    }
    // End:0xA7
    if(EntryActor != none)
    {
        Spawn(EntryActor);
    }
    //return;    
}

event UnTouch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    // End:0x35
    if(Other.CanSplash())
    {
        PlayExitSplash(Other);
    }
    //return;    
}

function PlayExitSplash()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    // End:0x7E
    if(ExitSound != none)
    {
        Other.PlaySound(ExitSound);
        // End:0x7E
        if(Other.Instigator != none)
        {
            Other.MakeNoise(1.0000000);
        }
    }
    // End:0xA7
    if(ExitActor != none)
    {
        Spawn(ExitActor);
    }
    //return;    
}

defaultproperties
{
    bWaterVolume=true
    FluidFriction=2.4000000
    // Reference: BrushComponent'Default__WaterVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    CollisionComponent=BrushComponent0
}