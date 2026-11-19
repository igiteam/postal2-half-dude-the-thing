class LPSM_PlayerVSWinchedAct1Boss extends LPSM_PlayerVSWinchedLargePawn
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LPC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttachedBoss;
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
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BossAdditiveAnimNode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStruggleStarted;

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
    return AttachedBoss.TuneDataBoss.ReelInSuccessDistance + AttachedBoss.TuneDataBoss.ReelInSuccessLeeway;
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
    if(AttachedBoss.WorldInfo.bPlayersOnly)
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
    AttachedBoss = LPAIPawnAct1Boss(AttachedPawn);
    AttachedBoss.ZeroMovementVariables();
    //return;    
}

function StartDragAnimation()
{
    animationState = 2;
    MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(2),,, 1.0000000, 0.2000000, 0.2500000, true);
    LPSM_Act1BossWinched(FollowerSMInstance).StartDragAnimation();
    //return;    
}

simulated function DoesStateUseFullChoreography()
{
    local /*0x97E50000-0x00000000*/ private byte InState[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function DragSetup()
{
    super.DragSetup();
    StartDistance = GetDistance();
    StartTime = AttachedBoss.WorldInfo.TimeSeconds;
    LastDistance = 0.0000000;
    LastKnownGoodLocation = AttachedBoss.Location;
    bStruggleStarted = StartDistance > AttachedBoss.TuneDataBoss.ReelInStruggleStartDistance;
    DepletionRate = AttachedBoss.TuneDataBoss.ReelInDepletionRate.GetValue();
    MaxHydraulicPressure = LPBaseVSPlayerPawn(MySPPawn).TuneDataVSPlayerPawn.ForkArmGrabMaxHydraulicPressure.GetValue();
    HydraulicPressureLeft = MaxHydraulicPressure;
    DisplayUI(true);
    NextRandomTime = 0.0000000;
    VelocityAccumulator = 0.0000000;
    // End:0x1E7
    if(!bStruggleStarted)
    {
        LastForward = 0.0000000;        
    }
    else
    {
        LastForward = AttachedBoss.WorldInfo.TimeSeconds;
    }
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

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    DragEnded();
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function UpdateProgress()
{
    local /*0x97E50000-0x00000000*/ private float Range, fromMin, percentFwd, percentRevAnim, Distance, percentDistance;

    // End:0x36
    if(!bStruggleStarted)
    {
        LPC.SetStruggleButtonStrength(0.0000000);        
    }
    else
    {
        Distance = GetDistance();
        Distance = Distance - AttachedBoss.TuneDataBoss.ReelInSuccessDistance;
        percentDistance = Distance / AttachedBoss.TuneDataBoss.ReelInFarUIDistance;
        percentDistance = FClamp(percentDistance, 0.0000000, 1.0000000);
        LPC.SetStruggleButtonStrength(1.0000000 - percentDistance);
    }
    // End:0x287
    if(BossAdditiveAnimNode != none)
    {
        fromMin = VelocityAccumulator - AttachedBoss.TuneDataBoss.ReelInVelocityRevMax;
        Range = AttachedBoss.TuneDataBoss.ReelInVelocityMax - AttachedBoss.TuneDataBoss.ReelInVelocityRevMax;
        percentFwd = fromMin / Range;
        percentRevAnim = 1.0000000 - percentFwd;
        BossAdditiveAnimNode.SetPosition(percentRevAnim * BossAdditiveAnimNode.AnimSeq.SequenceLength, false);
    }
    //return;    
}

function DragUpdate()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Rot, Dir, Delta, desiredDiff, DesiredLocation;

    local /*0x97E50000-0x00000000*/ private float Distance, RandomTime;

    // End:0x46
    if(AttachedBoss.WorldInfo.bPlayersOnly)
    {
        DeltaTime = 0.0000000;
    }
    // End:0x22F
    if(!bStruggleStarted)
    {
        Distance = GetDistance();
        // End:0xC4
        if(Distance > AttachedBoss.TuneDataBoss.ReelInStruggleStartDistance)
        {
            bStruggleStarted = true;
            DisplayUI(true);            
        }
        else
        {
            // End:0x135
            if(Abs(LastDistance - Distance) > float(0))
            {
                LastMoved = AttachedBoss.WorldInfo.TimeSeconds;
                LastDistance = Distance;                
            }
            else
            {
                // End:0x22F
                if(((AttachedBoss.WorldInfo.TimeSeconds - LastMoved) > AttachedBoss.TuneDataBoss.ReelInBeginTimerMaxNoMovement) || (AttachedBoss.WorldInfo.TimeSeconds - StartTime) > AttachedBoss.TuneDataBoss.ReelInBeginTimerMaxWalkAway)
                {
                    bStruggleStarted = true;
                }
            }
        }
    }
    // End:0x456
    if(AttachedBoss.WorldInfo.TimeSeconds > NextRandomTime)
    {
        VelocityAccumulator *= AttachedBoss.TuneDataBoss.ReelInRandomMulAmount.GetValue();
        VelocityAccumulator += AttachedBoss.TuneDataBoss.ReelInRandomAddAmount.GetValue();
        RandomTime = (FRand() * AttachedBoss.TuneDataBoss.ReelInMaxTimeForRandom.GetValue()) - AttachedBoss.TuneDataBoss.ReelInMinTimeForRandom.GetValue();
        RandomTime += AttachedBoss.TuneDataBoss.ReelInMinTimeForRandom.GetValue();
        NextRandomTime = AttachedBoss.WorldInfo.TimeSeconds + RandomTime;
    }
    // End:0x5B1
    if(AttachedBoss.WorldInfo.TimeSeconds > (LastForward + 0.2500000))
    {
        // End:0x4D4
        if(VelocityAccumulator > float(0))
        {
            VelocityAccumulator -= (VelocityAccumulator * (DeltaTime * float(2)));
        }
        VelocityAccumulator -= (AttachedBoss.TuneDataBoss.ReelInReverseVelocity.GetValue() * DeltaTime);
        // End:0x5B1
        if(VelocityAccumulator < AttachedBoss.TuneDataBoss.ReelInVelocityRevMax)
        {
            VelocityAccumulator = AttachedBoss.TuneDataBoss.ReelInVelocityRevMax;
        }
    }
    // End:0x615
    if(VelocityAccumulator < float(0))
    {
        LastKnownGoodLocation = AttachedBoss.Location;
        DesiredLocation = MySPPawn.Location;        
    }
    else
    {
        desiredDiff = Vector(MySPPawn.Rotation) * AttachedBoss.TuneDataBoss.ReelInSuccessDistance;
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
        LastForward = AttachedBoss.WorldInfo.TimeSeconds;
        VelocityAccumulator += AttachedBoss.TuneDataBoss.ReelInVelocity.GetValue();
        // End:0x11C
        if(VelocityAccumulator > AttachedBoss.TuneDataBoss.ReelInVelocityMax)
        {
            VelocityAccumulator = AttachedBoss.TuneDataBoss.ReelInVelocityMax;
        }
    }
    //return;    
}

function DragEnded()
{
    // End:0x3E
    if(BossAdditiveAnimNode != none)
    {
        AttachedBoss.StopAdditiveAnim(0.1000000);
        BossAdditiveAnimNode = none;
    }
    AttachedBoss.ZeroMovementVariables();
    DisplayUI(false);
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
    FollowerSpecialMoveClass=Class'LPSM_Act1BossWinched'
}