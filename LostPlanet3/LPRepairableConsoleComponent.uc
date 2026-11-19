class LPRepairableConsoleComponent extends LPRepairableBaseComponent;

// Export ULPRepairableConsoleComponent::execGetHealth(FFrame&, void* const)
native function GetHealth()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPRepairableConsoleComponent::execGetHealthMax(FFrame&, void* const)
native function GetHealthMax()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

function CanRepair()
{
    local /*0x97E50000-0x00000000*/ private @NULL Healer[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPVSC;

    // End:0x84
    if(super.CanRepair(Healer))
    {
        LPVSC = LPVSPlatformConsole(Owner);
        // End:0x84
        if(LPVSC != none)
        {
            // End:0x84
            if(LPVSC.Health < LPVSC.HealthMax)
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function GetRepairInfographic()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPVSPlatformConsole(Owner).RepairInfographic;
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
        LPVSPlatformConsole(Owner).HealDamage(int(Difference), none, none);        
    }
    else
    {
        LPVSPlatformConsole(Owner).Health = NewHealth;
    }
    //return;    
}

defaultproperties
{
    // Reference: LPQueryAnimNodeTemplateLogicRepairContext'Default__LPRepairableConsoleComponent.ContextSelector0'
    begin object name=ContextSelector0
    end object
    ContextSelector=ContextSelector0
}