class LPPerkProtoHarmonizer extends LPPerkDeployable;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ProtoHarmonizerTuneData;

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
    bOk = LPP.Mesh.GetSocketWorldLocationAndRotation(ProtoHarmonizerTuneData.DeploymentSocket, Loc, Rot);
    // End:0xC3
    if(!bOk)
    {
        return none;
    }
    RotOffset.Yaw = -16384;
    Totem = LPP.Spawn(ProtoHarmonizerTuneData.BeaconObjectClass,,, Loc, PerkManager.DeploymentRotation + RotOffset);
    // End:0x1E1
    if(Totem != none)
    {
        Totem.Velocity = (Vector(PerkManager.DeploymentRotation) + vect(0.0000000, 0.0000000, 0.4000000)) * ProtoHarmonizerTuneData.DeploymentVelocity;
    }
    return Totem;
    //return ReturnValue;    
}

defaultproperties
{
    PerkName="ProtoHarmonizer"
    PerkIndex=EPerks.EPERK_HARMONIZER
    HUDIconName="iconProtoHarmonizerNode"
    FriendlyName="Proto-harmonizer Node"
    Description="Deployable item that increases the rate of health regeneration for friendlies within its area of effect."
}