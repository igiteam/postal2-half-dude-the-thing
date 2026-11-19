class LPAICmd_DongoChargeAttackVs extends LPAICmd_CrabChargeAttackVs within LPAIControllerDongo;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRollInFinished;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRollOutFinished;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ChargeStartTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PreRampUpFocus;

function GetDodgeWindowType()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 19;
    //return ReturnValue;    
}

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.DongoPawn.ServerEndSpecialMove(Class'LPSM_DongoRollStart');
    Outer.DongoPawn.ServerEndSpecialMove(Class'LPSM_DongoRollEnd');
    Outer.SetChargeCSA(false);
    Outer.ReleaseStrikeAccess();
    //return;    
}

function EndOfChargeAttack()
{
    Outer.Focus = EnemyForAttack;
    Outer.CmdTurnToFaceFocus(1);
    //return;    
}

event DelegateMovingToChargePointAvoidance()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bAvoid;
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest, kActorObs;

    // End:0x173
    if(Outer.ShouldAviodActorTypeDuringCharge(Obstacle))
    {
        // End:0x9C
        if(Pawn(Obstacle) != none)
        {
            bAvoid = true;
            PawnToTest = Pawn(Obstacle);
            // End:0x8E
            if(PawnToTest == EnemyForAttack)
            {
                bAvoid = false;
            }
            return bAvoid;            
        }
        else
        {
            bAvoid = true;
            kActorObs = LPKActor(Obstacle);
            // End:0x168
            if(kActorObs != none)
            {
                // End:0x168
                if(CylinderComponent(kActorObs.CollisionComponent).CollisionHeight < Outer.CrabPawn.CylinderComponent.CollisionHeight)
                {
                    bAvoid = false;
                }
            }
            return bAvoid;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetHitPushDuringCharge()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ReturnValue;

    return vect(0.0000000, 0.0000000, 0.0000000);
    //return ReturnValue;    
}

function On_LPSM_DongoRollStart_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bRollInFinished = true;
    ChargeStartTime = Outer.DongoPawn.TuneDataDongo.ChargeRampUpTime.GetValue() + Outer.DongoPawn.WorldInfo.TimeSeconds;
    Outer.SetChargeCSA(true);
    //return;    
}

function StartDongoRollStart()
{
    Outer.myAIPawn.SetRadarIconState(2);
    bRollInFinished = false;
    PreRampUpFocus = Outer.Focus;
    Outer.Focus = EnemyForAttack;
    Outer.DongoPawn.DoSpecialMove(Class'LPSM_DongoRollStart', true, false, On_LPSM_DongoRollStart_Finished, none);
    //return;    
}

function On_LPSM_DongoRollEnd_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bRollOutFinished = true;
    //return;    
}

function StartDongoRollEnd()
{
    bRollOutFinished = false;
    Outer.DongoPawn.DoSpecialMove(Class'LPSM_DongoRollEnd', true, false, On_LPSM_DongoRollEnd_Finished, none);
    //return;    
}

state PostChargingTripAndStunned
{
    function DoFailSpecialMove()
    {
        Outer.CrabPawn.DoSpecialMove(Class'LPSM_DongoChargeMissedVS', true, false, OnLPSM_SnowCrabFailedChargeStunEnd);
        //return;        
    }
    stop;    
}

state StateCmdActive
{
    event PausedState()
    {
        super(SPStateObject).PausedState();
        Outer.ReleaseStrikeAccess();
        //return;        
    }

    function FaceEnemyForChargingStrike()
    {
        Outer.Focus = EnemyForAttack;
        Outer.CmdTurnToFaceFocus(1,, 1);
        //return;        
    }

    function PrepareForChargingStrike()
    {
        StartDongoRollStart();
        //return;        
    }

    function IsPreparedForChargingStrike()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x8D
        if(bRollInFinished)
        {
            // End:0x8D
            if(ChargeStartTime < Outer.DongoPawn.WorldInfo.TimeSeconds)
            {
                Outer.Focus = PreRampUpFocus;
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }

    function OverrideDamageReaction()
    {
        local /*0x97E50000-0x00000000*/ private @NULL DM[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x1B0
        if(bRollInFinished)
        {
            // End:0x57
            if((ChildCommand != none) && LPAICommand(ChildCommand).OverrideDamageReaction(DM))
            {
                return true;                
            }
            else
            {
                // End:0xAE
                if(DM.bIsVSMeleeDamage)
                {
                    DM.SetAIReactionDelegate(None);
                    return true;                    
                }
                else
                {
                    // End:0x19C
                    if(class<LPDamageType>(MyPawn.TakeDamageParams.DamageType).default.bCausesExplosiveReactions)
                    {
                        Outer.CmdStatus_ChargeAttack.SetChargeInteruptedBecauseOfExplosion();
                        Outer.PopCommand(self.ChildCommand);
                        DM.SetAIReactionDelegate(None);
                        return true;
                    }
                }
            }
            return super.OverrideDamageReaction(DM);
        }
        return false;
        //return ReturnValue;        
    }
    stop;    
}

state PostChargingShakeOff
{
    ignores NotifyOfDangerousAmountOfDamage;

    function TransitionOutOfCharge()
    {
        StartDongoRollEnd();
        //return;        
    }

    function FinishedTransitioningOutOfCharge()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x2D
        if(bRollOutFinished)
        {
            Outer.SetChargeCSA(false);
        }
        return bRollOutFinished;
        //return ReturnValue;        
    }
    stop;    
}
