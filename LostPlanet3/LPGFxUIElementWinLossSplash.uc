class LPGFxUIElementWinLossSplash extends LPGFxUIElement
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SplashManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SplashDuration[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SplashTimeRemaining;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWaitingToShow;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x17
    if(bWaitingToShow)
    {
        ShowWinLossSplashScreen();
    }
    // End:0x70
    if(SplashTimeRemaining > float(0))
    {
        // End:0x4B
        if(DeltaTime >= SplashTimeRemaining)
        {
            Show(false);
        }
        SplashTimeRemaining = FMax(0.0000000, SplashTimeRemaining - DeltaTime);
    }
    return super(SPGFxUIElement).Update(DeltaTime);
    //return ReturnValue;    
}

function SetActive()
{
    local /*0x97E50000-0x00000000*/ private bool bSet[8388609], bImmediate;

    // End:0x48
    if(bSet)
    {
        // End:0x45
        if(bImmediate)
        {
            bPendingInactive = false;
            super(SPGFxUIElement).SetActive(bSet, bImmediate);
        }        
    }
    else
    {
        // End:0x84
        if(bImmediate)
        {
            bPendingInactive = false;
            super(SPGFxUIElement).SetActive(bSet, bImmediate);
            return;            
        }
        else
        {
            // End:0xA2
            if(!bPendingInactive)
            {
                bPendingInactive = true;                
            }
            else
            {
                Show(false, true);
            }
        }
    }
    //return;    
}

function ShowWinLossSplashScreen()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyPC, TransTag;
    local /*0x97E50000-0x00000000*/ private bool bNevec, bLostRound;
    local /*0x97E50000-0x00000000*/ private int MyTeamNum;
    local /*0x97E50000-0x00000000*/ private editfixedsize string MissionText, StatusText;
    local /*0x97E50000-0x00000000*/ private @NULL Winner;

    MyPC = GetLPPC();
    // End:0x3C0
    if(MyPC != none)
    {
        bWaitingToShow = !MyPC.WorldInfo.GRI.bMatchIsOver;
        // End:0x3C0
        if(!bWaitingToShow)
        {
            Winner = MyPC.WorldInfo.GRI.Winner;
            MyTeamNum = int(MyPC.GetTeamNum());
            bNevec = MyTeamNum == 0;
            bLostRound = (Winner != none) && int(Winner.GetTeamNum()) != MyTeamNum;
            TransTag = Class'Engine.Engine'.static.GetEngine().GamePlayers[0].GetTranslationContext().GetTranslatorTagFromName('Strings');
            MissionText = TransTag.Translate("LostPlanetGame.LPGFxUIElementWinLossSplash.MissionString");
            // End:0x2AC
            if(bLostRound)
            {
                StatusText = TransTag.Translate("LostPlanetGame.LPGFxUIElementWinLossSplash.LostString");                
            }
            else
            {
                // End:0x31D
                if(Winner != none)
                {
                    StatusText = TransTag.Translate("LostPlanetGame.LPGFxUIElementWinLossSplash.WonString");                    
                }
                else
                {
                    StatusText = TransTag.Translate("LostPlanetGame.LPGFxUIElementWinLossSplash.DrewString");
                }
            }
            SetWinLossSplashScreen(bNevec, bLostRound, MissionText, StatusText);
            SplashTimeRemaining = SplashDuration;
        }
    }
    //return;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;

    // End:0x68
    if(!bShow)
    {
        HideWinLossSplashScreen();
        // End:0x68
        if(bImmediate)
        {
            // End:0x40
            if(bPendingInactive)
            {
                SetActive(false, true);
            }
            LPGFxMoviePlayerHUD(MoviePlayer).NotifyWinLossSplashComplete();
        }
    }
    //return;    
}

function GetSplashManager()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LPMPHUD;

    // End:0x88
    if(SplashManager == none)
    {
        LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
        // End:0x88
        if((LPMPHUD != none) && LPMPHUD.MPHUD_Container != none)
        {
            SplashManager = LPMPHUD.MPHUD_Container;
        }
    }
    return SplashManager;
    //return ReturnValue;    
}

function SetWinLossSplashScreen()
{
    local /*0x97E50000-0x00000000*/ private bool bNevec[8388609], bLostRound;
    local /*0x97E50000-0x00000000*/ private editfixedsize string MissionText[8388609], StatusText;

    // End:0x49
    if((GetSplashManager()) != none)
    {
        GetSplashManager().ActionScriptVoid("showWinLossSplashScreen");
    }
    //return;    
}

function HideWinLossSplashScreen()
{
    // End:0x49
    if((GetSplashManager()) != none)
    {
        GetSplashManager().ActionScriptVoid("hideWinLossSplashScreen");
    }
    //return;    
}

defaultproperties
{
    SplashDuration=8.0000000
}