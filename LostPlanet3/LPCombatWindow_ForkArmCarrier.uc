class LPCombatWindow_ForkArmCarrier extends LPCombatWindow_ForkArm
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x7CAF0000-0x00000000*/ private byte GrabPoint[65537];

function GetGrabPointIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return int(GrabPoint);
    //return ReturnValue;    
}

function IsValid()
{
    local /*0x97E50000-0x00000000*/ private @NULL Performer[8388609], Target;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CarrierPawn;

    CarrierPawn = LPAIPawnCarrier(Target);
    // End:0xA2
    if(CarrierPawn != none)
    {
        // End:0x68
        if(int(GrabPoint) == int(0))
        {
            // End:0x65
            if(CarrierPawn.AreCellsOnSideDestroyed(0))
            {
                return false;
            }            
        }
        else
        {
            // End:0xA2
            if(int(GrabPoint) == int(1))
            {
                // End:0xA2
                if(CarrierPawn.AreCellsOnSideDestroyed(1))
                {
                    return false;
                }
            }
        }
    }
    return super.IsValid(Performer, Target);
    //return ReturnValue;    
}

static function IsBetterWindow()
{
    local /*0x97E50000-0x00000000*/ private @NULL TestWindow[25296897], BaselineWindow, inPawn;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LPPI, LPCW;

    LPCW = LPCombatWindow_ForkArmCarrier(TestWindow.CombatWindow);
    LPPC = LPPlayerController(inPawn.Controller);
    // End:0x205
    if((LPPC != none) && LPCW != none)
    {
        LPPI = LPPlayerInput(LPPC.PlayerInput);
        // End:0x205
        if(LPPI != none)
        {
            // End:0x15E
            if((LPPI.UnfilteredRotationStick.X > float(0)) || LPPI.UnfilteredMovementStick.X > float(0))
            {
                return int(LPCW.GrabPoint) == int(1);                
            }
            else
            {
                // End:0x1FC
                if((LPPI.UnfilteredRotationStick.X < float(0)) || LPPI.UnfilteredMovementStick.X < float(0))
                {
                    return int(LPCW.GrabPoint) == int(0);                    
                }
                else
                {
                    return Rand(100) < 50;
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}
