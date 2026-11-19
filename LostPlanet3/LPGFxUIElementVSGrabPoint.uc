class LPGFxUIElementVSGrabPoint extends LPGFxUIElementVSInteractionPoint
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WorldPos;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFirmGrab;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super.Init(MP);
    // End:0x3F
    if(MoviePlayer != none)
    {
        SetInteractionPointText(InteractionPointMC, GetTutorialText());
    }
    //return;    
}

function CreateInteractionPointMC()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Mode[9437185];
    local /*0x97E50000-0x00000000*/ private float X[9437185], Y;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return MoviePlayer.ActionScriptObject("createGrabPoint");
    //return ReturnValue;    
}

function GetTutorialText()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;
    local /*0x97E50000-0x00000000*/ private editfixedsize string S;

    LPPC = GetLPPC();
    S = "";
    // End:0x103
    if(LPPC != none)
    {
        // End:0x103
        if(LPPC.ShouldDisplayVSCombatTutorials())
        {
            // End:0xD1
            if(LPVSInteractionPointHUD(AttachedActor) != none)
            {
                S = MoviePlayer.GetLocalizedString(LPVSInteractionPointHUD(AttachedActor).InputCallout.MarkUpTag);                
            }
            else
            {
                S = MoviePlayer.GetLocalizedString(TutorialString);
            }
        }
    }
    return S;
    //return ReturnValue;    
}

function SetWorldPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL pos[8388609];

    WorldPos = pos;
    //return;    
}

function SetPlayerIsBusy()
{
    local /*0x97E50000-0x00000000*/ private bool bInPlayerIsBusy[8388609];

    SetInteractionPointActive(InteractionPointMC, !bInPlayerIsBusy);
    //return;    
}

function SetInteractionPointText()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Str[8388609];

    MoviePlayer.ActionScriptVoid("setGrabPointText");
    //return;    
}

function SetGrabFirmness()
{
    local /*0x97E50000-0x00000000*/ private bool bFirm[8388609];

    //return;    
}

function GetWorldPos()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return WorldPos;
    //return ReturnValue;    
}

defaultproperties
{
    bAimForActive=false
    InteractableFunctionName="setGrabPointActive"
    AimWidthFunctionName="getGrabPointAimWidth"
    AimHeightFunctionName="getGrabPointAimHeight"
    TutorialString="<InputCallOuts:GBA_LeftArmAction>"
}