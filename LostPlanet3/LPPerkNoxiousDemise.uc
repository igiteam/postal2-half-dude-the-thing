class LPPerkNoxiousDemise extends LPPerkAbility;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NoxiousTuneData;

function SpawnCloud()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP, SpawnLoc;

    LPP = LPPlayerPawn(MyPlayerController.Pawn);
    // End:0x113
    if(LPP != none)
    {
        SpawnLoc = LPP.Location;
        SpawnLoc.Z -= (NoxiousTuneData.CloudHeight / float(2));
        LPP.Spawn(NoxiousTuneData.CloudObjectClass,,, SpawnLoc, LPP.Rotation);
    }
    //return;    
}

defaultproperties
{
    PerkName="NoxiousDemise"
    PerkType=EPerkType.PerkType_AbilityPassive
    PerkIndex=EPerks.EPERK_NOXIOUSDEMISE
    HUDIconName="iconNoxiousDemise"
    FriendlyName="Noxious Demise"
    Description="On death, release a toxic gas cloud that damages nearby enemies and Akrid."
}