class LPAICmd_MoveToCover extends LPAICmd_MoveToPosition within LPAIController;

struct SearchNode
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CoverSlot;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ClosedListParentIdx;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentDepth;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseSwatTurn;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseCornerTurn;

    structdefaultproperties
    {
        CoverSlot=none
        ClosedListParentIdx=0
        CurrentDepth=0
        bUseSwatTurn=false
        bUseCornerTurn=false
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyCoverGoal[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyCoverInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CoverPath[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentPathNodeIdx[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWantsToPerformTurn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWaitingForSpecialMove[536870913];

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super(LPAICmd_Move).Popped();
    // End:0x4D
    if(!Outer.CoverIsIn())
    {
        Outer.AIClearCoverGoal();
    }
    Outer.ClearTimer('MoveInCoverFAILSAFE');
    Outer.bMovingInCover = false;
    MyCoverGoal.Link = none;
    MyCoverGoal.SlotIdx = -1;
    //return;    
}

function SetDesiredCoverInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL InCoverInfo[8388609], Destination;
    local /*0x97E50000-0x00000000*/ private float floorAdjustedDelta;

    // End:0x134
    if(InCoverInfo != MyCoverGoal)
    {
        MyCoverGoal = InCoverInfo;
        Destination = MyCoverGoal.Link.GetSlotLocation(MyCoverGoal.SlotIdx);
        floorAdjustedDelta = SPCoverLink(MyCoverGoal.Link).GetHeightSlot() * 0.9000000;
        Destination -= (vect(0.0000000, 0.0000000, 1.0000000) * floorAdjustedDelta);
        SetDesiredDestination(Destination);
        Outer.AISetCoverGoal(MyCoverGoal);
    }
    //return;    
}

function FindPathToCoverSlot()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartCoverInfo[25296897], DestCoverInfo;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array OpenList, ClosedList;
    local /*0x97E50000-0x00000000*/ private @NULL Node, OpenNode;
    local /*0x97E50000-0x00000000*/ private int maxSearchDepth, ClosedListIdx;
    local /*0x97E50000-0x00000000*/ private bool bPathFound, bIgnoreSwatTurns, bIgnoreCornerTurns;

    maxSearchDepth = 6;
    Node.CoverSlot = StartCoverInfo;
    Node.ClosedListParentIdx = -1;
    Node.CurrentDepth = 0;
    OpenList.AddItem(Node);    
    bPathFound = false;
    J0x94:

    // End:0x11A9 [Loop If]
    if(OpenList.Length > 0)
    {
        OpenNode = OpenList[0];
        // End:0xF2
        if(OpenNode.CurrentDepth == maxSearchDepth)
        {
            bPathFound = false;
            // [Explicit Break]
            goto J0x11A9;
        }
        OpenList.Remove(0, 1);        
        ClosedList.AddItem(OpenNode);        
        ClosedListIdx = ClosedList.Length - 1;
        Node.CurrentDepth = OpenNode.CurrentDepth + 1;
        // End:0x440
        if(OpenNode.CoverSlot.SlotIdx > 0)
        {
            Node.CoverSlot.Link = OpenNode.CoverSlot.Link;
            Node.CoverSlot.SlotIdx = OpenNode.CoverSlot.SlotIdx - 1;
            Node.ClosedListParentIdx = ClosedListIdx;
            Node.bUseSwatTurn = OpenNode.bUseSwatTurn;
            Node.bUseCornerTurn = OpenNode.bUseCornerTurn;
            // End:0x440
            if((ClosedList.Find('CoverSlot', Node.CoverSlot) == ) && )
            {
                OpenList.Find('CoverSlot', Node.CoverSlot) == ;                                
                Node.bUseSwatTurn = OpenNode.bUseSwatTurn;
                Node.bUseCornerTurn = OpenNode.bUseCornerTurn;
                OpenList.AddItem(Node);                
                // End:0x440
                if(Node.CoverSlot == DestCoverInfo)
                {
                    bPathFound = true;
                    // [Explicit Break]
                    goto J0x11A9;
                }
            }
        }
        // End:0x6E9
        if(OpenNode.CoverSlot.SlotIdx < (OpenNode.CoverSlot.Link.Slots.Length - 1))
        {
            Node.CoverSlot.Link = OpenNode.CoverSlot.Link;
            Node.CoverSlot.SlotIdx = OpenNode.CoverSlot.SlotIdx + 1;
            Node.ClosedListParentIdx = ClosedListIdx;
            Node.bUseSwatTurn = OpenNode.bUseSwatTurn;
            Node.bUseCornerTurn = OpenNode.bUseCornerTurn;
            // End:0x6E9
            if((ClosedList.Find('CoverSlot', Node.CoverSlot) == ) && )
            {
                OpenList.Find('CoverSlot', Node.CoverSlot) == ;                                
                OpenList.AddItem(Node);                
                // End:0x6E9
                if(Node.CoverSlot == DestCoverInfo)
                {
                    bPathFound = true;
                    // [Explicit Break]
                    goto J0x11A9;
                }
            }
        }
        bIgnoreSwatTurns = false;
        // End:0x726
        if(Outer.bDisableSwatTurns)
        {
            bIgnoreSwatTurns = true;            
        }
        else
        {
            // End:0x776
            if(Outer.bDisableMixingSwatAndCornerTurns && OpenNode.bUseCornerTurn)
            {
                bIgnoreSwatTurns = true;
            }
        }
        // End:0xC60
        if(!bIgnoreSwatTurns)
        {
            // End:0x9F4
            if(OpenNode.CoverSlot.Link.Slots[OpenNode.CoverSlot.SlotIdx].bCanSwatTurn_Left)
            {
                OpenNode.CoverSlot.Link.GetSwatTurnTarget(OpenNode.CoverSlot.SlotIdx, 0, Node.CoverSlot);
                Node.ClosedListParentIdx = ClosedListIdx;
                Node.bUseSwatTurn = true;
                Node.bUseCornerTurn = OpenNode.bUseCornerTurn;
                // End:0x9F1
                if((ClosedList.Find('CoverSlot', Node.CoverSlot) == ) && )
                {
                    OpenList.Find('CoverSlot', Node.CoverSlot) == ;                                        
                    OpenList.AddItem(Node);                    
                    // End:0x9F1
                    if(Node.CoverSlot == DestCoverInfo)
                    {
                        bPathFound = true;
                        // [Explicit Break]
                        goto J0x11A9;
                    }
                }                
            }
            else
            {
                // End:0xC60
                if(OpenNode.CoverSlot.Link.Slots[OpenNode.CoverSlot.SlotIdx].bCanSwatTurn_Right)
                {
                    OpenNode.CoverSlot.Link.GetSwatTurnTarget(OpenNode.CoverSlot.SlotIdx, 1, Node.CoverSlot);
                    Node.ClosedListParentIdx = ClosedListIdx;
                    Node.bUseSwatTurn = true;
                    Node.bUseCornerTurn = OpenNode.bUseCornerTurn;
                    // End:0xC60
                    if((ClosedList.Find('CoverSlot', Node.CoverSlot) == ) && )
                    {
                        OpenList.Find('CoverSlot', Node.CoverSlot) == ;                                                
                        OpenList.AddItem(Node);                        
                        // End:0xC60
                        if(Node.CoverSlot == DestCoverInfo)
                        {
                            bPathFound = true;
                            // [Explicit Break]
                            goto J0x11A9;
                        }
                    }
                }
            }
        }
        bIgnoreCornerTurns = false;
        // End:0xCBC
        if(Outer.bDisableMixingSwatAndCornerTurns && OpenNode.bUseSwatTurn)
        {
            bIgnoreCornerTurns = true;
        }
        // End:0x11A6
        if(!bIgnoreCornerTurns)
        {
            // End:0xF3A
            if(OpenNode.CoverSlot.Link.Slots[OpenNode.CoverSlot.SlotIdx].bCanCornerTurn_Left)
            {
                OpenNode.CoverSlot.Link.GetCornerTurnTarget(OpenNode.CoverSlot.SlotIdx, 0, Node.CoverSlot);
                Node.ClosedListParentIdx = ClosedListIdx;
                Node.bUseSwatTurn = OpenNode.bUseSwatTurn;
                Node.bUseCornerTurn = true;
                // End:0xF37
                if((ClosedList.Find('CoverSlot', Node.CoverSlot) == ) && )
                {
                    OpenList.Find('CoverSlot', Node.CoverSlot) == ;                                        
                    OpenList.AddItem(Node);                    
                    // End:0xF37
                    if(Node.CoverSlot == DestCoverInfo)
                    {
                        bPathFound = true;
                        // [Explicit Break]
                        goto J0x11A9;
                    }
                }                
            }
            else
            {
                // End:0x11A6
                if(OpenNode.CoverSlot.Link.Slots[OpenNode.CoverSlot.SlotIdx].bCanCornerTurn_Right)
                {
                    OpenNode.CoverSlot.Link.GetCornerTurnTarget(OpenNode.CoverSlot.SlotIdx, 1, Node.CoverSlot);
                    Node.ClosedListParentIdx = ClosedListIdx;
                    Node.bUseSwatTurn = OpenNode.bUseSwatTurn;
                    Node.bUseCornerTurn = true;
                    // End:0x11A6
                    if((ClosedList.Find('CoverSlot', Node.CoverSlot) == ) && )
                    {
                        OpenList.Find('CoverSlot', Node.CoverSlot) == ;                                                
                        OpenList.AddItem(Node);                        
                        // End:0x11A6
                        if(Node.CoverSlot == DestCoverInfo)
                        {
                            bPathFound = true;
                            // [Explicit Break]
                            goto J0x11A9;
                        }
                    }
                }
            }
        }
        // [Loop Continue]
        goto J0x94;
    }
    J0x11A9:

    CoverPath.Remove(0, CoverPath.Length);    
    CurrentPathNodeIdx = 0;
    // End:0x12A0
    if(bPathFound)
    {
        CoverPath.AddItem(Node.CoverSlot);        
        J0x1200:

        // End:0x12A0 [Loop If]
        if(Node.ClosedListParentIdx != -1)
        {
            CoverPath.InsertItem(0, ClosedList[Node.ClosedListParentIdx].CoverSlot);            
            Node = ClosedList[Node.ClosedListParentIdx];
            // [Loop Continue]
            goto J0x1200;
        }
    }
    return bPathFound;
    //return ReturnValue;    
}

protected function NotifyMoveAbortedInternal()
{
    // End:0x30
    if(Outer.CoverCanEnter())
    {
        UpdateResult = 1;
        return;
    }
    super(LPAICmd_Move).NotifyMoveAbortedInternal();
    //return;    
}

function MoveInCoverFAILSAFE()
{
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        MyCoverInfo.Link = Outer.MyCoverPawn.CurrentLink;
        MyCoverInfo.SlotIdx = Outer.MyCoverPawn.CurrentSlotIdx;
        //return;        
    }
Begin:

    // End:0x54
    if(Outer.CoverIsIn() && FindPathToCoverSlot(MyCoverInfo, MyCoverGoal))
    {
        GotoState('MoveInCover');        
    }
    else
    {
        // End:0xB9
        if(Outer.CoverIsIn() && MyCoverInfo == MyCoverGoal)
        {
            Outer.PopCommand(self);            
        }
        else
        {
            GotoState('MoveToCurrentDestination');
        }
    }
    stop;                    
}

