class LPAICmd_Objective extends LPAICommand within LPAIController
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ObjectiveStatus[536870913];

function Pushed()
{
    super.Pushed();
    Outer.ScriptedFocus = none;
    Outer.ScriptedMoveTarget = none;
    Outer.ResetRotationRate();
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function SetReturnCmdStatus()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnStatus[8388609];

    super.SetReturnCmdStatus(ReturnStatus);
    ObjectiveStatus = LPAICmdStatus_Objective(ReturnStatus);
    //return;    
}
