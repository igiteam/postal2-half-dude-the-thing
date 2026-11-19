class LPPerkBase extends Object
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private name PerkName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PerkType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PerkIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string HUDIconName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string FriendlyName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Description;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ShortDescription;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PerkBaseTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPlayerController;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PerkManager;

simulated function Init()
{
    //return;    
}

function GetTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return PerkBaseTuneData;
    //return ReturnValue;    
}

function CopyProperties()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];

    MyPlayerController = P.MyPlayerController;
    //return;    
}

function SetController()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];

    MyPlayerController = C;
    //return;    
}

simulated function Reset()
{
    //return;    
}

function GetPerkCategory()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    switch(PerkType)
    {
        // End:0x18
        case 0:
        // End:0x20
        case 1:
            return 0;
        // End:0x25
        case 2:
        // End:0x2D
        case 3:
            return 1;
        // End:0x35
        case 4:
            return 2;
        // End:0xFFFF
        default:
            return 1;
            break;
    }
    //return ReturnValue;    
}

function IsPassive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(PerkType)
    {
        // End:0x18
        case 2:
        // End:0x1F
        case 4:
            return true;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return ReturnValue;    
}

function IsAssigned()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x15
    if(PerkManager == none)
    {
        return -1;
    }
    return PerkManager.QueryPerkIndex(PerkIndex);
    //return ReturnValue;    
}

function GetHUDIconName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return HUDIconName;
    //return ReturnValue;    
}

simulated function GetCost()
{
    local /*0x97E50000-0x00000000*/ private bool bRecalculateCost[9437185];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    false
    return 0.0000000;
    //return ReturnValue;    
}
