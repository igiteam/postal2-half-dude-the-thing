class LPSM_HitReactionFromSpitterAcidDOT extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private export @NULL ServerDOTInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastDOTUpdateTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpitterPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SavedGroundSpeed;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], LPPC;

    super.SpecialMoveStarted(bForced, PrevMove);
    LPPC = LPPlayerController(MySPPawn.Controller);
    SpitterPawn = LPAIPawnSpitter(MySPPawn.SpecialMoveState.CurSMInfo.InteractionPawn);
    // End:0xD7
    if(LPPC != none)
    {
        LPPC.GotoState('AcidStreamed');
    }
    StartChoreography();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, LPPC, LPP;

    LPPC = LPPlayerController(MySPPawn.Controller);
    LPP = LPPawn(MySPPawn);
    // End:0x7B
    if(LPPC != none)
    {
        LPPC.EndState_AcidStreamed();
    }
    SpitterPawn = none;
    LPP.StopPawnChoreography();
    // End:0x11F
    if(int(LPP.Role) == int(ROLE_Authority))
    {
        LPP.DOTComponent.ForceStopDOTByDamageType(ServerDOTInfo.DamageType);
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x54
    if((MySPPawn != none) && MySPPawn.HitReactLogicAnimTree != none)
    {
        return MySPPawn.HitReactLogicAnimTree;
    }
    return super.GetAnimTemplateTreeForSpecialMove();
    //return ReturnValue;    
}

function GetDesiredAnimIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return ((IsFacingAway()) ? 1 : 0);
    //return ReturnValue;    
}

function IsFacingAway()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL DeltaFromTarget, TargetPawn;

    TargetPawn = ((SpitterPawn != none) ? SpitterPawn : ServerDOTInfo.DamageCauser.Pawn);
    DeltaFromTarget = MySPPawn.Location - TargetPawn.Location;
    // End:0xD2
    if((DeltaFromTarget Dot Vector(MySPPawn.Rotation)) > float(0))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function SetDOTInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL InDOTInfo[25296897];

    ServerDOTInfo = InDOTInfo;
    LastDOTUpdateTime = MySPPawn.WorldInfo.TimeSeconds;
    //return;    
}

function StartChoreography()
{
    local /*0x97E50000-0x00000000*/ private @NULL ChoreographyParams;

    ChoreographyParams.OtherTarget = SpitterPawn;
    ChoreographyParams.MySequence = none;
    ChoreographyParams.OtherTargetSequence = none;
    ChoreographyParams.AlignmentType = 1;
    ChoreographyParams.BlendTime = 0.2000000;
    // End:0xD5
    if(IsFacingAway())
    {
        ChoreographyParams.ManualYawDeltaFromCenterline = -32768;        
    }
    else
    {
        ChoreographyParams.ManualYawDeltaFromCenterline = 0;
    }
    ChoreographyParams.ManualTargetDeltaFromCenterline = -32768;
    ChoreographyParams.bOverrideTranslationOffset = true;
    ChoreographyParams.OtherTargetMovePercent = 0.0000000;
    ChoreographyParams.RotationMode = 1;
    ChoreographyParams.OverridenDesiredTranslationOffset = 0.0000000;
    ChoreographyParams.TooCloseTranslationTolerance = 100000.0000000;
    ChoreographyParams.TooFarTranslationTolerance = 100000.0000000;
    ChoreographyParams.ZMatchType = 0;
    MySPPawn.StartPawnChoreography(ChoreographyParams);
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], TimeSinceUpdate;

    super.Tick(DeltaTime);
    // End:0xB7
    if(int(MySPPawn.Role) == int(ROLE_Authority))
    {
        TimeSinceUpdate = MySPPawn.WorldInfo.TimeSeconds - LastDOTUpdateTime;
        // End:0xB7
        if(TimeSinceUpdate > 0.3000000)
        {
            MySPPawn.ServerEndCurrentSpecialMove(self);
        }
    }
    //return;    
}

function UpdateAccelRateForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL newAccel[25165825];

    super(SPSpecialMove).UpdateAccelRateForSpecialMove(DeltaTime, newAccel);
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    bShouldLoop=true
    bManageRootMotionMode=true
    bAbortOnMissingAnimation=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
    CanBeOverridenByBaseClasses=/* Array type was not detected. */
}