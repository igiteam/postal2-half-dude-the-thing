class LPAIResBurrowerCombatManager extends SPAIResource within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

struct native BurrowerAttackOption
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackPublisher;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte TypeOfAttack;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DesirabilityOfAttackScaler;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeAttackWasFirstValid;

    structdefaultproperties
    {
        AttackPublisher=none
        TypeOfAttack=eAiAttackType.eAiAttackType_None
        DesirabilityOfAttackScaler=0.0000000
        TimeAttackWasFirstValid=0.0000000
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PublishedAttackOptions;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HowOfftenToUpdateTheManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastManagerUpdateTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HowOfftenToCleanOutOldOptions;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTimeBetweenAttacks;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTimeBetweenAttacks;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array StrikeTimeInfoByTypeOfAttackList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeForNextAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BestOption;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BackUpOption;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastOptionUtilized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActiveOption;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AttackTypeValue;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPurging;

// Export ULPAIResBurrowerCombatManager::execGetAccess(FFrame&, void* const)
native function GetAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    false                    
}

// Export ULPAIResBurrowerCombatManager::execUpdate(FFrame&, void* const)
native function Update();

function Init()
{
    super.Init();
    BestOption.AttackPublisher = none;
    LastOptionUtilized.AttackPublisher = none;
    BackUpOption.AttackPublisher = none;
    ActiveOption.AttackPublisher = none;
    bPurging = false;
    LastManagerUpdateTime = 0.0000000;
    TimeForNextAttack = -1.0000000;
    //return;    
}

function SetFromTuneData()
{
    super.SetFromTuneData();
    //return;    
}

function Destroy()
{
    super.Destroy();
    //return;    
}

function ShutDown()
{
    PublishedAttackOptions.Remove(0, PublishedAttackOptions.Length);    
    super.ShutDown();
    //return;    
}

function CleanOutAllAttackOptions()
{
    PublishedAttackOptions.Remove(0, PublishedAttackOptions.Length);    
    //return;    
}

function ClearActiveOption()
{
    ActiveOption.AttackPublisher = none;
    ActiveOption.TypeOfAttack = 0;
    ActiveOption.DesirabilityOfAttackScaler = -1.0000000;
    ActiveOption.TimeAttackWasFirstValid = -1.0000000;
    //return;    
}

function IsOwnerStillActiveTarget()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PawnOwner;

    PawnOwner = LPPawn(Outer.ResourceManagerOuter);
    // End:0x60
    if(PawnOwner != none)
    {
        return PawnOwner.IsValidForAi();
    }
    return false;
    //return ReturnValue;    
}