state MoveInCover
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        Outer.bMovingInCover = true;
        Outer.MyCoverPawn.bMirrorForMoving = true;
        Outer.PawnDontLook();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        Outer.bMovingInCover = false;
        Outer.MyCoverPawn.bMirrorForMoving = false;
        bWaitingForSpecialMove = false;
        Outer.ClearTimer('MoveInCoverFAILSAFE');
        //return;        
    }

    event @NULL Bump()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

        // End:0x26
        if(SPPawn(Other) != none)
        {
            GotoState('MoveToCurrentDestination');
        }
        //return;        
    }

    event NotifyReceivedDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Damage[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DamageInstigator[8388609];

        super(LPAICmd_Move).NotifyReceivedDamage(Damage, DamageInstigator);
        // End:0x48
        if((CurrentPathNodeIdx + 1) < (CoverPath.Length - 1))
        {
            GotoState('MoveToCurrentDestination');
        }
        //return;        
    }

    function NotifyReachedCoverSlot()
    {
        local /*0x97E50000-0x00000000*/ private int SlotIdx[8388609], OldSlotIdx;
        local /*0x97E50000-0x00000000*/ private byte CoverDirection;

        // End:0xC6
        if(((!bWaitingForSpecialMove && SlotIdx == OldSlotIdx) && SlotIdx == CoverPath[CurrentPathNodeIdx - 1].SlotIdx) && Outer.MyCoverPawn.CurrentLink == CoverPath[CurrentPathNodeIdx - 1].Link)
        {
            return;
        }
        bWaitingForSpecialMove = false;
        // End:0x176
        if((SlotIdx != CoverPath[CurrentPathNodeIdx].SlotIdx) || Outer.MyCoverPawn.CurrentLink != CoverPath[CurrentPathNodeIdx].Link)
        {
            GotoState('MoveToCurrentDestination');
            return;
        }
        // End:0x389
        if(CurrentPathNodeIdx >= (CoverPath.Length - 1))
        {
            CoverDirection = Outer.CoverGetDesiredDirection(MyCoverGoal);
            // End:0x252
            if(int(CoverDirection) != int(0))
            {
                Outer.MyCoverPawn.bMirrorForMoving = false;
                Outer.MyCoverPawn.SetMirroredSide(int(CoverDirection) == int(1));
            }
            Outer.PawnLookAtPos(MyCoverGoal.Link.GetSlotLocation(Outer.CoverGoal.SlotIdx) + (float(500) * Vector(MyCoverGoal.Link.GetSlotRotation(Outer.CoverGoal.SlotIdx))));
            Outer.CoverMove(0);
            Outer.PopCommand(self);
            return;
        }
        // End:0x53A
        if(((CurrentPathNodeIdx + 1) < (CoverPath.Length - 1)) && Outer.MainEnemy != none)
        {
            // End:0x53A
            if(!Outer.MyCoverPawn.IsProtectedByCover(Normal(Outer.MyCoverPawn.Location - Outer.MainEnemy.Location)) && VSize(Outer.MyCoverPawn.Location - Outer.MainEnemy.Location) < Outer.MyCoverPawn.mySPGFTuneDataPawn.DistanceBreakOutOfMovingInCover)
            {
                GotoState('MoveToCurrentDestination');
                return;
            }
        }
        GotoState('MoveInCover', 'NextMove');
        //return;        
    }

    function MoveInCoverFAILSAFE()
    {
        GotoState('MoveToCurrentDestination');
        //return;        
    }

    function StartNextCoverMove()
    {
        local /*0x97E50000-0x00000000*/ private @NULL CurrentCoverInfo, NextCoverInfo, CoverActionTarget;

        CurrentCoverInfo = CoverPath[CurrentPathNodeIdx];
        CurrentPathNodeIdx++;
        NextCoverInfo = CoverPath[CurrentPathNodeIdx];
        // End:0xC8
        if(!NextCoverInfo.Link.IsValidClaim(Outer.MyCoverPawn, NextCoverInfo.SlotIdx, true, true))
        {
            GotoState('MoveToCurrentDestination');
            return;
        }
        Outer.SetTimer(5.0000000, false, 'MoveInCoverFAILSAFE', self);
        // End:0x1B1
        if(NextCoverInfo.Link == CurrentCoverInfo.Link)
        {
            // End:0x18E
            if(CurrentCoverInfo.SlotIdx < NextCoverInfo.SlotIdx)
            {
                Outer.CoverMove(2);                
            }
            else
            {
                Outer.CoverMove(1);
            }
            return;
        }
        CurrentCoverInfo.Link.GetFirstCornerTurnTarget(CurrentCoverInfo.SlotIdx, CoverActionTarget);
        // End:0x281
        if(CoverActionTarget == NextCoverInfo)
        {
            Outer.CoverMove(0);
            bWaitingForSpecialMove = true;
            MyPawn.DoSpecialMove(Class'SPGameFramework.SPGFSM_CornerTurn', true, true);
            return;
        }
        CurrentCoverInfo.Link.GetFirstSwatTurnTarget(CurrentCoverInfo.SlotIdx, CoverActionTarget);
        // End:0x351
        if(CoverActionTarget == NextCoverInfo)
        {
            Outer.CoverMove(0);
            bWaitingForSpecialMove = true;
            MyPawn.DoSpecialMove(Class'SPGameFramework.SPGFSM_SwatTurn', true, true);
            return;
        }
        //return;        
    }

    function ShouldMirrorBeforeMoving()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x24B
        if(CoverPath[CurrentPathNodeIdx].Link == CoverPath[CurrentPathNodeIdx + 1].Link)
        {
            // End:0x14F
            if(Outer.MyCoverPawn.bIsMirrored && CoverPath[CurrentPathNodeIdx].SlotIdx < CoverPath[CurrentPathNodeIdx + 1].SlotIdx)
            {
                Outer.MyCoverPawn.bMirrorForMoving = true;
                Outer.MyCoverPawn.SetMirroredSide(false);                
            }
            else
            {
                // End:0x249
                if(!Outer.MyCoverPawn.bIsMirrored && CoverPath[CurrentPathNodeIdx].SlotIdx > CoverPath[CurrentPathNodeIdx + 1].SlotIdx)
                {
                    Outer.MyCoverPawn.bMirrorForMoving = true;
                    Outer.MyCoverPawn.SetMirroredSide(true);
                }
            }
            return false;
        }
        // End:0x320
        if(Outer.MyCoverPawn.bIsMirrored && CoverPath[CurrentPathNodeIdx].SlotIdx > 0)
        {
            Outer.MyCoverPawn.bMirrorForMoving = true;
            Outer.MyCoverPawn.SetMirroredSide(false);
            return true;            
        }
        else
        {
            // End:0x3F4
            if(!Outer.MyCoverPawn.bIsMirrored && CoverPath[CurrentPathNodeIdx].SlotIdx <= 0)
            {
                Outer.MyCoverPawn.bMirrorForMoving = true;
                Outer.MyCoverPawn.SetMirroredSide(true);
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    // End:0x41
    if(Outer.CoverActionIsDoing())
    {
        Outer.CoverResetAction();
    }
    J0x41:

    // End:0x83 [Loop If]
    if(Outer.IsTransitioning())
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x41;
    }
NextMove:


    // End:0x123
    if(ShouldMirrorBeforeMoving())
    {
        Outer.LastAnimTransitionTime = Outer.WorldInfo.TimeSeconds;
        J0xE2:

        Outer.Sleep(0.2500000);
        // End:0xE2
        if(!(!Outer.IsTransitioning()))
            goto J0xE2;
    }
    StartNextCoverMove();
    stop;            
}

state MoveToCurrentDestination
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    function UpdateDuringMove()
    {
        local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

        // End:0x25
        if(Outer.CoverCanEnter())
        {
            return 1;
        }
        return 0;
        //return ReturnValue;        
    }
    stop;    
}

state MoveEnded
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        Outer.ClearTimer('CoverEnterFailed', self);
        //return;        
    }

    function NotifyReachedCoverSlot()
    {
        local /*0x97E50000-0x00000000*/ private int SlotIdx[8388609], OldSlotIdx;

        Outer.PopCommand(self);
        //return;        
    }

    function CoverEnterFailed()
    {
        Outer.PopCommand(self);
        //return;        
    }
Begin:

    StopPathing();
    Outer.Sleep(0.1000000);
    // End:0xAB
    if(!Outer.CoverIsIn() && int(UpdateResult) != int(2))
    {
        Outer.SetTimer(2.0000000, false, 'CoverEnterFailed', self);
        Outer.CoverEnter();        
    }
    else
    {
        Outer.PopCommand(self);
    }
    stop;                    
}

defaultproperties
{
    bReplaceActiveSameClassInstance=true
}