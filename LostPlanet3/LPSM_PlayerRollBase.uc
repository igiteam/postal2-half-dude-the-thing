class LPSM_PlayerRollBase extends SPSM_PlayAnimBase
    abstract
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedRoll;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPPlayerPawn;

function ShouldCrouchDuringRoll()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function IsDoingDodgeRoll()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    super(SPSpecialMove).InitSpecialMove(inPawn, InHandle);
    MyLPPlayerPawn = LPBasePlayerPawn(MySPPawn);
    // End:0xBF
    if(!IsDoingDodgeRoll())
    {
        RootMotionAccelScale = MyLPPlayerPawn.TuneDataBasePlayerPawn.RollDistanceMultiplier.GetValue();
        SetRootMotionScale(RootMotionAccelScale, RootMotionAccelScale, RootMotionAccelScale);
    }
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];
    local /*0x97E50000-0x00000000*/ private float BlendInTimeTemp;
    local /*0x97E50000-0x00000000*/ private @NULL GrenadeWeapon;

    GrenadeWeapon = MyLPPlayerPawn.GetGrenade();
    // End:0x7D
    if((GrenadeWeapon != none) && !GrenadeWeapon.IsIdle())
    {
        MyLPPlayerPawn.NotifyGrenadeAborted();
    }
    StopUpperBodyAnimation();
    MyLPPlayerPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    MyLPPlayerPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    // End:0x10E
    if(ShouldCrouchDuringRoll())
    {
        MyLPPlayerPawn.ChangePosture(true);
    }
    BlendInTimeTemp = BlendInTime;
    // End:0x172
    if(MyLPPlayerPawn.bIsMirrored)
    {
        MyLPPlayerPawn.ForceImmediateMirror(false);
        BlendInTime = 0.0000000;
    }
    super.SpecialMoveStarted(bForced, PrevMove);
    BlendInTime = BlendInTimeTemp;
    HandlePossibleNotificationOfDodgeMoveToEnemy();
    MyLPPlayerPawn.Mesh.RootMotionMode = 3;
    MyLPPlayerPawn.Mesh.RootMotionRotationMode = 1;
    TimeStartedRoll = MyLPPlayerPawn.WorldInfo.TimeSeconds;
    // End:0x28C
    if(LPPlayerController(MyLPPlayerPawn.Controller) != none)
    {
        BeginRollState();
    }
    //return;    
}

function BeginRollState()
{
    LPPlayerController(MyLPPlayerPawn.Controller).BeginRollState();
    //return;    
}

function HandlePossibleNotificationOfDodgeMoveToEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL myLPPlayerController, DodgeableExplosion, SpecialDodgePawn;

    // End:0x172
    if(MyLPPlayerPawn != none)
    {
        myLPPlayerController = LPPlayerController(MyLPPlayerPawn.Controller);
        // End:0x172
        if(myLPPlayerController != none)
        {
            // End:0x172
            if(myLPPlayerController.SpecialDodgeActor != none)
            {
                SpecialDodgePawn = LPPawn(myLPPlayerController.SpecialDodgeActor);
                // End:0xF4
                if(SpecialDodgePawn != none)
                {
                    SpecialDodgePawn.NotifyThatSpecialDodgeActorDodged(MyLPPlayerPawn, self.Class);                    
                }
                else
                {
                    DodgeableExplosion = LPDodgeableExplosionActor(myLPPlayerController.SpecialDodgeActor);
                    // End:0x172
                    if(DodgeableExplosion != none)
                    {
                        DodgeableExplosion.NotifyThatSpecialDodgeActorDodged(MyLPPlayerPawn, self.Class);
                    }
                }
            }
        }
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0xBD
    if((MyLPPlayerPawn != none) && (LPPlayerController(MyLPPlayerPawn.Controller) == none) || !LPPlayerController(MyLPPlayerPawn.Controller).bLockInCover)
    {
        MyLPPlayerPawn.LeaveCover();
    }
    // End:0x284
    if(((MySPPawn != none) && !MySPPawn.bDeleteMe) && !MySPPawn.IsInState('Dying'))
    {
        MyLPPlayerPawn.CancelDestinationRegistration();
        MyLPPlayerPawn.Mesh.RootMotionMode = 2;
        MyLPPlayerPawn.Mesh.RootMotionRotationMode = 0;
        MyLPPlayerPawn.Velocity.X = 0.0000000;
        MyLPPlayerPawn.Velocity.Y = 0.0000000;
        MyLPPlayerPawn.Acceleration.X = 0.0000000;
        MyLPPlayerPawn.Acceleration.Y = 0.0000000;
    }
    //return;    
}

