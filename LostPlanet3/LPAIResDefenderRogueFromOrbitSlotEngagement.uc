class LPAIResDefenderRogueFromOrbitSlotEngagement extends LPAIResMedFlyerFromOrbitSlotEngagement within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

function Init()
{
    super.Init();
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
    super.ShutDown();
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
    //return;    
}

defaultproperties
{
    AttackTypeValue=/* Array type was not detected. */
    UniqueName="DefenderRogueOrbitEngagement"
}