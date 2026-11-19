class LPAIResMedFlyerFromOrbitSlotEngagement extends LPAIResBasePubSubCombatManager within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOfRangedAttacksCompletedSinceLastFullPhysicalAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int HowManyRangedAttacksRequiredBetweenFullPhysicalAttacks[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks[536870913];

// Export ULPAIResMedFlyerFromOrbitSlotEngagement::execRetractAllOptionsForThisPublisher(FFrame&, void* const)
native function RetractAllOptionsForThisPublisher()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackPublisher[8388609];


}

function Init()
{
    super.Init();
    NumOfRangedAttacksCompletedSinceLastFullPhysicalAttack = 0;
    //return;    
}

function SetFromTuneData()
{
    super.SetFromTuneData();
    HowManyRangedAttacksRequiredBetweenFullPhysicalAttacks = Rand(MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks - MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks) + MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks;
    //return;    
}

function Destroy()
{
    super.Destroy();
    //return;    
}

function ShutDown()
{
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

function IsFullPhysicalAttackAllowed()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackPublisher[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAssumeCurrentAttackIsDone[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL myAttackOption;

    false
    // End:0x14
    if(ForceOnlyFullPhysicalAttacks())
    {
        return true;
    }
    // End:0x23
    if(ForceOnlyRangedLobAttacks())
    {
        return false;
    }
    // End:0x32
    if(IsOwnerVitalSuit())
    {
        return false;
    }
    // End:0xCD
    if(GetAttackOptionByPublisher(AttackPublisher, myAttackOption))
    {
        // End:0xCD
        if(bAssumeCurrentAttackIsDone && (int(myAttackOption.TypeOfAttack) == int(2)) || int(myAttackOption.TypeOfAttack) == int(5))
        {
            // End:0xCD
            if(NumOfRangedAttacksCompletedSinceLastFullPhysicalAttack >= 0)
            {
                ++NumOfRangedAttacksCompletedSinceLastFullPhysicalAttack;                
            }
        }
    }
    // End:0xE6
    if(NumOfRangedAttacksCompletedSinceLastFullPhysicalAttack >= HowManyRangedAttacksRequiredBetweenFullPhysicalAttacks)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsLandOnAttackAsReplacementForFullPhysicalAttackAllowed()
{
    local /*0x97E50000-0x00000000*/ private bool bAssumeCurrentAttackIsDone[9437185], ReturnValue;

    false
    // End:0x23
    if((ForceOnlyFullPhysicalAttacks()) && IsOwnerVitalSuit())
    {
        return true;
    }
    // End:0x32
    if(ForceOnlyRangedLobAttacks())
    {
        return false;
    }
    // End:0x41
    if(IsOwnerVitalSuit())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HandlePostPublisherAcceptanceOfAttackOptionProcessing()
{
    local /*0x97E50000-0x00000000*/ private @NULL Option2Perform[25296897];

    super.HandlePostPublisherAcceptanceOfAttackOptionProcessing(Option2Perform);
    // End:0x49
    if(int(Option2Perform.TypeOfAttack) == int(13))
    {
        NumOfRangedAttacksCompletedSinceLastFullPhysicalAttack = -1;
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
    // End:0x112
    if((GetAttackOptionByPublisher(AttackPublisher, myAttackOption)) && int(myAttackOption.TypeOfAttack) == int(TypeOfAttack))
    {
        // End:0xEF
        if(myAttackOption.TimeAttackWasFirstValid != Outer.ResourceManagerOuter.WorldInfo.TimeSeconds)
        {
            ClearActiveOptions(AttackPublisher);            
        }
        else
        {
            // End:0x112
            if(bAllreadyAssumedCurrentAttackIsDone)
            {
                ClearActiveOptions(AttackPublisher);                
            }
        }
    }
    // End:0x16B
    if((int(TypeOfAttack) == int(2)) || int(TypeOfAttack) == int(5))
    {
        // End:0x168
        if(!bAllreadyAssumedCurrentAttackIsDone)
        {
            // End:0x168
            if(NumOfRangedAttacksCompletedSinceLastFullPhysicalAttack >= 0)
            {
                ++NumOfRangedAttacksCompletedSinceLastFullPhysicalAttack;                
            }
        }        
    }
    else
    {
        // End:0x1D8
        if(int(TypeOfAttack) == int(13))
        {
            NumOfRangedAttacksCompletedSinceLastFullPhysicalAttack = 0;
            HowManyRangedAttacksRequiredBetweenFullPhysicalAttacks = Rand(MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks - MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks) + MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks;
            RetractAllOptionsForThisTypeOfAttack(13);
            // End:0x1D8
            if(IsOwnerStillActiveTarget())
            {
                ChooseNewAttackOption();
            }
        }
    }
    //return;    
}

defaultproperties
{
    MinNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=3
    MaxNumOfRangedAttacksRequiredBetweenFullPhysicalAttacks=3
    AbsoluteMaxTimeToAllowAndAttackToHoldBestOption=5.0000000
    UniqueName="MedFlyerOrbitEngagement"
    MaxUsers=30
}