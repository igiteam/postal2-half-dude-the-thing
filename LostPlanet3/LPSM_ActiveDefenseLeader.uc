class LPSM_ActiveDefenseLeader extends SPSM_LeaderPawnBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CombatWindowInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BlendInTime;

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    super(SPSpecialMove).InitSpecialMove(inPawn, InHandle);
    //return;    
}

function PrepSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], InteractionActor;

    super(SPSpecialMoveStateBased).PrepSpecialMove(PrevMove, InteractionActor);
    PlayerPawn = LPBasePlayerPawn(MySPPawn);
    CombatWindowInfo = PlayerPawn.ReplicatedCombatWindowInfo.Window;
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function StartInteraction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    super(SPSM_LeaderFollowerBase).StartInteraction();
    // End:0x1FD
    if(PlayerPawn != none)
    {
        LPC = LPPlayerController(PlayerPawn.Controller);
        // End:0x7C
        if(LPC != none)
        {
            LPC.GotoState('ActiveDefense');
        }
        PlayerPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        PlayerPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        PlayerPawn.TemplateLogicData.TargetPawn = LPPawn(FollowerPawn);
        PlayerPawn.TemplateLogicData.CombatWindowName = CombatWindowInfo.CombatWindow.WindowName;
        PlayerPawn.EnableAIResourceStrike(false);
        StartAnimationChoreography(PlayerPawn, FollowerPawn, 0, false, ActiveDefenseFinished, FollowerSMInstance.EndAnimationFinished,, BlendInTime);
    }
    //return;    
}

function ActiveDefenseFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    EndActiveDefense();
    //return;    
}

function EndActiveDefense()
{
    // End:0x95
    if(int(MySPPawn.Role) != int(ROLE_SimulatedProxy))
    {
        // End:0x75
        if(int(MySPPawn.Role) == int(ROLE_Authority))
        {
            MySPPawn.ServerEndCurrentSpecialMove(self);            
        }
        else
        {
            MySPPawn.LocalEndCurrentSpecialMove(self);
        }
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, LPC;

    LPC = LPPlayerController(MySPPawn.Controller);
    // End:0x8A
    if(LPC != none)
    {
        // End:0x8A
        if(!LPC.IsInState('Dead'))
        {
            LPC.GotoState('PlayerWalking');
        }
    }
    // End:0xF0
    if(PlayerPawn != none)
    {
        PlayerPawn.StopFullBodyAnim(0.2000000);
        StopAnimationChoreography(PlayerPawn);
        PlayerPawn.EnableAIResourceStrike(true);
    }
    CombatWindowInfo.CombatWindow = none;
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

simulated function SetUpChoreography()
{
    local /*0x97E50000-0x00000000*/ private @NULL Leader[8388609], MySeq, Follower, OtherSeq, ChoreoMetaData;

    local /*0x97E50000-0x00000000*/ private byte AlignmentType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bLeaveCollisionOnOther[8388609], bIgnoreCollisionBetweenLeaderAndFollower;
    local /*0x97E50000-0x00000000*/ private float PreferredOtherMovementPercent[9437185];
    local /*0x97E50000-0x00000000*/ private byte ZMatchType[9437185], RotationMode;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    0.5000000
    0
    0
    return super(SPSM_LeaderFollowerBase).SetUpChoreography(Leader, MySeq, Follower, OtherSeq, ChoreoMetaData, AlignmentType, bLeaveCollisionOnOther, bIgnoreCollisionBetweenLeaderAndFollower, PreferredOtherMovementPercent, 1, RotationMode);
    //return ReturnValue;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x36
        case Class'LPSMMTypes'.default.SMM_VSPlayHitReactionAnimation:
            return true;
        // End:0xFFFF
        default:
            return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    //return;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], PP;

    PP = LPBasePlayerPawn(MySPPawn);
    // End:0x70
    if((PP != none) && PP.ActiveDefenseAnimTree != none)
    {
        return PP.ActiveDefenseAnimTree;
    }
    return super(SPSpecialMove).GetAnimTemplateTreeForSpecialMove();
    //return ReturnValue;    
}

defaultproperties
{
    BlendInTime=0.2500000
    FollowerSpecialMoveClass=Class'LPSM_ActiveDefenseFollower'
    AnimationTemplateNodeNames=/* Array type was not detected. */
    CanOverrideBaseClasses=/* Array type was not detected. */
}