function HasEnoughTimeExpiredBetweenStrikes()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackPublisher[8388609];
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float timeAfterWhichNextStrikeIsAllowed;
    local /*0x97E50000-0x00000000*/ private int iter;

    // End:0x158
    if(AttackPublisher == ActiveOption.AttackPublisher)
    {
        // End:0x155
        if(int(TypeOfAttack) == int(ActiveOption.TypeOfAttack))
        {
            iter = 0;
            J0x63:

            // End:0x152 [Loop If]
            if(iter < StrikeTimeInfoByTypeOfAttackList.Length)
            {
                // End:0x144
                if(int(StrikeTimeInfoByTypeOfAttackList[iter].StrikeType) == int(TypeOfAttack))
                {
                    timeAfterWhichNextStrikeIsAllowed = StrikeTimeInfoByTypeOfAttackList[iter].TimeForNextStrike;
                    // End:0x142
                    if(Outer.ResourceManagerOuter.WorldInfo.TimeSeconds > timeAfterWhichNextStrikeIsAllowed)
                    {
                        return true;                        
                    }
                    else
                    {
                        return false;
                    }
                }
                ++iter;
                // [Loop Continue]
                goto J0x63;
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

event ChooseNewAttackOption()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], battackSelected;

    battackSelected = false;
    // End:0xD3
    if((PublishedAttackOptions.Length > 0) && ActiveOption.AttackPublisher == none)
    {
        FindBestOption();
        // End:0x8D
        if(BestOption.AttackPublisher != none)
        {
            battackSelected = TellPublisherToPerformThisBehavior(BestOption);            
        }
        else
        {
            // End:0xD0
            if(BackUpOption.AttackPublisher != none)
            {
                battackSelected = TellPublisherToPerformThisBehavior(BestOption);                
            }
        }        
    }
    else
    {
        // End:0xE6
        if(PublishedAttackOptions.Length == 0)
        {            
        }
    }
    return battackSelected;
    //return ReturnValue;    
}

function TellPublisherToPerformThisBehavior()
{
    local /*0x97E50000-0x00000000*/ private @NULL Option2Perform[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], battackConfirmed;

    battackConfirmed = false;
    // End:0xA8
    if(Option2Perform.AttackPublisher.OnEngagementAttackOptionApproved(Option2Perform.TypeOfAttack))
    {
        ActiveOption = Option2Perform;
        LastOptionUtilized = Option2Perform;
        PublishedAttackOptions.RemoveItem(Option2Perform);        
        battackConfirmed = true;        
    }
    else
    {
        ClearActiveOption();
    }
    return battackConfirmed;
    //return ReturnValue;    
}

function SetNextAllowedAttackTimeAfterSuccessfulAttack()
{
    local /*0x97E50000-0x00000000*/ private float DelayTime;

    DelayTime = RandRange(MinTimeBetweenAttacks, MaxTimeBetweenAttacks);
    TimeForNextAttack = Outer.ResourceManagerOuter.WorldInfo.TimeSeconds + DelayTime;
    //return;    
}

function FindBestOption()
{
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private float testAttackVal, bestAttackVal, evalAttacksCurrentAttackDesirability, bestAttacksCurrentAttackDesirability;

    BestOption.AttackPublisher = none;
    BackUpOption.AttackPublisher = none;
    // End:0x300
    if(PublishedAttackOptions.Length > 0)
    {
        BestOption = PublishedAttackOptions[0];
        bestAttacksCurrentAttackDesirability = BestOption.AttackPublisher.GetCurrentAttackDesirabilityScaler(BestOption.TypeOfAttack, Outer.ResourceManagerOuter);
        iter = 0;
        iter = 1;
        J0xED:

        // End:0x300 [Loop If]
        if(iter < PublishedAttackOptions.Length)
        {
            // End:0x144
            if(BackUpOption.AttackPublisher == none)
            {
                BackUpOption = PublishedAttackOptions[iter];
            }
            evalAttacksCurrentAttackDesirability = PublishedAttackOptions[iter].AttackPublisher.GetCurrentAttackDesirabilityScaler(PublishedAttackOptions[iter].TypeOfAttack, Outer.ResourceManagerOuter);
            bestAttackVal = (AttackTypeValue[int(BestOption.TypeOfAttack)] * BestOption.DesirabilityOfAttackScaler) * bestAttacksCurrentAttackDesirability;
            testAttackVal = (AttackTypeValue[int(PublishedAttackOptions[iter].TypeOfAttack)] * PublishedAttackOptions[iter].DesirabilityOfAttackScaler) * evalAttacksCurrentAttackDesirability;
            // End:0x2F2
            if(testAttackVal > bestAttackVal)
            {
                BackUpOption = BestOption;
                BestOption = PublishedAttackOptions[iter];
                bestAttacksCurrentAttackDesirability = evalAttacksCurrentAttackDesirability;
            }
            iter++;
            // [Loop Continue]
            goto J0xED;
        }
    }
    // End:0x34F
    if(bestAttacksCurrentAttackDesirability < 0.0000000)
    {
        BestOption.AttackPublisher = none;
        BackUpOption.AttackPublisher = none;
    }
    //return;    
}

function PublishNewAttackOption()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackPublisher[8388609];
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private float PublishersDesirabilityOfAttackScaler[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForceChoice[9437185], ReturnValue, bshoudldAttackImmediately;
    local /*0x97E50000-0x00000000*/ private @NULL NewOption;

    false
    bshoudldAttackImmediately = false;
    RemoveAnyOtherAttacksOfThisTypeForThisPublisher(AttackPublisher, TypeOfAttack);
    NewOption.AttackPublisher = AttackPublisher;
    NewOption.TypeOfAttack = TypeOfAttack;
    NewOption.DesirabilityOfAttackScaler = PublishersDesirabilityOfAttackScaler;
    NewOption.TimeAttackWasFirstValid = Outer.ResourceManagerOuter.WorldInfo.TimeSeconds;
    PublishedAttackOptions.AddItem(NewOption);    
    // End:0x1AD
    if(bForceChoice && ActiveOption.AttackPublisher != none)
    {
        // End:0x1AD
        if(ActiveOption.AttackPublisher == AttackPublisher)
        {
            // End:0x1AD
            if(int(ActiveOption.TypeOfAttack) == int(TypeOfAttack))
            {
                ClearActiveOption();
            }
        }
    }
    // End:0x29A
    if(!bPurging)
    {
        // End:0x297
        if(bForceChoice || TimeForNextAttack < Outer.ResourceManagerOuter.WorldInfo.TimeSeconds)
        {
            // End:0x243
            if(IsOwnerStillActiveTarget())
            {
                bshoudldAttackImmediately = ChooseNewAttackOption();
            }
            // End:0x28B
            if(bshoudldAttackImmediately && BestOption.AttackPublisher == AttackPublisher)
            {
                bshoudldAttackImmediately = true;                
            }
            else
            {
                bshoudldAttackImmediately = false;
            }
        }        
    }
    return bshoudldAttackImmediately;
    //return ReturnValue;    
}

function RetractAllOptionsForThisPublisher()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackPublisher[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array attackOptionsToRemove;
    local /*0x97E50000-0x00000000*/ private int iter;

    // End:0x67
    if(ActiveOption.AttackPublisher == AttackPublisher)
    {
        // End:0x5D
        if(int(ActiveOption.TypeOfAttack) == int(13))
        {
            RetractAllOptionsForThisTypeOfAttack(13);
        }
        ClearActiveOption();
    }
    iter = 0;
    J0x72:

    // End:0xEC [Loop If]
    if(iter < PublishedAttackOptions.Length)
    {
        // End:0xDE
        if(PublishedAttackOptions[iter].AttackPublisher == AttackPublisher)
        {
            attackOptionsToRemove.AddItem(PublishedAttackOptions[iter]);            
        }
        iter++;
        // [Loop Continue]
        goto J0x72;
    }
    iter = 0;
    J0xF7:

    // End:0x13D [Loop If]
    if(iter < attackOptionsToRemove.Length)
    {
        PublishedAttackOptions.RemoveItem(attackOptionsToRemove[iter]);        
        iter++;
        // [Loop Continue]
        goto J0xF7;
    }
    //return;    
}

function RemoveAnyOtherAttacksOfThisTypeForThisPublisher()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackPublisher[8388609];
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0xB4 [Loop If]
    if(iter < PublishedAttackOptions.Length)
    {
        // End:0xA6
        if(PublishedAttackOptions[iter].AttackPublisher == AttackPublisher)
        {
            // End:0xA6
            if(int(PublishedAttackOptions[iter].TypeOfAttack) == int(TypeOfAttack))
            {
                PublishedAttackOptions.Remove(iter, 1);                
                return;
            }
        }
        iter++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function RetractAllOptionsForThisTypeOfAttack()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array attackOptionsToRemove;
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x89 [Loop If]
    if(iter < PublishedAttackOptions.Length)
    {
        // End:0x7B
        if(int(PublishedAttackOptions[iter].TypeOfAttack) == int(TypeOfAttack))
        {
            attackOptionsToRemove.AddItem(PublishedAttackOptions[iter]);            
        }
        iter++;
        // [Loop Continue]
        goto J0x0B;
    }
    iter = 0;
    J0x94:

    // End:0xDA [Loop If]
    if(iter < attackOptionsToRemove.Length)
    {
        PublishedAttackOptions.RemoveItem(attackOptionsToRemove[iter]);        
        iter++;
        // [Loop Continue]
        goto J0x94;
    }
    //return;    
}

event CleanOutOutOfDateAttackOptions()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array attackOptionsToRemove;
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private float CurTime;

    CurTime = Outer.ResourceManagerOuter.WorldInfo.TimeSeconds;
    iter = 0;
    J0x5D:

    // End:0xE2 [Loop If]
    if(iter < PublishedAttackOptions.Length)
    {
        // End:0xD4
        if((CurTime - PublishedAttackOptions[iter].TimeAttackWasFirstValid) >= HowOfftenToCleanOutOldOptions)
        {
            attackOptionsToRemove.AddItem(PublishedAttackOptions[iter]);            
        }
        iter++;
        // [Loop Continue]
        goto J0x5D;
    }
    iter = 0;
    J0xED:

    // End:0x133 [Loop If]
    if(iter < attackOptionsToRemove.Length)
    {
        PublishedAttackOptions.RemoveItem(attackOptionsToRemove[iter]);        
        iter++;
        // [Loop Continue]
        goto J0xED;
    }
    //return;    
}

