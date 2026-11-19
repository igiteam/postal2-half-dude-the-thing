class LPSM_DongoChargingAttackVs extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DistanceToStartBounceSq;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TargetPawn;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    MySPPawn.Mesh.RootMotionMode = 2;
    MySPPawn.Mesh.RootMotionRotationMode = 0;
    TargetPawn = LPAICmd_Strike(LPAIController(MySPPawn.Controller).GetActiveCommand()).EnemyForStrike;
    // End:0x15B
    if(TargetPawn.Controller == none)
    {
        DistanceToStartBounceSq = LPAIPawnDongo(MySPPawn).TuneDataDongo.DongoDistanceToStartBounceIfEmpty;        
    }
    else
    {
        DistanceToStartBounceSq = LPAIPawnDongo(MySPPawn).TuneDataDongo.DongoDistanceToStartBounce;
    }
    DistanceToStartBounceSq *= DistanceToStartBounceSq;
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], dSq;

    dSq = VSizeSq2D(MySPPawn.Location - TargetPawn.Location);
    // End:0x95
    if(dSq <= DistanceToStartBounceSq)
    {
        MySPPawn.DoSpecialMove(Class'LPSM_DongoChargingAttackVsBounce');
    }
    //return;    
}

defaultproperties
{
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}