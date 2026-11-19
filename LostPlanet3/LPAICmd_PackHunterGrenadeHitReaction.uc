class LPAICmd_PackHunterGrenadeHitReaction extends LPAICommand within LPAIControllerPackHunter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrenadeLocation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class HitReactionSpecialMove;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDone;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function SetGrenadeLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL InGrenadeLocation[25296897];

    GrenadeLocation = InGrenadeLocation;
    //return;    
}

protected function CanBeStarted()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x33
    if(Outer.CanDoGrenadeHitReaction())
    {
        // End:0x33
        if(HitReactionSpecialMove != none)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

protected function GetSpecialMoveForDirection()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MyDirection, MyRight, MyUp, DirectionToGrenade;
    local /*0x97E50000-0x00000000*/ private float DotResultForward, DotResultRight;

    // End:0x210
    if(Outer.CanDoGrenadeHitReaction())
    {
        MyDirection = Vector(Outer.myAIPawn.Rotation);
        GetAxes(Outer.myAIPawn.Rotation, MyDirection, MyRight, MyUp);
        DirectionToGrenade = Outer.myAIPawn.Location - GrenadeLocation;
        DirectionToGrenade.Z = 0.0000000;
        DirectionToGrenade = Normal(DirectionToGrenade);
        DotResultForward = DirectionToGrenade Dot MyDirection;
        // End:0x17F
        if(DotResultForward > float(0))
        {
            // End:0x17C
            if(DotResultForward > 0.7071068)
            {
                return Class'LPSM_PackHunterGrenadeHitFront';
            }            
        }
        else
        {
            DotResultForward = -DotResultForward;
            // End:0x1CA
            if(DotResultForward > 0.7071068)
            {
                // End:0x1C0
                if(FRand() > 0.5000000)
                {
                    return Class'LPSM_PackHunterGrenadeHitRight';                    
                }
                else
                {
                    return Class'LPSM_PackHunterGrenadeHitLeft';
                }
            }
        }
        DotResultRight = DirectionToGrenade Dot MyRight;
        // End:0x206
        if(DotResultRight > float(0))
        {
            return Class'LPSM_PackHunterGrenadeHitRight';            
        }
        else
        {
            return Class'LPSM_PackHunterGrenadeHitLeft';
        }
    }
    return none;
    //return ReturnValue;    
}

protected function InitSpecialMove()
{
    HitReactionSpecialMove = GetSpecialMoveForDirection();
    //return;    
}

function OnSpecialMoveFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bDone = true;
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super.BeginState(PreviousState);
        InitSpecialMove();
        //return;        
    }
Begin:

    // End:0xAD
    if(CanBeStarted())
    {
        Outer.Focus = none;
        Outer.PHPawn.DoSpecialMove(HitReactionSpecialMove,,, OnSpecialMoveFinished);
        J0x7E:

        // End:0xAD [Loop If]
        if(!bDone)
        {
            Outer.Sleep(0.1000000);
            // [Loop Continue]
            goto J0x7E;
        }
    }
    Outer.PopCommand(self);
    stop;            
}

defaultproperties
{
    bInterruptible=false
}