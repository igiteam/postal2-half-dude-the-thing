class LPAIResSurroundFormation extends SPAIResGroupMultiLocation within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

const LPAIResSurroundFormation_UpdateFrequency = 1.0;

struct native SubSpanInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Resource;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bChanged;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int StartIdx;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int EndIdx;

    structdefaultproperties
    {
        Resource=none
        bChanged=false
        StartIdx=-1
        EndIdx=-1
    }
};

struct native FormationConnectedPositions
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array TotalSpan;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array SubSpan;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array TotalSpanBanned;

    structdefaultproperties
    {
        TotalSpan=none
        SubSpan=none
        TotalSpanBanned=none
    }
};

struct native ContentClassInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name PawnClassName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ControllerClassName;

    structdefaultproperties
    {
        PawnClassName="None"
        ControllerClassName="None"
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxInFormation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FormationExplorer[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastExploreOrigin[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ContentClasses[537001985];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentContentClasses[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Span[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsExploring[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNewSpansAvailable[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool TraversalRender[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool FormationBlockCheckEnabled[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsFormationBlocked[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDebugDrawForamtionExplorer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDebugDrawSpans;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumPositionsAvailable[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextUpdateTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DefaultMinRadius[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DefaultIdealRadius[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DefaultMaxRadius[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FrequencyOfFormationBlockCheck[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FormationBlockCheckDisableTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FormationBlockCheckMaxTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FormationBlockCheckFrequency[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FormationBlockCheckNextTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SectorsPerAttackerFactor[536870913];

// Export ULPAIResSurroundFormation::execGetAccess(FFrame&, void* const)
native function GetAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    false                    
}

// Export ULPAIResSurroundFormation::execGetAccessForNewUser(FFrame&, void* const)
native function GetAccessForNewUser()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000                
}

// Export ULPAIResSurroundFormation::execIsAllowedAccess(FFrame&, void* const)
protected native function IsAllowedAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIResSurroundFormation::execIsAccessPossible(FFrame&, void* const)
native function IsAccessPossible()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIResSurroundFormation::execGetPawnsAtLocation(FFrame&, void* const)
native function GetPawnsAtLocation()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array OutPawns[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL InLocation[25296897];
    local /*0x97E50000-0x00000000*/ private float Inradius[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIResSurroundFormation::execUpdate(FFrame&, void* const)
native function Update();

function Init()
{
    super.Init();
    bIsExploring = false;
    NextUpdateTime = Outer.GetTimeSeconds() + 0.1000000;
    //return;    
}

function BeginPlay()
{
    MakeRadiusValid();
    DefaultMinRadius = Attribute.MinFormationRadius;
    DefaultIdealRadius = Attribute.FormationRadius;
    DefaultMaxRadius = Attribute.MaxFormationRadius;
    NextUpdateTime = Outer.GetTimeSeconds() + 0.1000000;
    // End:0xC5
    if(!bStarted)
    {
        StartExploration();
    }
    //return;    
}

function GetFormationRadius()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Attribute.FormationRadius;
    //return ReturnValue;    
}

function GetMaxFormationRadius()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Attribute.MaxFormationRadius;
    //return ReturnValue;    
}

function IsFormationBlockedByPawns()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x95
    if(FormationBlockCheckEnabled)
    {
        // End:0x8A
        if(FormationBlockCheckDisableTime < Outer.GetTimeSeconds())
        {
            FormationBlockCheckDisableTime = Outer.GetTimeSeconds() + FormationBlockCheckMaxTime;
            FormationBlockCheckNextTime = 0.0000000;
            UpdateFormationBlockCheck();            
        }
        else
        {
            return bIsFormationBlocked;
        }
    }
    return false;
    //return ReturnValue;    
}

event UpdateFormationBlockCheck()
{
    local /*0x97E50000-0x00000000*/ private float CurTime;

    // End:0x83
    if(CanDoFormationBlockCheck())
    {
        CurTime = Outer.GetTimeSeconds();
        // End:0x80
        if(FormationBlockCheckNextTime < CurTime)
        {
            bIsFormationBlocked = DoFormationBlockCheck();
            FormationBlockCheckNextTime = FormationBlockCheckFrequency + CurTime;
        }        
    }
    else
    {
        bIsFormationBlocked = false;
    }
    //return;    
}

function CanDoFormationBlockCheck()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3C
    if(FormationBlockCheckEnabled)
    {
        // End:0x3C
        if(FormationBlockCheckDisableTime > Outer.GetTimeSeconds())
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function DoFormationBlockCheck()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShutDown()
{
    super.ShutDown();
    RemoveAllResources();
    // End:0x78
    if(FormationExplorer != none)
    {
        FormationExplorer.AbortExploration();
        FormationExplorer.Destroy();
        FormationExplorer = none;
        bIsExploring = false;
    }
    bStarted = false;
    //return;    
}

function GetResourceIndices()
{
    local /*0x97E50000-0x00000000*/ private @NULL Res[8388609];
    local /*0x97E50000-0x00000000*/ private int OutSpanIndex[25165825], OutSubSpanIndex, SpanIndex, SubSpanIndex;

    OutSpanIndex = -1;
    OutSubSpanIndex = -1;
    // End:0x125
    if(Res != none)
    {
        SpanIndex = 0;
        J0x38:

        // End:0x125 [Loop If]
        if(SpanIndex < Span.Length)
        {
            SubSpanIndex = 0;
            J0x5B:

            // End:0x117 [Loop If]
            if(SubSpanIndex < Span[SpanIndex].SubSpan.Length)
            {
                // End:0x109
                if(Span[SpanIndex].SubSpan[SubSpanIndex].Resource == Res)
                {
                    OutSpanIndex = SpanIndex;
                    OutSubSpanIndex = SubSpanIndex;
                    return;
                }
                ++SubSpanIndex;
                // [Loop Continue]
                goto J0x5B;
            }
            ++SpanIndex;
            // [Loop Continue]
            goto J0x38;
        }
    }
    //return;    
}

function IsResourceAssigned()
{
    local /*0x97E50000-0x00000000*/ private @NULL Res[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int SpanIndex, SubSpanIndex;

    GetResourceIndices(Res, SpanIndex, SubSpanIndex);
    return (SpanIndex > -1) && SubSpanIndex > -1;
    //return ReturnValue;    
}

event AssignResourceToSpan()
{
    local /*0x97E50000-0x00000000*/ private @NULL Res[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Best;

    // End:0x63
    if(Res != none)
    {
        // End:0x63
        if(!IsResourceAssigned(Res))
        {
            // End:0x63
            if(GetBestSpanForResource(Res, Best))
            {
                return AddResourceToSpan(Best, Res);
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function GetBestSpanForResource()
{
    local /*0x97E50000-0x00000000*/ private @NULL Res[8388609];
    local /*0x97E50000-0x00000000*/ private int Best[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL User;

    Best = -1;
    // End:0x8A
    if(Res != none)
    {
        User = Res.GetAUser();
        // End:0x76
        if(User != none)
        {
            return GetBestSpanForUser(User, Best);            
        }
        else
        {
            return GetSpanWithMostFreeSpace(Best);
        }
    }
    return false;
    //return ReturnValue;    
}

function AreAllPositionsBanned()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bAllPositionsBanned;
    local /*0x97E50000-0x00000000*/ private int I;

    bAllPositionsBanned = true;
    I = 0;
    J0x17:

    // End:0x9F [Loop If]
    if(I < Span.Length)
    {
        // End:0x91
        if(Span[I].TotalSpanBanned.Length < Span[I].TotalSpan.Length)
        {
            bAllPositionsBanned = false;
            // [Explicit Break]
            goto J0x9F;
        }
        ++I;
        // [Loop Continue]
        goto J0x17;
    }
    J0x9F:

    return bAllPositionsBanned;
    //return ReturnValue;    
}

function ResetAllBannedPositions()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x81 [Loop If]
    if(I < Span.Length)
    {
        Span[I].TotalSpanBanned.Remove(0, Span[I].TotalSpanBanned.Length);        
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function GetBestSpanForUser()
{
    local /*0x97E50000-0x00000000*/ private @NULL User[8388609];
    local /*0x97E50000-0x00000000*/ private int Best[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private float DistSq, mindistsq;

    Best = -1;
    // End:0x146
    if(User != none)
    {
        // End:0x35
        if(AreAllPositionsBanned())
        {
            ResetAllBannedPositions();
        }
        mindistsq = 2147484000.0000000 * float(2147483647);
        I = 0;
        J0x58:

        // End:0x123 [Loop If]
        if(I < Span.Length)
        {
            // End:0x115
            if(Span[I].SubSpan.Length == 0)
            {
                DistSq = GetMinDistSqFromSpan(User.Location, I);
                // End:0x115
                if(DistSq < mindistsq)
                {
                    mindistsq = DistSq;
                    Best = I;
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x58;
        }
        // End:0x146
        if(Best < 0)
        {
            return GetSpanWithMostFreeSpace(Best);
        }
    }
    return Best >= 0;
    //return ReturnValue;    
}

function GetSpanWithMostFreeSpace()
{
    local /*0x97E50000-0x00000000*/ private int Best[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int SpanIndex, MaxFreePositions, PotentialFreePositions;

    MaxFreePositions = 0;
    Best = -1;
    SpanIndex = 0;
    J0x25:

    // End:0x120 [Loop If]
    if(SpanIndex < Span.Length)
    {
        // End:0x112
        if(Span[SpanIndex].SubSpan.Length != 0)
        {
            PotentialFreePositions = Span[SpanIndex].TotalSpan.Length - Span[SpanIndex].SubSpan.Length;
            // End:0x112
            if((PotentialFreePositions > 0) && PotentialFreePositions > MaxFreePositions)
            {
                MaxFreePositions = PotentialFreePositions;
                Best = SpanIndex;
            }
        }
        ++SpanIndex;
        // [Loop Continue]
        goto J0x25;
    }
    return Best >= 0;
    //return ReturnValue;    
}

function AddResourceToSpan()
{
    local /*0x97E50000-0x00000000*/ private int SpanIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Res[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int SubSpanIndex, NumSubSpans, NewSubSpanIndex;

    // End:0x1C5
    if((Res != none) && SpanIndex < Span.Length)
    {
        NumSubSpans = Span[SpanIndex].SubSpan.Length;
        SubSpanIndex = 0;
        J0x65:

        // End:0x180 [Loop If]
        if(SubSpanIndex < NumSubSpans)
        {
            // End:0x172
            if((Span[SpanIndex].SubSpan[SubSpanIndex].Resource == none) || Span[SpanIndex].SubSpan[SubSpanIndex].Resource.IsPendingKill())
            {
                Span[SpanIndex].SubSpan[SubSpanIndex].Resource = Res;
                return true;
            }
            ++SubSpanIndex;
            // [Loop Continue]
            goto J0x65;
        }
        // End:0x1C5
        if(AddNewSubSpanToSpan(SpanIndex, NewSubSpanIndex))
        {
            return AssignResourceToSubSpan(SpanIndex, NewSubSpanIndex, Res);
        }
    }
    return false;
    //return ReturnValue;    
}

function AssignResourceToSubSpan()
{
    local /*0x97E50000-0x00000000*/ private int SpanIndex[8388609], SubSpanIndex;
    local /*0x97E50000-0x00000000*/ private @NULL Res[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL pos;

    // End:0x28D
    if((Res != none) && SpanIndex < Span.Length)
    {
        // End:0x28D
        if(SubSpanIndex < Span[SpanIndex].SubSpan.Length)
        {
            Res.ClearLocations();
            I = Span[SpanIndex].SubSpan[SubSpanIndex].StartIdx;
            J0xCA:

            // End:0x1F8 [Loop If]
            if(I <= Span[SpanIndex].SubSpan[SubSpanIndex].EndIdx)
            {
                // End:0x188
                if((I < Span[SpanIndex].TotalSpanBanned.Length) && Span[SpanIndex].TotalSpanBanned[I])
                {                    
                }
                else
                {
                    pos = Span[SpanIndex].TotalSpan[I];
                    Res.AddLocation(pos);
                }
                ++I;
                // [Loop Continue]
                goto J0xCA;
            }
            Span[SpanIndex].SubSpan[SubSpanIndex].bChanged = true;
            Span[SpanIndex].SubSpan[SubSpanIndex].Resource = Res;
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function BanFormationPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL FormationPosition[8388609];
    local /*0x97E50000-0x00000000*/ private int SpanIdx, PositionIdx;

    SpanIdx = 0;
    J0x0B:

    // End:0xE5 [Loop If]
    if(SpanIdx < Span.Length)
    {
        PositionIdx = 0;
        J0x2E:

        // End:0xD7 [Loop If]
        if(PositionIdx < Span[SpanIdx].TotalSpan.Length)
        {
            // End:0xC9
            if(VSizeSq(FormationPosition - Span[SpanIdx].TotalSpan[PositionIdx]) < float(10 * 10))
            {
                BanSpanPosition(SpanIdx, PositionIdx);
            }
            ++PositionIdx;
            // [Loop Continue]
            goto J0x2E;
        }
        ++SpanIdx;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function BanSpanPosition()
{
    local /*0x97E50000-0x00000000*/ private int SpanIndex[8388609], PositionIndex;

    // End:0x172
    if(SpanIndex < Span.Length)
    {
        // End:0x172
        if(PositionIndex < Span[SpanIndex].TotalSpan.Length)
        {
            // End:0x140
            if(Span[SpanIndex].TotalSpanBanned.Length != Span[SpanIndex].TotalSpan.Length)
            {
                Span[SpanIndex].TotalSpanBanned.Remove(0, Span[SpanIndex].TotalSpanBanned.Length);                
                Span[SpanIndex].TotalSpanBanned.Insert(0, Span[SpanIndex].TotalSpan.Length);                
            }
            Span[SpanIndex].TotalSpanBanned[PositionIndex] = true;
        }
    }
    //return;    
}

function AddNewSubSpanToSpan()
{
    local /*0x97E50000-0x00000000*/ private int SpanIndex[8388609], SubSpanIndex;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL NewSubSpan;
    local /*0x97E50000-0x00000000*/ private int TotalPositions, NumSubSpans;

    SubSpanIndex = -1;
    // End:0x13B
    if(SpanIndex < Span.Length)
    {
        TotalPositions = Span[SpanIndex].TotalSpan.Length;
        NumSubSpans = Span[SpanIndex].SubSpan.Length;
        // End:0x13B
        if(TotalPositions > NumSubSpans)
        {
            NewSubSpan.bChanged = true;
            Span[SpanIndex].SubSpan.AddItem(NewSubSpan);            
            SubSpanIndex = Span[SpanIndex].SubSpan.Length - 1;
            SetSubSpanIndicesForSpan(SpanIndex);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

protected function SetSubSpanIndicesForSpan()
{
    local /*0x97E50000-0x00000000*/ private int SpanIndex[8388609], TotalPositions, NumSubSpans, PositionsPerSubSpan, SubSpanIndex, StartIndex,
	    EndIndex;

    // End:0x2F7
    if(SpanIndex < Span.Length)
    {
        TotalPositions = Span[SpanIndex].TotalSpan.Length;
        NumSubSpans = Span[SpanIndex].SubSpan.Length;
        // End:0x2F7
        if(NumSubSpans > 0)
        {
            PositionsPerSubSpan = TotalPositions / NumSubSpans;
            StartIndex = 0;
            EndIndex = 0;
            SubSpanIndex = 0;
            J0xC8:

            // End:0x2F7 [Loop If]
            if(SubSpanIndex < Span[SpanIndex].SubSpan.Length)
            {
                EndIndex = (StartIndex + PositionsPerSubSpan) - 1;
                // End:0x14B
                if(EndIndex >= TotalPositions)
                {
                    EndIndex = TotalPositions - 1;
                }
                Span[SpanIndex].SubSpan[SubSpanIndex].StartIdx = StartIndex;
                Span[SpanIndex].SubSpan[SubSpanIndex].EndIdx = EndIndex;
                Span[SpanIndex].SubSpan[SubSpanIndex].bChanged = true;
                StartIndex = EndIndex + 1;
                // End:0x2E9
                if(Span[SpanIndex].SubSpan[SubSpanIndex].Resource != none)
                {
                    AssignResourceToSubSpan(SpanIndex, SubSpanIndex, Span[SpanIndex].SubSpan[SubSpanIndex].Resource);
                }
                ++SubSpanIndex;
                // [Loop Continue]
                goto J0xC8;
            }
        }
    }
    //return;    
}

protected function GetMinDistSqFromSpan()
{
    local /*0x97E50000-0x00000000*/ private @NULL pos[25296897];
    local /*0x97E50000-0x00000000*/ private int SpanIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], DistSq, mindistsq;
    local /*0x97E50000-0x00000000*/ private int I;

    mindistsq = 2147484000.0000000 * float(2147483647);
    // End:0x15C
    if(SpanIndex < Span.Length)
    {
        I = 0;
        J0x3B:

        // End:0x15C [Loop If]
        if(I < Span[SpanIndex].TotalSpan.Length)
        {
            // End:0xDD
            if((I < Span[SpanIndex].TotalSpanBanned.Length) && Span[SpanIndex].TotalSpanBanned[I])
            {                
            }
            else
            {
                DistSq = VSizeSq(Span[SpanIndex].TotalSpan[I] - pos);
                // End:0x14E
                if(DistSq < mindistsq)
                {
                    mindistsq = DistSq;
                }
            }
            ++I;
            // [Loop Continue]
            goto J0x3B;
        }
    }
    return mindistsq;
    //return ReturnValue;    
}

protected function GetSpanDirectionVectors()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartDir[25165825], EndDir;
    local /*0x97E50000-0x00000000*/ private int SpanIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Origin;

    // End:0x1A5
    if((SpanIndex < Span.Length) && Span[SpanIndex].TotalSpan.Length > 0)
    {
        Origin = Outer.GetOuterLocation();
        Origin.Z = 0.0000000;
        StartDir = Span[SpanIndex].TotalSpan[0];
        EndDir = Span[SpanIndex].TotalSpan[Span[SpanIndex].TotalSpan.Length - 1];
        StartDir.Z = 0.0000000;
        EndDir.Z = 0.0000000;
        StartDir = Normal(StartDir - Origin);
        EndDir = Normal(EndDir - Origin);
        return true;
    }
    return false;
    //return ReturnValue;    
}

protected function GetSpanHalfAngleAndDirection()
{
    local /*0x97E50000-0x00000000*/ private float HalfAngle[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL SpanDirection[25165825];
    local /*0x97E50000-0x00000000*/ private int SpanIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL StartDir, EndDir;

    // End:0xEE
    if(GetSpanDirectionVectors(StartDir, EndDir, SpanIndex))
    {
        HalfAngle = Acos(StartDir Dot EndDir);
        SpanDirection = Normal((StartDir + EndDir) * 0.5000000);
        // End:0xDC
        if(StartDir Cross EndDir.Z < float(0))
        {
            HalfAngle = (2.0000000 * 3.1415930) - HalfAngle;
            SpanDirection = -SpanDirection;
        }
        HalfAngle *= 0.5000000;
        return true;
    }
    return false;
    //return ReturnValue;    
}

protected function GetAngularSeperationFromSpan()
{
    local /*0x97E50000-0x00000000*/ private float AngularSeperationFromSpan[25165825], AngularSeperationFromSpanDirection;
    local /*0x97E50000-0x00000000*/ private @NULL pos[25296897];
    local /*0x97E50000-0x00000000*/ private int SpanIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Origin, SpanDirection, Direction;
    local /*0x97E50000-0x00000000*/ private float HalfAngle;

    // End:0x130
    if(GetSpanHalfAngleAndDirection(HalfAngle, SpanDirection, SpanIndex))
    {
        Origin = Outer.GetOuterLocation();
        Origin.Z = 0.0000000;
        Direction = pos;
        Direction.Z = 0.0000000;
        Direction = Normal(Direction - Origin);
        AngularSeperationFromSpanDirection = Acos(Direction Dot SpanDirection);
        AngularSeperationFromSpan = AngularSeperationFromSpanDirection - HalfAngle;
        // End:0x12E
        if(AngularSeperationFromSpan < float(0))
        {
            AngularSeperationFromSpan = 0.0000000;
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

protected function GetMinDistSqFromSubSpan()
{
    local /*0x97E50000-0x00000000*/ private @NULL pos[25296897];
    local /*0x97E50000-0x00000000*/ private int SpanIndex[8388609], SubSpanIndex;
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], DistSq, mindistsq;
    local /*0x97E50000-0x00000000*/ private int StartIdx, EndIdx, I;

    mindistsq = 2147484000.0000000 * float(2147483647);
    // End:0x215
    if(SpanIndex < Span.Length)
    {
        // End:0x215
        if(SubSpanIndex < Span[SpanIndex].SubSpan.Length)
        {
            StartIdx = Span[SpanIndex].SubSpan[SubSpanIndex].StartIdx;
            EndIdx = Span[SpanIndex].SubSpan[SubSpanIndex].EndIdx;
            I = StartIdx;
            J0x112:

            // End:0x215 [Loop If]
            if(I <= EndIdx)
            {
                // End:0x196
                if((I < Span[SpanIndex].TotalSpanBanned.Length) && Span[SpanIndex].TotalSpanBanned[I])
                {                    
                }
                else
                {
                    DistSq = VSizeSq(Span[SpanIndex].TotalSpan[I] - pos);
                    // End:0x207
                    if(DistSq < mindistsq)
                    {
                        mindistsq = DistSq;
                    }
                }
                ++I;
                // [Loop Continue]
                goto J0x112;
            }
        }
    }
    return mindistsq;
    //return ReturnValue;    
}

function IsVisible()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[8388609], TestActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bCanSee;
    local /*0x97E50000-0x00000000*/ private @NULL AUser, AUserController;

    AUser = Pawn(GetAUser());
    // End:0x54
    if(AUser != none)
    {
        AUserController = AUser.Controller;
    }
    // End:0xB1
    if(AUserController == none)
    {
        AUserController = Controller(Class'SPEngine.SPUtil'.static.GetDefaultObject(CurrentContentClasses.ControllerClassName));
    }
    bCanSee = false;
    // End:0x105
    if(AUserController != none)
    {
        bCanSee = AUserController.LineOfSightTo(TestActor, FromLocation, false);        
    }
    return bCanSee;
    //return ReturnValue;    
}

protected function ExplorationFinished()
{
    bIsExploring = false;
    bNewSpansAvailable = FormationExplorer.WerePositionsUpdated();
    //return;    
}

protected event GetNewSpansAndUpdate()
{
    local /*0x97E50000-0x00000000*/ private int I, J, NumSpans, NumPositions;
    local /*0x97E50000-0x00000000*/ private @NULL Res, Temp, tempPos;

    // End:0x28B
    if(FormationExplorer != none)
    {
        // End:0x28B
        if(bNewSpansAvailable)
        {
            bNewSpansAvailable = false;
            Span.Length = 0;
            NumSpans = FormationExplorer.NumConnectedPositions();
            NumPositionsAvailable = 0;
            I = 0;
            J0x73:

            // End:0x1AF [Loop If]
            if(I < NumSpans)
            {
                NumPositions = FormationExplorer.NumPositions(I);
                Span.AddItem(Temp);                
                J = 0;
                J0xDD:

                // End:0x16F [Loop If]
                if(J < NumPositions)
                {
                    FormationExplorer.GetPosition(I, J, tempPos);
                    Span[I].TotalSpan.AddItem(tempPos);                    
                    ++J;
                    // [Loop Continue]
                    goto J0xDD;
                }
                NumPositionsAvailable += Span[I].TotalSpan.Length;
                ++I;
                // [Loop Continue]
                goto J0x73;
            }
            I = 0;
            J0x1BA:

            // End:0x28B [Loop If]
            if(I < Resource.Length)
            {
                Res = LPAIResMultiLocation(Resource[I]);
                // End:0x27D
                if(Res != none)
                {
                    // End:0x27D
                    if(!AssignResourceToSpan(Res))
                    {
                        Res.RevokeAllAccess();
                        Resource.Remove(I, 1);                        
                        Res.Destroy();
                        --I;
                    }
                }
                ++I;
                // [Loop Continue]
                goto J0x1BA;
            }
        }
    }
    //return;    
}

function IsPawnClassLoaded()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4F
    if(SPPawn(Class'SPEngine.SPUtil'.static.GetDefaultObject(CurrentContentClasses.PawnClassName)) != none)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function FindValidContentClass()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    CurrentContentClasses.PawnClassName = 'None';
    CurrentContentClasses.ControllerClassName = 'None';
    I = 0;
    J0x57:

    // End:0x1AD [Loop If]
    if(I < ContentClasses.Length)
    {
        // End:0x19F
        if(SPPawn(Class'SPEngine.SPUtil'.static.GetDefaultObject(ContentClasses[I].PawnClassName)) != none)
        {
            // End:0x19F
            if(SPAIController(Class'SPEngine.SPUtil'.static.GetDefaultObject(ContentClasses[I].ControllerClassName)) != none)
            {
                CurrentContentClasses.PawnClassName = ContentClasses[I].PawnClassName;
                CurrentContentClasses.ControllerClassName = ContentClasses[I].ControllerClassName;
                return true;
            }
        }
        ++I;
        // [Loop Continue]
        goto J0x57;
    }
    return false;
    //return ReturnValue;    
}

event StartExploration()
{
    // End:0x219
    if(MaxInFormation > 0)
    {
        // End:0x61
        if(!IsPawnClassLoaded())
        {
            // End:0x57
            if(FormationExplorer != none)
            {
                FormationExplorer.Destroy();
                FormationExplorer = none;
            }
            FindValidContentClass();
        }
        // End:0x219
        if(IsPawnClassLoaded())
        {
            // End:0xC2
            if(FormationExplorer == none)
            {
                FormationExplorer = Class'LPSurroundFormationExplorer'.static.CreateFromPawnClassName(CurrentContentClasses.PawnClassName);
            }
            // End:0x219
            if(FormationExplorer != none)
            {
                FormationExplorer.SetSectors(int(float(MaxInFormation) * SectorsPerAttackerFactor));
                FormationExplorer.SetSearchDistances(Attribute.MinFormationRadius, Attribute.MaxFormationRadius, Attribute.FormationRadius);
                SetFormationExplorerCallBacks(FormationExplorer);
                LastExploreOrigin = Outer.GetOuterLocation();
                bIsExploring = true;
                bNewSpansAvailable = false;
                FormationExplorer.StartExploration(Outer.GetResourceManagerOwner());
                bStarted = true;
            }
        }
    }
    //return;    
}

protected function SetFormationExplorerCallBacks()
{
    local /*0x97E50000-0x00000000*/ private @NULL Explorer[8388609];

    Explorer.SetLosFunction(IsVisible);
    Explorer.SetFinishCallBack(ExplorationFinished);
    //return;    
}

protected event RemoveUnUsedResources()
{
    local /*0x97E50000-0x00000000*/ private int R;
    local /*0x97E50000-0x00000000*/ private @NULL Res;

    R = 0;
    J0x0B:

    // End:0xC5 [Loop If]
    if(R < Resource.Length)
    {
        Res = Resource[R];
        // End:0xB7
        if(Res.GetAUser() == none)
        {
            Res.RevokeAllAccess();
            RemoveResourceFromSpan(Res);
            Resource.Remove(R, 1);            
            --R;
        }
        ++R;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

protected function RemoveResourceFromSpan()
{
    local /*0x97E50000-0x00000000*/ private @NULL InRes[8388609];
    local /*0x97E50000-0x00000000*/ private int SpanIndex, SubSpanIndex;
    local /*0x97E50000-0x00000000*/ private @NULL Res;

    Res = LPAIResMultiLocation(InRes);
    // End:0xBD
    if(Res != none)
    {
        GetResourceIndices(Res, SpanIndex, SubSpanIndex);
        // End:0xBD
        if((SpanIndex > -1) && SubSpanIndex > -1)
        {
            Span[SpanIndex].SubSpan.Remove(SubSpanIndex, 1);            
            SetSubSpanIndicesForSpan(SpanIndex);
        }
    }
    //return;    
}

protected event ShouldExplore()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x6F
    if(!bIsExploring && IsPawnClassLoaded())
    {
        // End:0x6F
        if(((NumPositionsAvailable == 0) || FormationExplorer == none) || LastExploreOrigin != Outer.GetOuterLocation())
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

protected event NotifyUserOfChanges()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];
    local /*0x97E50000-0x00000000*/ private int SpanIndex, SubSpanIndex;
    local /*0x97E50000-0x00000000*/ private @NULL Res;

    false
    SpanIndex = 0;
    J0x10:

    // End:0x19B [Loop If]
    if(SpanIndex < Span.Length)
    {
        SubSpanIndex = 0;
        J0x33:

        // End:0x18D [Loop If]
        if(SubSpanIndex < Span[SpanIndex].SubSpan.Length)
        {
            // End:0x17F
            if(bForced || Span[SpanIndex].SubSpan[SubSpanIndex].bChanged)
            {
                Span[SpanIndex].SubSpan[SubSpanIndex].bChanged = false;
                Res = Span[SpanIndex].SubSpan[SubSpanIndex].Resource;
                // End:0x17F
                if(Res != none)
                {
                    Res.MarkAsChanged();
                }
            }
            ++SubSpanIndex;
            // [Loop Continue]
            goto J0x33;
        }
        ++SpanIndex;
        // [Loop Continue]
        goto J0x10;
    }
    //return;    
}

protected function MakeRadiusValid()
{
    // End:0x8A
    if(Attribute.FormationRadius <= float(0))
    {
        Attribute.FormationRadius = 1000.0000000;
        Attribute.MinFormationRadius = -1.0000000;
        Attribute.MaxFormationRadius = -1.0000000;
    }
    // End:0x12D
    if((Attribute.MinFormationRadius <= float(0)) || Attribute.MinFormationRadius >= Attribute.FormationRadius)
    {
        Attribute.MinFormationRadius = Attribute.FormationRadius * 0.5000000;
    }
    // End:0x1AA
    if(Attribute.MaxFormationRadius <= Attribute.FormationRadius)
    {
        Attribute.MaxFormationRadius = Attribute.FormationRadius * 1.5000000;
    }
    //return;    
}

function OnRadiusChange()
{
    MakeRadiusValid();
    OnParametersChanged();
    //return;    
}

function OnParametersChanged()
{
    RevokeAllAccess();
    RemoveAllResources();
    LastExploreOrigin.X = 0.0000000;
    LastExploreOrigin.Y = 0.0000000;
    LastExploreOrigin.Z = 0.0000000;
    ShutDown();
    //return;    
}

function SetMaxInFormation()
{
    local /*0x97E50000-0x00000000*/ private int NewMax[8388609];

    // End:0x1A
    if(NewMax < 0)
    {
        NewMax = 0;
    }
    MaxInFormation = NewMax;
    OnParametersChanged();
    //return;    
}

function HandleSequenceAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], OverrideFormationRadius;

    OverrideFormationRadius = SPSeqAct_OverrideFormationRadius(inAction);
    // End:0x3E
    if(OverrideFormationRadius != none)
    {
        OnOverrideFormationRadius(OverrideFormationRadius);
    }
    //return;    
}

function OnOverrideFormationRadius()
{
    local /*0x97E50000-0x00000000*/ private @NULL OverrideFormationRadius[8388609];

    // End:0x1D4
    if(OverrideFormationRadius != none)
    {
        // End:0x12F
        if(int(OverrideFormationRadius.Mode) == int(0))
        {
            Attribute.MinFormationRadius = OverrideFormationRadius.Override.MinRadius;
            Attribute.FormationRadius = OverrideFormationRadius.Override.IdealRadius;
            Attribute.MaxFormationRadius = OverrideFormationRadius.Override.MaxRadius;
            OnRadiusChange();            
        }
        else
        {
            // End:0x1D4
            if(int(OverrideFormationRadius.Mode) == int(1))
            {
                Attribute.FormationRadius = DefaultIdealRadius;
                Attribute.MinFormationRadius = DefaultMinRadius;
                Attribute.MaxFormationRadius = DefaultMaxRadius;
                OnRadiusChange();
            }
        }
    }
    //return;    
}

function WerePositionsFound()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return NumPositionsAvailable > 0;
    //return ReturnValue;    
}

defaultproperties
{
    MaxInFormation=1
    bDebugDrawForamtionExplorer=true
    bDebugDrawSpans=true
    FormationBlockCheckMaxTime=10.0000000
    FormationBlockCheckFrequency=2.0000000
    SectorsPerAttackerFactor=3.0000000
    Attribute=(FormationRadius=1000.0000000)
    GeneratedClass=Class'LPAIResMultiLocation'
}