final function IsPawnImmuneToThisDamageEvent()
{
    local /*0x97E50000-0x00000000*/ private class DamageReceive[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL myLpPlayCtrl, pawnToAttacker, dirOfIntent;
    local /*0x97E50000-0x00000000*/ private float cosOfAttackToIntent, differenceInDodgeWindowStartAndRollStart;
    local /*0x97E50000-0x00000000*/ private @NULL HumanPlayer;

    HumanPlayer = LPPlayerPawn(MyLPPlayerPawn);
    // End:0x3BF
    if((HumanPlayer != none) && LPPlayerController(HumanPlayer.Controller) != none)
    {
        myLpPlayCtrl = LPPlayerController(HumanPlayer.Controller);
        // End:0x3BF
        if(HumanPlayer.TakeDamageParams.InstigatedByPawn != none)
        {
            iter = 0;
            J0xCD:

            // End:0x3BF [Loop If]
            if(iter < HumanPlayer.TuneDataPlayerPawn.DodgeRollImmunityInfo.Length)
            {
                // End:0x3B1
                if(ClassIsChildOf(DamageReceive, HumanPlayer.TuneDataPlayerPawn.DodgeRollImmunityInfo[iter].DamageImmuneFrom))
                {
                    // End:0x3AF
                    if(myLpPlayCtrl.TimeWasNotifiedOfDodgeWindowClosing > TimeStartedRoll)
                    {
                        differenceInDodgeWindowStartAndRollStart = myLpPlayCtrl.TimeWasNotifiedOfDodgeWindowOpening - TimeStartedRoll;
                        // End:0x3AC
                        if(differenceInDodgeWindowStartAndRollStart < HumanPlayer.TuneDataPlayerPawn.DodgeRollImmunityInfo[iter].StartOfRollVsDodgeWindowBuffer)
                        {
                            pawnToAttacker = HumanPlayer.TakeDamageParams.InstigatedByPawn.Location;
                            pawnToAttacker.Z = HumanPlayer.Location.Z;
                            pawnToAttacker = Normal(pawnToAttacker - HumanPlayer.Location);
                            dirOfIntent = Normal(HumanPlayer.Acceleration);
                            cosOfAttackToIntent = dirOfIntent Dot pawnToAttacker;
                            // End:0x3A9
                            if(cosOfAttackToIntent < HumanPlayer.TuneDataPlayerPawn.DodgeRollImmunityInfo[iter].CosOfAngleOfImmunityExclusion)
                            {
                                return true;                                
                            }                            
                        }                        
                    }
                    return false;
                }
                ++iter;
                // [Loop Continue]
                goto J0xCD;
            }
        }
    }
    return false;
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
        // End:0x70
        case Class'LPSMMTypes'.default.SMM_ShouldIgnoreDamageType:
            return IsPawnImmuneToThisDamageEvent(MySPPawn.TakeDamageParams.DamageType);
        // End:0xFFFF
        default:
            return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

event WantsToStopSMOnNotifyEnablePlayerMovement()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

static function IsValidSpecialDodge()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609], SpecialDodgeActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    bAllowFootPlacementControllers=false
}