class LPSM_PlayerDodgeBossBite extends LPSM_PlayerDodgeBase
    config(Game);

static function GetDirection()
{
    local /*0x97E50000-0x00000000*/ private @NULL InPC[8388609];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL relativeInput;
    local /*0x97E50000-0x00000000*/ private int Yaw;

    LPPlayerInput(InPC.PlayerInput).GetRelativeInput(relativeInput, false);
    Yaw = Rotator(relativeInput).Yaw;
    // End:0xAA
    if((Abs(float(Yaw)) < float(8192)) && Yaw > -8192)
    {
        return Class'LPSM_PlayerDodgeBossBiteForward';        
    }
    else
    {
        // End:0xDF
        if((Yaw > 8192) && Yaw < 24576)
        {
            return Class'LPSM_PlayerDodgeBossBiteRight';            
        }
        else
        {
            // End:0x114
            if((Yaw < -8192) && Yaw > -24576)
            {
                return Class'LPSM_PlayerDodgeBossBiteLeft';                
            }
            else
            {
                return Class'LPSM_PlayerDodgeBossBiteBackward';
            }
        }
    }
    //return ReturnValue;    
}
