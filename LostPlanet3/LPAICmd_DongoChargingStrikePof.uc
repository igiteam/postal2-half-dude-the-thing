class LPAICmd_DongoChargingStrikePof extends LPAICmd_CrabChargingStrikePof within LPAIControllerDongo;

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

function StartChargingStrikeSucsussfulHit()
{
    bDonePlayingHit = true;
    //return;    
}

function GetHitPushDuringCharge()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ReturnValue;

    return vect(0.0000000, 0.0000000, 0.0000000);
    //return ReturnValue;    
}

function HasTheHitPawnSucsufullyDodgedOrBlockedStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnRunInto[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    vsPawn = LPBaseVSPlayerPawn(PawnRunInto);
    // End:0x4C
    if(vsPawn != none)
    {
        CmdStatus_ChargeAttackUsing.NotifyStruckBlockingObject();
        return true;
    }
    return super.HasTheHitPawnSucsufullyDodgedOrBlockedStrike(PawnRunInto);
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

function StartChargingStrikeSpecialMove()
{
    //return;    
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

function DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];

    //return;    
}
