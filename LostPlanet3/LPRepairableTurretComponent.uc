class LPRepairableTurretComponent extends LPRepairablePawnComponent;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataTurret;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInitializedFromOwner;

event Attached()
{
    SetupParametersFromOwner();
    //return;    
}

event Detached()
{
    //return;    
}

function GetPerkDeployable()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    Idx = GetPerkDeployableIndex();
    // End:0xD2
    if(Idx >= 0)
    {
        // End:0x5B
        foreach Owner.LocalPlayerControllers(Class'LPPlayerController', LPC)
        {
            // End:0x5B
            break;            
        }        
        // End:0xD2
        if(LPC != none)
        {
            return LPPerkDeployable(LPPRI(LPC.PlayerReplicationInfo).PerksManager.QueryPerkInstance(byte(Idx)));
        }
    }
    return none;
    //return ReturnValue;    
}

function GetPerkDeployableIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Totem, AITurret;

    // End:0xAA
    if(Owner != none)
    {
        Totem = LPTotemBase(Owner);
        // End:0x5E
        if(Totem != none)
        {
            return int(Totem.PerkIndex);            
        }
        else
        {
            AITurret = LPAIPawnTurret(Owner);
            // End:0xAA
            if(AITurret != none)
            {
                return int(AITurret.PerkIndex);
            }
        }
    }
    return -1;
    //return ReturnValue;    
}

simulated function SetupParametersFromOwner()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    InitTuneData();
    // End:0x1B
    if(TuneDataTurret == none)
    {
        return false;
    }
    RepairRate = TuneDataTurret.RepairRate;
    MinRepairPitchAngle = TuneDataTurret.MinRepairPitchAngle;
    MinRepairYawAngle = TuneDataTurret.MinRepairYawAngle;
    MinRepairDistance = TuneDataTurret.MinRepairDistance;
    bInitializedFromOwner = true;
    return true;
    //return ReturnValue;    
}

simulated function InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL PD;

    // End:0x64
    if(TuneDataTurret == none)
    {
        PD = GetPerkDeployable();
        // End:0x64
        if(PD != none)
        {
            TuneDataTurret = LPTuneDataPerkChaingunTurret(GetPerkDeployable().PerkBaseTuneData);
        }
    }
    //return;    
}

function GetRepairInfographic()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPAIPawnTurret(Owner).RepairInfographic;
    //return ReturnValue;    
}

defaultproperties
{
    MinRepairDistance=600.0000000
    // Reference: LPQueryAnimNodeTemplateLogicRepairContext'Default__LPRepairableTurretComponent.ContextSelector0'
    begin object name=ContextSelector0
    end object
    ContextSelector=ContextSelector0
}