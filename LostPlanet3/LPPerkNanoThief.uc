class LPPerkNanoThief extends LPPerkAbility;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NanoThiefTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AssumeIdentity;

simulated function Init()
{
    AssumeIdentity = -1;
    super(LPPerkBase).Init();
    //return;    
}

simulated function HasIdentity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return AssumeIdentity >= 0;
    //return ReturnValue;    
}

simulated function AssumePerkIdentity()
{
    local /*0x97E50000-0x00000000*/ private byte NewIndex[8388609];

    AssumeIdentity = int(NewIndex);
    //return;    
}

simulated function WipeIdentity()
{
    AssumeIdentity = -1;
    //return;    
}

simulated function GetIdentity()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return byte(AssumeIdentity);
    //return ReturnValue;    
}

simulated function GetHUDIconName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    // End:0x48
    if((AssumeIdentity < 0) || AssumeIdentity >= Class'LPPerks'.static.GetMaxPerkCount())
    {
        return HUDIconName;
    }
    return PerkManager.PerkList[AssumeIdentity].GetHUDIconName();
    //return ReturnValue;    
}

simulated function CanPerkBeActivated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TE;

    // End:0x0F
    if(HasIdentity())
    {
        return false;
    }
    TE = LPThermalEnergy(MyPlayerController.Pawn.FindInventoryType(Class'LPThermalEnergy', true));
    // End:0x71
    if(TE == none)
    {
        return false;
    }
    // End:0xA2
    if(TE.GetEnergyCount() < (GetCost()))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

defaultproperties
{
    PerkName="NanoThief"
    PerkType=EPerkType.PerkType_AbilityActive
    PerkIndex=EPerks.EPERK_NANOTHIEF
    HUDIconName="iconDeployableHack"
    FriendlyName="Nanothief"
    Description="Ability that allows you to steal enemy deployables and reuse them for your own team."
}