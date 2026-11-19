class LPHUDGameTimer extends Object;

struct ClockInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Minutes;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Seconds;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnchorMC;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ClockContainerMC;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ClockMC;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MinutesMC;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DelimiterMC;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SecondsMC;

    structdefaultproperties
    {
        Minutes=0
        Seconds=0
        AnchorMC=none
        ClockContainerMC=none
        ClockMC=none
        MinutesMC=none
        DelimiterMC=none
        SecondsMC=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ParentHUD;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RootMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Clock;

function Update()
{
    local /*0x97E50000-0x00000000*/ private @NULL GRI;
    local /*0x97E50000-0x00000000*/ private int Min, Sec;
    local /*0x97E50000-0x00000000*/ private editfixedsize string Str;

    // End:0x22
    if(!bInitialized)
    {
        Init(ParentHUD);
    }
    // End:0x33
    if(!bEnabled)
    {
        return;
    }
    GRI = Class'Engine.WorldInfo'.static.GetWorldInfo().GRI;
    Min = GRI.RemainingTime / 60;
    Sec = GRI.RemainingTime % 60;
    // End:0x1CE
    if(Min != Clock.Minutes)
    {
        Clock.Minutes = Min;
        // End:0x147
        if(Min < 10)
        {
            Str = "0" $ string(Min);            
        }
        else
        {
            Str = string(Min);
        }
        Clock.MinutesMC.SetText(Str);
        Clock.DelimiterMC.SetText(":");
    }
    // End:0x29C
    if(Sec != Clock.Seconds)
    {
        Clock.Seconds = Sec;
        // End:0x24B
        if(Sec < 10)
        {
            Str = "0" $ string(Sec);            
        }
        else
        {
            Str = string(Sec);
        }
        Clock.SecondsMC.SetText(Str);
    }
    //return;    
}

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL Parent[8388609];
    local /*0x97E50000-0x00000000*/ private bool bMultiplayer;
    local /*0x97E50000-0x00000000*/ private @NULL GRI;

    ParentHUD = Parent;
    GRI = Class'Engine.WorldInfo'.static.GetWorldInfo().GRI;
    // End:0x7B
    if(GRI == none)
    {
        bInitialized = false;
        bEnabled = false;
        return;
    }
    // End:0xCA
    if(int(Class'Engine.WorldInfo'.static.GetWorldInfo().NetMode) != int(NM_Standalone))
    {
        bMultiplayer = true;        
    }
    else
    {
        bMultiplayer = false;
    }
    bEnabled = bMultiplayer;
    GRI = Class'Engine.WorldInfo'.static.GetWorldInfo().GRI;
    // End:0x15A
    if(GRI.TimeLimit == 0)
    {
        bEnabled = false;
    }
    // End:0x16B
    if(!bEnabled)
    {
        return;
    }
    RootMC = ParentHUD.GetVariableObject("_root");
    Clock.Minutes = 0;
    Clock.Seconds = 0;
    Clock.AnchorMC = RootMC.GetObject("mpAnchor_GameTimer");
    Clock.ClockContainerMC = Clock.AnchorMC.AttachMovie("mpGameTimerContainer", "game timer");
    Clock.ClockMC = Clock.ClockContainerMC.GetObject("mpGameTimerClock");
    Clock.MinutesMC = Clock.ClockMC.GetObject("textMinutes");
    Clock.DelimiterMC = Clock.ClockMC.GetObject("textDelimit");
    Clock.SecondsMC = Clock.ClockMC.GetObject("textSeconds");
    Clock.MinutesMC.SetText("00");
    Clock.DelimiterMC.SetText(":");
    Clock.SecondsMC.SetText("00");
    bInitialized = true;
    //return;    
}
