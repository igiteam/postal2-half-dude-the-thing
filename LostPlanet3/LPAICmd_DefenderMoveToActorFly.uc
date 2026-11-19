class LPAICmd_DefenderMoveToActorFly extends LPAICmd_MoveToActorFly within LPAIControllerDefender;

function Pushed()
{
    super.Pushed();
    //return;    
}

protected function SetReach()
{
    // End:0x80
    if((Outer.DefenderPawn.PawnThatLaunchedMe == none) || Outer.DefenderPawn.TargetPawnGivenByLauncher == none)
    {
        super(LPAICmd_MoveToActor).SetReach();
        return;
    }
    // End:0x13A
    if(((TargetActor != none) && !TargetActor.bBlockActors) && DesiredReachDistance > 0.0000000)
    {
        DesiredSeperation = 0.0000000;
        MinDistForReachedTest = DesiredReachDistance;
        MaxDistForReachedTest = MinDistForReachedTest * 1.2000000;
        Outer.Kynapse_PathFinderSetDistToTarget(MinDistForReachedTest, MaxDistForReachedTest);        
    }
    else
    {
        // End:0x17C
        if((TargetActor != none) && !TargetActor.IsPendingKill())
        {
            SetDefaultReachDist();            
        }
        else
        {
            SetReachDist(Outer.MyKynapseRadius, Outer.MyKynapseRadius * 1.2000000);
        }
    }
    //return;    
}

protected function OnFlyGoalChange()
{
    // End:0xD6
    if((MoveToActorStatus != none) && Outer.DefenderPawn != none)
    {
        // End:0xB5
        if((Outer.DefenderPawn.PawnThatLaunchedMe == none) || Outer.DefenderPawn.TargetPawnGivenByLauncher == none)
        {
            super.OnFlyGoalChange();
            return;
        }
        MoveToActorStatus.Cmd_Move_GoalIsOnAiMesh = true;
    }
    //return;    
}
