class LPAIObjectiveKismetAttackMortarBase extends LPAIObjectiveAttackActor within LPAIController
    config(AI)
    hidecategories(Object,Object,Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MortarAttackSetupInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LocationToLaunchFrom;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private const @NULL TheTarget;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHaveValidData;

function OnCommandAborted()
{
    super(SPAIObjective).OnCommandAborted();
    //return;    
}

function OnCommandFinished()
{
    super.OnCommandFinished();
    // End:0x9C
    if((Outer.AIObjectiveManager != none) && Outer.AIObjectiveManager.CanTick())
    {
        Outer.AIObjectiveManager.RemoveObjective(self);
    }
    //return;    
}

event Abort()
{
    super(SPAIObjective).Abort();
    //return;    
}

event IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL closeEnemy;
    local /*0x97E50000-0x00000000*/ private float rangeToCloseEnemy;

    // End:0x9C
    if((TheTarget != none) && bHaveValidData)
    {
        // End:0x99
        if(!TheTarget.IsPendingKill() && !Outer.IsAnyEnemyTooClose(MortarAttackSetupInfo.RangeToAnyEnemyToQuitAttack, true, closeEnemy, rangeToCloseEnemy))
        {
            return true;
        }        
    }
    else
    {
        // End:0x112
        if((LocationToLaunchFrom != none) && bHaveValidData)
        {
            // End:0x10F
            if(!Outer.IsAnyEnemyTooClose(MortarAttackSetupInfo.RangeToAnyEnemyToQuitAttack, true, closeEnemy, rangeToCloseEnemy))
            {
                return true;
            }            
        }
        else
        {
            // End:0x176
            if(super.IsValid() && !Outer.IsAnyEnemyTooClose(MortarAttackSetupInfo.RangeToAnyEnemyToQuitAttack, true, closeEnemy, rangeToCloseEnemy))
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

event CanBeActivated()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(HasFinished())
    {
        return false;
    }
    return super(LPAIObjectiveAttack).CanBeActivated();
    //return ReturnValue;    
}

function InitFromKismet()
{
    local /*0x97E50000-0x00000000*/ private @NULL InKismetObjectiveData[8388609], KismetData;

    KismetData = LPAIOD_MortarAttackBase(InKismetObjectiveData);
    bHaveValidData = KismetData != none;
    // End:0x4B5
    if(bHaveValidData)
    {
        // End:0x98
        if(LPPawn(KismetData.TheLobTarget) != none)
        {
            TheTarget = KismetData.TheLobTarget;            
        }
        else
        {
            // End:0x164
            if((Controller(KismetData.TheLobTarget) != none) && LPPawn(Controller(KismetData.TheLobTarget).Pawn) != none)
            {
                TheTarget = LPPawn(Controller(KismetData.TheLobTarget).Pawn);                
            }
            else
            {
                TheTarget = KismetData.TheLobTarget;
            }
        }
        LocationToLaunchFrom = KismetData.LocationToLaunchFrom;
        MortarAttackSetupInfo.MinDelayBetweenLobStrikes = KismetData.MinDelayBetweenLobStrikes;
        MortarAttackSetupInfo.MaxDelayBetweenLobStrikes = KismetData.MaxDelayBetweenLobStrikes;
        MortarAttackSetupInfo.MinRangeToLaunchFrom = KismetData.MinRangeToLaunchFrom;
        MortarAttackSetupInfo.MaxRangeToLaunchFrom = KismetData.MaxRangeToLaunchFrom;
        MortarAttackSetupInfo.DistanceErrorBuffer = KismetData.DistanceErrorBuffer;
        MortarAttackSetupInfo.bUseCombatManager = KismetData.bUseCombatManager;
        MortarAttackSetupInfo.MinLobStrikesBetweenDamageAssessments = KismetData.MinLobStrikesBetweenDamageAssessments;
        MortarAttackSetupInfo.MaxLobStrikesBetweenDamageAssessments = KismetData.MaxLobStrikesBetweenDamageAssessments;
        MortarAttackSetupInfo.MinDurationOfDamageAssessmentInSecs = KismetData.MinDurationOfDamageAssessmentInSecs;
        MortarAttackSetupInfo.MaxDurationOfDamageAssessmentInSecs = KismetData.MaxDurationOfDamageAssessmentInSecs;
        MortarAttackSetupInfo.bCheckToSeeIfAnyEnemyHasGottenToCloseAndNeedsToQuitAttack = KismetData.bCheckToSeeIfAnyEnemyHasGottenToCloseAndNeedsToQuitAttack;
        MortarAttackSetupInfo.RangeToAnyEnemyToQuitAttack = KismetData.RangeToAnyEnemyToQuitAttack;
        // End:0x49A
        if(TheTarget != none)
        {
            bHaveValidData = true;            
        }
        else
        {
            // End:0x4B5
            if(LocationToLaunchFrom != none)
            {
                bHaveValidData = true;
            }
        }
    }
    //return;    
}

static function @NULL FindExistingObjective()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, EnemyCandidate, ReturnValue, foundObj, CurObjective,
	    targetToCheckFor;

    // End:0x2E
    if(LPPawn(EnemyCandidate) != none)
    {
        targetToCheckFor = EnemyCandidate;        
    }
    else
    {
        // End:0xBB
        if((Controller(EnemyCandidate) != none) && LPPawn(Controller(EnemyCandidate).Pawn) != none)
        {
            targetToCheckFor = LPPawn(Controller(EnemyCandidate).Pawn);            
        }
        else
        {
            targetToCheckFor = EnemyCandidate;
        }
    }
    // End:0x1C2
    foreach InObjectiveManager.AllObjectivesWithAttributes(Class'LPAIObjectiveKismetAttackMortarBase', InAttributes, CurObjective)
    {
        foundObj = LPAIObjectiveKismetAttackMortarBase(CurObjective);
        // End:0x1C1
        if(foundObj != none)
        {
            // End:0x1C1
            if((foundObj.EnemyInfo.Info.Actor == targetToCheckFor) || foundObj.TheTarget == targetToCheckFor)
            {                
                return foundObj;
            }
        }        
    }    
    return none;
    //return ReturnValue;    
}

static function @NULL FindExistingObjectiveForFixedMortarFromSightWithNoGivenEnemy()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes, TestLocationToLaunchFrom, ReturnValue, foundObj, CurObjective;

    // End:0xC4
    foreach InObjectiveManager.AllObjectivesWithAttributes(Class'LPAIObjectiveKismetAttackMortarBase', InAttributes, CurObjective)
    {
        foundObj = LPAIObjectiveKismetAttackMortarBase(CurObjective);
        // End:0xC3
        if(foundObj != none)
        {
            // End:0xC3
            if(foundObj.LocationToLaunchFrom == TestLocationToLaunchFrom)
            {
                // End:0xC3
                if(foundObj.TheTarget == none)
                {                    
                    return foundObj;
                }
            }
        }        
    }    
    return none;
    //return ReturnValue;    
}

