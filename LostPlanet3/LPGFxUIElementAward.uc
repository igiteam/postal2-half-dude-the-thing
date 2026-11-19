class LPGFxUIElementAward extends LPGFxUIElement
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPMoviePlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MPHUD;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AwardManager;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AwardText;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL IconHolder;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL IconMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AwardCreditsText;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ScanEffect;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentAward;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBusy;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHideFiligreeForConsolation[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFiligreeVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL IconColor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string IconName;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OutroComplete__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __IntroComplete__Delegate;

delegate OutroComplete()
{
    SetActive(false, true);
    bBusy = false;
    MyLPMoviePlayer.NotifyShowAwardComplete();
    //return;    
}

delegate IntroComplete()
{
    MyLPMoviePlayer.NotifyAwardIntroComplete(CurrentAward);
    //return;    
}

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    SetOnOutroComplete(OutroComplete);
    super(SPGFxUIElement).Init(MP);
    MyLPMoviePlayer = LPGFxMoviePlayerHUD(MoviePlayer);
    //return;    
}

function NotifyMPHUDLoaded()
{
    local /*0x97E50000-0x00000000*/ private @NULL InMPHUD_Container[8388609];

    MPHUD = InMPHUD_Container;
    AwardManager = GetAwardContainer(InMPHUD_Container);
    IconHolder = AwardManager.GetObject("emblemIcon");
    AwardText = AwardManager.GetObject("emblemText").GetObject("emblemText");
    ScanEffect = AwardManager.GetObject("scanEffectLrg");
    AwardCreditsText = AwardManager.GetObject("emblemCreditsText").GetObject("emblemCreditsText");
    //return;    
}

function SetOnIntroComplete()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> F[8388609];

    // End:0x42
    if(AwardManager != none)
    {
        AwardManager.ActionScriptSetFunction("IntroCompleteEvent");
    }
    //return;    
}

function SetOnOutroComplete()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> F[8388609];

    // End:0x42
    if(AwardManager != none)
    {
        AwardManager.ActionScriptSetFunction("OutroCompleteEvent");
    }
    //return;    
}

function ShowAward()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Award[9437185];
    local /*0x97E50000-0x00000000*/ private int CreditsAwarded[9437185];
    local /*0x97E50000-0x00000000*/ private name AwardIconName;
    local /*0x97E50000-0x00000000*/ private editfixedsize string AwardString;
    local /*0x97E50000-0x00000000*/ private int CreditAmount;
    local /*0x97E50000-0x00000000*/ private @NULL OwningPC, PRI, cxCol, cxColTwo, AwardColor;

    // End:0x4A
    if(!bShow)
    {
        AwardManager.ActionScriptVoid("GoToOutro");
        ShouldDisplayOutro = false;        
    }
    else
    {
        // End:0x4C7
        if(!IsBusy())
        {
            bBusy = true;
            OwningPC = GetLPPC();
            // End:0x4C7
            if(OwningPC != none)
            {
                PRI = LPPRI(OwningPC.PlayerReplicationInfo);
                // End:0x4C7
                if(PRI != none)
                {
                    CurrentAward = Award;
                    ShouldDisplayOutro = true;
                    SetOnIntroComplete(IntroComplete);
                    SetOnOutroComplete(OutroComplete);
                    AwardIconName = Award.GetIconName();
                    AwardString = Award.GetAwardString();
                    AwardColor = Award.GetIconColor();
                    CreditAmount = CreditsAwarded;
                    // End:0x417
                    if(IconColor != AwardColor)
                    {
                        IconColor = AwardColor;
                        cxCol.Multiply.R = float(AwardColor.R) / float(255);
                        cxCol.Multiply.G = float(AwardColor.G) / float(255);
                        cxCol.Multiply.B = float(AwardColor.B) / float(255);
                        AwardManager.SetColorTransform(cxCol);
                        ScanEffect.SetColorTransform(cxCol);
                        cxColTwo.Multiply.R = 255.0000000;
                        cxColTwo.Multiply.G = 255.0000000;
                        cxColTwo.Multiply.B = 255.0000000;
                        AwardCreditsText.SetColorTransform(cxColTwo);
                        AwardText.SetColorTransform(cxColTwo);
                    }
                    SetIcon(string(AwardIconName));
                    AwardCreditsText.SetText("+ " $ string(CreditAmount));
                    AwardText.SetText(AwardString);
                    // End:0x4B2
                    if(bHideFiligreeForConsolation)
                    {
                        ShowFiligree(LPEmblem_Consolation(Award) == none);
                    }
                    SetActive(bShow, false);
                }
            }
        }
    }
    //return;    
}

function GetAwardContainer()
{
    local /*0x97E50000-0x00000000*/ private @NULL InMPHUD_Container[8388609], ReturnValue;

    // End:0x43
    if(InMPHUD_Container != none)
    {
        return InMPHUD_Container.ActionScriptObject("GetEmblemContainer");
    }
    return none;
    //return ReturnValue;    
}

function IsBusy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bBusy;
    //return ReturnValue;    
}

function SetActive()
{
    local /*0x97E50000-0x00000000*/ private bool bSet[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    bBusy = bSet;
    // End:0xF7
    if(bSet)
    {
        DI = AwardManager.GetDisplayInfo();
        DI.Visible = true;
        AwardManager.SetDisplayInfo(DI);
        AwardManager.ActionScriptVoid("GoToIntro");
        // End:0xF4
        if(bImmediate)
        {
            bPendingInactive = false;
            super(SPGFxUIElement).SetActive(bSet, bImmediate);
        }        
    }
    else
    {
        // End:0x133
        if(bImmediate)
        {
            bPendingInactive = false;
            super(SPGFxUIElement).SetActive(bSet, bImmediate);
            return;            
        }
        else
        {
            // End:0x17B
            if(!bPendingInactive)
            {
                AwardManager.ActionScriptVoid("GoToOutro");
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

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x1B0
    if(AwardManager != none)
    {
        // End:0xB7
        if(bShow)
        {
            // End:0xB4
            if(!bVisible)
            {
                bVisible = true;
                DI = AwardManager.GetDisplayInfo();
                DI.Visible = true;
                AwardManager.SetDisplayInfo(DI);
                ShouldDisplayOutro = true;
            }            
        }
        else
        {
            // End:0x1B0
            if(bVisible && bImmediate)
            {
                bVisible = false;
                DI = AwardManager.GetDisplayInfo();
                DI.Visible = bShow;
                AwardManager.SetDisplayInfo(DI);
                // End:0x171
                if(bPendingInactive)
                {
                    SetActive(false, true);
                }
                ShouldDisplayOutro = false;
                MyLPMoviePlayer.NotifyAwardDisplayComplete(CurrentAward);
                CurrentAward = none;
            }
        }
    }
    //return;    
}

function GoToOutro()
{
    AwardManager.ActionScriptVoid("GoToOutro");
    //return;    
}

function ShowFiligree()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x61
    if(bShow != bFiligreeVisible)
    {
        bFiligreeVisible = bShow;
        MPHUD.ActionScriptVoid("ShowEmblemFiligree");
    }
    //return;    
}

function SetIcon()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string AwardIconName[8388609];

    // End:0x58
    if(IconName != AwardIconName)
    {
        IconName = AwardIconName;
        MPHUD.ActionScriptVoid("SetEmblemIcon");
    }
    //return;    
}

defaultproperties
{
    bHideFiligreeForConsolation=true
}