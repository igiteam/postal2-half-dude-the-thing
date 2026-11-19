class LPGFxMoviePlayerCredits extends SPGFxMoviePlayer
    config(UI);

struct native CreditLine
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Title;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Name;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Style;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Spacing;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHideOnPC;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHideOnPS3;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHideOnXBOX360;

    structdefaultproperties
    {
        Title=""
        Name=""
        Style=""
        Spacing=""
        bHideOnPC=false
        bHideOnPS3=false
        bHideOnXBOX360=false
    }
};

struct native StringToInt
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string S;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int I;

    structdefaultproperties
    {
        S=""
        I=0
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string LocalizationKeyPrefix[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array StyleToNumberMapping[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array SpacingPresetToNumberMapping[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CreditLines[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSkippable;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMenuCredits;

function Start()
{
    local /*0x97E50000-0x00000000*/ private bool StartPaused[9437185], ReturnValue;

    false
    super.Start();
    Advance(0.0000000);
    SPPlayerController(GetPC()).AddGamepadUpdateMoviePlayerSubscriber(self);
    LPPlayerController(GetPC()).bCreditsSkippable = false;
    ShowAlphaRun(!bMenuCredits);
    SetAlphaRunPrompts();
    InitCredits();
    StartCredits();
    return true;
    //return ReturnValue;    
}

event NotifyUsingGamepad()
{
    local /*0x97E50000-0x00000000*/ private bool bGamepad[8388609];

    SetAlphaRunPrompts();
    //return;    
}

function GetSpacingFromString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string gapString[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], I;

    I = 0;
    J0x0B:

    // End:0x8C [Loop If]
    if(I < SpacingPresetToNumberMapping.Length)
    {
        // End:0x7E
        if(SpacingPresetToNumberMapping[I].S == gapString)
        {
            return SpacingPresetToNumberMapping[I].I;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    return 0;
    //return ReturnValue;    
}

function GetStyleTypeFromString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string TypeString[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], I;

    I = 0;
    J0x0B:

    // End:0x8C [Loop If]
    if(I < StyleToNumberMapping.Length)
    {
        // End:0x7E
        if(StyleToNumberMapping[I].S == TypeString)
        {
            return StyleToNumberMapping[I].I;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    return 0;
    //return ReturnValue;    
}

function InitCredits()
{
    local /*0x97E50000-0x00000000*/ private int I, Len, Type, gap;
    local /*0x97E50000-0x00000000*/ private editfixedsize string s1, s2;
    local /*0x97E50000-0x00000000*/ private @NULL TransContext;

    TransContext = GetLP().GetTranslationContext();
    Len = CreditLines.Length;
    I = 0;
    J0x49:

    // End:0x2E7 [Loop If]
    if(I < Len)
    {
        // End:0xB4
        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
        {
            // End:0xB1
            if(CreditLines[I].bHideOnPS3)
            {
                // [Explicit Continue]
                goto J0x2D9;
            }            
        }
        else
        {
            // End:0x134
            if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1) && CreditLines[I].bHideOnXBOX360)
            {
                // End:0x131
                if(CreditLines[I].bHideOnXBOX360)
                {
                    // [Explicit Continue]
                    goto J0x2D9;
                }                
            }
            else
            {
                // End:0x161
                if(CreditLines[I].bHideOnPC)
                {
                    // [Explicit Continue]
                    goto J0x2D9;
                }
            }
        }
        s1 = CreditLines[I].Title;
        s1 = Class'GFxUI.GFxObject'.static.TranslateString(s1, TransContext);
        s2 = CreditLines[I].Name;
        s2 = Class'GFxUI.GFxObject'.static.TranslateString(s2, TransContext);
        Type = GetStyleTypeFromString(CreditLines[I].Style);
        gap = GetSpacingFromString(CreditLines[I].Spacing);
        AddCreditLine(s1, s2, Type, gap);
        J0x2D9:

        I++;
        // [Loop Continue]
        goto J0x49;
    }
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x90
    if(bSkippable && (int(InputEvent) == int(0)) && (ButtonName == 'XboxTypeS_B') || ButtonName == 'Escape')
    {
        // End:0x90
        if(LPPlayerController(GetPC()).bCreditsSkippable)
        {
            ConfirmSkipCredits();
            return true;            
        }
    }
    return false;
    //return ReturnValue;    
}

function AddCreditLine()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string nameString[8388609], positionString;
    local /*0x97E50000-0x00000000*/ private int Type[8388609], followingGap;

    ActionScriptVoid("addCreditLine");
    //return;    
}

function StartCredits()
{
    ActionScriptVoid("startCredits");
    //return;    
}

function SkipCredits()
{
    LPPlayerController(GetPC()).ClientShowLoadingMovie(true);    
    GetPC().ConsoleCommand("ReturnToMainMenu");
    //return;    
}

function ShowAlphaRun()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    ActionScriptVoid("setAlphaRunMode");
    //return;    
}

function SetAlphaRunPrompts()
{
    ASSetAlphaRunPrompts(GetLocalizedString("<Strings:LostPlanetGame.FrontEnd.CreditsRunBoost>"), GetLocalizedString("<Strings:LostPlanetGame.FrontEnd.CreditsJump>"), GetLocalizedString("<Strings:LostPlanetGame.FrontEnd.CreditsTailWhip>"), GetLocalizedString("<Strings:LostPlanetGame.FrontEnd.CreditsRespawn>"));
    //return;    
}

function ASSetAlphaRunPrompts()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string runPrompt[8388609], jumpPrompt, strikePrompt, respawnPrompt;

    ActionScriptVoid("setAlphaRunPrompts");
    //return;    
}

function ConfirmSkipCredits()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array ButtonTitles;

    ButtonTitles.AddItem("<Strings:LostPlanetGame.PauseMenu.No>");    
    ButtonTitles.AddItem("<Strings:LostPlanetGame.PauseMenu.Yes>");    
    Class'LPUIManager'.static.ShowUIMessage('ConfirmNoStorage', "<Strings:LostPlanetGame.FrontEnd.CreditsSkipTitle>", "<Strings:LostPlanetGame.FrontEnd.CreditsSkipMessage>", ButtonTitles, ConfirmSkipCreditsOnOptionSelected,,,, true);
    //return;    
}

function ConfirmSkipCreditsOnOptionSelected()
{
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedButtonIndex[8388609], PlayerIndex;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x19
    if(SelectedButtonIndex == 1)
    {
        SkipCredits();
    }
    return true;
    //return ReturnValue;    
}

defaultproperties
{
    LocalizationKeyPrefix="LostPlanetGame.Credits"
    StyleToNumberMapping=/* Array type was not detected. */
    SpacingPresetToNumberMapping=/* Array type was not detected. */
    CreditLines=/* Array type was not detected. */
    bSkippable=true
    bMenuCredits=true
    bCaptureInput=true
    CaptureKeys=/* Array type was not detected. */
    Priority=10
}