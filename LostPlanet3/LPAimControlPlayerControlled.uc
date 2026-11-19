class LPAimControlPlayerControlled extends SPGFAimControlPlayerControlled
    config(Pawn)
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CrosshairColor_Hook[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CrosshairColor_LeechStruggle[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CrosshairColor_Enemy[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CrosshairColor_Friendly[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastAimAtEnemyTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EnemyCrosshairTimeout[131073];

// Export ULPAimControlPlayerControlled::execGetCrosshairColor(FFrame&, void* const)
native function GetCrosshairColor()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], HitPhysicalMaterial, ReturnValue;


}

function GetAimLineCollisionLength()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;
    local /*0x97E50000-0x00000000*/ private float Range;

    vsPawn = LPVSPlayerPawn(PawnOuter);
    // End:0x6F
    if(vsPawn != none)
    {
        Range = vsPawn.GetWinchSearchRange();
        // End:0x6F
        if(Range > float(0))
        {
            return Range;
        }
    }
    return super.GetAimLineCollisionLength();
    //return ReturnValue;    
}

simulated function AdditionalPassThroughCheck()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    vsPawn = LPVSPlayerPawn(PawnOuter);
    // End:0x59
    if(vsPawn != none)
    {
        // End:0x59
        if(HitActor.Base == vsPawn)
        {
            return true;
        }
    }
    return super.AdditionalPassThroughCheck(HitActor);
    //return ReturnValue;    
}

defaultproperties
{
    CrosshairColor_Hook=(R=0,G=255,B=0,A=255)
    CrosshairColor_LeechStruggle=(R=0,G=255,B=0,A=255)
    CrosshairColor_Enemy=(R=255,G=0,B=0,A=255)
    CrosshairColor_Friendly=(R=0,G=255,B=0,A=255)
    LastAimAtEnemyTime=-1.0000000
    EnemyCrosshairTimeout=0.1250000
}