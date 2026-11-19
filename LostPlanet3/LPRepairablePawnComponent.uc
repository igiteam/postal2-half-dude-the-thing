class LPRepairablePawnComponent extends LPRepairableBaseComponent;

var(0.25_Pct) /*0x822F0000-0x00000000*/ private bool bRepairableIfDead[65537];

// Export ULPRepairablePawnComponent::execGetHealth(FFrame&, void* const)
native function GetHealth()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPRepairablePawnComponent::execGetHealthMax(FFrame&, void* const)
native function GetHealthMax()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

function CanRepair()
{
    local /*0x97E50000-0x00000000*/ private @NULL Healer[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    // End:0x188
    if(super.CanRepair(Healer))
    {
        // End:0x188
        if(Owner != none)
        {
            LPP = LPPawn(Owner);
            // End:0x188
            if(LPP != none)
            {
                // End:0x188
                if((((LPP.Health < LPP.HealthMax) || Healer.PerkEnabled(1) && Owner.IsTimerActive('EndEMPEffect')) && (LPP.Health > 0) || bRepairableIfDead) && (LPP.GetTeam() == none) || LPP.GetTeam() == Healer.GetTeam())
                {
                    return true;
                }
            }
        }
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
    // End:0xBF
    if(Difference > float(0))
    {
        Owner.HealDamage(int(Difference), none, none);        
    }
    else
    {
        LPPawn(Owner).Health = NewHealth;
    }
    //return;    
}

defaultproperties
{
    RepairRate=80
    MinRepairDistance=400.0000000
    MinRepairPitchAngle=45.0000000
    MinRepairYawAngle=45.0000000
    // Reference: LPQueryAnimNodeTemplateLogicRepairContext'Default__LPRepairablePawnComponent.ContextSelector0'
    begin object name=ContextSelector0
    end object
    ContextSelector=ContextSelector0
}