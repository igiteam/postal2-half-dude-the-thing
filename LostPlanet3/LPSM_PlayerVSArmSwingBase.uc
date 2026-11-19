class LPSM_PlayerVSArmSwingBase extends SPSM_PlayAnimBase
    abstract
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private class EndSpecialMoveClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStartsComboSpecialMoveInstantly;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPreventChain[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsButtonPressed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableBreakOut[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class NextSpecialMoveClass[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPVSPlayerPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ComboTuneDataIndex[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastButtonPressedTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastButtonReleasedTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AnimPercentAtButtonPress[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AnimPercentAtButtonRelease[536870913];

function PrepSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], InteractionActor;

    super(SPSpecialMoveStateBased).PrepSpecialMove(PrevMove, InteractionActor);
    MyLPVSPlayerPawn = LPVSPlayerPawn(MySPPawn);
    InitComboTuneDataIndex();
    AnimPercentAtButtonPress = -1.0000000;
    AnimPercentAtButtonRelease = -1.0000000;
    LastButtonPressedTime = 0.0000000;
    LastButtonReleasedTime = 0.0000000;
    bIsButtonPressed = false;
    bEnableBreakOut = false;
    //return;    
}

function CanOverrideMoveWith()
{
    local /*0x97E50000-0x00000000*/ private class InMove[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bEnableBreakOut;
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    BlendOutTime = 0.2000000;
    super.SpecialMoveStarted(bForced, PrevMove);
    MyLPVSPlayerPawn.StartRightArmPartAction(1);
    CallNotifyStart();
    NextSpecialMoveClass = none;
    bPreventChain = false;
    bEndSpecialMoveOnAnimFinish = true;
    //return;    
}

function InitComboTuneDataIndex()
{
    local /*0x97E50000-0x00000000*/ private int Idx;

    // End:0x11
    if(ComboTuneDataIndex >= 0)
    {
        return;
    }
    Idx = 0;
    J0x1C:

    // End:0xDD [Loop If]
    if(Idx < MyLPVSPlayerPawn.TuneDataVSPlayerPawn.SwingComboInfo.Length)
    {
        // End:0xCF
        if(Class == MyLPVSPlayerPawn.TuneDataVSPlayerPawn.SwingComboInfo[Idx].UsedInSpecialMove)
        {
            ComboTuneDataIndex = Idx;
        }
        Idx++;
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

function NotifyEnablePlayerMovement()
{
    bEnableBreakOut = true;
    super(SPSpecialMove).NotifyEnablePlayerMovement();
    //return;    
}

function CallNotifyStart()
{
    MyLPVSPlayerPawn.NotifyAIOfMeleeSwingStart();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    MyLPVSPlayerPawn.StopRightArmPartAction(1, BlendOutTime < 0.0001000);
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function SPSMAnimationFinishedCB()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x36
    if(bInterrupted || MyLPVSPlayerPawn.GetCurrentSpecialMoveInstance() != self)
    {
        return;
    }
    LPPC = LPPlayerController(MyLPVSPlayerPawn.Controller);
    // End:0xA8
    if(LPPC.PlayerMoveInfo.bVSShieldBlockPressed)
    {
        bPreventChain = true;
    }
    // End:0xCC
    if(NextSpecialMoveClass == none)
    {
        NextSpecialMoveClass = DetermineComboSpecialMove();
    }
    // End:0xEE
    if(NextSpecialMoveClass == none)
    {
        NextSpecialMoveClass = EndSpecialMoveClass;
    }
    bEndSpecialMoveOnAnimFinish = (NextSpecialMoveClass == none) || bPreventChain;
    super.SPSMAnimationFinishedCB(Node, InUserData, bInterrupted);
    // End:0x153
    if(!bEndSpecialMoveOnAnimFinish)
    {
        DoNextSpecialMove();
    }
    //return;    
}

function SpecialMoveEndedStopAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0x59
    if((NextMove == none) || NextSpecialMoveClass != NextMove.Class)
    {
        super.SpecialMoveEndedStopAnimation(PrevMove, NextMove);
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
        // End:0x41
        case Class'LPSMMTypes'.default.SMM_TakeDamageSetParams:
            CheckKnockOut();
            // End:0x26D
            break;
        // End:0x126
        case Class'LPSMMTypes'.default.SMM_VSRightArmAltActionPressed:
            // End:0x124
            if(MyLPVSPlayerPawn.IsLocallyControlled())
            {
                LastButtonPressedTime = MySPPawn.WorldInfo.TimeSeconds;
                bIsButtonPressed = true;
                AnimPercentAtButtonPress = GetCurrentAnimNodeSlotPositionPercent();
                // End:0x124
                if(bStartsComboSpecialMoveInstantly)
                {
                    NextSpecialMoveClass = DetermineComboSpecialMove(NextSpecialMoveClass);
                    // End:0x124
                    if(NextSpecialMoveClass != none)
                    {
                        DoNextSpecialMove();
                    }
                }
            }
            return true;
        // End:0x20B
        case Class'LPSMMTypes'.default.SMM_VSRightArmAltActionReleased:
            // End:0x209
            if(MyLPVSPlayerPawn.IsLocallyControlled())
            {
                AnimPercentAtButtonRelease = GetCurrentAnimNodeSlotPositionPercent();
                LastButtonReleasedTime = MySPPawn.WorldInfo.TimeSeconds;
                bIsButtonPressed = false;
                // End:0x209
                if(bStartsComboSpecialMoveInstantly)
                {
                    NextSpecialMoveClass = DetermineComboSpecialMove(NextSpecialMoveClass);
                    // End:0x209
                    if(NextSpecialMoveClass != none)
                    {
                        DoNextSpecialMove();
                    }
                }
            }
            return true;
        // End:0x26A
        case Class'LPSMMTypes'.default.SMM_PlayerExitedVS:
            BlendOutTime = 0.0000000;
            bPreventChain = true;
            MySPPawn.EndCurrentSpecialMove(self);
            // End:0x26D
            break;
        // End:0xFFFF
        default:
            break;
    }
    return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function GetCurrentAnimNodeSlotPositionPercent()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x68
    if(int(PlaybackType) == int(1))
    {
        return MyLPVSPlayerPawn.GetCurrentAnimNodeSlotPositionPercent(MyLPVSPlayerPawn.UpperBodyAnimInfo.AnimNodeSlot);        
    }
    else
    {
        return MyLPVSPlayerPawn.GetCurrentAnimNodeSlotPositionPercent(MyLPVSPlayerPawn.FullBodyAnimInfo.AnimNodeSlot);
    }
    //return ReturnValue;    
}

function CheckKnockOut()
{
    local /*0x97E50000-0x00000000*/ private @NULL VS;

    VS = LPBaseVSPlayerPawn(MySPPawn);
    // End:0x79
    if((VS != none) && ClassIsChildOf(VS.TakeDamageParams.DamageType, Class'LPDamageTypeCrabKnockOut'))
    {
        bPreventChain = true;
    }
    //return;    
}

function DetermineComboSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class CurrentMove[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL TD;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private float Duration;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private bool bHasHoldDurationEntry;

    // End:0x12
    if(ComboTuneDataIndex < 0)
    {
        return none;
    }
    TD = MyLPVSPlayerPawn.TuneDataVSPlayerPawn;
    LPPC = LPPlayerController(MyLPVSPlayerPawn.Controller);
    Idx = TD.SwingComboInfo[ComboTuneDataIndex].ComboEntries.Length - 1;
    J0xB4:

    // End:0x5D1 [Loop If]
    if(Idx >= 0)
    {
        // End:0x122
        if(TD.SwingComboInfo[ComboTuneDataIndex].ComboEntries[Idx].bDisabled)
        {            
        }
        else
        {
            // End:0x200
            if(TD.SwingComboInfo[ComboTuneDataIndex].ComboEntries[Idx].RequiredUpgrade != none)
            {
                // End:0x200
                if(!LPPC.HasUpgrade(TD.SwingComboInfo[ComboTuneDataIndex].ComboEntries[Idx].RequiredUpgrade))
                {
                    // [Explicit Continue]
                    goto J0x5C3;
                }
            }
            // End:0x2E4
            if(((AnimPercentAtButtonPress < float(0)) || AnimPercentAtButtonPress < TD.SwingComboInfo[ComboTuneDataIndex].ComboEntries[Idx].WindowStartPercentage) || AnimPercentAtButtonPress > TD.SwingComboInfo[ComboTuneDataIndex].ComboEntries[Idx].WindowEndPercentage)
            {                
            }
            else
            {
                // End:0x3D7
                if(!bIsButtonPressed)
                {
                    // End:0x3D7
                    if(((AnimPercentAtButtonRelease < float(0)) || AnimPercentAtButtonRelease < TD.SwingComboInfo[ComboTuneDataIndex].ComboEntries[Idx].WindowStartPercentage) || AnimPercentAtButtonRelease > TD.SwingComboInfo[ComboTuneDataIndex].ComboEntries[Idx].WindowEndPercentage)
                    {
                        // [Explicit Continue]
                        goto J0x5C3;
                    }
                }
                // End:0x525
                if(TD.SwingComboInfo[ComboTuneDataIndex].ComboEntries[Idx].HoldDuration > float(0))
                {
                    bHasHoldDurationEntry = true;
                    // End:0x49B
                    if(bIsButtonPressed)
                    {
                        Duration = MyLPVSPlayerPawn.WorldInfo.TimeSeconds - LastButtonPressedTime;                        
                    }
                    else
                    {
                        Duration = LastButtonReleasedTime - LastButtonPressedTime;
                    }
                    // End:0x522
                    if(Duration < TD.SwingComboInfo[ComboTuneDataIndex].ComboEntries[Idx].HoldDuration)
                    {
                        // [Explicit Continue]
                        goto J0x5C3;
                    }                    
                }
                else
                {
                    // End:0x547
                    if(bHasHoldDurationEntry && bIsButtonPressed)
                    {
                        goto J0x5C3;                        
                    }
                    else
                    {
                        // End:0x56A
                        if((AnimPercentAtButtonPress == float(0)) && bIsButtonPressed)
                        {
                            // [Explicit Continue]
                            goto J0x5C3;
                        }
                    }
                }
                return TD.SwingComboInfo[ComboTuneDataIndex].ComboEntries[Idx].ComboSpecialMoveClasses;
            }
        }
        J0x5C3:

        Idx--;
        // [Loop Continue]
        goto J0xB4;
    }
    return CurrentMove;
    //return ReturnValue;    
}

function DoNextSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    // End:0x0F
    if(bPreventChain)
    {
        return;
    }
    // End:0x8A
    if(NextSpecialMoveClass != none)
    {
        LPC = LPPlayerController(MyLPVSPlayerPawn.Controller);
        // End:0x8A
        if(LPC != none)
        {
            LPC.DoSpecialMove(NextSpecialMoveClass, true, true);
        }
    }
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    // End:0x56
    if(bStartsComboSpecialMoveInstantly)
    {
        NextSpecialMoveClass = DetermineComboSpecialMove(NextSpecialMoveClass);
        // End:0x56
        if(NextSpecialMoveClass != none)
        {
            DoNextSpecialMove();
        }
    }
    //return;    
}

defaultproperties
{
    ComboTuneDataIndex=-1
    PlaybackType=SPSM_PlayAnimType.SPSM_PlayAnimUpperBody
    AnimTemplateTree=AnimTree'VSMeleeAnimations.VSMeleeAnimations'
    bManageRootMotionMode=true
}