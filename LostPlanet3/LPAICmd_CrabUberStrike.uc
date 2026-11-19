class LPAICmd_CrabUberStrike extends LPAICmd_CrabBaseStrike within LPAIControllerBaseSnowCrab;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDonePlayingHit[536870913];

function Pushed()
{
    super.Pushed();
    bDonePlayingHit = false;
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.ResetRotationRate();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    Outer.ResetRotationRate();
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0xE8
    if(Other.IsA('LPPlayerPawn'))
    {
        // End:0xE5
        if(Outer.CrabPawn.TuneDataIceCrab.bChargeHitsOnTouchAgainstPof)
        {
            // End:0xE5
            if(!RanIntoActor(Other, OtherComp, HitLocation, HitNormal))
            {
                Outer.TouchedOtherActorDuringMoveCmd(Other, OtherComp, HitLocation, HitNormal);
            }
        }        
    }
    else
    {
        // End:0x1D0
        if(Other.IsA('LPBaseVSPlayerPawn'))
        {
            // End:0x1CD
            if(Outer.CrabPawn.TuneDataIceCrab.bChargeHitsOnTouchAgainstVs)
            {
                // End:0x1CD
                if(!RanIntoActor(Other, OtherComp, HitLocation, HitNormal))
                {
                    Outer.TouchedOtherActorDuringMoveCmd(Other, OtherComp, HitLocation, HitNormal);
                }
            }            
        }
        else
        {
            // End:0x246
            if(!RanIntoActor(Other, OtherComp, HitLocation, HitNormal))
            {
                Outer.TouchedOtherActorDuringMoveCmd(Other, OtherComp, HitLocation, HitNormal);
            }
        }
    }
    //return;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    // End:0x71
    if(!RanIntoActor(Other, OtherComp, vect(0.0000000, 0.0000000, 0.0000000), HitNormal))
    {
        Outer.BumpedOtherActorDuringMoveCmd(Other, OtherComp, HitNormal);
    }
    //return;    
}

function @NULL RanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL hitPush, runIntoPawn, HitInfo, HitLoc, HitNorm, StartTrace,
	    EndTrace;

    // End:0x2C0
    if(Other != none)
    {
        runIntoPawn = LPPawn(Other);
        // End:0x2C0
        if(runIntoPawn != none)
        {
            // End:0x2C0
            if(Class'LPAIUtils'.static.AddPawnHit(runIntoPawn, Outer.PawnsRunIntoWhileMoveing, Outer.WorldInfo.TimeSeconds, true))
            {
                hitPush = runIntoPawn.Location - Outer.CrabPawn.Location;
                hitPush = Normal(hitPush);
                StartTrace = Outer.myAIPawn.Location;
                EndTrace = Other.Location;
                /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
                    
                */

                /*@Error*/;
                // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at System.ThrowHelper.ThrowArgumentOutOfRangeException(ExceptionArgument argument, ExceptionResource resource)
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
                // 3 & Type:If Position:0x2C0
            }
        }
    }
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    RanIntoActor(Info.Impact.HitActor, Info.Impact.HitInfo.HitComponent, Info.Impact.HitLocation, Info.Impact.HitNormal);
    //return;    
}

function OnLPSM_CrabUberStrikeHitEnd()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bDonePlayingHit = true;
    //return;    
}

function StartUberStrike()
{
    //return;    
}

function GetUbertrikeHitDamageForThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;
    local /*0x97E50000-0x00000000*/ private float returnDamage;

    vsPawn = LPBaseVSPlayerPawn(HitPawn);
    // End:0xD1
    if(vsPawn != none)
    {
        returnDamage = Outer.CrabPawn.TuneDataIceCrab.UberHitDamageVS.GetValue();
        // End:0xCE
        if(returnDamage < float(0))
        {
            returnDamage = float(HitPawn.HealthMax);
        }        
    }
    else
    {
        returnDamage = Outer.CrabPawn.TuneDataIceCrab.UberHitDamagePoF.GetValue();
        // End:0x174
        if(returnDamage < float(0))
        {
            returnDamage = float(HitPawn.HealthMax);
        }
    }
    return returnDamage;
    //return ReturnValue;    
}

state StateCmdActive
{
    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function AreFacingTarget()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL displacementToEnemy, rotToEnemy;

        displacementToEnemy = Outer.MyLPEnemy.Location - Outer.CrabPawn.Location;
        rotToEnemy = Rotator(displacementToEnemy);
        rotToEnemy = rotToEnemy - Outer.CrabPawn.Rotation;
        rotToEnemy.Yaw = rotToEnemy.Yaw & 65535;
        // End:0x159
        if(rotToEnemy.Yaw >= 32768)
        {
            rotToEnemy.Yaw -= 65536;
        }
        // End:0x187
        if(Abs(float(rotToEnemy.Yaw)) < float(300))
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    Outer.Focus = Outer.MyLPEnemy;
    J0x3D:

    // End:0x6C [Loop If]
    if(!AreFacingTarget())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x3D;
    }
    Outer.ZeroRotationRate();
    StartUberStrike();
    J0x95:

    // End:0xC4 [Loop If]
    if(!bDonePlayingHit)
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x95;
    }
    Outer.PopCommand(self);
    stop;                
}

defaultproperties
{
    bInterruptible=false
}