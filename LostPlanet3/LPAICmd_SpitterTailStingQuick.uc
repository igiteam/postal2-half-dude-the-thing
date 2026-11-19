class LPAICmd_SpitterTailStingQuick extends LPAICmd_SpitterTailSting within LPAIControllerSpitter;

function Pushed()
{
    super.Pushed();
    // End:0xD2
    if(Outer.SpitterPawn.bAggressiveAttackSelection)
    {
        DelayBetweenStrikes = Outer.SpitterPawn.TuneDataSpitter.Aggressive_Overrides.QuickTailSting.DelayBetweenStrikesPof.GetValue();        
    }
    else
    {
        DelayBetweenStrikes = Outer.SpitterPawn.TuneDataSpitter.TailStingQuick_DelayBetweenStrikesPof.GetValue();
    }
    AttackSeperation_TailSting = Outer.SpitterPawn.AttackSeperation_TailStingPof;
    AttackSeperation_TailSting.Min *= 0.5000000;
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function IsInPositionForTailSting()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
            
        */

        // End:0x7D
        /*@Error*/
        return IsInAngularRangeForTailSting();
    }
    return false;
    //return ReturnValue;    
    @NULL
    default.@NULL
    @NULL
}

function IsInRangeForTailSting()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5C
    Outer.@NULL;
    {
        Seperation = EnemySeperation2D();
        return IsInRange(AttackSeperation_TailSting, Seperation);
    }
    //return ReturnValue;    
    @NULL
    default.@NULL
    @NULL
}

function IsInAngularRangeForTailSting()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL RelativeDirection, MyFacing;

    RelativeDirection = EnemyForStrike.Location - Outer.SpitterPawn.Location;
    RelativeDirection.Z = 0.0000000;
    RelativeDirection = Normal(RelativeDirection);
    MyFacing = Vector(Outer.SpitterPawn.Rotation);
    // End:0xF3
    if((MyFacing Dot RelativeDirection) > 0.9848077)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetTailStuckTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], MinTime, MaxTime, StuckTime;

    // End:0x13
    if(bReactive)
    {
        return 0.0000000;
    }
    StuckTime = 0.0000000;
    // End:0xEA
    if(Outer.SpitterPawn.bAggressiveAttackSelection)
    {
        StuckTime = Outer.SpitterPawn.TuneDataSpitter.Aggressive_Overrides.QuickTailSting.PercentChanceTailGettingStuckInGround.GetValue();        
    }
    else
    {
        StuckTime = Outer.SpitterPawn.TuneDataSpitter.PercentChanceTailGettingStuckInGroundForQuick.GetValue();
    }
    // End:0x175
    if(StuckTime < float(0))
    {
        StuckTime = 0.0000000;        
    }
    else
    {
        // End:0x196
        if(StuckTime > float(100))
        {
            StuckTime = 100.0000000;
        }
    }
    StuckTime /= float(100);
    // End:0x441
    if(FRand() <= StuckTime)
    {
        // End:0x30B
        if(Outer.SpitterPawn.bAggressiveAttackSelection)
        {
            MinTime = Outer.SpitterPawn.TuneDataSpitter.Aggressive_Overrides.QuickTailSting.MinTimeGettingStuckInGround.GetValue();
            MaxTime = Outer.SpitterPawn.TuneDataSpitter.Aggressive_Overrides.QuickTailSting.MaxTimeGettingStuckInGround.GetValue();            
        }
        else
        {
            MinTime = Outer.SpitterPawn.TuneDataSpitter.MinTimeGettingStuckInGroundForQuick.GetValue();
            MaxTime = Outer.SpitterPawn.TuneDataSpitter.MaxTimeGettingStuckInGroundForQuick.GetValue();
        }
        // End:0x41B
        if(MinTime < MaxTime)
        {
            StuckTime = RandRange(MinTime, MaxTime);            
        }
        else
        {
            StuckTime = RandRange(MaxTime, MinTime);
        }
    }
    return StuckTime;
    //return ReturnValue;    
}

defaultproperties
{
    bCmdAllowsEndOfEarlyAttack=true
    LPSMClassStingQuickIn=Class'LPSM_SpitterAttackTailStingQuickIn'
    LPSMClassStingQuickOut=Class'LPSM_SpitterAttackTailStingQuickOut'
}