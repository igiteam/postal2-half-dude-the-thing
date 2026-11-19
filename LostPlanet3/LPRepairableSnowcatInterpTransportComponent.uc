class LPRepairableSnowcatInterpTransportComponent extends LPRepairableBaseComponent;

// Export ULPRepairableSnowcatInterpTransportComponent::execGetHealth(FFrame&, void* const)
native function GetHealth()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPRepairableSnowcatInterpTransportComponent::execGetHealthMax(FFrame&, void* const)
native function GetHealthMax()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

function CanRepair()
{
    local /*0x97E50000-0x00000000*/ private @NULL Healer[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPI, TI, GRI;

    // End:0x1A
    if(!super.CanRepair(Healer))
    {
        return false;
    }
    LPI = LPSnowcatInterpTransport(Owner);
    // End:0x6D
    if((LPI == none) || !LPI.bEnabled)
    {
        return false;
    }
    GRI = LPI.WorldInfo.GRI;
    // End:0xBB
    if(GRI == none)
    {
        return false;
    }
    // End:0xE1
    if(!Healer.IsAliveAndWell())
    {
        return false;
    }
    TI = LPTeamInfo_MP(GRI.Teams[int(Healer.GetTeamNum())]);
    // End:0x145
    if(TI == none)
    {
        return false;
    }
    // End:0x18A
    if(LPI.bAttacking != TI.bAttackingTeam)
    {
        return false;
    }
    // End:0x221
    if((LPI.Health < LPI.MaxHealth) || Owner.IsTimerActive('EndEMPEffect') && Healer.PerkEnabled(1))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetRepairInfographic()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPSnowcatInterpTransport(Owner).RepairInfographic;
    //return ReturnValue;    
}

function SetHealthDirectly()
{
    local /*0x97E50000-0x00000000*/ private int NewHealth[8388609];
    local /*0x97E50000-0x00000000*/ private float CurrentHealth, Difference;

    // End:0x1D
    if(NewHealth < 0)
    {
        NewHealth = 0;        
    }
    else
    {
        // End:0x49
        if(NewHealth > (GetHealthMax()))
        {
            NewHealth = GetHealthMax();
        }
    }
    CurrentHealth = float(GetHealth());
    Difference = float(NewHealth) - CurrentHealth;
    // End:0xC8
    if(Difference > float(0))
    {
        LPSnowcatInterpTransport(Owner).HealDamage(int(Difference), none, none);        
    }
    else
    {
        LPSnowcatInterpTransport(Owner).Health = NewHealth;
    }
    //return;    
}

defaultproperties
{
    RepairRate=80
    MinRepairDistance=800.0000000
    MinRepairPitchAngle=45.0000000
    MinRepairYawAngle=45.0000000
    // Reference: LPQueryAnimNodeTemplateLogicRepairContext'Default__LPRepairableSnowcatInterpTransportComponent.ContextSelector0'
    begin object name=ContextSelector0
    end object
    ContextSelector=ContextSelector0
}