class LPAICmd_DongoChargingStrikeVs extends LPAICmd_CrabChargingStrikeVs within LPAIControllerDongo;

function GetDodgeWindowType()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 19;
    //return ReturnValue;    
}

function Pushed()
{
    super.Pushed();
    Outer.SetChargeCSA(true);
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.SetChargeCSA(false);
    //return;    
}

function StartChargingStrikeSpecialMove()
{
    Outer.CrabPawn.DoSpecialMove(Class'LPSM_DongoChargingAttackVs', true, false);
    //return;    
}

function StartChargingStrikeSucsussfulHit()
{
    bDonePlayingHit = true;
    //return;    
}

function IHitMyTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609];

    // End:0x2D
    if(LPPlayerPawn(HitPawn) != none)
    {
        super(LPAICmd_CrabChargingStrike).IHitMyTarget(HitPawn);
        return;
    }
    // End:0x70
    if(CurMoveToPositionCmd != none)
    {
        Outer.AbortCommand(CurMoveToPositionCmd);
        CurMoveToPositionCmd = none;
    }
    //return;    
}

function GetHitPushDuringCharge()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ReturnValue;

    return vect(0.0000000, 0.0000000, 0.0000000);
    //return ReturnValue;    
}

event DelegateMovingToChargePointAvoidance()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(LPBaseVSPlayerPawn(Obstacle) != none)
    {
        return false;
    }
    // End:0x59
    if(Outer.ShouldAviodActorTypeDuringCharge(Obstacle))
    {
        return super(LPAICmd_CrabChargingStrike).DelegateMovingToChargePointAvoidance(Obstacle);
    }
    return false;
    //return ReturnValue;    
}

function @NULL RanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000400*/ private editfixedsize array ComponentArray;
    local /*0x97E50000-0x00000400*/ private @NULL OtherDestructComponent;

    // End:0x67
    if(Outer.CanBeDestroyedByChargeHit(Other))
    {
        Outer.DestroyByChargeHit(Other, HitLocation, HitNormal);
        return true;
    }
    // End:0x21A
    if(!super(LPAICmd_CrabChargingStrike).RanIntoActor(Other, OtherComp, HitLocation, HitNormal))
    {
        Other.GetComponentsOfClass(Class'SPDestructibles.SPActorDestructComponent', ComponentArray);
        // End:0xF9
        if(ComponentArray.Length > 0)
        {
            OtherDestructComponent = SPActorDestructComponent(ComponentArray[0]);
        }
        // End:0x21A
        if(OtherDestructComponent != none)
        {
            // End:0x21A
            if(OtherDestructComponent.CanDoDamageType(Outer.DongoPawn.DamageTypeChargeHit))
            {
                Other.TakeDamage(1000000, Outer, Outer.DongoPawn.Location, HitNormal, Outer.DongoPawn.DamageTypeChargeHit,, Outer.DongoPawn);
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

state StateCmdActive
{
    function DHD_SmashHitReaction()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

        CmdStatus_ChargeAttackUsing.NotifyActiveDefenseStruck();
        //return;        
    }

    function OverrideDamageReaction()
    {
        local /*0x97E50000-0x00000000*/ private @NULL DM[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x54
        if(DM.bIsVSMeleeDamage)
        {
            DM.SetAIReactionDelegate(DHD_SmashHitReaction);
            return true;
        }
        return false;
        //return ReturnValue;        
    }
    stop;    
}
