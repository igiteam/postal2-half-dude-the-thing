class LPGFxMoviePlayerVSHUD_CenterPanel extends LPGFxMoviePlayerVSHUD
    config(UI);

enum EUIElements_VSHUDCenter
{
    EUIElements_VSHUDCenter_HullIntegrity,// 0
    EUIElements_VSHUDCenter_EnvironmentalMessage,// 1
    EUIElements_VSHUDCenter_IncomingMessage,// 2
    EUIElements_VSHUDCenter_TEnergyMeter,// 3
    EUIElements_VSHUDCenter_Minimap,// 4
    EUIElements_VSHUDCenter_Radio,  // 5
    EUIElements_VSHUDCenter_MAX     // 6
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_HullIntegrity;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_EnvironmentalMsg;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_IncomingMsg;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_VSTEnergyMeter;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_Minimap;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UI_Radio;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL Player[9437185];

    super.Init(Player);
    UI_HullIntegrity = LPGFxUIElementVSHullIntegrity(UIElements[0]);
    UI_HullIntegrity.SetActive(false, true);
    UI_EnvironmentalMsg = LPGFxUIElementVSEnvironmentalMessage(UIElements[1]);
    UI_EnvironmentalMsg.SetActive(false, true);
    UI_IncomingMsg = LPGFxUIElementVSIncomingMessage(UIElements[2]);
    UI_IncomingMsg.SetActive(false, true);
    UI_VSTEnergyMeter = LPGFxUIElementVSTEnergyMeter(UIElements[3]);
    UI_Radio = LPGFxUIElementVSRadio(UIElements[5]);
    UI_Radio.SetActive(false, true);
    //return;    
}

function SetActive()
{
    local /*0x97E50000-0x00000000*/ private bool bSet[8388609], bForce;

    super(SPGFxMoviePlayer).SetActive(bSet, bForce);
    // End:0x61
    if(UI_Minimap != none)
    {
        UI_Minimap.SetActive(bSet, bForce);
    }
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Update(DeltaTime);
    //return;    
}

function SetVSMinimapZoom()
{
    local /*0x97E50000-0x00000000*/ private float zoom[8388609];

    // End:0x37
    if(UI_Minimap != none)
    {
        UI_Minimap.SetZoom(zoom);
    }
    //return;    
}

function HideVSHUD()
{
    local /*0x97E50000-0x00000000*/ private bool bHide[8388609];

    ActionScriptVoid("hideVSHUD");
    //return;    
}

function ShowVSBootSequence()
{
    local /*0x97E50000-0x00000000*/ private bool bHide[9437185];

    true
    ActionScriptVoid("vsBootSequence");
    //return;    
}

function ShowHullIntegrity()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bRepairing;

    UI_HullIntegrity.SetActive(bShow);
    //return;    
}

function VSHullStatusOutroComplete()
{
    UI_HullIntegrity.VSHullStatusOutroComplete();
    //return;    
}

function OpenVSEnvironmentalMessage()
{
    local /*0x97E50000-0x00000000*/ private byte MessageType[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageText[8388609], SecondaryMessageText;

    UI_EnvironmentalMsg.OpenVSEnvironmentalMessage(MessageType, MessageText, SecondaryMessageText);
    //return;    
}

function CloseVSEnvironmentalMessage()
{
    UI_EnvironmentalMsg.CloseVSEnvironmentalMessage();
    //return;    
}

function AbortVSEnvironmentalMessage()
{
    UI_EnvironmentalMsg.AbortVSEnvironmentalMessage();
    //return;    
}

function VSMessageHidden()
{
    UI_EnvironmentalMsg.VSMessageHidden();
    //return;    
}

function IsVSEnvironmentalMessageDone()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(UI_EnvironmentalMsg != none)
    {
        return UI_EnvironmentalMsg.IsVSEnvironmentalMessageDone();
    }
    return true;
    //return ReturnValue;    
}

function ShowIncomingMessage()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    UI_IncomingMsg.SetActive(bShow);
    //return;    
}

function ClickIncomingMessage()
{
    UI_IncomingMsg.ClickIncomingMessage();
    //return;    
}

function IncomingMessageHidden()
{
    UI_IncomingMsg.IncomingMessageHidden();
    //return;    
}

function IncomingMessageOutroComplete()
{
    UI_IncomingMsg.IncomingMessageOutroComplete();
    //return;    
}

function registerMiniMapView()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string clipName[8388609];
    local /*0x97E50000-0x00000000*/ private float R[8388609];

    LPGFxUIElementMinimap(UIElements[4]).registerMiniMapView(MC, R);
    UI_Minimap = LPGFxUIElementMinimapVS(UIElements[4]);
    //return;    
}

function SetMinimapInstrumentDamage()
{
    UI_Minimap.SetMinimapInstrumentDamage();
    //return;    
}

function ClearMinimapInstrumentDamage()
{
    UI_Minimap.ClearMinimapInstrumentDamage();
    //return;    
}

function ShowRadioMessage()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    UI_Radio.SetActive(bShow);
    //return;    
}

function RadioOutroComplete()
{
    UI_Radio.RadioOutroComplete();
    //return;    
}

function SetCurrentMapDisplayIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];

    UI_Minimap.SetCurrentMapDisplayIndex(Index);
    //return;    
}

function IsRadarShowingEnemies()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return UI_Minimap.Minimap.IsShowingEnemies();
    //return ReturnValue;    
}
