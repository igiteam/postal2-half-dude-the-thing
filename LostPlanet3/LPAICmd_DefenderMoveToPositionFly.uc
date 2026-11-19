class LPAICmd_DefenderMoveToPositionFly extends LPAICmd_MoveToPositionFly within LPAIControllerDefender;

function Pushed()
{
    super.Pushed();
    //return;    
}

protected function OnFlyGoalChange()
{
    // End:0xD6
    if((MoveToPositionStatus != none) && Outer.DefenderPawn != none)
    {
        // End:0xB5
        if((Outer.DefenderPawn.PawnThatLaunchedMe == none) || Outer.DefenderPawn.TargetPawnGivenByLauncher == none)
        {
            super.OnFlyGoalChange();
            return;
        }
        MoveToPositionStatus.Cmd_Move_GoalIsOnAiMesh = true;
    }
    //return;    
}
