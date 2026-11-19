class LPHUDMessageLayerManager extends Object
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array Layers[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL myLPHUD[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CallbackValidationInterval;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> NotificationCheckFunction;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnHUDMessageConditionCheck__Delegate;

// Export ULPHUDMessageLayerManager::execInitManager(FFrame&, void* const)
native final function InitManager()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];


}

// Export ULPHUDMessageLayerManager::execAddMessageLayer(FFrame&, void* const)
native final function AddMessageLayer()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL NewLayer[25165825];


}

// Export ULPHUDMessageLayerManager::execRemoveMessageLayer(FFrame&, void* const)
native final function RemoveMessageLayer()
{
    local /*0x97E50000-0x00000000*/ private byte InLayerID[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPHUDMessageLayerManager::execRemoveAllMessageLayers(FFrame&, void* const)
native final function RemoveAllMessageLayers();

// Export ULPHUDMessageLayerManager::execTick(FFrame&, void* const)
native final function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];


}

// Export ULPHUDMessageLayerManager::execNotifyMessageCleared(FFrame&, void* const)
native final function NotifyMessageCleared()
{
    local /*0x97E50000-0x00000000*/ private int InMessageID[8388609];


}

// Export ULPHUDMessageLayerManager::execIsMessageLayerActive(FFrame&, void* const)
native final function IsMessageLayerActive()
{
    local /*0x97E50000-0x00000000*/ private byte LayerID[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPHUDMessageLayerManager::execIsMessageLayerTopmost(FFrame&, void* const)
native final function IsMessageLayerTopmost()
{
    local /*0x97E50000-0x00000000*/ private byte LayerID[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

delegate OnHUDMessageConditionCheck()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

event CallCheckFunctionOnLayer()
{
    local /*0x97E50000-0x00000000*/ private int InIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bStillValid;

    NotificationCheckFunction = Layers[InIndex].CheckFunc;
    bStillValid = OnHUDMessageConditionCheck();
    NotificationCheckFunction = None;
    return bStillValid;
    //return ReturnValue;    
}

simulated function GetGameMessageUIElementForLayer()
{
    local /*0x97E50000-0x00000000*/ private byte InLayerID[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], UIEl;
    local /*0x97E50000-0x00000000*/ private int iIndex;

    // End:0x12
    if(Layers.Length == 0)
    {
        return none;
    }
    // End:0x44
    if(int(Layers[0].LayerID) != int(InLayerID))
    {
        return none;
    }
    // End:0xCB
    if((myLPHUD.GFxFlashMovieInstanceKismetMessage == none) || myLPHUD.GFxFlashMovieInstanceKismetMessage.GameMsgInfo.UIElementInfo.UIElementClass == none)
    {
        return none;
    }
    // End:0x156
    foreach myLPHUD.GFxFlashMovieInstanceKismetMessage.UIElements(UIEl, iIndex)
    {
        // End:0x155
        if(ClassIsChildOf(UIEl.Class, Class'SPGfx.SPGFxUIElementGameMessage'))
        {            
            return SPGFxUIElementGameMessage(UIEl);
        }        
    }    
    return none;
    //return ReturnValue;    
}

defaultproperties
{
    CallbackValidationInterval=0.5000000
}