class LPAICmd_SpitterTailStingQuickVS extends LPAICmd_SpitterTailStingVS within LPAIControllerSpitter;

function Pushed()
{
    super.Pushed();
    // End:0xD2
    if(Outer.SpitterPawn.bAggressiveAttackSelection)
    {
        DelayBetweenStrikes = Outer.SpitterPawn.TuneDataSpitter.Aggressive_Overrides.QuickTailSting.DelayBetweenStrikesVS.GetValue();        
    }
    else
    {
        DelayBetweenStrikes = Outer.SpitterPawn.TuneDataSpitter.TailStingQuick_DelayBetweenStrikesVS.GetValue();
    }
    AttackSeperation_TailSting = Outer.SpitterPawn.AttackSeperation_TailStingVs;
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function GetTailStuckTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 0.0000000;
    //return ReturnValue;    
}

function IsItTimeToUnStuckTail()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
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
    // End:0xF1
    if((MyFacing Dot RelativeDirection) > float(0))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    LPSMClassStingIn=Class'LPSM_SpitterAttackTailStingVSQuickIn'
    LPSMClassStingQuickIn=Class'LPSM_SpitterAttackTailStingQuickRepeat'
}