class LPAct1BossLeechTarget extends Keypoint
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x76AC0000-0x00000000*/ private bool bPlayerMustBeFacing[65537];
var(0.25_Pct) /*0x76AC0000-0x00000000*/ private bool bBossTargetOnly[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsOwned;

simulated function SetOwned()
{
    local /*0x97E50000-0x00000000*/ private float Time[8388609];

    bIsOwned = true;
    SetTimer(Time, false, 'RemoveOwned');
    //return;    
}

simulated function RemoveOwned()
{
    bIsOwned = false;
    //return;    
}

defaultproperties
{
    bStatic=false
    bAlwaysRelevant=true
    bGameRelevant=true
}