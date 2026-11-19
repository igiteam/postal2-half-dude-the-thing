class LPWeatherVolume extends Volume
    hidecategories(AnimDependency,Navigation,Object,Movement,Display,Advanced,Collision,Volume,Debug,Interaction,Destruct,Physics);

struct native LPWeatherEffect
{
    var(0.25_Pct) /*0x8B170000-0x00000000*/ private @NULL Effects[65537];
    var(0.25_Pct) /*0x8B170000-0x00000000*/ private bool bInheritRotation[65537];
    var(0.25_Pct) /*0x8B170000-0x00000000*/ private float RotationYaw[65537];
    var(0.25_Pct) /*0x8B170000-0x00000000*/ private @NULL Offset[65537];

    structdefaultproperties
    {
        Effects=none
        bInheritRotation=false
        RotationYaw=0.0000000
        Offset=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

struct native LPWeatherSettings
{
    var(0.25_Pct) /*0x8B180000-0x00000000*/ private @NULL VS_Effect[65537];
    var(0.25_Pct) /*0x8B180000-0x00000000*/ private @NULL POF_Effect[65537];

    structdefaultproperties
    {
        VS_Effect=(Effects=none,bInheritRotation=false,RotationYaw=0.0000000,Offset=(X=0.0000000,Y=0.0000000,Z=0.0000000))
        POF_Effect=(Effects=none,bInheritRotation=false,RotationYaw=0.0000000,Offset=(X=0.0000000,Y=0.0000000,Z=0.0000000))
    }
};

var(0.25_Pct) /*0x8B190000-0x00000000*/ private editconst @NULL Settings[65537];
var(0.25_Pct) /*0x8B190000-0x00000000*/ private float Priority[65537];
var(0.25_Pct) /*0x97E50000-0x00000100*/ private @NULL NextLowerPriorityVolume[537001985];
var(0.25_Pct) /*0x8B190000-0x00000000*/ private bool bEnabled[2162689];
var(0.25_Pct) /*0x8B190000-0x00000000*/ private bool bHealthRegenPenalty[65537];

// Export ULPWeatherVolume::execUpdatePlayerLocation(FFrame&, void* const)
native static function UpdatePlayerLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609], ReturnValue;


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
    ForceNetRelevant();
    SetForcedInitialReplicatedProperty(BoolProperty'Engine.PostProcessVolume.bEnabled', bEnabled == default.bEnabled);
    //return;    
}

defaultproperties
{
    bEnabled=true
    // Reference: BrushComponent'Default__LPWeatherVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    bStatic=false
    bTickIsDisabled=true
    bCanStepUpOn=false
    bAllowFluidSurfaceInteraction=false
    bCollideActors=false
    CollisionComponent=BrushComponent0
    SupportedEvents=/* Array type was not detected. */
}