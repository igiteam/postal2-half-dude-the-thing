class LPRepairableSnowcatComponent extends LPRepairableBaseComponent;

// Export ULPRepairableSnowcatComponent::execGetHealth(FFrame&, void* const)
native function GetHealth()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPRepairableSnowcatComponent::execGetHealthMax(FFrame&, void* const)
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
    LPI = LPSnowcatObjective(Owner);
    // End:0x47
    if(LPI == none)
    {
        return false;
    }
    GRI = LPI.WorldInfo.GRI;
    // End:0x95
    if(GRI == none)
    {
        return false;
    }
    // End:0xBB
    if(!Healer.IsAliveAndWell())
    {
        return false;
    }
    TI = LPTeamInfo_MP(GRI.Teams[int(Healer.GetTeamNum())]);
    // End:0x11F
    if(TI == none)
    {
        return false;
    }
    // End:0x164
    if(LPI.bAttacking != TI.bAttackingTeam)
    {
        return false;
    }
    // End:0x1A7
    if(LPI.Health < LPI.MaxHealth)
    {
        return true;
    }
    return false;
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
        LPSnowcatObjective(Owner).HealDamage(int(Difference), none, none);        
    }
    else
    {
        LPSnowcatObjective(Owner).Health = NewHealth;
    }
    //return;    
}

defaultproperties
{
    RepairRate=80
    MinRepairDistance=800.0000000
    MinRepairPitchAngle=45.0000000
    MinRepairYawAngle=45.0000000
    // Reference: LPQueryAnimNodeTemplateLogicRepairContext'Default__LPRepairableSnowcatComponent.ContextSelector0'
    begin object name=ContextSelector0
    end object
    ContextSelector=ContextSelector0
}