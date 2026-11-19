class LPSM_PlayerCarrierSweepOnGround extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OnGroundTimeLeft;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], MyLPPawn;

    MyLPPawn = LPPawn(MySPPawn);
    // End:0x56
    if(MyLPPawn != none)
    {
        OnGroundTimeLeft = MyLPPawn.CarrierKnockDownTimeToStayOnGround;        
    }
    else
    {
        OnGroundTimeLeft = 1.0000000;
    }
    // End:0xD0
    if(LPPlayerController(MySPPawn.Controller) != none)
    {
        LPPlayerController(MySPPawn.Controller).IgnoreMoveInput(true);
    }
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0x87
    if(LPPlayerController(MySPPawn.Controller) != none)
    {
        LPPlayerController(MySPPawn.Controller).IgnoreMoveInput(false);
    }
    // End:0xC2
    if(NextMove == none)
    {
        MySPPawn.DoSpecialMove(Class'LPSM_PlayerCarrierSweepGetUp');
    }
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    // End:0xE3
    if(OnGroundTimeLeft > float(0))
    {
        OnGroundTimeLeft -= DeltaTime;
        // End:0x8B
        if(OnGroundTimeLeft <= float(0))
        {
            OnGroundTimeLeft = 0.0000000;
            SMFinishedDelegate = None;
            MySPPawn.EndSpecialMove(Class);            
        }
        else
        {
            MySPPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
            MySPPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        }
    }
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
        // End:0x36
        case Class'LPSMMTypes'.default.SMM_AllowSMToContinueOnIgnoreMoveInput:
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
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}