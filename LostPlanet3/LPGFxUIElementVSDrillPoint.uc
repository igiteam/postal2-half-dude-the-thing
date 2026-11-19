class LPGFxUIElementVSDrillPoint extends LPGFxUIElementVSInteractionPoint
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

    return MoviePlayer.ActionScriptObject("createDrillVolume");
    //return ReturnValue;    
}

function PlayerHasRequiredEquipment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LPVSP;
    local /*0x97E50000-0x00000000*/ private bool bRetval;

    LPPC = GetLPPC();
    LPVSP = LPVSPlayerPawn(LPPC.Pawn);
    bRetval = ClassIsChildOf(LPVSP.RightArmPartClass, Class'LPWeaponVSDrill');
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

    MoviePlayer.ActionScriptVoid("setDrillVolumeText");
    //return;    
}

function GetTutorialText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private editfixedsize string S;

    LPPC = GetLPPC();
    S = "";
    // End:0x83
    if(LPPC != none)
    {
        // End:0x83
        if(LPPC.ShouldDisplayVSCombatTutorials())
        {
            S = MoviePlayer.GetLocalizedString(TutorialString);
        }
    }
    return S;
    //return ReturnValue;    
}

function UpdateVisibility()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bVisible;
    local /*0x97E50000-0x00000000*/ private @NULL DrillVolume, LPPC;

    bVisible = true;
    DrillVolume = LPVSDrillVolume(AttachedActor);
    // End:0x106
    if(DrillVolume != none)
    {
        LPPC = GetLPPC();
        // End:0x106
        if((DrillVolume.VisibilityDistance > float(0)) && LPPC != none)
        {
            // End:0x106
            if(VSize(DrillVolume.Location - LPPC.Pawn.Location) > DrillVolume.VisibilityDistance)
            {
                bVisible = false;
            }
        }
    }
    return bVisible;
    //return ReturnValue;    
}

function GetWorldPos()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], DrillVolume;

    DrillVolume = LPVSDrillVolume(AttachedActor);
    // End:0x59
    if(DrillVolume != none)
    {
        return DrillVolume.CenterLocation + vect(0.0000000, 0.0000000, -150.0000000);
    }
    return AttachedActor.Location;
    //return ReturnValue;    
}

defaultproperties
{
    InteractableFunctionName="setDrillVolumeActive"
    AimWidthFunctionName="getDrillPointAimWidth"
    AimHeightFunctionName="getDrillPointAimHeight"
    TutorialString="<InputCallOuts:GBA_RightArmAction>"
}