function PurgeAllAttackOptions()
{
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private editfixedsize array attackOptionsToRemove;

    bPurging = true;
    iter = 0;
    J0x17:

    // End:0x5D [Loop If]
    if(iter < PublishedAttackOptions.Length)
    {
        attackOptionsToRemove.AddItem(PublishedAttackOptions[iter]);        
        ++iter;
        // [Loop Continue]
        goto J0x17;
    }
    PublishedAttackOptions.Length = 0;
    iter = 0;
    J0x74:

    // End:0xFC [Loop If]
    if(iter < attackOptionsToRemove.Length)
    {
        attackOptionsToRemove[iter].AttackPublisher.OnEngagementAttackOptionPurged(attackOptionsToRemove[iter].TypeOfAttack);
        ++iter;
        // [Loop Continue]
        goto J0x74;
    }
    attackOptionsToRemove.Length = 0;
    bPurging = false;
    //return;    
}

function NotifyOfStrikeActionCompleted()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackPublisher[8388609];
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float timeAfterWhichNextStrikeIsAllowed;

    // End:0x161
    if(AttackPublisher == ActiveOption.AttackPublisher)
    {
        // End:0x15E
        if(int(TypeOfAttack) == int(ActiveOption.TypeOfAttack))
        {
            // End:0x15B
            if(int(TypeOfAttack) < StrikeTimeInfoByTypeOfAttackList.Length)
            {
                timeAfterWhichNextStrikeIsAllowed = RandRange(StrikeTimeInfoByTypeOfAttackList[int(TypeOfAttack)].MinTimeBetweenStrikes, StrikeTimeInfoByTypeOfAttackList[int(TypeOfAttack)].MaxTimeBetweenStrikes);
                StrikeTimeInfoByTypeOfAttackList[int(TypeOfAttack)].TimeForNextStrike = Outer.ResourceManagerOuter.WorldInfo.TimeSeconds + timeAfterWhichNextStrikeIsAllowed;                
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

function NotifyOfAttackCompleted()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackPublisher[8388609];
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAllreadyAssumedCurrentAttackIsDone[9437185];

    false
    // End:0xF9
    if((ActiveOption.AttackPublisher == AttackPublisher) && int(ActiveOption.TypeOfAttack) == int(TypeOfAttack))
    {
        SetNextAllowedAttackTimeAfterSuccessfulAttack();
        // End:0xDF
        if(ActiveOption.TimeAttackWasFirstValid != Outer.ResourceManagerOuter.WorldInfo.TimeSeconds)
        {
            ClearActiveOption();            
        }
        else
        {
            // End:0xF9
            if(bAllreadyAssumedCurrentAttackIsDone)
            {
                ClearActiveOption();                
            }
        }
    }
    // End:0x130
    if(int(TypeOfAttack) == int(13))
    {
        RetractAllOptionsForThisTypeOfAttack(13);
        // End:0x130
        if(IsOwnerStillActiveTarget())
        {
            ChooseNewAttackOption();
        }
    }
    //return;    
}

function NotifyOfAttackFailedToStart()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackPublisher[8388609];
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];

    // End:0x64
    if((ActiveOption.AttackPublisher == AttackPublisher) && int(ActiveOption.TypeOfAttack) == int(TypeOfAttack))
    {
        ClearActiveOption();
    }
    //return;    
}

defaultproperties
{
    HowOfftenToUpdateTheManager=1.0000000
    HowOfftenToCleanOutOldOptions=5.0000000
    MinTimeBetweenAttacks=5.0000000
    MaxTimeBetweenAttacks=10.0000000
    AttackTypeValue=/* Array type was not detected. */
    UniqueName="BurrowerCombatManager"
    MaxUsers=10
}