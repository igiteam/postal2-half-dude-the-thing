class LPAICmd_SpitterMelee extends LPAICmd_Melee within LPAIControllerSpitter
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIgnoreOtherWaitingAttackers[536870913];

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

function AreOtherSpittersWaitingToStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ResGroup, ResGroupMultiLocation;

    // End:0x0F
    if(bIgnoreOtherWaitingAttackers)
    {
        return false;
    }
    // End:0x1B7
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        ResGroup = SPAIResGroupLocation(EnemyForAttack.AIResourceManager.GetResourceGroup(Outer.MeleeResourceName));
        // End:0xFF
        if((ResGroup != none) && ResGroup.AreOtherUsersInStrikePosition(Outer.myAIPawn))
        {
            return true;            
        }
        else
        {
            ResGroupMultiLocation = SPAIResGroupMultiLocation(EnemyForAttack.AIResourceManager.GetResourceGroup(Outer.MeleeResourceName));
            // End:0x1B7
            if((ResGroupMultiLocation != none) && ResGroupMultiLocation.AreOtherUsersInStrikePosition(Outer.myAIPawn))
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

event NotifyAIResourceChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function SetMeleeExtents()
{
    // End:0x89
    if(Outer.ShouldUseMeleeResource())
    {
        EnemyForAttack.AIResourceManager.GetResourceLocationExtents(Outer.MeleeResourceName, MeleePatternCenter, MeleePatternRadius);        
    }
    else
    {
        super.SetMeleeExtents();
    }
    //return;    
}

function GetStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];

    -1.0000000
    false
    super(LPAICommand).GetStrikeAccess(TheEnemy, RevokeTolerance, bForced);
    Outer.LockStrikeAccess(false);
    //return;    
}

function ShouldFaceEnemyWhileMovingToSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float InPatternRadius;

    // End:0x27
    if(IsInState('MoveToMeleeSlotOnFormationChange') || IsInState('MoveToMeleeSlotOnRetreat'))
    {
        return true;        
    }
    else
    {
        SetMeleeExtents();
        InPatternRadius = MeleePatternRadius * 1.1000000;
        // End:0xA6
        if(VSizeSq(MeleePatternCenter - Outer.myAIPawn.Location) < (InPatternRadius * InPatternRadius))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

state MoveCloserToEnemy
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PrevStateName[8388609];

        super(SPStateObject).BeginState(PrevStateName);
        bCanStrikeBeforeReachingMeleeSlot = false;
        //return;        
    }
    stop;    
}

state StrikeWithClearence
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PrevStateName[8388609];

        super.BeginState(PrevStateName);
        Outer.myAIPawn.ZeroMovementVariables();
        //return;        
    }
    stop;    
}

defaultproperties
{
    bCanStrikeBeforeReachingMeleeSlot=true
    MinAttackRange=200.0000000
    MaxAttackRange=250.0000000
}