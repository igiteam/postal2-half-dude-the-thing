class LPGFxFrontEnd_MPFriendsLoader extends SPGFxUIView within GFxMoviePlayer
    config(UI);

function OnTopMostView()
{
    local /*0x97E50000-0x00000000*/ private bool bPlayOpenAnimation[9437185];
    local /*0x97E50000-0x00000000*/ private name previousView[9437185];

    false
    'None'
    super.OnTopMostView(bPlayOpenAnimation, previousView);
    // End:0x9A
    if(previousView == 'FriendsList')
    {
        MenuViewLoader.PopView(MenuViewLoader.ShouldUnloadViewOnPop());
        ASSetScaleMode("showAll");        
    }
    else
    {
        SetFrontEndMPMode(true);
    }
    //return;    
}

function ASSetScaleMode()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Mode[8388609];

    ActionScriptVoid("setScaleMode");
    //return;    
}

function SetFrontEndMPMode()
{
    local /*0x97E50000-0x00000000*/ private bool bInMPMode[8388609];

    ActionScriptVoid("setFrontEndMPMode");
    //return;    
}

function OnEscapeKeyPress()
{
    //return;    
}

event FilterButtonInput()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[8388609];
    local /*0x97E50000-0x00000000*/ private name ButtonName[8388609];
    local /*0x97E50000-0x00000000*/ private byte InputEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

defaultproperties
{
    bShouldHideViewStack=false
    PushTransitionTime=0.0000000
}