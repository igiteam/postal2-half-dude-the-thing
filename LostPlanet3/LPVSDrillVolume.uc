class LPVSDrillVolume extends Volume
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

var(0.25_Pct) /*0x8ACB0000-0x00000000*/ private @NULL DrillAreaDir[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL DrillDirArrow[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CenterLocation;
var(0.25_Pct) /*0x8ACB0000-0x00000000*/ private bool bEnabled[65537];
var(0.25_Pct) /*0x8ACB0000-0x00000000*/ private bool bUsesDrillArmSwing[65537];
var(0.25_Pct) /*0x8ACB0000-0x00000000*/ private float VisibilityDistance[65537];

// Export ULPVSDrillVolume::execFindCenter(FFrame&, void* const)
native final function FindCenter()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPVSDrillVolume::execGetYLocFromCenter(FFrame&, void* const)
native final function GetYLocFromCenter()
{
    local /*0x97E50000-0x00000000*/ private float OverrideDistance[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    0.0000000            
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    CenterLocation = FindCenter();
    //return;    
}

simulated function StopsProjectile()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bEnabled = true;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bEnabled = false;            
        }
        else
        {
            // End:0xDB
            if(Action.InputLinks[2].bHasImpulse)
            {
                bEnabled = !bEnabled;
            }
        }
    }
    //return;    
}

function GetLeftLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CenterLocation - GetYLocFromCenter(30.0000000);
    //return ReturnValue;    
}

function GetRightLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CenterLocation + GetYLocFromCenter(30.0000000);
    //return ReturnValue;    
}

defaultproperties
{
    bEnabled=true
    VisibilityDistance=-1.0000000
    BrushColor=(R=100,G=100,B=255,A=255)
    bColored=true
    // Reference: BrushComponent'Default__LPVSDrillVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    Components[1]=none
    bStatic=false
    bCollideActors=false
    CollisionComponent=BrushComponent0
    SupportedEvents=none
}