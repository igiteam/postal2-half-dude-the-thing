class LPRepairableBaseComponent extends ActorComponent
    abstract;

var(0.25_Pct) /*0xBB7A0000-0x00000000*/ private bool bUseSimpleRepair[65537];
var(0.25_Pct) /*0xBB7A0000-0x00000000*/ private bool bFirePercentageEventsOnEarlyCompletion[65537];
var(0.25_Pct) /*0x822B0000-0x00000000*/ private bool bRepairable[65537];
var(0.25_Pct) /*0xBB7A0000-0x00000000*/ private float RepairDuration[65537];
var(0.25_Pct) /*0xBB7A0000-0x00000000*/ private float Rewards[65540];
var(0.25_Pct) /*0xBB7A0000-0x00000000*/ private float CompletionInputDelay[65537];
var(0.25_Pct) /*0x822B0000-0x00000000*/ private int RepairRate[65537];
var(0.25_Pct) /*0x822B0000-0x00000000*/ private float MinRepairDistance[65537];
var(0.25_Pct) /*0x822B0000-0x00000000*/ private float MinRepairPitchAngle[65537];
var(0.25_Pct) /*0x822B0000-0x00000000*/ private float MinRepairYawAngle[65537];
var(0.25_Pct) /*0x822B0000-0x00000000*/ private float HeightTolerance[65537];
var(0.25_Pct) /*0x822B0000-0x00000000*/ private @NULL EnhancedRepairUIOffset[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HealthAccumulator;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SimulatedHealth;
var(0.25_Pct) /*0x822B0000-0x00000400*/ private editfixedsize @NULL ContextSelector[589825];

// Export ULPRepairableBaseComponent::execGetSimulatedHealth(FFrame&, void* const)
native final function GetSimulatedHealth()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPRepairableBaseComponent::execGetHealth(FFrame&, void* const)
native function GetHealth()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

// Export ULPRepairableBaseComponent::execGetHealthMax(FFrame&, void* const)
native function GetHealthMax()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

function CanRepair()
{
    local /*0x97E50000-0x00000000*/ private @NULL Healer[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ToHealer, HealerAim, YawAngle, PitchAngle;
    local /*0x97E50000-0x00000000*/ private float zdiff;

    // End:0x11
    if(!bRepairable)
    {
        return false;
    }
    // End:0x84
    if(((GetHealth()) >= (GetHealthMax())) && !Owner.IsTimerActive('EndEMPEffect') || !Healer.PerkEnabled(1))
    {
        return false;
    }
    // End:0x2A4
    if((Healer != none) && Owner != none)
    {
        HealerAim = Healer.GetAimDirection();
        YawAngle.Yaw = HealerAim.Yaw;
        PitchAngle.Pitch = HealerAim.Pitch;
        ToHealer = Owner.Location - Healer.Location;
        zdiff = Abs(ToHealer.Z);
        ToHealer.Z = 0.0000000;
        // End:0x2A4
        if((((((Owner != none) && !Owner.bHidden) && VSize(ToHealer) < MinRepairDistance) && zdiff < HeightTolerance) && (Vector(YawAngle) Dot Normal(ToHealer)) > Cos(MinRepairYawAngle * 0.0174533)) && Vector(PitchAngle).X > Cos(MinRepairPitchAngle * 0.0174533))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function Repair()
{
    local /*0x97E50000-0x00000000*/ private @NULL Healer[8388609];
    local /*0x97E50000-0x00000000*/ private float RepairRateModifier[9437185], PrevHealth, CurHealth, MaxHealth;
    local /*0x97E50000-0x00000000*/ private int RepairAmount, Index;
    local /*0x97E50000-0x00000000*/ private float HealthPreIndex, HealthPostIndex;

    1.0000000
    // End:0x1A
    if(!bRepairable)
    {
        return;
    }
    // End:0x32E
    if(Owner != none)
    {
        PrevHealth = float(GetHealth());
        MaxHealth = float(GetHealthMax());
        // End:0x32E
        if(PrevHealth < MaxHealth)
        {
            HealthAccumulator += ((float(RepairRate) * RepairRateModifier) * Owner.WorldInfo.DeltaSeconds);
            // End:0x32E
            if(HealthAccumulator > 1.0000000)
            {
                RepairAmount = int(HealthAccumulator);
                HealthAccumulator -= float(RepairAmount);
                Owner.HealDamage(RepairAmount, Healer, none);
                // End:0x174
                if(int(Owner.Role) == int(ROLE_Authority))
                {
                    CurHealth = float(GetHealth());                    
                }
                else
                {
                    CurHealth = float(GetSimulatedHealth() + RepairAmount);
                    CurHealth = FClamp(CurHealth, 0.0000000, MaxHealth);
                }
                SimulatedHealth = CurHealth;
                HealthPreIndex = float(FFloor((PrevHealth / MaxHealth) * 10.0000000));
                HealthPostIndex = float(FFloor((CurHealth / MaxHealth) * 10.0000000));
                // End:0x2C5
                if(HealthPreIndex != HealthPostIndex)
                {
                    Index = int(float(9) - (HealthPostIndex - float(1)));
                    // End:0x2C5
                    if((Index > -1) && Index < 10)
                    {
                        Owner.TriggerEventClass(Class'LPSeqEvent_RepairPercent', Owner, Index);
                    }
                }
                // End:0x32E
                if((PrevHealth < float(GetHealthMax())) && (GetHealth()) == (GetHealthMax()))
                {
                    Owner.TriggerEventClass(Class'LPSeqEvent_ObjectRepaired', Owner);
                }
            }
        }
    }
    //return;    
}

function SetHealthDirectly()
{
    local /*0x97E50000-0x00000000*/ private int NewHealth[8388609];

    //return;    
}

function GetRepairInfographic()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return none;
    //return ReturnValue;    
}

function BeginRepairOperation()
{
    SimulatedHealth = float(GetHealth());
    //return;    
}

function EndRepairOperation()
{
    //return;    
}

defaultproperties
{
    bFirePercentageEventsOnEarlyCompletion=true
    bRepairable=true
    RepairDuration=20.0000000
    Rewards[0]=100.0000000
    Rewards[1]=50.0000000
    Rewards[2]=25.0000000
    Rewards[3]=5.0000000
    CompletionInputDelay=2.0000000
    RepairRate=50
    MinRepairDistance=300.0000000
    MinRepairPitchAngle=25.0000000
    MinRepairYawAngle=20.0000000
    HeightTolerance=200.0000000
    // Reference: LPQueryAnimNodeTemplateLogicRepairContext'Default__LPRepairableBaseComponent.ContextSelector0'
    begin object name=ContextSelector0 class=Class'LPQueryAnimNodeTemplateLogicRepairContext'
    end object
    ContextSelector=ContextSelector0
}