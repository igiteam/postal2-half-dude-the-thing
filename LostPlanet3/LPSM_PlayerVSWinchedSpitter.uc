class LPSM_PlayerVSWinchedSpitter extends LPSM_PlayerVSWinchedLargePawn
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LPC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttachedSpitter;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastKnownGoodLocation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StartDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastMoved;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StartTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DepletionRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HydraulicPressureLeft;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxHydraulicPressure;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float VelocityAccumulator;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastForward;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextRandomTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpitterAdditiveAnimNode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStruggleStarted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FeedbackFwdAmount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DisplayedPercent;

function GetDistance()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Distance;

    Distance = VSize2D(MySPPawn.Location - AttachedPawn.Location);
    return Distance;
    //return ReturnValue;    
}

function GetDragEndDistance()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x15
    if(!bStruggleStarted)
    {
        return -1.0000000;
    }
    return AttachedSpitter.TuneDataSpitter.ReelInSuccessDistance + AttachedSpitter.TuneDataSpitter.ReelInSuccessLeeway;
    //return ReturnValue;    
}

function CheckTimeout()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!bStruggleStarted)
    {
        return false;
    }
    // End:0x57
    if(AttachedSpitter.WorldInfo.bPlayersOnly)
    {
        DeltaTime = 0.0000000;
    }
    HydraulicPressureLeft -= (DeltaTime * DepletionRate);
    // End:0xCB
    if(MySPPawn.IsLocallyControlled())
    {
        LPC.SetHydraulicPressureLevel(HydraulicPressureLeft / MaxHydraulicPressure);
    }
    return HydraulicPressureLeft <= float(0);
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    LPC = LPPlayerController(MySPPawn.Controller);
    AttachedSpitter = LPAIPawnSpitter(AttachedPawn);
    AttachedSpitter.ZeroMovementVariables();
    //return;    
}

function StartDragAnimation()
{
    animationState = 2;
    MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(2),,, 1.0000000, 0.2000000, 0.2500000, true);
    LPSM_SpitterWinched(FollowerSMInstance).StartDragAnimation();
    //return;    
}

simulated function DoesStateUseFullChoreography()
{
    local /*0x97E50000-0x00000000*/ private byte InState[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function FeedbackAddForward()
{
    FeedbackFwdAmount += 0.0500000;
    //return;    
}

function FeedbackUpdate()
{
    local /*0x97E50000-0x00000000*/ private float Distance, percentDistance;

    Distance = GetDistance();
    Distance = Distance - AttachedSpitter.TuneDataSpitter.ReelInSuccessDistance;
    percentDistance = Distance / AttachedSpitter.TuneDataSpitter.ReelInFarUIDistance;
    percentDistance = FClamp(percentDistance, 0.0000000, 1.0000000);
    // End:0x144
    if(DisplayedPercent > (float(1) - percentDistance))
    {
        DisplayedPercent = FInterpTo(DisplayedPercent, 1.0000000 - percentDistance, MySPPawn.WorldInfo.DeltaSeconds, 8.0000000);
    }
    // End:0x178
    if(FeedbackFwdAmount > float(0))
    {
        DisplayedPercent += FeedbackFwdAmount;
        FeedbackFwdAmount = 0.0000000;
    }
    LPC.SetStruggleButtonStrength(DisplayedPercent);
    //return;    
}

function DragSetup()
{
    super.DragSetup();
    DisplayedPercent = 0.0000000;
    FeedbackFwdAmount = 0.0000000;
    StartDistance = GetDistance();
    StartTime = AttachedSpitter.WorldInfo.TimeSeconds;
    LastDistance = 0.0000000;
    LastKnownGoodLocation = AttachedSpitter.Location;
    bStruggleStarted = StartDistance > AttachedSpitter.TuneDataSpitter.ReelInStruggleStartDistance;
    DepletionRate = AttachedSpitter.TuneDataSpitter.ReelInDepletionRate.GetValue();
    MaxHydraulicPressure = LPBaseVSPlayerPawn(MySPPawn).TuneDataVSPlayerPawn.ForkArmGrabMaxHydraulicPressure.GetValue();
    HydraulicPressureLeft = MaxHydraulicPressure;
    DisplayUI(true);
    NextRandomTime = 0.0000000;
    VelocityAccumulator = 0.0000000;
    // End:0x205
    if(!bStruggleStarted)
    {
        LastForward = 0.0000000;        
    }
    else
    {
        LastForward = AttachedSpitter.WorldInfo.TimeSeconds;
    }
    SpitterAdditiveAnimNode = PlayAdditive(true, 0);
    SpitterAdditiveAnimNode.StopAnim();
    UpdateProgress();
    //return;    
}

function DisplayUI()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];

    LPC.DisplayStruggleMessage(bOn);
    LPC.EnableHydraulicPressureDisplay(bOn);
    //return;    
}

