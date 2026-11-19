class LPGFxUIElementMinimapVS extends LPGFxUIElementMinimap
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bActiveDefense;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ActiveDefenseTutorialString;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ButtonLabel;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609], ActiveDefense, Label;

    super.Init(MP);
    bActiveDefense = false;
    Minimap.bCheckForEnemies = true;
    ActiveDefense = Minimap.GetObject("activeDefense");
    // End:0x103
    if(ActiveDefense != none)
    {
        Label = ActiveDefense.GetObject("buttonLabel");
        // End:0x103
        if(Label != none)
        {
            ButtonLabel = Label.GetObject("textField");
        }
    }
    SetUpTutorialText();
    //return;    
}

function SetUpTutorialText()
{
    // End:0x39
    if(ButtonLabel != none)
    {
        ButtonLabel.SetText(GetTutorialText());
    }
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
            S = MoviePlayer.GetLocalizedString(ActiveDefenseTutorialString);
        }
    }
    return S;
    //return ReturnValue;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPlayerPawn;
    local /*0x97E50000-0x00000000*/ private bool bNewActiveDefense, bShouldBeActive;

    bShouldBeActive = super.Update(DeltaTime);
    // End:0x10D
    if(bShouldBeActive && MoviePlayer != none)
    {
        Minimap.Update(NormalZoomf);
        vsPlayerPawn = LPBaseVSPlayerPawn(GetLPPC().Pawn);
        // End:0x10D
        if(vsPlayerPawn != none)
        {
            bNewActiveDefense = vsPlayerPawn.IsAnyActiveDefenseWindowOpen();
            // End:0xF8
            if(bNewActiveDefense && !bActiveDefense)
            {
                PlayActiveDefense();
            }
            bActiveDefense = bNewActiveDefense;
        }
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

function PlayActiveDefense()
{
    SetUpTutorialText();
    // End:0x4B
    if(MoviePlayer != none)
    {
        MoviePlayer.ActionScriptVoid("PlayActiveDefense");
    }
    //return;    
}

function SetMinimapInstrumentDamage()
{
    GoToBeginInstrumentDamage();
    //return;    
}

function ClearMinimapInstrumentDamage()
{
    GoToEndInstrumentDamage();
    //return;    
}

function GoToBeginInstrumentDamage()
{
    MinimapRoot.ActionScriptVoid("GoToBeginInstrumentDamage");
    //return;    
}

function GoToEndInstrumentDamage()
{
    MinimapRoot.ActionScriptVoid("GoToEndInstrumentDamage");
    //return;    
}

defaultproperties
{
    ActiveDefenseTutorialString="<InputCallOuts:GBA_VSShieldBlock>"
    MinimapScale=90.0000000
}