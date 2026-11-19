class TriggerVolume extends Volume
    placeable
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

var(*) /*0x35EA0000-0x00000000*/ private bool bIgnoreUnreferencedMapError;

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x43
    if(BrushComponent != none)
    {
        bProjTarget = BrushComponent.BlockZeroExtent;
    }
    //return;    
}

simulated function StopsProjectile()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

defaultproperties
{
    BrushColor=(R=100,G=255,B=100,A=255)
    bColored=true
    // Reference: BrushComponent'Default__TriggerVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    bProjTarget=true
    CollisionComponent=BrushComponent0
    SupportedEvents=/* Array type was not detected. */
}