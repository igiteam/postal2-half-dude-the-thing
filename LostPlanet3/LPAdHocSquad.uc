class LPAdHocSquad extends Object;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SquadName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InfoForSquadBuilding[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array SquadMembers[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentLeader[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentAttacker[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OwningManager[536870913];

function DisbandSquad()
{
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0xBA [Loop If]
    if(iter < SquadMembers.Length)
    {
        // End:0xAC
        if((SquadMembers[iter] != none) && SquadMembers[iter].AiCtrlOwner != none)
        {
            SquadMembers[iter].AiCtrlOwner.NotifyGettingKickedFromAdHocSquad(self, true);
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    SquadMembers.Length = 0;
    //return;    
}

function TryAndAddToSquad()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewSquadMember[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bwasAddedToSquad;

    bwasAddedToSquad = false;
    // End:0x296
    if(SquadMembers.Length < InfoForSquadBuilding.MaxNumberInSquad)
    {
        // End:0x296
        if((NewSquadMember != none) && NewSquadMember.myAIPawn != none)
        {
            // End:0x296
            if(ClassIsChildOf(NewSquadMember.myAIPawn.Class, InfoForSquadBuilding.AiPawnTypesForThisSquad))
            {
                // End:0x174
                if(CurrentLeader != none)
                {
                    // End:0x174
                    if(!CurrentLeader.CanMemberJoinMyAdHocSquad(NewSquadMember) || CurrentLeader.myAIPawn.DistanceBetweenCollisionCylinders(NewSquadMember.myAIPawn) > InfoForSquadBuilding.MaxSeperationFromLeaderToBeInGroupRange)
                    {
                        return false;
                    }
                }
                // End:0x296
                if(NewSquadMember.MyAdHocSquadMemberData != none)
                {
                    NewSquadMember.MyAdHocSquadMemberData.CurrentSquadIn = self;
                    // End:0x229
                    if(SquadMembers.Length == 0)
                    {
                        NewSquadMember.MyAdHocSquadMemberData.MySquadStatus = 1;
                        CurrentLeader = NewSquadMember;                        
                    }
                    else
                    {
                        NewSquadMember.MyAdHocSquadMemberData.MySquadStatus = 2;
                    }
                    SquadMembers.AddItem(NewSquadMember.MyAdHocSquadMemberData);                    
                    bwasAddedToSquad = true;
                }
            }
        }
    }
    return bwasAddedToSquad;
    //return ReturnValue;    
}

function NotifySquadImDead()
{
    local /*0x97E50000-0x00000000*/ private @NULL DeadSquadMember[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bwasRemovedFromSquad;
    local /*0x97E50000-0x00000000*/ private int numberBeforeRemoval;

    bwasRemovedFromSquad = false;
    // End:0x1E3
    if(DeadSquadMember.MyAdHocSquadMemberData != none)
    {
        numberBeforeRemoval = SquadMembers.Length;
        // End:0x1E3
        if(DeadSquadMember.MyAdHocSquadMemberData.CurrentSquadIn == self)
        {
            SquadMembers.RemoveItem(DeadSquadMember.MyAdHocSquadMemberData);            
            // End:0xF8
            if((DeadSquadMember == CurrentAttacker) && CurrentLeader != none)
            {
                CurrentLeader.NotifyFromSquadCurrentAttackerIsRemovedFromSquad(DeadSquadMember);
            }
            // End:0x1E0
            if(numberBeforeRemoval != SquadMembers.Length)
            {
                bwasRemovedFromSquad = true;
                DeadSquadMember.MyAdHocSquadMemberData.CleanForSquadRemoval();
                // End:0x194
                if((SquadMembers.Length == 0) && OwningManager != none)
                {
                    OwningManager.LetOwnerManagerKnowSquadEmpty(self);                    
                }
                else
                {
                    // End:0x1DD
                    if(CurrentLeader == DeadSquadMember)
                    {
                        // End:0x1DD
                        if(!FindNewSquadLeader())
                        {
                            OwningManager.LetOwnerManagerKnowSquadEmpty(self);                            
                        }
                    }
                }                
            }            
        }
    }
    return bwasRemovedFromSquad;
    //return ReturnValue;    
}

function FindNewSquadLeader()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private bool bleaderFound;

    bleaderFound = false;
    iter = 0;
    J0x17:

    // End:0x154 [Loop If]
    if(iter < SquadMembers.Length)
    {
        // End:0x146
        if((SquadMembers[iter] != none) && SquadMembers[iter].AiCtrlOwner != none)
        {
            // End:0x146
            if(SquadMembers[iter].AiCtrlOwner.CanBecomeAdHocSquadLeader(self))
            {
                SquadMembers[iter].MySquadStatus = 1;
                CurrentLeader = SquadMembers[iter].AiCtrlOwner;
                CurrentLeader.NotifyNowAdHocSquadLeader(self);
                bleaderFound = true;
                // [Explicit Break]
                goto J0x154;
            }
        }
        ++iter;
        // [Loop Continue]
        goto J0x17;
    }
    J0x154:

    // End:0x163
    if(!bleaderFound)
    {
    }
    return bleaderFound;
    //return ReturnValue;    
}

defaultproperties
{
    InfoForSquadBuilding=(SqaudTypeName="TheDirtyGirls",AiPawnTypesForThisSquad=Class'LPAIPawn',MaxNumberInSquad=2,MaxSeperationFromLeaderToBeInGroupRange=1000.0000000)
}