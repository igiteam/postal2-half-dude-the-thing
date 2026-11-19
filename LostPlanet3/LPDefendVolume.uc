class LPDefendVolume extends LPTriggerVolume
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DefendNodes_Low;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DefendNodes_Medium;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DefendNodes_High;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DefendCoverSlots;
var(0.25_Pct) /*0x7E070000-0x00000000*/ private @NULL ThingToFocusOnWhenNoEnemy[65537];
var(0.25_Pct) /*0x7E070000-0x00000000*/ private float HowCloseToLocationToTryAndStay[65537];
var(0.25_Pct) /*0x7E070000-0x00000000*/ private float HowCloseToLetEnemiesGetBeforeAttacking[65537];
var(0.25_Pct) /*0x7E070000-0x00000000*/ private float DamageThresholdBeforeEndingCommand[65537];
var(0.25_Pct) /*0x7E070000-0x00000000*/ private float HowCloseToLetGrenadesGetBeforeAttacking[65537];
var(0.25_Pct) /*0x7E070000-0x00000000*/ private bool bUseAggressiveIndicator[65537];
var(0.25_Pct) /*0x7E070000-0x00000000*/ private bool bRandomizeWhichMovesToPlay[65537];
var(0.25_Pct) /*0x7E070000-0x00000000*/ private float MinTimeToWaitAtNode[65537];
var(0.25_Pct) /*0x7E070000-0x00000000*/ private float MaxTimeToWaitAtNode[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL AIResourceMan[524289];

static event @NULL IsOnNavMesh()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609], DesiredPos;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000400*/ private @NULL BotHandle, inPawn;

    // End:0x1A
    if(LPAIPawnMedFlyer(Requester) != none)
    {
        return true;
    }
    inPawn = LPAIPawn(Requester);
    // End:0xB4
    if(inPawn != none)
    {
        BotHandle = SPKynapseBotHandle(inPawn.myKynapseHandle);
        // End:0xB4
        if((BotHandle != none) && BotHandle.PathFinder_IsLocationInNavMesh(DesiredPos))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

static function Shuffle()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array DefendNodeArray[25165825];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL Temp;
    local /*0x97E50000-0x00000000*/ private int Rand;

    I = 0;
    J0x0B:

    // End:0xBC [Loop If]
    if(I < DefendNodeArray.Length)
    {
        Temp = DefendNodeArray[I];
        Rand = int(RandRange(0.0000000, float(DefendNodeArray.Length - 1)));
        DefendNodeArray[I] = DefendNodeArray[Rand];
        DefendNodeArray[Rand] = Temp;
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function ShuffleCovers()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array DefendNodeArray[25165825];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL Temp;
    local /*0x97E50000-0x00000000*/ private int Rand;

    I = 0;
    J0x0B:

    // End:0xBC [Loop If]
    if(I < DefendNodeArray.Length)
    {
        Temp = DefendNodeArray[I];
        Rand = int(RandRange(0.0000000, float(DefendNodeArray.Length - 1)));
        DefendNodeArray[I] = DefendNodeArray[Rand];
        DefendNodeArray[Rand] = Temp;
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

static function GetDefendNode()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requestor[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array DefendNodeArray[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL CurrentNode[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int Counter;
    local /*0x97E50000-0x00000000*/ private @NULL DefendNode, Resource, Access;

    // End:0x12
    if(DefendNodeArray.Length == 0)
    {
        return none;
    }
    Shuffle(DefendNodeArray);
    Counter = 0;
    J0x30:

    // End:0x17D [Loop If]
    if(Counter < DefendNodeArray.Length)
    {
        DefendNode = DefendNodeArray[Counter];
        // End:0x7F
        if(DefendNode == CurrentNode)
        {            
        }
        else
        {
            // End:0xB8
            if(!IsOnNavMesh(Requestor, DefendNode.Location))
            {                
            }
            else
            {
                Resource = DefendNode.GetResource();
                // End:0xF3
                if(Resource == none)
                {                    
                }
                else
                {
                    Access = Resource.GetAccess(Requestor, 0.0000000);
                    // End:0x13D
                    if(Access == none)
                    {                        
                    }
                    else
                    {
                        DefendNode.SetAccess(Access);
                        return DefendNode;
                    }
                }
            }
        }
        Counter++;
        // [Loop Continue]
        goto J0x30;
    }
    return none;
    //return ReturnValue;    
}

static function GetDefendNodeForTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requestor[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array DefendNodeArray[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL MyTarget[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int Counter;
    local /*0x97E50000-0x00000000*/ private @NULL DefendNode, Resource, Access;

    // End:0x12
    if(DefendNodeArray.Length == 0)
    {
        return none;
    }
    Shuffle(DefendNodeArray);
    Counter = 0;
    J0x30:

    // End:0x1F1 [Loop If]
    if(Counter < DefendNodeArray.Length)
    {
        DefendNode = DefendNodeArray[Counter];
        // End:0x9E
        if(!IsOnNavMesh(Requestor, DefendNode.Location))
        {            
        }
        else
        {
            Resource = DefendNode.GetResource();
            // End:0xD9
            if(Resource == none)
            {                
            }
            else
            {
                // End:0x109
                if(!Resource.IsAccessPossible(Requestor))
                {                    
                }
                else
                {
                    // End:0x167
                    if(!Requestor.FastTrace(MyTarget.Location, Requestor.Location,, true))
                    {                        
                    }
                    else
                    {
                        Access = Resource.GetAccess(Requestor, 0.0000000);
                        // End:0x1B1
                        if(Access == none)
                        {                            
                        }
                        else
                        {
                            DefendNode.SetAccess(Access);
                            return DefendNode;
                        }
                    }
                }
            }
        }
        Counter++;
        // [Loop Continue]
        goto J0x30;
    }
    return none;
    //return ReturnValue;    
}

function GetDefendCover()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requestor[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array DefendCoverArray[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL CurrentNode[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int Counter;
    local /*0x97E50000-0x00000000*/ private @NULL DefendCoverSlotMarker, DefendCover;

    // End:0x12
    if(DefendCoverArray.Length == 0)
    {
        return none;
    }
    ShuffleCovers(DefendCoverArray);
    Counter = 0;
    J0x30:

    // End:0x120 [Loop If]
    if(Counter < DefendCoverArray.Length)
    {
        DefendCoverSlotMarker = DefendCoverArray[Counter];
        // End:0x7F
        if(DefendCoverSlotMarker == CurrentNode)
        {            
        }
        else
        {
            DefendCover = DefendCoverSlotMarker.OwningSlot;
            // End:0x108
            if(!DefendCover.Link.IsValidClaim(Requestor, DefendCover.SlotIdx, true, false))
            {                
            }
            else
            {
                return DefendCoverSlotMarker;
            }
        }
        Counter++;
        // [Loop Continue]
        goto J0x30;
    }
    return none;
    //return ReturnValue;    
}

function GetBestAttackNode()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requestor[8388609], MyTarget, ReturnValue, DefendNode;

    none
    AIResourceMan.Update();
    // End:0x7C
    if(DefendNodes_High.Length > 0)
    {
        DefendNode = GetDefendNodeForTarget(Requestor, DefendNodes_High, MyTarget);
        // End:0x7C
        if(DefendNode != none)
        {
            return DefendNode;
        }
    }
    // End:0xD4
    if(DefendNodes_Medium.Length > 0)
    {
        DefendNode = GetDefendNodeForTarget(Requestor, DefendNodes_Medium, MyTarget);
        // End:0xD4
        if(DefendNode != none)
        {
            return DefendNode;
        }
    }
    // End:0x12C
    if(DefendNodes_Low.Length > 0)
    {
        DefendNode = GetDefendNodeForTarget(Requestor, DefendNodes_Low, MyTarget);
        // End:0x12C
        if(DefendNode != none)
        {
            return DefendNode;
        }
    }
    // End:0x17C
    if(DefendNodes_High.Length > 0)
    {
        DefendNode = GetDefendNode(Requestor, DefendNodes_High, none);
        // End:0x17C
        if(DefendNode != none)
        {
            return DefendNode;
        }
    }
    // End:0x1CC
    if(DefendNodes_Medium.Length > 0)
    {
        DefendNode = GetDefendNode(Requestor, DefendNodes_Medium, none);
        // End:0x1CC
        if(DefendNode != none)
        {
            return DefendNode;
        }
    }
    // End:0x21C
    if(DefendNodes_Low.Length > 0)
    {
        DefendNode = GetDefendNode(Requestor, DefendNodes_Low, none);
        // End:0x21C
        if(DefendNode != none)
        {
            return DefendNode;
        }
    }
    return none;
    //return ReturnValue;    
}

function GetBestDefendPositionActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requestor[8388609], CurrentDefendNode, ReturnValue, DefendNode;

    none
    // End:0x84
    if(Requestor.TuneDataAIPawn.bCanUseCover)
    {
        DefendNode = GetDefendCover(Requestor, DefendCoverSlots, CurrentDefendNode);
        // End:0x84
        if(DefendNode != none)
        {
            return DefendNode;
        }
    }
    AIResourceMan.Update();
    // End:0xFB
    if(DefendNodes_High.Length > 0)
    {
        DefendNode = GetDefendNode(Requestor, DefendNodes_High, CurrentDefendNode);
        // End:0xFB
        if(DefendNode != none)
        {
            return DefendNode;
        }
    }
    // End:0x153
    if(DefendNodes_Medium.Length > 0)
    {
        DefendNode = GetDefendNode(Requestor, DefendNodes_Medium, CurrentDefendNode);
        // End:0x153
        if(DefendNode != none)
        {
            return DefendNode;
        }
    }
    // End:0x1AB
    if(DefendNodes_Low.Length > 0)
    {
        DefendNode = GetDefendNode(Requestor, DefendNodes_Low, CurrentDefendNode);
        // End:0x1AB
        if(DefendNode != none)
        {
            return DefendNode;
        }
    }
    return none;
    //return ReturnValue;    
}

protected event IsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(IsPendingKill())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function SetupArrays()
{
    local /*0x97E50000-0x00000000*/ private @NULL A, CoverSlotMarker, DefendNode, Resource, ResLocation, Offset;

    ResLocation = AIResourceMan.GetOuterLocation();
    // End:0x284
    foreach AllActors(Class'Engine.Actor', A)
    {
        CoverSlotMarker = SPGFCoverSlotMarker(A);
        // End:0x99
        if(CoverSlotMarker != none)
        {
            // End:0x99
            if(Encompasses(A))
            {
                DefendCoverSlots.AddItem(CoverSlotMarker);                
            }
        }
        DefendNode = LPAIDefendNode(A);
        // End:0x283
        if(DefendNode != none)
        {
            // End:0x283
            if(Encompasses(A))
            {
                Resource = AIResourceMan.CreateDefendNodeResource();
                Resource.AllowAccess(true);
                Resource.SetMaxUsers(1);
                Offset = DefendNode.Location - ResLocation;
                Resource.SetRelativeLocation(Offset);
                DefendNode.SetResource(Resource);
                // End:0x205
                if(int(DefendNode.DefendNodePriority) == int(2))
                {
                    DefendNodes_High.AddItem(DefendNode);                    
                }
                // End:0x244
                if(int(DefendNode.DefendNodePriority) == int(1))
                {
                    DefendNodes_Medium.AddItem(DefendNode);                    
                }
                // End:0x283
                if(int(DefendNode.DefendNodePriority) == int(0))
                {
                    DefendNodes_Low.AddItem(DefendNode);                    
                }
            }
        }        
    }    
    //return;    
}

simulated event PostBeginPlay()
{
    super(TriggerVolume).PostBeginPlay();
    SetupArrays();
    //return;    
}

defaultproperties
{
    HowCloseToLocationToTryAndStay=200.0000000
    HowCloseToLetEnemiesGetBeforeAttacking=2000.0000000
    DamageThresholdBeforeEndingCommand=20.0000000
    HowCloseToLetGrenadesGetBeforeAttacking=1000.0000000
    bUseAggressiveIndicator=true
    // Reference: LPAIResManDefendVolume'Default__LPDefendVolume.LPAIResManDefendVolume'
    begin object name=LPAIResManDefendVolume class=Class'LPAIResManDefendVolume'
    end object
    AIResourceMan=LPAIResManDefendVolume
    // Reference: BrushComponent'Default__LPDefendVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    Components[1]=LPAIResManDefendVolume
    CollisionComponent=BrushComponent0
}