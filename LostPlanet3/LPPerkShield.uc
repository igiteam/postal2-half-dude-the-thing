class LPPerkShield extends LPPerkDeployable;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ShieldTuneData;

simulated function GetTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ShieldTuneData;
    //return ReturnValue;    
}

function SpawnDeployable()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Loc, Rot, RotOffset, LPP, Totem;

    local /*0x97E50000-0x00000000*/ private bool bOk;

    LPP = LPPlayerPawn(MyPlayerController.Pawn);
    // End:0x42
    if(LPP == none)
    {
        return none;
    }
    bOk = LPP.Mesh.GetSocketWorldLocationAndRotation(ShieldTuneData.DeploymentSocket, Loc, Rot);
    // End:0xC3
    if(!bOk)
    {
        return none;
    }
    RotOffset.Yaw = -16384;
    Totem = LPP.Spawn(ShieldTuneData.BeaconObjectClass,,, Loc, PerkManager.DeploymentRotation + RotOffset);
    // End:0x1E1
    if(Totem != none)
    {
        Totem.Velocity = (Vector(PerkManager.DeploymentRotation) + vect(0.0000000, 0.0000000, 0.4000000)) * ShieldTuneData.DeploymentVelocity;
    }
    return Totem;
    //return ReturnValue;    
}

function GetPerkTargetActorType()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return ShieldTuneData.BeaconObjectClass;
    //return ReturnValue;    
}

defaultproperties
{
    PerkName="Shield"
    PerkIndex=EPerks.EPERK_SHIELD
    HUDIconName="iconTENGShield"
    FriendlyName="T-Energy Shield"
    Description="Deployable item that creates a temporary shield made out of thermal energy."
}