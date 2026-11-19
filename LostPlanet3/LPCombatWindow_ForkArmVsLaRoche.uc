class LPCombatWindow_ForkArmVsLaRoche extends LPCombatWindow_ForkArm
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x7CB30000-0x00000000*/ private byte GrabPoint[65537];

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
    local /*0x97E50000-0x00000000*/ private @NULL VsLarochePawn;

    VsLarochePawn = LPAIPawnVsLaroche(Target);
    // End:0x233
    if(VsLarochePawn != none)
    {
        // End:0x7C
        if((int(GrabPoint) == int(0)) || int(GrabPoint) == int(7))
        {
            // End:0x79
            if(VsLarochePawn.IsLeftArmGrabPointAbleToBeGrabed())
            {
                return true;
            }            
        }
        else
        {
            // End:0xCD
            if((int(GrabPoint) == int(1)) || int(GrabPoint) == int(8))
            {
                // End:0xCA
                if(VsLarochePawn.IsLeftShoulderGrabPointAbleToBeGrabed())
                {
                    return true;
                }                
            }
            else
            {
                // End:0x11E
                if((int(GrabPoint) == int(2)) || int(GrabPoint) == int(9))
                {
                    // End:0x11B
                    if(VsLarochePawn.IsRightShoulderGrabPointAbleToBeGrabed())
                    {
                        return true;
                    }                    
                }
                else
                {
                    // End:0x16F
                    if((int(GrabPoint) == int(4)) || int(GrabPoint) == int(11))
                    {
                        // End:0x16C
                        if(VsLarochePawn.IsCockpitCrossBarForShieldGrabPointAbleToBeGrabed())
                        {
                            return true;
                        }                        
                    }
                    else
                    {
                        // End:0x1C0
                        if((int(GrabPoint) == int(5)) || int(GrabPoint) == int(12))
                        {
                            // End:0x1BD
                            if(VsLarochePawn.IsCockpitCrossBarGrabPointAbleToBeGrabed())
                            {
                                return true;
                            }                            
                        }
                        else
                        {
                            // End:0x1FB
                            if(int(GrabPoint) == int(6))
                            {
                                // End:0x1F8
                                if(VsLarochePawn.IsRightInnerShoulderGrabPointAbleToBeGrabed())
                                {
                                    return true;
                                }                                
                            }
                            else
                            {
                                // End:0x233
                                if(int(GrabPoint) == int(13))
                                {
                                    // End:0x233
                                    if(VsLarochePawn.IsCockpitGrabPointAbleToBeGrabed())
                                    {
                                        return true;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}

static function IsBetterWindow()
{
    local /*0x97E50000-0x00000000*/ private @NULL TestWindow[25296897], BaselineWindow, inPawn;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LPPI, testWindowLaRoche, baselineWindowLaRoche;

    testWindowLaRoche = LPCombatWindow_ForkArmVsLaRoche(TestWindow.CombatWindow);
    baselineWindowLaRoche = LPCombatWindow_ForkArmVsLaRoche(BaselineWindow.CombatWindow);
    LPPC = LPPlayerController(inPawn.Controller);
    // End:0x79A
    if(((LPPC != none) && testWindowLaRoche != none) && baselineWindowLaRoche != none)
    {
        LPPI = LPPlayerInput(LPPC.PlayerInput);
        // End:0x79A
        if(LPPI != none)
        {
            // End:0x330
            if((int(baselineWindowLaRoche.GrabPoint) == int(3)) || int(baselineWindowLaRoche.GrabPoint) == int(2))
            {
                // End:0x1CB
                if(int(testWindowLaRoche.GrabPoint) == int(0))
                {
                    return CompareLeftWindowToRightWindow(testWindowLaRoche, baselineWindowLaRoche, LPPI, LPAIPawnVsLaroche(BaselineWindow.Publisher));                    
                }
                else
                {
                    // End:0x242
                    if(int(testWindowLaRoche.GrabPoint) == int(1))
                    {
                        return CompareLeftWindowToRightWindow(testWindowLaRoche, baselineWindowLaRoche, LPPI, LPAIPawnVsLaroche(BaselineWindow.Publisher));                        
                    }
                    else
                    {
                        // End:0x2B9
                        if(int(testWindowLaRoche.GrabPoint) == int(4))
                        {
                            return CompareLeftWindowToRightWindow(testWindowLaRoche, baselineWindowLaRoche, LPPI, LPAIPawnVsLaroche(BaselineWindow.Publisher));                            
                        }
                        else
                        {
                            // End:0x32D
                            if(int(testWindowLaRoche.GrabPoint) == int(5))
                            {
                                return CompareLeftWindowToRightWindow(testWindowLaRoche, baselineWindowLaRoche, LPPI, LPAIPawnVsLaroche(BaselineWindow.Publisher));
                            }
                        }
                    }
                }                
            }
            else
            {
                // End:0x560
                if((int(baselineWindowLaRoche.GrabPoint) == int(4)) || int(baselineWindowLaRoche.GrabPoint) == int(5))
                {
                    // End:0x3FB
                    if(int(testWindowLaRoche.GrabPoint) == int(0))
                    {
                        return CompareLeftWindowToRightWindow(testWindowLaRoche, baselineWindowLaRoche, LPPI, LPAIPawnVsLaroche(BaselineWindow.Publisher));                        
                    }
                    else
                    {
                        // End:0x472
                        if(int(testWindowLaRoche.GrabPoint) == int(1))
                        {
                            return CompareLeftWindowToRightWindow(testWindowLaRoche, baselineWindowLaRoche, LPPI, LPAIPawnVsLaroche(BaselineWindow.Publisher));                            
                        }
                        else
                        {
                            // End:0x4E9
                            if(int(testWindowLaRoche.GrabPoint) == int(3))
                            {
                                return CompareLeftWindowToRightWindow(baselineWindowLaRoche, testWindowLaRoche, LPPI, LPAIPawnVsLaroche(BaselineWindow.Publisher));                                
                            }
                            else
                            {
                                // End:0x55D
                                if(int(testWindowLaRoche.GrabPoint) == int(2))
                                {
                                    return CompareLeftWindowToRightWindow(baselineWindowLaRoche, testWindowLaRoche, LPPI, LPAIPawnVsLaroche(BaselineWindow.Publisher));
                                }
                            }
                        }
                    }                    
                }
                else
                {
                    // End:0x791
                    if((int(baselineWindowLaRoche.GrabPoint) == int(0)) || int(baselineWindowLaRoche.GrabPoint) == int(1))
                    {
                        // End:0x62B
                        if(int(testWindowLaRoche.GrabPoint) == int(4))
                        {
                            return CompareLeftWindowToRightWindow(baselineWindowLaRoche, testWindowLaRoche, LPPI, LPAIPawnVsLaroche(BaselineWindow.Publisher));                            
                        }
                        else
                        {
                            // End:0x6A2
                            if(int(testWindowLaRoche.GrabPoint) == int(5))
                            {
                                return CompareLeftWindowToRightWindow(baselineWindowLaRoche, testWindowLaRoche, LPPI, LPAIPawnVsLaroche(BaselineWindow.Publisher));                                
                            }
                            else
                            {
                                // End:0x71B
                                if(int(testWindowLaRoche.GrabPoint) == int(3))
                                {
                                    return !CompareLeftWindowToRightWindow(baselineWindowLaRoche, testWindowLaRoche, LPPI, LPAIPawnVsLaroche(BaselineWindow.Publisher));                                    
                                }
                                else
                                {
                                    // End:0x791
                                    if(int(testWindowLaRoche.GrabPoint) == int(2))
                                    {
                                        return !CompareLeftWindowToRightWindow(baselineWindowLaRoche, testWindowLaRoche, LPPI, LPAIPawnVsLaroche(BaselineWindow.Publisher));
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return Rand(100) < 50;
        }
    }
    return false;
    //return ReturnValue;    
}

static function CompareLeftWindowToRightWindow()
{
    local /*0x97E50000-0x00000000*/ private @NULL LeftWindow[8388609], RightWindow, InPlayerInput, VsLarochePawn;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float greaterXinput;

    // End:0x168
    if((LeftWindow != none) && RightWindow != none)
    {
        // End:0x168
        if((InPlayerInput != none) && VsLarochePawn != none)
        {
            // End:0xE9
            if(Abs(InPlayerInput.UnfilteredRotationStick.X) > Abs(InPlayerInput.UnfilteredMovementStick.X))
            {
                greaterXinput = InPlayerInput.UnfilteredRotationStick.X;                
            }
            else
            {
                greaterXinput = InPlayerInput.UnfilteredMovementStick.X;
            }
            // End:0x168
            if(greaterXinput > VsLarochePawn.DeadZoneForCombatWindowInputChoice)
            {
                // End:0x166
                if(greaterXinput > float(0))
                {
                    return true;                    
                }
                else
                {
                    return false;
                }
            }
        }
    }
    return Rand(100) < 50;
    //return ReturnValue;    
}
