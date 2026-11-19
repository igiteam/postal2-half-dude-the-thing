class LPAIResAdHocSquadMgr extends SPAIResource within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TotalNumOfSquadsEveryMade[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AdHocSquadList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ListOfInfoForSquadBuilding[536870913];

// Export ULPAIResAdHocSquadMgr::execGetAccess(FFrame&, void* const)
native function GetAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    false                    
}

function Init()
{
    super.Init();
    TotalNumOfSquadsEveryMade = 0;
    //return;    
}

function SetFromTuneData()
{
    super.SetFromTuneData();
    //return;    
}

function Destroy()
{
    DestoryAllSquads();
    super.Destroy();
    //return;    
}

function ShutDown()
{
    DestoryAllSquads();
    super.ShutDown();
    //return;    
}

function DestoryAllSquads()
{
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x46 [Loop If]
    if(iter < AdHocSquadList.Length)
    {
        AdHocSquadList[iter] = none;
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    AdHocSquadList.Length = 0;
    //return;    
}

function AddToMeToSquad()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewSquadMember[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x61
    if((NewSquadMember.MyAdHocSquadMemberData != none) && NewSquadMember.MyAdHocSquadMemberData.CurrentSquadIn != none)
    {
        return true;
    }
    // End:0x79
    if(FindSquadForMe(NewSquadMember))
    {
        return true;
    }
    // End:0x91
    if(BuildNewSquadForMe(NewSquadMember))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function FindSquadForMe()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewSquadMember[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private bool bwasAddedToSquad;

    bwasAddedToSquad = false;
    iter = 0;
    J0x17:

    // End:0x8A [Loop If]
    if(iter < AdHocSquadList.Length)
    {
        bwasAddedToSquad = AdHocSquadList[iter].TryAndAddToSquad(NewSquadMember);
        // End:0x7C
        if(bwasAddedToSquad)
        {
            // [Explicit Break]
            goto J0x8A;
        }
        ++iter;
        // [Loop Continue]
        goto J0x17;
    }
    J0x8A:

    return bwasAddedToSquad;
    //return ReturnValue;    
}

function BuildNewSquadForMe()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewSquadMember[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bwasAddedToSquad;
    local /*0x97E50000-0x00000000*/ private int indexForFoundSquadInfo;
    local /*0x97E50000-0x00000000*/ private @NULL newSquad;

    bwasAddedToSquad = false;
    // End:0x18E
    if(IsItPossibleToMakeSquadForThisTypeOfPawn(NewSquadMember.myAIPawn, indexForFoundSquadInfo))
    {
        newSquad = new (self) Class'LPAdHocSquad';
        // End:0x18B
        if(newSquad != none)
        {
            newSquad.InfoForSquadBuilding = ListOfInfoForSquadBuilding[indexForFoundSquadInfo];
            newSquad.SquadName = name(string(newSquad.InfoForSquadBuilding.SqaudTypeName) $ string(TotalNumOfSquadsEveryMade));
            newSquad.OwningManager = self;
            bwasAddedToSquad = newSquad.TryAndAddToSquad(NewSquadMember);
            // End:0x16A
            if(!bwasAddedToSquad)
            {
                newSquad = none;                
            }
            else
            {
                ++TotalNumOfSquadsEveryMade;
                AdHocSquadList.AddItem(newSquad);                
            }
        }        
    }
    return bwasAddedToSquad;
    //return ReturnValue;    
}

function IsItPossibleToMakeSquadForThisTypeOfPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609];
    local /*0x97E50000-0x00000000*/ private int indexForFoundSquadInfo[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x90 [Loop If]
    if(iter < ListOfInfoForSquadBuilding.Length)
    {
        // End:0x82
        if(ClassIsChildOf(PawnToTest.Class, ListOfInfoForSquadBuilding[iter].AiPawnTypesForThisSquad))
        {
            indexForFoundSquadInfo = iter;
            return true;
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    indexForFoundSquadInfo = -1;
    return false;
    //return ReturnValue;    
}

function LetOwnerManagerKnowSquadEmpty()
{
    local /*0x97E50000-0x00000000*/ private @NULL SquadEmpty[8388609];

    // End:0x4F
    if(SquadEmpty != none)
    {
        SquadEmpty.DisbandSquad();
        AdHocSquadList.RemoveItem(SquadEmpty);        
        SquadEmpty = none;
    }
    return;
    //return;    
}

defaultproperties
{
    ListOfInfoForSquadBuilding=/* Array type was not detected. */
    UniqueName="AIResAdHocSquadMgr"
    MaxUsers=50
}