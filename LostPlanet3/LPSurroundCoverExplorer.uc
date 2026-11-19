class LPSurroundCoverExplorer extends SPTickableObject within LPAIController
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Covers;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CoverTraversal;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDistanceLookCover;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFirstTraversalFinished;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bContinuouslyPerformTraversal;

function GetPctgBestCover()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrentCover[25296897];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], BestRating;
    local /*0x97E50000-0x00000000*/ private int CoverIdx, I;

    CoverIdx = GetCoverIdx(CurrentCover);
    // End:0x36
    if(CoverIdx == -1)
    {
        return 100.0000000;
    }
    // End:0x6C
    if(Covers[CoverIdx].Rating == 0.0000000)
    {
        return 100.0000000;
    }
    BestRating = 0.0000000;
    I = 0;
    J0x86:

    // End:0x14E [Loop If]
    if(I < Covers.Length)
    {
        // End:0xDC
        if(Covers[I].Cover == CurrentCover)
        {            
        }
        else
        {
            // End:0x140
            if(Covers[I].Rating > BestRating)
            {
                BestRating = Covers[I].Rating;
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x86;
    }
    return BestRating / Covers[CoverIdx].Rating;
    //return ReturnValue;    
}

function GetBestCover()
{
    local /*0x97E50000-0x00000000*/ private @NULL OutCoverSlot[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float BestRating;
    local /*0x97E50000-0x00000000*/ private bool bFound;
    local /*0x97E50000-0x00000000*/ private int I;

    BestRating = 0.0000000;
    bFound = false;
    I = 0;
    J0x26:

    // End:0xEC [Loop If]
    if(I < Covers.Length)
    {
        // End:0xDE
        if(Covers[I].Rating > BestRating)
        {
            BestRating = Covers[I].Rating;
            OutCoverSlot = Covers[I].Cover;
            bFound = true;
        }
        ++I;
        // [Loop Continue]
        goto J0x26;
    }
    return bFound;
    //return ReturnValue;    
}

function GetClosestCover()
{
    local /*0x97E50000-0x00000000*/ private @NULL OutCoverSlot[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float BestRating;
    local /*0x97E50000-0x00000000*/ private bool bFound;
    local /*0x97E50000-0x00000000*/ private int I;

    BestRating = 0.0000000;
    bFound = false;
    I = 0;
    J0x26:

    // End:0xF0 [Loop If]
    if(I < Covers.Length)
    {
        // End:0xE2
        if(Covers[I].RatingFactors[1] > BestRating)
        {
            BestRating = Covers[I].RatingFactors[1];
            OutCoverSlot = Covers[I].Cover;
            bFound = true;
        }
        ++I;
        // [Loop Continue]
        goto J0x26;
    }
    return bFound;
    //return ReturnValue;    
}

function HasNegativeRating()
{
    local /*0x97E50000-0x00000000*/ private byte InRatingFactor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0xA1 [Loop If]
    if(I < Covers.Length)
    {
        // End:0x93
        if((Covers[I].Rating < 0.0000000) && Covers[I].RatingFactors[int(InRatingFactor)] < 0.0000000)
        {
            return true;
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

function DoesItNeedImmediateReaction()
{
    local /*0x97E50000-0x00000000*/ private byte InInvalidReason[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x19
    if(int(InInvalidReason) == int(3))
    {
        return true;        
    }
    else
    {
        // End:0x2F
        if(int(InInvalidReason) == int(4))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetAmbushCover()
{
    local /*0x97E50000-0x00000000*/ private @NULL OutCoverSlot[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float CoverRating, BestRating;
    local /*0x97E50000-0x00000000*/ private bool bFound;
    local /*0x97E50000-0x00000000*/ private int I;

    BestRating = 0.0000000;
    bFound = false;
    I = 0;
    J0x26:

    // End:0x2D4 [Loop If]
    if(I < Covers.Length)
    {
        // End:0x71
        if(Covers[I].Rating <= 0.0000000)
        {            
        }
        else
        {
            // End:0x11A
            if(int(Covers[I].Cover.Link.Slots[Covers[I].Cover.SlotIdx].CoverType) == int(2))
            {                
            }
            else
            {
                CoverRating = 0.0000000;
                CoverRating += Covers[I].RatingFactors[2];
                CoverRating += Covers[I].RatingFactors[1];
                CoverRating += Covers[I].RatingFactors[4];
                CoverRating += Covers[I].RatingFactors[5];
                CoverRating += Covers[I].RatingFactors[6];
                CoverRating -= Covers[I].RatingFactors[3];
                // End:0x2C6
                if(CoverRating > BestRating)
                {
                    BestRating = CoverRating;
                    OutCoverSlot = Covers[I].Cover;
                    bFound = true;
                }
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x26;
    }
    return bFound;
    //return ReturnValue;    
}

function InvalidCover()
{
    local /*0x97E50000-0x00000000*/ private @NULL InCover[25296897];
    local /*0x97E50000-0x00000000*/ private byte InvalidReason[8388609];
    local /*0x97E50000-0x00000000*/ private float SpreadDistance[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL OtherCover, ThisCoverLocation, OtherCoverLocation;
    local /*0x97E50000-0x00000000*/ private float SpreadDistanceSq;
    local /*0x97E50000-0x00000000*/ private int CoverIdx, SlotIdx;

    300.0000000
    // End:0x2D
    if(InCover.Link == none)
    {
        return;
    }
    CoverIdx = GetCoverIdx(InCover);
    // End:0xB9
    if(CoverIdx != -1)
    {
        Covers[CoverIdx].Rating = 0.0000000;
        Covers[CoverIdx].InvalidReason = InvalidReason;
    }
    // End:0x2B6
    if(SpreadDistance > 0.0000000)
    {
        SpreadDistanceSq = SpreadDistance * SpreadDistance;
        ThisCoverLocation = InCover.Link.GetSlotLocation(InCover.SlotIdx);
        SlotIdx = 0;
        J0x14E:

        // End:0x2B6 [Loop If]
        if(SlotIdx < InCover.Link.Slots.Length)
        {
            // End:0x1BB
            if(SlotIdx == InCover.SlotIdx)
            {                
            }
            else
            {
                OtherCoverLocation = InCover.Link.GetSlotLocation(SlotIdx);
                // End:0x228
                if(VSizeSq(ThisCoverLocation - OtherCoverLocation) > SpreadDistanceSq)
                {                    
                }
                else
                {
                    OtherCover.Link = InCover.Link;
                    OtherCover.SlotIdx = SlotIdx;
                    InvalidCover(OtherCover, InvalidReason, 0.0000000);
                }
            }
            ++SlotIdx;
            // [Loop Continue]
            goto J0x14E;
        }
    }
    //return;    
}

function GetCoverIdx()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cover[25296897];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], I;

    I = 0;
    J0x0B:

    // End:0x76 [Loop If]
    if(I < Covers.Length)
    {
        // End:0x68
        if(Covers[I].Cover == Cover)
        {
            return I;
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    return -1;
    //return ReturnValue;    
}

function GetMinRatingFactor()
{
    local /*0x97E50000-0x00000000*/ private int inCoverIdx[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private byte RatingFactor;
    local /*0x97E50000-0x00000000*/ private float MinValue, Value;

    RatingFactor = 0;
    MinValue = 100000000000000.0000000;
    Idx = 0;
    J0x26:

    // End:0xD2 [Loop If]
    if(Idx < 11)
    {
        Value = Covers[inCoverIdx].RatingFactors[Idx];
        // End:0xC4
        if((Value != 0.0000000) && Value < MinValue)
        {
            MinValue = Value;
            RatingFactor = byte(Idx);
        }
        ++Idx;
        // [Loop Continue]
        goto J0x26;
    }
    return RatingFactor;
    //return ReturnValue;    
}

function GetMaxRatingFactor()
{
    local /*0x97E50000-0x00000000*/ private int inCoverIdx[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private byte RatingFactor;
    local /*0x97E50000-0x00000000*/ private float MaxValue, Value;

    RatingFactor = 0;
    MaxValue = -100000000000000.0000000;
    Idx = 0;
    J0x26:

    // End:0xD2 [Loop If]
    if(Idx < 11)
    {
        Value = Covers[inCoverIdx].RatingFactors[Idx];
        // End:0xC4
        if((Value != 0.0000000) && Value > MaxValue)
        {
            MaxValue = Value;
            RatingFactor = byte(Idx);
        }
        ++Idx;
        // [Loop Continue]
        goto J0x26;
    }
    return RatingFactor;
    //return ReturnValue;    
}

static function CreateNewInstance()
{
    local /*0x97E50000-0x00000000*/ private @NULL Ctrl[8388609], ReturnValue, newExplorer;

    newExplorer = LPSurroundCoverExplorer(default.Class.static.Create(Ctrl));
    // End:0x98
    if(newExplorer != none)
    {
        // End:0x98
        if(!newExplorer.CreateTraversal())
        {
            newExplorer.Destroy();
            newExplorer = none;
        }
    }
    return newExplorer;
    //return ReturnValue;    
}

function Cleanup()
{
    ClearAllCovers();
    // End:0x81
    if(CoverTraversal != none)
    {
        CoverTraversal.Cleanup();
        CoverTraversal.Abort();
        CoverTraversal.Destroy();
        CoverTraversal = none;
    }
    //return;    
}

function GetTraversalClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return none;
    //return ReturnValue;    
}

protected function CreateTraversal()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    CoverTraversal = LPKyTraversalCover(static.GetTraversalClass().Create(Outer));
    // End:0xB0
    if(CoverTraversal != none)
    {
        CoverTraversal.SetFinishCallBack(CoverTraversalFinished);
        CoverTraversal.SetAbortCallBack(CoverTraversalAborted);
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

protected function StartExploration()
{
    local /*0x97E50000-0x00000000*/ private @NULL InStartPos[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x99
    if(CoverTraversal != none)
    {
        // End:0x97
        if(!CoverTraversal.IsRunning())
        {
            CoverTraversal.StartAndBindToController(Outer, Outer.Pawn.Location, MaxDistanceLookCover);
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

protected function AbortExploration()
{
    // End:0x2E
    if(CoverTraversal != none)
    {
        CoverTraversal.Abort();
    }
    //return;    
}

protected function ClearAllCovers()
{
    Covers.Length = 0;
    //return;    
}

protected function CoverTraversalFinished()
{
    bFirstTraversalFinished = true;
    // End:0x43
    if(CoverTraversal != none)
    {
        CoverTraversal.GetCovers(Covers);
    }
    //return;    
}

protected function CoverTraversalAborted()
{
    ClearAllCovers();
    //return;    
}

function SearchForCover()
{
    CoverTraversal.SetLookForCover(true);
    CoverTraversal.SetLookForOpenPosition(false);
    // End:0x8C
    if(!bContinuouslyPerformTraversal)
    {
        StartExploration(Outer.Pawn.Location);
    }
    //return;    
}

function SearchForOpenPosition()
{
    CoverTraversal.SetLookForCover(false);
    CoverTraversal.SetLookForOpenPosition(true);
    // End:0x8C
    if(!bContinuouslyPerformTraversal)
    {
        StartExploration(Outer.Pawn.Location);
    }
    //return;    
}

auto state StartState
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        bFirstTraversalFinished = false;
        //return;        
    }
    J0x00:
    // End:0x80 [Loop If]
    if(bContinuouslyPerformTraversal)
    {
        // End:0x6E
        if(Outer.MainEnemy != none)
        {
            StartExploration(Outer.Pawn.Location);
        }
        Sleep(1.0000000);
        // [Loop Continue]
        goto J0x00;
    }
    stop;                
}

defaultproperties
{
    MaxDistanceLookCover=2500.0000000
    bContinuouslyPerformTraversal=true
}