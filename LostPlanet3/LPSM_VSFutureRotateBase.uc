class LPSM_VSFutureRotateBase extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RotateDestinationActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RotationDestination;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    MySPPawn.Mesh.RootMotionMode = 3;
    MySPPawn.Mesh.RootMotionRotationMode = 1;
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.Mesh.RootMotionMode = 2;
    MySPPawn.Mesh.RootMotionRotationMode = 0;
    RotateDestinationActor = none;
    //return;    
}

function PrepSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], InteractionActor;

    super(SPSpecialMoveStateBased).PrepSpecialMove(PrevMove, InteractionActor);
    RotateDestinationActor = InteractionActor;
    // End:0x66
    if(InteractionActor != none)
    {
        RotationDestination = InteractionActor.Location;
    }
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CurrentDir, DirToTarget;
    local /*0x97E50000-0x00000000*/ private float dotprod;

    super.Tick(DeltaTime);
    // End:0x133
    if(RotateDestinationActor != none)
    {
        CurrentDir = Vector(MySPPawn.Rotation);
        DirToTarget = RotationDestination - MySPPawn.Location;
        DirToTarget.Z = 0.0000000;
        DirToTarget = Normal(DirToTarget);
        dotprod = DirToTarget Dot CurrentDir;
        // End:0x133
        if(dotprod >= 0.9960000)
        {
            MySPPawn.StopFullBodyAnim(0.5000000);
            MySPPawn.EndSpecialMove(Class);
        }
    }
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    AnimationTemplateNodeNames=/* Array type was not detected. */
}