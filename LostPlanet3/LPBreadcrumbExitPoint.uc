class LPBreadcrumbExitPoint extends LPBreadcrumb
    hidecategories(AnimDependency,Navigation);

struct native ExitPointMapInfo
{
    var(0.25_Pct) /*0x55800000-0x00000000*/ private name PersistentMapName[65537];

    structdefaultproperties
    {
        PersistentMapName="None"
    }
};

var(0.25_Pct) /*0x7C570000-0x00000000*/ private editfixedsize array ExitPointInfo[65537];
var(0.25_Pct) /*0x7C570000-0x00000000*/ private bool bDefaultExitPoint[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL QuestTuneDataContainer[524289];
var(0.25_Pct) /*0x7C570000-0x00000400*/ private editfixedsize @NULL ToLevelName[589825];
var(0.25_Pct) /*0x7C570000-0x00000400*/ private editfixedsize @NULL DisabledDisplayText[589825];

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, LPP, LPPC;

    LPP = LPPawn(Other);
    // End:0x8B
    if(LPP != none)
    {
        LPPC = LPPlayerController(LPP.Controller);
        // End:0x8B
        if(LPPC != none)
        {
            LPPC.ShowExitPointMessage(self);
        }
    }
    super(Actor).Touch(Other, OtherComp, HitLocation, HitNormal);
    //return;    
}

defaultproperties
{
    Components[0]=none
    // Reference: CylinderComponent'Default__LPBreadcrumbExitPoint.MyCollisionComponent'
    begin object name=MyCollisionComponent class=Class'Engine.CylinderComponent'
    end object
    Components[1]=MyCollisionComponent
    bCollideActors=true
    CollisionComponent=MyCollisionComponent
}