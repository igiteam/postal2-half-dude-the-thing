class LPSM_GrapplingHook extends SPSpecialMoveStateBased
    config(Game);

enum EGrapplingAnim
{
    eGrappleFire,                   // 0
    eGrappleWait,                   // 1
    eGrappleTransition,             // 2
    eGrappleFlying,                 // 3
    eGrappleLanding,                // 4
    eGrappleLanded,                 // 5
    eGrappleFire_Horiz,             // 6
    eGrappleWait_Horiz,             // 7
    eGrappleTransition_Horiz,       // 8
    eGrappleFlying_Horiz,           // 9
    eGrappleLanding_Horiz,          // 10
    eGrappleLanded_Horiz,           // 11
    eGrappleFire_Vert,              // 12
    eGrappleWait_Vert,              // 13
    eGrappleTransition_Vert,        // 14
    eGrappleFlying_Vert,            // 15
    eGrappleLanding_Vert,           // 16
    eGrappleLanded_Vert,            // 17
    eGrappleCount,                  // 18
    EGrapplingAnim_MAX              // 19
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SequenceID;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ShouldLoop;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurPlayingAnimSeq;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bReadyForMove;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int GrappleTransition;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int GrappleLanding;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int GrappleLanded;

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    super(SPSpecialMove).InitSpecialMove(inPawn, InHandle);
    //return;    
}

protected function InternalCanDoSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

event AnimNotifySpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(MySPPawn.Controller);
    // End:0x82
    if(SequenceID == GrappleTransition)
    {
        // End:0x76
        if(LPPC != none)
        {
            LPPC.OnPlayerReadyToMoveToGrapplePoint();
        }
        bReadyForMove = true;
    }
    //return;    
}

function HookAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(MySPPawn.Controller);
    // End:0x93
    if((SequenceID == GrappleTransition) && !bReadyForMove)
    {
        // End:0x87
        if(LPPC != none)
        {
            LPPC.OnPlayerReadyToMoveToGrapplePoint();
        }
        bReadyForMove = true;
    }
    // End:0xBC
    if((SequenceID + 1) < 18)
    {
        SequenceID = SequenceID + 1;
    }
    PlaySequence();
    //return;    
}

function NextSequence()
{
    // End:0x2D
    if(SequenceID < GrappleTransition)
    {
        SequenceID = GrappleTransition;        
    }
    else
    {
        // End:0x5A
        if(SequenceID < GrappleLanding)
        {
            SequenceID = GrappleLanding;            
        }
        else
        {
            SequenceID = GrappleLanded;
        }
    }
    // End:0x9C
    if(!bDisableCollision)
    {
        bDisableCollision = true;
        TogglePawnCollision(MySPPawn, false);
    }
    PlaySequence();
    //return;    
}

function PlaySequence()
{
    CurPlayingAnimSeq = MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(SequenceID), HookAnimFinished,, 1.0000000, 0.1000000, 0.1000000, ShouldLoop[SequenceID], true,,, true);
    //return;    
}

function SetupSequenceIds()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn, Hook, Dest, GrappleDir, FlatDir;

    local /*0x97E50000-0x00000000*/ private float dotprod;

    // End:0x4A
    if(int(MySPPawn.WorldInfo.NetMode) == int(NM_Standalone))
    {
        SetupAsNormal();
        return;
    }
    PlayerPawn = LPPlayerPawn(MySPPawn);
    Hook = PlayerPawn.GetGrapplingHook();
    // End:0xAA
    if(Hook == none)
    {
        SetupAsNormal();
        return;
    }
    Dest = Hook.GrapplePoint;
    GrappleDir = Normal(Dest - PlayerPawn.Location);
    Dest.Z = PlayerPawn.Location.Z;
    FlatDir = Normal(Dest - PlayerPawn.Location);
    dotprod = FlatDir Dot GrappleDir;
    // End:0x201
    if(dotprod > Cos(PlayerPawn.TuneDataPlayerPawn.GrappleHorizantalMaxAngle * 0.0174533))
    {
        SetupAsHorizontal();
        return;        
    }
    else
    {
        // End:0x258
        if(dotprod < Cos(PlayerPawn.TuneDataPlayerPawn.GrappleVerticalMinAngle * 0.0174533))
        {
            SetupAsVertical();            
        }
        else
        {
            SetupAsNormal();
        }
    }
    //return;    
}

function SetupAsNormal()
{
    LPPlayerPawn(MySPPawn).GrappleMovementType = 0;
    SequenceID = 0;
    GrappleTransition = 2;
    GrappleLanding = 4;
    GrappleLanded = 5;
    //return;    
}

function SetupAsVertical()
{
    SetupAsNormal();
    //return;    
}

function SetupAsHorizontal()
{
    LPPlayerPawn(MySPPawn).GrappleMovementType = 1;
    SequenceID = 6;
    GrappleTransition = 8;
    GrappleLanding = 10;
    GrappleLanded = 11;
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    bDisableCollision = false;
    super(SPSpecialMove).SpecialMoveStarted(bForced, PrevMove);
    SetupSequenceIds();
    bReadyForMove = false;
    PlaySequence();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0x24
    if(LPSM_GrapplingFinishBase(NextMove) != none)
    {
        bDisableCollision = false;
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.StopFullBodyAnim(0.5000000);
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x40
        case Class'LPSMMTypes'.default.SMM_NextAnimSequence:
            NextSequence();
            return true;
        // End:0xFFFF
        default:
            return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

defaultproperties
{
    ShouldLoop=/* Array type was not detected. */
    AnimationTemplateNodeNames=/* Array type was not detected. */
    bAllowRotationInterpolation=true
}