class LPSM_WinchEscapeBase extends SPSpecialMove
    abstract
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Target;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    Target = LPVSPlayerPawn(MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor);
    PlayEscapeAnim();
    //return;    
}

function PlayEscapeAnim()
{
    MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(0), PlayJumpingLoop,, 1.0000000, 0.1000000, -1.0000000, false, true);
    //return;    
}

function PlayJumpingLoop()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Winch;

    MySPPawn.SetPhysics(2);
    MySPPawn.SetCollision(true, true);
    MySPPawn.bBlockActors = true;
    MySPPawn.bCollideWorld = true;
    MySPPawn.CollisionComponent.SetTraceBlocking(false, true);
    MySPPawn.Mesh.SetTraceBlocking(true, false);
    // End:0x171
    if(Target != none)
    {
        Target.EndCurrentSpecialMove();
        Winch = LPWeaponVSWinch(Target.FindInventoryType(Class'LPWeaponVSWinch', true));
        Winch.GotoState('Idle');
    }
    MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(1),,, 1.0000000, 0.1000000, 0.0000000, true, true);
    //return;    
}

function NotifyLanded()
{
    MySPPawn.Mesh.RootMotionMode = 3;
    MySPPawn.Mesh.RootMotionRotationMode = 1;
    MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(2), EndSpecialMove,, 1.0000000, 0.0600000, 0.2500000, false, true, 2, 2);
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
        // End:0x41
        case Class'LPSMMTypes'.default.SMM_AIPawnLanded:
            NotifyLanded();
            // End:0x47
            break;
        // End:0xFFFF
        default:
            // End:0x47
            break;
            break;
    }
    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function EndSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    MySPPawn.EndCurrentSpecialMove();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.Mesh.RootMotionMode = 2;
    MySPPawn.Mesh.RootMotionRotationMode = 0;
    //return;    
}

defaultproperties
{
    DefaultAICommand=Class'LPAICmd_SpecialMoveBase'
}