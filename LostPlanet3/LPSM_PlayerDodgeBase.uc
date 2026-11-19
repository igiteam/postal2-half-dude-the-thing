class LPSM_PlayerDodgeBase extends LPSM_PlayerRollBase
    abstract
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRequirePlayerInFrontOfAttacker;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxSeparationDistance;

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x36
        case Class'LPSMMTypes'.default.SMM_ShouldIgnoreDamageType:
            return true;
        // End:0xFFFF
        default:
            return super.ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

function ShouldCrouchDuringRoll()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function IsDoingDodgeRoll()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

static function IsValidSpecialDodge()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609], SpecialDodgeActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(SpecialDodgeActor == none)
    {
        return false;
    }
    // End:0x58
    if(default.bRequirePlayerInFrontOfAttacker && !Class'SPEngine.SPUtil'.static.IsInFront(SpecialDodgeActor, Dodger))
    {
        return false;
    }
    // End:0xA5
    if((default.MaxSeparationDistance > 0.0000000) && Dodger.DistanceBetweenCollisionCylinders(SpecialDodgeActor) > default.MaxSeparationDistance)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}
