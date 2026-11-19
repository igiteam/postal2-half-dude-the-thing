class LPGFxFrontEnd_OnlineModeInternetOnly extends LPGFxFrontEnd_OnlineMode within GFxMoviePlayer
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsExternalUIOpen;

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL PC, OnlineSub;

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    // End:0x3F
    if(bPlayOpenAnimation)
    {        
    }
    else
    {
        OnEscapeKeyPress();
    }
    // End:0x185
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
    {
        OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
        // End:0x122
        if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.SystemInterface, OnlineSystemInterface(none)))
        {
            OnlineSub.SystemInterface.AddExternalUIChangeDelegate(OnExternalUIChange);
        }
        PC = Outer.GetPC();
        // End:0x185
        if(PC != none)
        {
            PC.SetTimer(2.0000000, true, 'CheckLoginStatus', self);            
        }
    }
    //return;    
}

function PostPushFromPreviousScreen()
{
    Select_Internet(false);
    //return;    
}

function SetNumOptions()
{
    local /*0x97E50000-0x00000000*/ private int Num[8388609];

    ActionScriptVoid("setNumOptions");
    //return;    
}

function OnExternalUIChange()
{
    local /*0x97E50000-0x00000000*/ private bool bIsOpening[8388609];

    bIsExternalUIOpen = bIsOpening;
    //return;    
}

function OnViewLoaded()
{
    super(LPGFxFrontEnd_Screen).OnViewLoaded();
    RemoveOptionItemByName("LAN");
    RemoveOptionItemByName("Internet");
    RemoveOptionItemByName("InternetNoParty");
    SetNumOptions(0);
    //return;    
}

function CheckLoginStatus()
{
    local /*0x97E50000-0x00000000*/ private byte LoginStatus;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    // End:0x0F
    if(bIsExternalUIOpen)
    {
        return;
    }
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0x92
    if((OnlineSub == none) || EqualEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        Cleanup();
        MoveBackImpl();
    }
    LoginStatus = OnlineSub.PlayerInterface.GetLoginStatus(byte(Outer.GetPC().PlayerNum));
    // End:0x129
    if(int(LoginStatus) == int(2))
    {
        Select_Internet();        
    }
    else
    {
        Cleanup();
        MoveBackImpl();
    }
    //return;    
}

function Cleanup()
{
    local /*0x97E50000-0x00000000*/ private @NULL PC, OnlineSub;

    PC = Outer.GetPC();
    // End:0x64
    if(PC != none)
    {
        PC.ClearTimer('CheckLoginStatus', self);        
    }
    OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
    // End:0x119
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.SystemInterface, OnlineSystemInterface(none)))
    {
        OnlineSub.SystemInterface.ClearExternalUIChangeDelegate(OnExternalUIChange);
    }
    super.Cleanup();
    //return;    
}
