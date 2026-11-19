class LPGFxUIElementDisableRepairPoint extends LPGFxUIElementMPObjective
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Objective;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentHealth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNevec;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldRepair;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WarningThresholdPct[1073741825];

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];
    local /*0x97E50000-0x00000000*/ private int MyTeamNum;

    Objective = LPDisableRepairObjective(AttachedActor);
    MyTeamNum = int(MP.GetPC().GetTeamNum());
    bShouldRepair = int(Objective.OwningTeam) == MyTeamNum;
    bNevec = MyTeamNum == 0;
    super.Init(MP);
    //return;    
}

function SetAttachedActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private int theIndex[9437185], MyTeamNum;

    -1
    super.SetAttachedActor(TheActor, theIndex);
    Objective = LPDisableRepairObjective(AttachedActor);
    MyTeamNum = int(GetLPPC().GetTeamNum());
    bShouldRepair = int(Objective.OwningTeam) == MyTeamNum;
    bNevec = MyTeamNum == 0;
    //return;    
}

function UpdateObjectiveIcon()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.UpdateObjectiveIcon(DeltaTime);
    SetProgress(Objective.GetHealthPercent() * 0.0100000);
    //return;    
}

function ObjectiveChangedState()
{
    // End:0x39
    if(!bIconInit)
    {
        CurrentHealth = float(Objective.Health);
    }
    // End:0xAE
    if(Objective.Health == Objective.MaxHealth)
    {
        SetObjectiveState(((bShouldRepair) ? "repaired" : "def_repaired"));        
    }
    else
    {
        // End:0x121
        if(CurrentHealth < float(Objective.Health))
        {
            SetObjectiveState(((bShouldRepair) ? "repairing" : "def_repairing"));
            StateTimer = 2.0000000;            
        }
        else
        {
            // End:0x1C1
            if(CurrentHealth > float(Objective.Health))
            {
                SetObjectiveState(((bShouldRepair) ? "takingDamage" : ((bNevec) ? "def_damaging_nevec" : "def_damaging_pirates")));
                StateTimer = 2.0000000;                
            }
            else
            {
                // End:0x244
                if(Objective.Health <= 0)
                {
                    SetObjectiveState(((bShouldRepair) ? "disabled" : ((bNevec) ? "def_disabled_nevec" : "def_disabled_pirates")));                    
                }
                else
                {
                    // End:0x296
                    if(bShouldRepair && Objective.GetHealthPercent() <= WarningThresholdPct)
                    {
                        SetObjectiveState("warning");                        
                    }
                    else
                    {
                        // End:0x2F4
                        if(!bShouldRepair && Objective.GetHealthPercent() >= (float(100) - WarningThresholdPct))
                        {
                            SetObjectiveState("def_warning");                            
                        }
                        else
                        {
                            SetObjectiveState(((bShouldRepair) ? "default" : ((bNevec) ? "def_default_nevec" : "def_default_pirates")));
                        }
                    }
                }
            }
        }
    }
    CurrentHealth = float(Objective.Health);
    //return;    
}

function OnStateTimer()
{
    ObjectiveChangedState();
    //return;    
}

// Export ULPGFxUIElementDisableRepairPoint::execGetIconPosition(FFrame&, void* const)
native function GetIconPosition()
{
    local /*0x97E50000-0x00000000*/ private float distToPlayer[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

function ShouldHideUI()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bHide;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    bHide = super.ShouldHideUI() || !Objective.bEnabled;
    // End:0x53
    if(bHide)
    {
        return bHide;
    }
    LPPC = GetLPPC();
    // End:0x10A
    if(LPPC != none)
    {
        // End:0x10A
        if((LPPC.MyPlayerPawn != none) && LPPC.MyPlayerPawn.ClosestValidRepairableActor == AttachedActor)
        {
            // End:0x10A
            if(LPPC.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerRepairBase'))
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function CreateEdgeMC()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CreateMPObjectiveEdgePoint(((bShouldRepair) ? "repair" : "disable"));
    //return ReturnValue;    
}

defaultproperties
{
    WarningThresholdPct=25.0000000
    ObjectiveType="repair"
    ObjectiveStateFunc="setMPRepairPointState"
}