function UpdateProgress()
{
    local /*0x97E50000-0x00000000*/ private float Range, fromMin, percentFwd, percentRevAnim;

    // End:0x15F
    if(SpitterAdditiveAnimNode != none)
    {
        fromMin = VelocityAccumulator - AttachedSpitter.TuneDataSpitter.ReelInVelocityRevMax;
        Range = AttachedSpitter.TuneDataSpitter.ReelInVelocityMax - AttachedSpitter.TuneDataSpitter.ReelInVelocityRevMax;
        percentFwd = fromMin / Range;
        percentRevAnim = 1.0000000 - percentFwd;
        SpitterAdditiveAnimNode.SetPosition(percentRevAnim * SpitterAdditiveAnimNode.AnimSeq.SequenceLength, false);
    }
    FeedbackUpdate();
    //return;    
}

function DragUpdate()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Rot, Dir, Delta, desiredDiff, DesiredLocation;

    local /*0x97E50000-0x00000000*/ private float Distance, RandomTime;

    // End:0x46
    if(AttachedSpitter.WorldInfo.bPlayersOnly)
    {
        DeltaTime = 0.0000000;
    }
    // End:0x22F
    if(!bStruggleStarted)
    {
        Distance = GetDistance();
        // End:0xC4
        if(Distance > AttachedSpitter.TuneDataSpitter.ReelInStruggleStartDistance)
        {
            bStruggleStarted = true;
            DisplayUI(true);            
        }
        else
        {
            // End:0x135
            if(Abs(LastDistance - Distance) > float(0))
            {
                LastMoved = AttachedSpitter.WorldInfo.TimeSeconds;
                LastDistance = Distance;                
            }
            else
            {
                // End:0x22F
                if(((AttachedSpitter.WorldInfo.TimeSeconds - LastMoved) > AttachedSpitter.TuneDataSpitter.ReelInBeginTimerMaxNoMovement) || (AttachedSpitter.WorldInfo.TimeSeconds - StartTime) > AttachedSpitter.TuneDataSpitter.ReelInBeginTimerMaxWalkAway)
                {
                    bStruggleStarted = true;
                }
            }
        }
    }
    // End:0x456
    if(AttachedSpitter.WorldInfo.TimeSeconds > NextRandomTime)
    {
        VelocityAccumulator *= AttachedSpitter.TuneDataSpitter.ReelInRandomMulAmount.GetValue();
        VelocityAccumulator += AttachedSpitter.TuneDataSpitter.ReelInRandomAddAmount.GetValue();
        RandomTime = (FRand() * AttachedSpitter.TuneDataSpitter.ReelInMaxTimeForRandom.GetValue()) - AttachedSpitter.TuneDataSpitter.ReelInMinTimeForRandom.GetValue();
        RandomTime += AttachedSpitter.TuneDataSpitter.ReelInMinTimeForRandom.GetValue();
        NextRandomTime = AttachedSpitter.WorldInfo.TimeSeconds + RandomTime;
    }
    // End:0x5B1
    if(AttachedSpitter.WorldInfo.TimeSeconds > (LastForward + 0.2500000))
    {
        // End:0x4D4
        if(VelocityAccumulator > float(0))
        {
            VelocityAccumulator -= (VelocityAccumulator * (DeltaTime * float(2)));
        }
        VelocityAccumulator -= (AttachedSpitter.TuneDataSpitter.ReelInReverseVelocity.GetValue() * DeltaTime);
        // End:0x5B1
        if(VelocityAccumulator < AttachedSpitter.TuneDataSpitter.ReelInVelocityRevMax)
        {
            VelocityAccumulator = AttachedSpitter.TuneDataSpitter.ReelInVelocityRevMax;
        }
    }
    // End:0x6CC
    if(VelocityAccumulator < float(0))
    {
        // End:0x64B
        if(SPAIController(AttachedSpitter.Controller).IsDestinationInsideAiMesh(AttachedSpitter.Location))
        {
            LastKnownGoodLocation = AttachedSpitter.Location;            
        }
        else
        {
            AttachedSpitter.SetLocation(LastKnownGoodLocation);
            VelocityAccumulator = 50.0000000;
            // End:0x6A1
            if(!bStruggleStarted)
            {
                bStruggleStarted = true;
                DisplayUI(true);
            }
        }
        DesiredLocation = MySPPawn.Location;        
    }
    else
    {
        desiredDiff = Vector(MySPPawn.Rotation) * AttachedSpitter.TuneDataSpitter.ReelInSuccessDistance;
        DesiredLocation = MySPPawn.Location + desiredDiff;
    }
    Delta = DesiredLocation - AttachedPawn.Location;
    Dir = Normal(Delta);
    AttachedPawn.Velocity = Dir * VelocityAccumulator;
    Delta = MySPPawn.Location - AttachedPawn.Location;
    Delta.Z = 0.0000000;
    Dir = Normal(Delta);
    Rot = Rotator(Dir);
    AttachedPawn.SetRotation(Rot);
    UpdateProgress();
    //return;    
}

