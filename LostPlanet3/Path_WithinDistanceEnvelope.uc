class Path_WithinDistanceEnvelope extends PathConstraint;

var(*) /*0x3B180000-0x00000000*/ private float MaxDistance[65537];
var(*) /*0x3B180000-0x00000000*/ private float MinDistance[65537];
var(*) /*0x3B180000-0x00000000*/ private bool bSoft[65537];
var(*) /*0x3B180000-0x00000000*/ private bool bOnlyThrowOutNodesThatLeaveEnvelope[65537];
var(*) /*0x3B180000-0x00000000*/ private float SoftStartPenalty[65537];
var(*) /*0x3B180000-0x00000000*/ private @NULL EnvelopeTestPoint[65537];

static function StayWithinEnvelopeToLoc()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609], InEnvelopeTestPoint;
    local /*0x35EA0000-0x00000000*/ private float InMaxDistance[8388609], InMinDistance;
    local /*0x35EA0000-0x00000000*/ private bool bInSoft[9437185];
    local /*0x35EA0000-0x00000000*/ private float InSoftStartPenalty[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bOnlyTossOutSpecsThatLeave[9437185], ReturnValue;
    local /*0x35EA0000-0x00000000*/ private @NULL Con;

    true
    -1.0000000    
    // End:0x199
    if(P != none)
    {
        Con = Path_WithinDistanceEnvelope(P.CreatePathConstraint(default.Class));
        // End:0x199
        if(Con != none)
        {
            Con.EnvelopeTestPoint = InEnvelopeTestPoint;
            Con.bSoft = bInSoft;
            Con.MaxDistance = InMaxDistance;
            Con.MinDistance = InMinDistance;
            Con.bOnlyThrowOutNodesThatLeaveEnvelope = bOnlyTossOutSpecsThatLeave;
            // End:0x16F
            if(InSoftStartPenalty > -1.0000000)
            {
                Con.SoftStartPenalty = InSoftStartPenalty;
            }
            P.AddPathConstraint(Con);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function Recycle()
{
    super.Recycle();
    MaxDistance = default.MaxDistance;
    MinDistance = default.MinDistance;
    bSoft = default.bSoft;
    SoftStartPenalty = default.SoftStartPenalty;
    EnvelopeTestPoint = default.EnvelopeTestPoint;
    bOnlyThrowOutNodesThatLeaveEnvelope = default.bOnlyThrowOutNodesThatLeaveEnvelope;
    //return;    
}

defaultproperties
{
    bSoft=true
    SoftStartPenalty=320.0000000
    CacheIdx=3
}