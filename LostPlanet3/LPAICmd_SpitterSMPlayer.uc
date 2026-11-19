class LPAICmd_SpitterSMPlayer extends LPAICommand within LPAIControllerSpitter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InteractionActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DesiredFocus;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PrevFocus;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array SMList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL curSM;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurSmIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSmFinished;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTimerFinished;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLineSweepHitTestsBeforeSM;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowChoreography;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LoopCountDown;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Description;

function Pushed()
{
    super.Pushed();
    CurSmIndex = -1;
    Outer.SpitterPawn.SetAiming(false);
    Outer.SpitterPawn.DisableTailIKImmediate();
    Outer.Focus = none;
    Outer.SetFocalPoint(vect(0.0000000, 0.0000000, 0.0000000));
    Outer.EnableRotation(false);
    PrevFocus = Outer.Focus;
    bLineSweepHitTestsBeforeSM = Outer.SpitterPawn.LineSweepHitTester.IsEnabled();
    bAllowChoreography = Outer.SpitterPawn.bAllowChoreography;
    //return;    
}

function Popped()
{
    super.Popped();
    OnFinish();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    OnFinish();
    //return;    
}

function OnFinish()
{
    local /*0x97E50000-0x00000000*/ private int I;

    Outer.EnableRotation(false);
    Outer.Focus = PrevFocus;
    Outer.SpitterPawn.DisableTailIKImmediate();
    SetInterruptible(true, true);
    I = 0;
    J0x93:

    // End:0x113 [Loop If]
    if(I < SMList.Length)
    {
        Outer.SpitterPawn.EndSpecialMove(SMList[I].SMClass);
        ++I;
        // [Loop Continue]
        goto J0x93;
    }
    Outer.SpitterPawn.EnableLineSweepHitTester(bLineSweepHitTestsBeforeSM);
    Outer.SpitterPawn.bAllowChoreography = bAllowChoreography;
    //return;    
}

function OnSmFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    // End:0x16C
    if(FinishedSM.Class == curSM.SMClass)
    {
        Outer.SpitterPawn.LineSweepHitTesterCompleteHitTestAndDisable();
        switch(curSM.Mode)
        {
            // End:0xC3
            case 0:
                bSmFinished = true;
                GotoState('StartNextSm', 'Begin');
                // End:0x16C
                break;
            // End:0xF3
            case 1:
                // End:0xE4
                if(!bTimerFinished)
                {
                    StartCurSm();                    
                }
                else
                {
                    bSmFinished = true;
                }
                // End:0x16C
                break;
            // End:0x144
            case 2:
                // End:0x12C
                if(LoopCountDown <= 0)
                {
                    bSmFinished = true;
                    GotoState('StartNextSm', 'Begin');                    
                }
                else
                {
                    --LoopCountDown;
                    StartCurSm();
                }
                // End:0x16C
                break;
            // End:0xFFFF
            default:
                bSmFinished = true;
                GotoState('StartNextSm', 'Begin');
                // End:0x16C
                break;
                break;
        }
    }
    //return;    
}

function StartCurSm()
{
    // End:0x16A
    if(curSM.SMClass != none)
    {
        SetInterruptible(curSM.bInterruptible);
        Outer.SpitterPawn.EnableLineSweepHitTester(curSM.bIsMeleeHit);
        Outer.SpitterPawn.bAllowChoreography = curSM.bAllowChoreography;
        Outer.SpitterPawn.DoSpecialMove(curSM.SMClass, true, false, OnSmFinished, InteractionActor);
        bSmFinished = false;        
    }
    else
    {
        bSmFinished = true;
        LoopCountDown = 0;
    }
    //return;    
}

function @NULL DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];
    local /*0x97E50000-0x00000400*/ private editfixedsize array ComponentArray;
    local /*0x97E50000-0x00000400*/ private @NULL DebugComponent, ToolTip;

    super.DrawDebug(InHUD);
    Outer.SpitterPawn.GetComponentsOfClass(Class'SPEngine.SPDebugComponentPawn', ComponentArray);
    // End:0x87
    if(ComponentArray.Length > 0)
    {
        DebugComponent = SPDebugComponentPawn(ComponentArray[0]);
    }
    // End:0x1D5
    if(DebugComponent != none)
    {
        ToolTip = DebugComponent.GetTooltip(InHUD);
        ToolTip.Draw2DTextLn(Description,, ToolTip.YellowColor);
        ToolTip.Draw2DTextLn("SM : " $ string(curSM.SMClass));
        // End:0x1D5
        if(DesiredFocus != none)
        {
            ToolTip.Draw2DTextLn("Rotating To Face : " $ string(DesiredFocus),, ToolTip.RedColor);
        }
    }
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super.BeginState(PreviousState);
        SetInterruptible(false);
        //return;        
    }
Begin:

    // End:0x7F
    if(DesiredFocus == none)
    {
        Outer.Focus = none;
        Outer.SetFocalPoint(vect(0.0000000, 0.0000000, 0.0000000));
        Outer.EnableRotation(false);        
    }
    else
    {
        Outer.Focus = DesiredFocus;
        Outer.EnableRotation(true);
    }
    GotoState('StartNextSm');
    stop;            
}

state StartNextSm
{
    function HandleCurSm()
    {
        switch(curSM.Mode)
        {
            // End:0x3C
            case 0:
                GotoState('OneTime');
                // End:0x84
                break;
            // End:0x52
            case 1:
                GotoState('Loop');
                // End:0x84
                break;
            // End:0x68
            case 2:
                GotoState('LoopCount');
                // End:0x84
                break;
            // End:0xFFFF
            default:
                GotoState('StartNextSm', 'Begin');
                // End:0x84
                break;
                break;
        }
        //return;        
    }
Begin:

    // End:0x30
    if(SMList.Length < 1)
    {
        Outer.PopCommand(self);
    }
    Outer.SpitterPawn.ZeroMovementVariables();
    ++CurSmIndex;
    // End:0xA7
    if(CurSmIndex >= SMList.Length)
    {
        Outer.PopCommand(self);
    }
    curSM = SMList[CurSmIndex];
    HandleCurSm();
    stop;        
}

state OneTime
{Begin:

    StartCurSm();
    stop;        
}

state Loop
{
    function StartTimer()
    {
        bTimerFinished = false;
        Outer.SetTimer(curSM.LoopTime, false, 'LoopTimer', self);
        //return;        
    }

    function LoopTimer()
    {
        bTimerFinished = true;
        //return;        
    }
Begin:

    StartTimer();
    StartCurSm();
    J0x14:

    // End:0x43 [Loop If]
    if(!bTimerFinished)
    {
        Outer.Sleep(0.0010000);
        // [Loop Continue]
        goto J0x14;
    }
    Outer.SpitterPawn.EndSpecialMove(curSM.SMClass);
    GotoState('StartNextSm', 'Begin');
    stop;            
}

state LoopCount
{Begin:

    LoopCountDown = curSM.LoopCount - 1;
    StartCurSm();
    stop;                    
}

defaultproperties
{
    curSM=(SMClass=none,Mode=SpitterSMMode.SpitterSMMode_OneTime,LoopTime=1.0000000,LoopCount=1,bInterruptible=false,bIsMeleeHit=false,bAllowChoreography=true)
}