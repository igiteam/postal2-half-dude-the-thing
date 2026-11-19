class LPAICmd_DefenderReactiveAttackBase extends LPAICmd_MedFlyerReactiveAttack within LPAIControllerDefender;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super.SetDesiredEnemy(InEnemy);
    StartTryingToFindingWithDrawPointAfterContactPoint();
    //return;    
}

final function StartTryingToFindingWithDrawPointAfterContactPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL displacementToLocationToStartLookingForWithDrawPoint;
    local /*0x97E50000-0x00000000*/ private float DistanceAwayToStartLookingForWithdrawPoint;
    local /*0x97E50000-0x00000000*/ private @NULL locationToStartLookingForWithDrawPoint;

    displacementToLocationToStartLookingForWithDrawPoint = Outer.myAIPawn.Location - EnemyForAttack.Location;
    displacementToLocationToStartLookingForWithDrawPoint.Z = 0.0000000;
    displacementToLocationToStartLookingForWithDrawPoint = Normal(displacementToLocationToStartLookingForWithDrawPoint);
    DistanceAwayToStartLookingForWithdrawPoint = Outer.DefenderPawn.TuneDataDefender.DistanceAwayToStartLookingForWithdrawPointAfterBumpingEnemy.GetValue();
    displacementToLocationToStartLookingForWithDrawPoint = displacementToLocationToStartLookingForWithDrawPoint * DistanceAwayToStartLookingForWithdrawPoint;
    locationToStartLookingForWithDrawPoint = displacementToLocationToStartLookingForWithDrawPoint + EnemyForAttack.Location;
    Outer.StartFindWithdrawToSpotTraversal(EnemyForAttack, locationToStartLookingForWithDrawPoint, Outer.DefenderPawn.TuneDataDefender.MaxDistanceToExploreGraphFromStartLocWhileLookingForWithdrawPointAfterBumpingEnemy.GetValue(), Outer.IsValidWithdrawAfterEnemyBumpToPosition, Outer.FindWithdrawAfterEnemyBumpToSpotTraversalFinished, Outer.FindWithdrawAfterEnemyBumpToSpotTraversalAborted);
    //return;    
}
