class LPGFxUIElementSnowcatPoint extends LPGFxUIElementMPObjective
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Objective;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentHealth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsMoving;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnabled;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super.Init(MP);
    Objective = LPSnowcatInterpTransport(AttachedActor);
    //return;    
}

function SetAttachedActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheActor[8388609];
    local /*0x97E50000-0x00000000*/ private int theIndex[9437185];

    -1
    super.SetAttachedActor(TheActor, theIndex);
    Objective = LPSnowcatInterpTransport(AttachedActor);
    //return;    
}

function UpdateObjectiveIcon()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.UpdateObjectiveIcon(DeltaTime);
    SetProgress(Objective.GetHealthPercent() * 0.0100000);
    // End:0x1E4
    if(MPHUD.bMPObjectiveVisible)
    {
        // End:0x13C
        if(MPHUD.bMPSubObjectiveVisible != Objective.bEnabled)
        {
            MPHUD.ShowMPSubObjective(Objective.bEnabled);
            MPHUD.SetMPSubObjectiveType(((Objective.bEnabled) ? "battlecat" : "normal"));
        }
        // End:0x1E1
        if(MPHUD.bMPSubObjectiveVisible && bIsMoving != Objective.ShouldBeMoving())
        {
            bIsMoving = Objective.ShouldBeMoving();
            MPHUD.SetMPSubObjectiveBattlecatMoving(bIsMoving);
        }        
    }
    else
    {
        // End:0x226
        if(MPHUD.bMPSubObjectiveVisible)
        {
            MPHUD.ShowMPSubObjective(false);
        }
    }
    //return;    
}

function ObjectiveChangedState()
{
    // End:0x39
    if(!bIconInit)
    {
        CurrentHealth = float(Objective.Health);
    }
    // End:0x90
    if(Objective.Health == Objective.MaxHealth)
    {
        SetObjectiveState("default");        
    }
    else
    {
        // End:0xDD
        if(CurrentHealth < float(Objective.Health))
        {
            SetObjectiveState("repairInProgress");            
        }
        else
        {
            // End:0x135
            if(CurrentHealth > float(Objective.Health))
            {
                SetObjectiveState("takingDamage");
                StateTimer = 2.0000000;                
            }
            else
            {
                // End:0x16E
                if(Objective.bIsDisabled)
                {
                    SetObjectiveState("disabled");                    
                }
                else
                {
                    SetObjectiveState("repairInProgress");
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

defaultproperties
{
    ObjectiveType="escort"
    ObjectiveStateFunc="setMPEscortPointState"
    ScaleFactor=1.5000000
    IconOffset=(X=-50.0000000,Y=0.0000000,Z=500.0000000)
}