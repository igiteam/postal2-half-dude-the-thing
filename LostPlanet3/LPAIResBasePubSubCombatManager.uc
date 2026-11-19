class LPAIResBasePubSubCombatManager extends SPAIResource within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

struct native PublishedAttackOption
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
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeBestOptionWasChosen;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array StrikeTimeInfoByTypeOfAttackList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AttackTimeInfoByTypeOfAttackList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxActiveOptions;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BestOption;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BackUpOption;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastOptionUtilized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ActiveOptions;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AttackTypeValue;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPurging;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AbsoluteMaxTimeToAllowAndAttackToHoldBestOption[1073741825];

// Export ULPAIResBasePubSubCombatManager::execGetAccess(FFrame&, void* const)
native function GetAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    false                    
}

// Export ULPAIResBasePubSubCombatManager::execUpdate(FFrame&, void* const)
native function Update();

// Export ULPAIResBasePubSubCombatManager::execRetractAllOptionsForThisPublisher(FFrame&, void* const)
native function RetractAllOptionsForThisPublisher()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackPublisher[8388609];


}

// Export ULPAIResBasePubSubCombatManager::execDoesPublisherHaveActiveOption(FFrame&, void* const)
native function DoesPublisherHaveActiveOption()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackPublisher[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function Init()
{
    super.Init();
    BestOption.AttackPublisher = none;
    LastOptionUtilized.AttackPublisher = none;
    BackUpOption.AttackPublisher = none;
    ClearActiveOptions(none);
    bPurging = false;
    LastManagerUpdateTime = 0.0000000;
    TimeOfLastAttack = -1.0000000;
    LastTimeBestOptionWasChosen = -1.0000000;
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

function ForceOnlyFullPhysicalAttacks()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ForceOnlyRangedLobAttacks()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function CleanOutAllAttackOptions()
{
    PublishedAttackOptions.Remove(0, PublishedAttackOptions.Length);    
    //return;    
}

event GetAttackOptionByPublisher()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackPublisher[8388609], NewOption;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x11
    if(AttackPublisher == none)
    {
        return false;
    }
    I = 0;
    J0x1C:

    // End:0x95 [Loop If]
    if(I < ActiveOptions.Length)
    {
        // End:0x87
        if(AttackPublisher == ActiveOptions[I].AttackPublisher)
        {
            NewOption = ActiveOptions[I];
            return true;
        }
        I++;
        // [Loop Continue]
        goto J0x1C;
    }
    return false;
    //return ReturnValue;    
}

event ClearActiveOptions()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackPublisher[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x8D [Loop If]
    if(I < ActiveOptions.Length)
    {
        // End:0x7F
        if((AttackPublisher == none) || AttackPublisher == ActiveOptions[I].AttackPublisher)
        {
            ActiveOptions.Remove(I--, 1);            
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
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

function IsOwnerVitalSuit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PawnOwner;

    PawnOwner = LPBaseVSPlayerPawn(Outer.ResourceManagerOuter);
    // End:0x42
    if(PawnOwner != none)
    {
        return true;
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

    // End:0x113
    if(DoesPublisherHaveActiveOption(AttackPublisher))
    {
        iter = 0;
        J0x21:

        // End:0x110 [Loop If]
        if(iter < StrikeTimeInfoByTypeOfAttackList.Length)
        {
            // End:0x102
            if(int(StrikeTimeInfoByTypeOfAttackList[iter].StrikeType) == int(TypeOfAttack))
            {
                timeAfterWhichNextStrikeIsAllowed = StrikeTimeInfoByTypeOfAttackList[iter].TimeForNextStrike;
                // End:0x100
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
            goto J0x21;
        }        
    }
    return false;
    //return ReturnValue;    
}

function ChangeTimeBetweenStrikeOfThisType()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private float NewMinTime[8388609], NewMaxTime;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private float timeAfterWhichNextStrikeIsAllowed;

    iter = 0;
    J0x0B:

    // End:0x1B1 [Loop If]
    if(iter < StrikeTimeInfoByTypeOfAttackList.Length)
    {
        // End:0x1A3
        if(int(StrikeTimeInfoByTypeOfAttackList[iter].StrikeType) == int(TypeOfAttack))
        {
            StrikeTimeInfoByTypeOfAttackList[iter].MinTimeBetweenStrikes = NewMinTime;
            StrikeTimeInfoByTypeOfAttackList[iter].MaxTimeBetweenStrikes = NewMaxTime;
            timeAfterWhichNextStrikeIsAllowed = RandRange(StrikeTimeInfoByTypeOfAttackList[iter].MinTimeBetweenStrikes, StrikeTimeInfoByTypeOfAttackList[iter].MaxTimeBetweenStrikes);
            StrikeTimeInfoByTypeOfAttackList[iter].TimeForNextStrike = Outer.ResourceManagerOuter.WorldInfo.TimeSeconds + timeAfterWhichNextStrikeIsAllowed;
            return true;
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

function HasEnoughTimeExpiredBetweenAttacks()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float timeAfterWhichNextAttackIsAllowed;
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0xFA [Loop If]
    if(iter < AttackTimeInfoByTypeOfAttackList.Length)
    {
        // End:0xEC
        if(int(AttackTimeInfoByTypeOfAttackList[iter].StrikeType) == int(TypeOfAttack))
        {
            timeAfterWhichNextAttackIsAllowed = AttackTimeInfoByTypeOfAttackList[iter].TimeForNextStrike;
            // End:0xEA
            if(Outer.ResourceManagerOuter.WorldInfo.TimeSeconds > timeAfterWhichNextAttackIsAllowed)
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
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

function ChangeTimeBetweenAttacksOfThisType()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private float NewMinTime[8388609], NewMaxTime;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private float timeAfterWhichNextStrikeIsAllowed;

    iter = 0;
    J0x0B:

    // End:0x1B1 [Loop If]
    if(iter < AttackTimeInfoByTypeOfAttackList.Length)
    {
        // End:0x1A3
        if(int(AttackTimeInfoByTypeOfAttackList[iter].StrikeType) == int(TypeOfAttack))
        {
            AttackTimeInfoByTypeOfAttackList[iter].MinTimeBetweenStrikes = NewMinTime;
            AttackTimeInfoByTypeOfAttackList[iter].MaxTimeBetweenStrikes = NewMaxTime;
            timeAfterWhichNextStrikeIsAllowed = RandRange(AttackTimeInfoByTypeOfAttackList[iter].MinTimeBetweenStrikes, AttackTimeInfoByTypeOfAttackList[iter].MaxTimeBetweenStrikes);
            AttackTimeInfoByTypeOfAttackList[iter].TimeForNextStrike = Outer.ResourceManagerOuter.WorldInfo.TimeSeconds + timeAfterWhichNextStrikeIsAllowed;
            return true;
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

event ChooseNewAttackOption()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], battackSelected;

    battackSelected = false;
    // End:0xC9
    if((PublishedAttackOptions.Length > 0) && ActiveOptions.Length < MaxActiveOptions)
    {
        FindBestOption();
        // End:0x83
        if(BestOption.AttackPublisher != none)
        {
            battackSelected = TellPublisherToPerformThisBehavior(BestOption);            
        }
        else
        {
            // End:0xC6
            if(BackUpOption.AttackPublisher != none)
            {
                battackSelected = TellPublisherToPerformThisBehavior(BestOption);                
            }
        }        
    }
    else
    {
        // End:0xDC
        if(PublishedAttackOptions.Length == 0)
        {            
        }
    }
    return battackSelected;
    //return ReturnValue;    
}

function HandlePostPublisherAcceptanceOfAttackOptionProcessing()
{
    local /*0x97E50000-0x00000000*/ private @NULL Option2Perform[25296897], optionToAdd;

    LastTimeBestOptionWasChosen = Outer.ResourceManagerOuter.WorldInfo.TimeSeconds;
    optionToAdd = Option2Perform;
    optionToAdd.TimeAttackWasFirstValid = Outer.ResourceManagerOuter.WorldInfo.TimeSeconds;
    ActiveOptions.AddItem(optionToAdd);    
    LastOptionUtilized = Option2Perform;
    PublishedAttackOptions.RemoveItem(Option2Perform);    
    SetNextAllowedAttackTimeAfterSuccessfulAttack();
    //return;    
}

function TellPublisherToPerformThisBehavior()
{
    local /*0x97E50000-0x00000000*/ private @NULL Option2Perform[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], battackConfirmed;

    battackConfirmed = false;
    // End:0x7F
    if(Option2Perform.AttackPublisher.OnEngagementAttackOptionApproved(Option2Perform.TypeOfAttack))
    {
        HandlePostPublisherAcceptanceOfAttackOptionProcessing(Option2Perform);
        battackConfirmed = true;        
    }
    else
    {
        ClearActiveOptions(Option2Perform.AttackPublisher);
    }
    return battackConfirmed;
    //return ReturnValue;    
}

function SetNextAllowedAttackTimeAfterSuccessfulAttack()
{
    //return;    
}

function FindBestOption()
{
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private float testAttackVal, bestAttackVal, evalAttacksCurrentAttackDesirability, bestAttacksCurrentAttackDesirability;

    BestOption.AttackPublisher = none;
    BackUpOption.AttackPublisher = none;
    // End:0x37E
    if(PublishedAttackOptions.Length > 0)
    {
        BestOption = PublishedAttackOptions[0];
        bestAttacksCurrentAttackDesirability = BestOption.AttackPublisher.GetCurrentAttackDesirabilityScaler(BestOption.TypeOfAttack, Outer.ResourceManagerOuter);
        // End:0x111
        if(!HasEnoughTimeExpiredBetweenAttacks(BestOption.TypeOfAttack))
        {
            bestAttacksCurrentAttackDesirability = -1.0000000;
        }
        iter = 0;
        iter = 1;
        J0x127:

        // End:0x37E [Loop If]
        if(iter < PublishedAttackOptions.Length)
        {
            // End:0x17E
            if(BackUpOption.AttackPublisher == none)
            {
                BackUpOption = PublishedAttackOptions[iter];
            }
            evalAttacksCurrentAttackDesirability = PublishedAttackOptions[iter].AttackPublisher.GetCurrentAttackDesirabilityScaler(PublishedAttackOptions[iter].TypeOfAttack, Outer.ResourceManagerOuter);
            // End:0x24C
            if(!HasEnoughTimeExpiredBetweenAttacks(PublishedAttackOptions[iter].TypeOfAttack))
            {
                evalAttacksCurrentAttackDesirability = -1.0000000;
            }
            bestAttackVal = (AttackTypeValue[int(BestOption.TypeOfAttack)] * BestOption.DesirabilityOfAttackScaler) * bestAttacksCurrentAttackDesirability;
            testAttackVal = (AttackTypeValue[int(PublishedAttackOptions[iter].TypeOfAttack)] * PublishedAttackOptions[iter].DesirabilityOfAttackScaler) * evalAttacksCurrentAttackDesirability;
            // End:0x370
            if(testAttackVal > bestAttackVal)
            {
                BackUpOption = BestOption;
                BestOption = PublishedAttackOptions[iter];
                bestAttacksCurrentAttackDesirability = evalAttacksCurrentAttackDesirability;
            }
            iter++;
            // [Loop Continue]
            goto J0x127;
        }
    }
    // End:0x3CD
    if(bestAttacksCurrentAttackDesirability <= 0.0000000)
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
    local /*0x97E50000-0x00000000*/ private @NULL NewOption, currentOption;

    false
    bshoudldAttackImmediately = false;
    RemoveAnyOtherAttacksOfThisTypeForThisPublisher(AttackPublisher, TypeOfAttack);
    NewOption.AttackPublisher = AttackPublisher;
    NewOption.TypeOfAttack = TypeOfAttack;
    NewOption.DesirabilityOfAttackScaler = PublishersDesirabilityOfAttackScaler;
    NewOption.TimeAttackWasFirstValid = Outer.ResourceManagerOuter.WorldInfo.TimeSeconds;
    PublishedAttackOptions.AddItem(NewOption);    
    // End:0x19C
    if(bForceChoice && DoesPublisherHaveActiveOption(AttackPublisher))
    {
        GetAttackOptionByPublisher(AttackPublisher, currentOption);
        // End:0x19C
        if(int(currentOption.TypeOfAttack) == int(TypeOfAttack))
        {
            ClearActiveOptions(AttackPublisher);
        }
    }
    // End:0x231
    if(!bPurging)
    {
        // End:0x22E
        if(bForceChoice)
        {
            // End:0x1DA
            if(IsOwnerStillActiveTarget())
            {
                bshoudldAttackImmediately = ChooseNewAttackOption();
            }
            // End:0x222
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

event RetractAllOptionsForThisTypeOfAttack()
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
    local /*0x97E50000-0x00000000*/ private float CurTime, timeSinceActiveOptionWasChosen;

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
    // End:0x299
    if((ActiveOptions.Length > 0) && AbsoluteMaxTimeToAllowAndAttackToHoldBestOption > 0.0000000)
    {
        iter = 0;
        J0x163:

        // End:0x299 [Loop If]
        if(iter < ActiveOptions.Length)
        {
            // End:0x28B
            if(ActiveOptions[iter].AttackPublisher != none)
            {
                timeSinceActiveOptionWasChosen = CurTime - ActiveOptions[iter].TimeAttackWasFirstValid;
                // End:0x28B
                if(timeSinceActiveOptionWasChosen > AbsoluteMaxTimeToAllowAndAttackToHoldBestOption)
                {
                    ActiveOptions[iter].AttackPublisher.OnEngagementAttackOptionPurged(ActiveOptions[iter].TypeOfAttack);
                    ClearActiveOptions(ActiveOptions[iter].AttackPublisher);
                }
            }
            iter++;
            // [Loop Continue]
            goto J0x163;
        }
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
    local /*0x97E50000-0x00000000*/ private int iter;

    // End:0x164
    if(DoesPublisherHaveActiveOption(AttackPublisher))
    {
        iter = 0;
        J0x21:

        // End:0x161 [Loop If]
        if(iter < StrikeTimeInfoByTypeOfAttackList.Length)
        {
            // End:0x153
            if(int(StrikeTimeInfoByTypeOfAttackList[iter].StrikeType) == int(TypeOfAttack))
            {
                timeAfterWhichNextStrikeIsAllowed = RandRange(StrikeTimeInfoByTypeOfAttackList[iter].MinTimeBetweenStrikes, StrikeTimeInfoByTypeOfAttackList[iter].MaxTimeBetweenStrikes);
                StrikeTimeInfoByTypeOfAttackList[iter].TimeForNextStrike = Outer.ResourceManagerOuter.WorldInfo.TimeSeconds + timeAfterWhichNextStrikeIsAllowed;
            }
            ++iter;
            // [Loop Continue]
            goto J0x21;
        }        
    }
    return false;
    //return ReturnValue;    
}

function ProcessAttackCompletedForNextAttackTime()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackPublisher[8388609];
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private float timeAfterWhichNextAttackIsAllowed;
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x14B [Loop If]
    if(iter < AttackTimeInfoByTypeOfAttackList.Length)
    {
        // End:0x13D
        if(int(AttackTimeInfoByTypeOfAttackList[iter].StrikeType) == int(TypeOfAttack))
        {
            timeAfterWhichNextAttackIsAllowed = RandRange(AttackTimeInfoByTypeOfAttackList[iter].MinTimeBetweenStrikes, AttackTimeInfoByTypeOfAttackList[iter].MaxTimeBetweenStrikes);
            AttackTimeInfoByTypeOfAttackList[iter].TimeForNextStrike = Outer.ResourceManagerOuter.WorldInfo.TimeSeconds + timeAfterWhichNextAttackIsAllowed;
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function NotifyOfAttackCompleted()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackPublisher[8388609];
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAllreadyAssumedCurrentAttackIsDone[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL myAttackOption;

    false
    ProcessAttackCompletedForNextAttackTime(AttackPublisher, TypeOfAttack);
    // End:0x110
    if(GetAttackOptionByPublisher(AttackPublisher, myAttackOption))
    {
        // End:0x110
        if(int(myAttackOption.TypeOfAttack) == int(TypeOfAttack))
        {
            // End:0xED
            if(myAttackOption.TimeAttackWasFirstValid != Outer.ResourceManagerOuter.WorldInfo.TimeSeconds)
            {
                ClearActiveOptions(AttackPublisher);                
            }
            else
            {
                // End:0x110
                if(bAllreadyAssumedCurrentAttackIsDone)
                {
                    ClearActiveOptions(AttackPublisher);                    
                }
            }
        }
    }
    //return;    
}

function NotifyOfAttackFailedToStart()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackPublisher[8388609];
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myAttackOption;

    // End:0x62
    if((GetAttackOptionByPublisher(AttackPublisher, myAttackOption)) && int(myAttackOption.TypeOfAttack) == int(TypeOfAttack))
    {
        ClearActiveOptions(AttackPublisher);
    }
    //return;    
}

defaultproperties
{
    HowOfftenToUpdateTheManager=1.0000000
    HowOfftenToCleanOutOldOptions=5.0000000
    MaxActiveOptions=1
    AttackTypeValue=/* Array type was not detected. */
    AbsoluteMaxTimeToAllowAndAttackToHoldBestOption=-1.0000000
    UniqueName="BasePubSubCombatManager"
    MaxUsers=20
}