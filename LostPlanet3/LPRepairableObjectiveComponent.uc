class LPRepairableObjectiveComponent extends LPRepairableBaseComponent;

// Export ULPRepairableObjectiveComponent::execGetHealth(FFrame&, void* const)
native function GetHealth()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPRepairableObjectiveComponent::execGetHealthMax(FFrame&, void* const)
native function GetHealthMax()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

function CanRepair()
{
    local /*0x97E50000-0x00000000*/ private @NULL Healer[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPO;

    // End:0x16D
    if(super.CanRepair(Healer))
    {
        LPO = LPDisableRepairObjective(Owner);
        // End:0x16D
        if(LPO != none)
        {
            // End:0x16D
            if(LPO.bEnabled && (LPO.Health < LPO.MaxHealth) || Healer.PerkEnabled(1) && Owner.IsTimerActive('EndEMPEffect'))
            {
                // End:0x16D
                if((int(LPO.OwningTeam) == int(Healer.GetTeamNum())) || int(LPO.OwningTeam) == int(3))
                {
                    return true;
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function GetRepairInfographic()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPDisableRepairObjective(Owner).RepairInfographic;
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
        LPDisableRepairObjective(Owner).HealDamage(int(Difference), none, none);        
    }
    else
    {
        LPDisableRepairObjective(Owner).Health = NewHealth;
    }
    //return;    
}

defaultproperties
{
    RepairRate=80
    MinRepairDistance=400.0000000
    MinRepairPitchAngle=45.0000000
    MinRepairYawAngle=45.0000000
    // Reference: LPQueryAnimNodeTemplateLogicRepairContext'Default__LPRepairableObjectiveComponent.ContextSelector0'
    begin object name=ContextSelector0
    end object
    ContextSelector=ContextSelector0
}