class LPAICmd_FireWaspOrbitPof_MP extends LPAICmd_FireWaspOrbitPof within LPAIControllerFireWasp;

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

function DoPhysicalAttack()
{
    Outer.bMeleeFinished = false;
    StopPocessLookForAttackOpportunityTimer();
    CurrentAttackCmd = Outer.CmdFireWaspRamAttack(EnemyForAttack,, 1);
    //return;    
}

function AttackEnemyFromOrbitSlot()
{
    // End:0x20
    if(int(TypeOfAttackToldToPerform) == int(13))
    {
        DoPhysicalAttack();
        return;
    }
    super.AttackEnemyFromOrbitSlot();
    //return;    
}

function IsThereClearDirectFireAttackLaneFromGivenLoc()
{
    local /*0x97E50000-0x00000000*/ private @NULL PointToStrikeFrom[8388609];
    local /*0x97E50000-0x00000000*/ private int CurrentTierToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc, HitNorm, HitInfo, HitActor, Dir, EndTrace;

    local /*0x97E50000-0x00000000*/ private float Dist;

    Dir = PointToStrikeFrom - EnemyForAttack.Location;
    Dist = VSize(Dir);
    Dir = Normal(Dir);
    Dist -= float(250);
    // End:0x8C
    if(Dist < float(0))
    {
        Dist = 50.0000000;
    }
    EndTrace = PointToStrikeFrom + (Dir * Dist);
    HitActor = Outer.Trace(HitLoc, HitNorm, EndTrace, PointToStrikeFrom, true,, HitInfo, Outer.@NULL, @NULL, , HitActor, EnemyForAttack);    
    return true;
    return false;
    //return ReturnValue;    
    @NULL
    /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
        
    */

    /*@Error*/
}

function ShouldTryFullPhysicalAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function FlyAttackEnemyFromHere()
{
    // End:0x20
    if(int(TypeOfAttackToldToPerform) == int(13))
    {
        DoPhysicalAttack();
        return;
    }
    // End:0x4F
    if(!Outer.IsEnemyVisible(EnemyForAttack))
    {
        return;
    }
    super.FlyAttackEnemyFromHere();
    //return;    
}
