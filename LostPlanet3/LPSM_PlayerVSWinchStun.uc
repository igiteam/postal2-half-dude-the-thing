class LPSM_PlayerVSWinchStun extends SPSM_LeaderPawnBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    LPPawn(MySPPawn).TemplateLogicData.TargetPawn = LPPawn(FollowerPawn);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
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
        // End:0x74
        case Class'LPSMMTypes'.default.SMM_ShockStart:
            // End:0x72
            if(int(LPSM_LargePawnWinchStun(FollowerSMInstance).animationState) <= int(1))
            {
                DoVSShock();
                return true;
            }
            return false;
        // End:0xD4
        case Class'LPSMMTypes'.default.SMM_ForkArmGrabPressed:
            // End:0xD1
            if(int(LPSM_LargePawnWinchStun(FollowerSMInstance).animationState) <= int(1))
            {
                Released();
            }
            // End:0xDA
            break;
        // End:0xFFFF
        default:
            // End:0xDA
            break;
            break;
    }
    return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function Released()
{
    // End:0x98
    if(((FollowerSMInstance != none) && ClassIsChildOf(FollowerSMInstance.Class, Class'LPSM_LargePawnWinchStun')) && FollowerSMInstance == FollowerPawn.GetCurrentSpecialMoveInstance())
    {
        LPSM_LargePawnWinchStun(FollowerSMInstance).Release();        
    }
    else
    {
        MySPPawn.EndCurrentSpecialMove();
    }
    //return;    
}

function DoVSShock()
{
    //return;    
}

function StunFinished()
{
    //return;    
}

defaultproperties
{
    FollowerSpecialMoveClass=Class'LPSM_LargePawnWinchStun'
}