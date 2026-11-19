class LPGFxUIElementVSWeldPoint extends LPGFxUIElementVSInteractionPoint
    config(UI);

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super.Init(MP);
    //return;    
}

function CreateInteractionPointMC()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Mode[9437185];
    local /*0x97E50000-0x00000000*/ private float X[9437185], Y;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return MoviePlayer.ActionScriptObject("createWeldPoint");
    //return ReturnValue;    
}

function PlayerHasRequiredEquipment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LPVSP;
    local /*0x97E50000-0x00000000*/ private bool bRetval;

    LPPC = GetLPPC();
    LPVSP = LPVSPlayerPawn(LPPC.Pawn);
    bRetval = ClassIsChildOf(LPVSP.RightArmPartClass, Class'LPWeaponVSWelder');
    return bRetval;
    //return ReturnValue;    
}

function NotifyChangedVSInventoryPart()
{
    SetInteractionPointActive(InteractionPointMC, true);
    //return;    
}

function SetInteractionPointText()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Str[8388609];

    MoviePlayer.ActionScriptVoid("setWeldPointText");
    //return;    
}

defaultproperties
{
    InteractableFunctionName="setWeldPointActive"
    AimWidthFunctionName="getWeldPointAimWidth"
    AimHeightFunctionName="getWeldPointAimHeight"
}