static event @NULL GenerateObjectives()
{
    local /*0x97E50000-0x00000000*/ private @NULL OuterController[8388609], InObjectiveManager, InAttributes;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL curObj, EnemyCandidate, curKismetMotarData;

    // End:0x51D
    if(InAttributes.KismetObjectiveData != none)
    {
        curKismetMotarData = LPAIOD_MortarAttackBase(InAttributes.KismetObjectiveData);
        // End:0x393
        if((curKismetMotarData != none) && curKismetMotarData.TheLobTarget != none)
        {
            // End:0xDE
            if(LPPawn(curKismetMotarData.TheLobTarget) != none)
            {
                EnemyCandidate = curKismetMotarData.TheLobTarget;                
            }
            else
            {
                // End:0x1AA
                if((Controller(curKismetMotarData.TheLobTarget) != none) && LPPawn(Controller(curKismetMotarData.TheLobTarget).Pawn) != none)
                {
                    EnemyCandidate = LPPawn(Controller(curKismetMotarData.TheLobTarget).Pawn);                    
                }
                else
                {
                    EnemyCandidate = curKismetMotarData.TheLobTarget;
                }
            }
            curObj = FindExistingObjective(InObjectiveManager, InAttributes, EnemyCandidate);
            // End:0x38E
            if(curObj == none)
            {
                OuterController.AddTarget(EnemyCandidate);
                I = OuterController.GetTargetIndex(EnemyCandidate);
                // End:0x2C2
                if(I >= 0)
                {
                    CreateNewObjectiveForEnemy(InObjectiveManager, InAttributes, OuterController.TargetList[I]);
                    return;                    
                }
                else
                {
                    OuterController.AILog_Internal(("GenerateObjectives -- Could not create a AI Target out of given target: " @ string(curKismetMotarData.TheLobTarget)) @ " - so now all sorts of bad things are going to happen!!!");
                }                
            }
            else
            {
                return;
            }            
        }
        else
        {
            // End:0x51D
            if((curKismetMotarData != none) && curKismetMotarData.LocationToLaunchFrom != none)
            {
                OuterController.AILog_Internal(("GenerateObjectives -- Does not have Designated enemy to attack but has LocationToLaunchFrom: " @ string(curKismetMotarData.LocationToLaunchFrom)) @ " - so Will now try to handle the attack with out a target");
                curObj = FindExistingObjectiveForFixedMortarFromSightWithNoGivenEnemy(InObjectiveManager, InAttributes, curKismetMotarData.LocationToLaunchFrom);
                // End:0x51B
                if(curObj == none)
                {
                    CreateNewObjectiveForFixedMortarFromSightWithNoGivenEnemy(InObjectiveManager, InAttributes);
                    return;                    
                }
                else
                {
                    return;
                }
            }
        }
    }
    I = 0;
    J0x528:

    // End:0x70B [Loop If]
    if(I < OuterController.TargetList.Length)
    {
        EnemyCandidate = OuterController.TargetList[I].Actor;
        // End:0x6FD
        if((EnemyCandidate != none) && OuterController.CanBeMyEnemy(EnemyCandidate))
        {
            curObj = FindExistingObjective(InObjectiveManager, InAttributes, EnemyCandidate);
            // End:0x6B9
            if(curObj != none)
            {
                // End:0x6B6
                if((OuterController.WorldInfo.TimeSeconds - curObj.TimeUpdated) >= float(1))
                {
                    curObj.UpdateTarget(OuterController.TargetList[I]);
                }                
            }
            else
            {
                CreateNewObjectiveForEnemy(InObjectiveManager, InAttributes, OuterController.TargetList[I]);
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x528;
    }
    //return;    
}

static function @NULL CreateNewObjectiveForFixedMortarFromSightWithNoGivenEnemy()
{
    local /*0x97E50000-0x00000400*/ private @NULL InObjectiveManager[8388609], InAttributes;

    //return;    
}

defaultproperties
{
    MortarAttackSetupInfo=(bUseCombatManager=true,bCheckToSeeIfAnyEnemyHasGottenToCloseAndNeedsToQuitAttack=true,RangeToAnyEnemyToQuitAttack=600.0000000,MinDelayBetweenLobStrikes=-1.0000000,MaxDelayBetweenLobStrikes=-1.0000000,MinLobStrikesBetweenDamageAssessments=-1,MaxLobStrikesBetweenDamageAssessments=-1,MinDurationOfDamageAssessmentInSecs=3.0000000,MaxDurationOfDamageAssessmentInSecs=4.0000000,MinRangeToLaunchFrom=1000.0000000,MaxRangeToLaunchFrom=2000.0000000,DistanceErrorBuffer=50.0000000,MinHeightDelta=-1000.0000000,MaxHeightDelta=1000.0000000,HeightErrorBuffer=100.0000000,bUseHeightInsteadOfPitchForEvaluations=true,MaxPitchAllowedInDegrees=90.0000000,MinPitchAllowedInDegrees=-90.0000000,PitchErrorBufferInDegrees=5.0000000)
    bRangedAttack=true
    Attribute=(bRemoveWhenFinished=true)
}