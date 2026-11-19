class LPAICmd_VsLarocheHitReactionToStun extends LPAICmd_HitReactionToStun within LPAIControllerVsLaroche;

function Pushed()
{
    super(LPAICommand).Pushed();
    Outer.UpdateVsLightsOnStunStart();
    //return;    
}

function Popped()
{
    Outer.ResetLightsByStage();
    super(LPAICommand).Popped();
    //return;    
}

function DoneWithHitReactionPreStun()
{
    //return;    
}

function DoneWithStunPreRecovery()
{
    //return;    
}

defaultproperties
{
    HitReactionSpecialMove=none
}