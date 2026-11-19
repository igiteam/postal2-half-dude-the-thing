class PlayerInput extends Input within PlayerController
    transient
    config(Input)
    hidecategories(Object,UIRoot);

var(*) /*0x35EA0000-0x00000000*/ private bool bUsingGamepad[131073];
var(*) /*0x35EA0000-0x00000000*/ private input bool bInvertMouse[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input bool bInvertTurn[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bWasForward;
var(*) /*0x35EA0000-0x00000000*/ private bool bWasBack;
var(*) /*0x35EA0000-0x00000000*/ private bool bWasLeft;
var(*) /*0x35EA0000-0x00000000*/ private bool bWasRight;
var(*) /*0x35EA0000-0x00000000*/ private bool bEdgeForward;
var(*) /*0x35EA0000-0x00000000*/ private bool bEdgeBack;
var(*) /*0x35EA0000-0x00000000*/ private bool bEdgeLeft;
var(*) /*0x35EA0000-0x00000000*/ private bool bEdgeRight;
var(*) /*0x35EA0000-0x00000000*/ private input bool bEnableMouseSmoothing[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bEnableFOVScaling;
var(*) /*0x35EA0000-0x00000000*/ private bool bLockTurnUntilRelease[536870913];
var(*) /*0x35EA0000-0x00000000*/ private name LastAxisKeyName[131073];
var(*) /*0x35EA0000-0x00000000*/ private float UsingGamepadDeadZone[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float DoubleClickTimer;
var(*) /*0x35EA0000-0x00000000*/ private input float DoubleClickTime[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private input float MouseSensitivity[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private float aBaseX[262145];
var(*) /*0x35EA0000-0x00000000*/ private float aBaseY[262145];
var(*) /*0x35EA0000-0x00000000*/ private float aBaseZ[262145];
var(*) /*0x35EA0000-0x00000000*/ private float aMouseX[262145];
var(*) /*0x35EA0000-0x00000000*/ private float aMouseY[262145];
var(*) /*0x35EA0000-0x00000000*/ private float aForward[262145];
var(*) /*0x35EA0000-0x00000000*/ private float aTurn[262145];
var(*) /*0x35EA0000-0x00000000*/ private float aStrafe[262145];
var(*) /*0x35EA0000-0x00000000*/ private float aUp[262145];
var(*) /*0x35EA0000-0x00000000*/ private float aLookUp[262145];
var(*) /*0x35EA0000-0x00000000*/ private float aRightAnalogTrigger[262145];
var(*) /*0x35EA0000-0x00000000*/ private float aLeftAnalogTrigger[262145];
var(*) /*0x35EA0000-0x00000000*/ private float aPS3AccelX[262145];
var(*) /*0x35EA0000-0x00000000*/ private float aPS3AccelY[262145];
var(*) /*0x35EA0000-0x00000000*/ private float aPS3AccelZ[262145];
var(*) /*0x35EA0000-0x00000000*/ private float aPS3Gyro[262145];
var(*) /*0x35EA0000-0x00000000*/ private float aWiiUPointerX[262145];
var(*) /*0x35EA0000-0x00000000*/ private float aWiiUPointerY[262145];
var(*) /*0x35EA0000-0x00000000*/ private @NULL aTilt[262145];
var(*) /*0x35EA0000-0x00000000*/ private @NULL aRotationRate[262145];
var(*) /*0x35EA0000-0x00000000*/ private @NULL aGravity[262145];
var(*) /*0x35EA0000-0x00000000*/ private @NULL aAcceleration[262145];
var(*) /*0x35EA0000-0x00000000*/ private @NULL aTouch[262149];
var(*) /*0x35EA0000-0x00000000*/ private @NULL aBackTouch[262149];
var(*) /*0x35EA0000-0x00000000*/ private float RawJoyUp[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float RawJoyRight[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float RawJoyLookRight[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float RawJoyLookUp[536870913];
var(*) /*0x3CE80000-0x00000000*/ private float MoveForwardSpeed[1073807361];
var(*) /*0x3CE80000-0x00000000*/ private float MoveStrafeSpeed[1073807361];
var(*) /*0x3CE80000-0x00000000*/ private float LookRightScale[1073807361];
var(*) /*0x3CE80000-0x00000000*/ private float LookUpScale[1073807361];
var(*) /*0x35EA0000-0x00000000*/ private byte bStrafe[262145];
var(*) /*0x35EA0000-0x00000000*/ private byte bXAxis[262145];
var(*) /*0x35EA0000-0x00000000*/ private byte bYAxis[262145];
var(*) /*0x35EA0000-0x00000000*/ private float ZeroTime[2];
var(*) /*0x35EA0000-0x00000000*/ private float SmoothedMouse[2];
var(*) /*0x35EA0000-0x00000000*/ private int MouseSamples;
var(*) /*0x35EA0000-0x00000000*/ private float MouseSamplingTotal;
var(*) /*0x35EA0000-0x00000000*/ private float AutoUnlockTurnTime[536870913];

// Export UPlayerInput::execCancelMobileInput(FFrame&, void* const)
native function CancelMobileInput();

// Export UPlayerInput::execSetUsingGamepad(FFrame&, void* const)
native function SetUsingGamepad()
{
    local /*0x35EA0000-0x00000000*/ private bool bUsingPad[8388609];


}

exec function InvertMouse()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    bInvertMouse = !bInvertMouse;
    SaveConfig();
    return bInvertMouse;
    //return ReturnValue;    
}

exec function InvertTurn()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    bInvertTurn = !bInvertTurn;
    SaveConfig();
    return bInvertTurn;
    //return ReturnValue;    
}

exec function SetSensitivity()
{
    local /*0x35EA0000-0x00000000*/ private float F[8388609];

    MouseSensitivity = F;
    //return;    
}

function DrawHUD()
{
    local /*0x35EA0000-0x00000000*/ private @NULL H[8388609];

    //return;    
}

function PreProcessInput()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

function PostProcessInput()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

function AdjustMouseSensitivity()
{
    local /*0x35EA0000-0x00000000*/ private float FOVScale[8388609];

    aMouseX *= (MouseSensitivity * FOVScale);
    aMouseY *= (MouseSensitivity * FOVScale);
    //return;    
}

event PlayerInput()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609], FOVScale, TimeScale;

    RawJoyUp = aBaseY;
    RawJoyRight = aStrafe;
    RawJoyLookRight = aTurn;
    RawJoyLookUp = aLookUp;
    DeltaTime /= Outer.WorldInfo.TimeDilation;
    // End:0x12A
    if(Outer.bDemoOwner && int(Outer.WorldInfo.NetMode) == int(NM_Client))
    {
        DeltaTime /= Outer.WorldInfo.DemoPlayTimeDilation;
    }
    PreProcessInput(DeltaTime);
    TimeScale = 100.0000000 * DeltaTime;
    aBaseY *= (TimeScale * MoveForwardSpeed);
    aStrafe *= (TimeScale * MoveStrafeSpeed);
    aUp *= (TimeScale * MoveStrafeSpeed);
    aTurn *= (TimeScale * LookRightScale);
    aLookUp *= (TimeScale * LookUpScale);
    PostProcessInput(DeltaTime);
    ProcessInputMatching(DeltaTime);
    CatchDoubleClickInput();
    // End:0x262
    if(bEnableFOVScaling)
    {
        FOVScale = Outer.GetFOVAngle() * 0.0111100;        
    }
    else
    {
        FOVScale = 1.0000000;
    }
    AdjustMouseSensitivity(FOVScale);
    // End:0x2F1
    if(bEnableMouseSmoothing)
    {
        aMouseX = SmoothMouse(aMouseX, DeltaTime, bXAxis, 0);
        aMouseY = SmoothMouse(aMouseY, DeltaTime, bYAxis, 1);
    }
    aLookUp *= FOVScale;
    aTurn *= FOVScale;
    // End:0x34F
    if(int(bStrafe) > int(0))
    {
        aStrafe += (aBaseX + aMouseX);        
    }
    else
    {
        aTurn += (aBaseX + aMouseX);
    }
    // End:0x396
    if(LookUpScale > float(0))
    {
        aLookUp -= aMouseY;        
    }
    else
    {
        aLookUp += aMouseY;
    }
    // End:0x3C7
    if(bInvertMouse)
    {
        aLookUp *= -1.0000000;
    }
    // End:0x3E4
    if(bInvertTurn)
    {
        aTurn *= -1.0000000;
    }
    aForward += aBaseY;
    Outer.HandleWalking();
    // End:0x499
    if(bLockTurnUntilRelease)
    {
        // End:0x48D
        if(RawJoyLookRight != float(0))
        {
            aTurn = 0.0000000;
            // End:0x48A
            if(AutoUnlockTurnTime > 0.0000000)
            {
                AutoUnlockTurnTime -= DeltaTime;
                // End:0x48A
                if(AutoUnlockTurnTime < 0.0000000)
                {
                    bLockTurnUntilRelease = false;
                }
            }            
        }
        else
        {
            bLockTurnUntilRelease = false;
        }
    }
    // End:0x4E8
    if(Outer.IsMoveInputIgnored())
    {
        aForward = 0.0000000;
        aStrafe = 0.0000000;
        aUp = 0.0000000;
    }
    // End:0x528
    if(Outer.IsLookInputIgnored())
    {
        aTurn = 0.0000000;
        aLookUp = 0.0000000;
    }
    //return;    
}

function CatchDoubleClickInput()
{
    // End:0x11C
    if(!Outer.IsMoveInputIgnored())
    {
        bEdgeForward = bWasForward ^^ (aBaseY > float(0));
        bEdgeBack = bWasBack ^^ (aBaseY < float(0));
        bEdgeLeft = bWasLeft ^^ (aStrafe < float(0));
        bEdgeRight = bWasRight ^^ (aStrafe > float(0));
        bWasForward = aBaseY > float(0);
        bWasBack = aBaseY < float(0);
        bWasLeft = aStrafe < float(0);
        bWasRight = aStrafe > float(0);
    }
    //return;    
}

function CheckForDoubleClickMove()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689], DoubleClickMove, OldDoubleClick;

    // End:0x38
    if(int(Outer.DoubleClickDir) == int(5))
    {
        DoubleClickMove = 5;        
    }
    else
    {
        DoubleClickMove = 0;
    }
    // End:0x49F
    if(DoubleClickTime > 0.0000000)
    {
        // End:0x117
        if(int(Outer.DoubleClickDir) == int(5))
        {
            // End:0x114
            if((Outer.Pawn != none) && int(Outer.Pawn.Physics) == int(1))
            {
                DoubleClickTimer = 0.0000000;
                Outer.DoubleClickDir = 6;
            }            
        }
        else
        {
            // End:0x35A
            if(int(Outer.DoubleClickDir) != int(6))
            {
                OldDoubleClick = Outer.DoubleClickDir;
                Outer.DoubleClickDir = 0;
                // End:0x1C9
                if(bEdgeForward && bWasForward)
                {
                    Outer.DoubleClickDir = 3;                    
                }
                else
                {
                    // End:0x209
                    if(bEdgeBack && bWasBack)
                    {
                        Outer.DoubleClickDir = 4;                        
                    }
                    else
                    {
                        // End:0x249
                        if(bEdgeLeft && bWasLeft)
                        {
                            Outer.DoubleClickDir = 1;                            
                        }
                        else
                        {
                            // End:0x286
                            if(bEdgeRight && bWasRight)
                            {
                                Outer.DoubleClickDir = 2;
                            }
                        }
                    }
                }
                // End:0x2DA
                if(int(Outer.DoubleClickDir) == int(0))
                {
                    Outer.DoubleClickDir = OldDoubleClick;                    
                }
                else
                {
                    // End:0x332
                    if(int(Outer.DoubleClickDir) != int(OldDoubleClick))
                    {
                        DoubleClickTimer = DoubleClickTime + (0.5000000 * DeltaTime);                        
                    }
                    else
                    {
                        DoubleClickMove = Outer.DoubleClickDir;
                    }
                }
            }
        }
        // End:0x3F2
        if(int(Outer.DoubleClickDir) == int(6))
        {
            DoubleClickTimer = FMin(DoubleClickTimer - DeltaTime, 0.0000000);
            // End:0x3EF
            if(DoubleClickTimer < -0.3500000)
            {
                Outer.DoubleClickDir = 0;
                DoubleClickTimer = DoubleClickTime;
            }            
        }
        else
        {
            // End:0x49F
            if((int(Outer.DoubleClickDir) != int(0)) && int(Outer.DoubleClickDir) != int(5))
            {
                DoubleClickTimer -= DeltaTime;
                // End:0x49F
                if(DoubleClickTimer < float(0))
                {
                    Outer.DoubleClickDir = 0;
                    DoubleClickTimer = DoubleClickTime;
                }
            }
        }
    }
    return DoubleClickMove;
    //return ReturnValue;    
}

final function ProcessInputMatching()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609], Value;
    local /*0x35EA0000-0x00000000*/ private int I, MatchIdx;
    local /*0x35EA0000-0x00000000*/ private bool bMatch;

    I = 0;
    J0x0B:

    // End:0x9AE [Loop If]
    if(I < Outer.InputRequests.Length)
    {
        // End:0x9A0
        if((Outer.InputRequests[I].MatchIdx >= 0) && Outer.InputRequests[I].MatchIdx < Outer.InputRequests[I].Inputs.Length)
        {
            // End:0x17D
            if(Outer.InputRequests[I].MatchActor == none)
            {
                Outer.InputRequests[I].MatchActor = Outer;
            }
            MatchIdx = Outer.InputRequests[I].MatchIdx;
            // End:0x45A
            if(((MatchIdx != 0) && Outer.InputRequests[I].Inputs[MatchIdx].TimeDelta > 0.0000000) && (Outer.WorldInfo.TimeSeconds - Outer.InputRequests[I].LastMatchTime) >= Outer.InputRequests[I].Inputs[MatchIdx].TimeDelta)
            {
                Outer.InputRequests[I].LastMatchTime = 0.0000000;
                Outer.InputRequests[I].MatchIdx = 0;
                // End:0x457
                if(Outer.InputRequests[I].FailedFuncName != 'None')
                {
                    Outer.InputRequests[I].MatchActor.SetTimer(0.0100000, false, Outer.InputRequests[I].FailedFuncName);
                }                
            }
            else
            {
                Value = 0.0000000;
                switch(Outer.InputRequests[I].Inputs[MatchIdx].Type)
                {
                    // End:0x4E6
                    case 0:
                        Value = aStrafe;
                        // End:0x504
                        break;
                    // End:0x501
                    case 1:
                        Value = aBaseY;
                        // End:0x504
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
                switch(Outer.InputRequests[I].Inputs[MatchIdx].Action)
                {
                    // End:0x5DC
                    case 0:
                        bMatch = Value >= Outer.InputRequests[I].Inputs[MatchIdx].Value;
                        // End:0x655
                        break;
                    // End:0x652
                    case 1:
                        bMatch = Value <= Outer.InputRequests[I].Inputs[MatchIdx].Value;
                        // End:0x655
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }
                // End:0x9A0
                if(bMatch)
                {
                    Outer.InputRequests[I].LastMatchTime = Outer.WorldInfo.TimeSeconds;
                    Outer.InputRequests[I].MatchIdx++;
                    // End:0x9A0
                    if(Outer.InputRequests[I].MatchIdx >= Outer.InputRequests[I].Inputs.Length)
                    {
                        // End:0x84D
                        if(Outer.InputRequests[I].MatchDelegate != none)
                        {
                            Outer.__InputMatchDelegate__Delegate = Outer.InputRequests[I].MatchDelegate;
                            Outer.InputMatchDelegate();
                        }
                        // End:0x922
                        if(Outer.InputRequests[I].MatchFuncName != 'None')
                        {
                            Outer.InputRequests[I].MatchActor.SetTimer(0.0100000, false, Outer.InputRequests[I].MatchFuncName);
                        }
                        Outer.InputRequests[I].LastMatchTime = 0.0000000;
                        Outer.InputRequests[I].MatchIdx = 0;
                    }
                }
            }
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

exec function Jump()
{
    // End:0x7A
    if(Outer.WorldInfo.Pauser == Outer.PlayerReplicationInfo)
    {
        Outer.SetPause(false);        
    }
    else
    {
        Outer.bPressedJump = true;
    }
    //return;    
}

exec function SmartJump()
{
    Jump();
    //return;    
}

exec function ClearSmoothing()
{
    local /*0x35EA0000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x5B [Loop If]
    if(I < 2)
    {
        ZeroTime[I] = 0.0000000;
        SmoothedMouse[I] = 0.0000000;
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    MouseSamplingTotal = default.MouseSamplingTotal;
    MouseSamples = default.MouseSamples;
    //return;    
}

function SmoothMouse()
{
    local /*0x35EA0000-0x00000000*/ private float aMouse[8388609], DeltaTime;
    local /*0x35EA0000-0x00000000*/ private byte SampleCount[25165825];
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689], MouseSamplingTime;

    // End:0x1BB
    if(DeltaTime < 0.2500000)
    {
        MouseSamplingTime = MouseSamplingTotal / float(MouseSamples);
        // End:0xD5
        if(aMouse == float(0))
        {
            ZeroTime[Index] += DeltaTime;
            // End:0xB9
            if(ZeroTime[Index] < MouseSamplingTime)
            {
                aMouse = (SmoothedMouse[Index] * DeltaTime) / MouseSamplingTime;                
            }
            else
            {
                SmoothedMouse[Index] = 0.0000000;
            }            
        }
        else
        {
            ZeroTime[Index] = 0.0000000;
            // End:0x18E
            if(SmoothedMouse[Index] != float(0))
            {
                // End:0x16E
                if(DeltaTime < (MouseSamplingTime * float(int(SampleCount) + int(1))))
                {
                    aMouse = (aMouse * DeltaTime) / (MouseSamplingTime * float(SampleCount));                    
                }
                else
                {
                    SampleCount = byte(DeltaTime / MouseSamplingTime);
                }
            }
            SmoothedMouse[Index] = aMouse / float(SampleCount);
        }        
    }
    else
    {
        ClearSmoothing();
    }
    SampleCount = 0;
    return aMouse;
    //return ReturnValue;    
}

// Export UPlayerInput::execInitInputSystem(FFrame&, void* const)
native function InitInputSystem();

function ClientInitInputSystem()
{
    //return;    
}

function PreClientTravel()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string PendingURL[8388609];
    local /*0x35EA0000-0x00000000*/ private byte TravelType[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIsSeamlessTravel[8388609];

    //return;    
}

defaultproperties
{
    UsingGamepadDeadZone=0.3000000
    DoubleClickTime=0.2500000
    MouseSensitivity=60.0000000
    MoveForwardSpeed=1200.0000000
    MoveStrafeSpeed=1200.0000000
    LookRightScale=300.0000000
    LookUpScale=-250.0000000
    MouseSamples=1
    MouseSamplingTotal=0.0083000
    Bindings=/* Array type was not detected. */
}