function AddForward()
{
    // End:0x11C
    if(bStruggleStarted)
    {
        LastForward = AttachedSpitter.WorldInfo.TimeSeconds;
        VelocityAccumulator += AttachedSpitter.TuneDataSpitter.ReelInVelocity.GetValue();
        // End:0x11C
        if(VelocityAccumulator > AttachedSpitter.TuneDataSpitter.ReelInVelocityMax)
        {
            VelocityAccumulator = AttachedSpitter.TuneDataSpitter.ReelInVelocityMax;
        }
    }
    FeedbackAddForward();
    //return;    
}

function DragEnded()
{
    // End:0x3E
    if(SpitterAdditiveAnimNode != none)
    {
        AttachedSpitter.StopAdditiveAnim(0.1000000);
        SpitterAdditiveAnimNode = none;
    }
    DisplayUI(false);
    super.DragEnded();
    //return;    
}

function PlayAdditive()
{
    local /*0x97E50000-0x00000000*/ private bool bOnAttached[8388609];
    local /*0x97E50000-0x00000000*/ private int AnimIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], PlayAnimPawn, PlayAnimSequence;

    // End:0x42
    if(!bOnAttached)
    {
        PlayAnimPawn = MySPPawn;
        PlayAnimSequence = GetBestSequenceTemplateByIndex(AnimIndex);        
    }
    else
    {
        PlayAnimPawn = FollowerPawn;
        PlayAnimSequence = FollowerSMInstance.GetBestSequenceTemplateByIndex(AnimIndex);
    }
    return PlayAnimPawn.PlayAdditiveAnimationSequence(PlayAnimSequence,,,,, -1.0000000);
    //return ReturnValue;    
}

defaultproperties
{
    FollowerSpecialMoveClass=Class'LPSM_SpitterWinched'
}