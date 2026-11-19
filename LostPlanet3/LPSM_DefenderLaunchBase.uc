class LPSM_DefenderLaunchBase extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyDefenderPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array LaunchSegments;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    MyDefenderPawn = LPAIPawnDefender(MySPPawn);
    super.SpecialMoveStarted(bForced, PrevMove);
    MyDefenderPawn.Mesh.RootMotionMode = 0;
    MyDefenderPawn.Mesh.RootMotionRotationMode = 0;
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private editfixedsize string outOfLaunchSegments;

    // End:0x139
    if(MyDefenderPawn.TuneDataAIPawn.bShowFlyerLaunchDebug)
    {
        outOfLaunchSegments = "(";
        iter = 0;
        J0x4F:

        // End:0x121 [Loop If]
        if(iter < LaunchSegments.Length)
        {
            outOfLaunchSegments = ((((((outOfLaunchSegments $ "(X=") $ string(LaunchSegments[iter].X)) $ ",Y=") $ string(LaunchSegments[iter].Y)) $ ",Z=") $ string(LaunchSegments[iter].Z)) $ "),";
            ++iter;
            // [Loop Continue]
            goto J0x4F;
        }
        outOfLaunchSegments = outOfLaunchSegments $ ")";
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    MyDefenderPawn.Mesh.RootMotionMode = 2;
    MyDefenderPawn.Mesh.RootMotionRotationMode = 0;
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
}