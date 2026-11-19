class LPSM_PlayerVSArmSwingEndBase extends LPSM_PlayerVSArmSwingBase
    abstract
    config(Game);

function PrepSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], InteractionActor, SwingSM;

    super.PrepSpecialMove(PrevMove, InteractionActor);
    SwingSM = LPSM_PlayerVSArmSwingBase(PrevMove);
    // End:0x10D
    if(SwingSM != none)
    {
        LastButtonPressedTime = SwingSM.LastButtonPressedTime;
        LastButtonReleasedTime = SwingSM.LastButtonReleasedTime;
        bIsButtonPressed = SwingSM.bIsButtonPressed;
        // End:0xEF
        if(bIsButtonPressed)
        {
            AnimPercentAtButtonPress = 0.0000000;
            AnimPercentAtButtonRelease = -1.0000000;            
        }
        else
        {
            AnimPercentAtButtonPress = -1.0000000;
            AnimPercentAtButtonRelease = -1.0000000;
        }
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    MyLPVSPlayerPawn.NotifyAIOfMeleeSwingEnd();
    //return;    
}

function CallNotifyStart()
{
    //return;    
}

defaultproperties
{
    bStartsComboSpecialMoveInstantly=true
}