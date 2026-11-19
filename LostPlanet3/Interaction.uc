class Interaction extends UIRoot
    transient
    config(Engine)
    hidecategories(Object,UIRoot);

enum ETouchType
{
    Touch_Began,                    // 0
    Touch_Moved,                    // 1
    Touch_Stationary,               // 2
    Touch_Ended,                    // 3
    Touch_Cancelled,                // 4
    Touch_MAX                       // 5
};

//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnReceivedNativeInputKey__Delegate;
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnReceivedNativeInputAxis__Delegate;
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnReceivedNativeInputChar__Delegate;
//var(*) /*0x35EA0000-0x00000000*/ private editfixedsize delegate<@NULL> __OnInitialize__Delegate;

delegate OnReceivedNativeInputKey()
{
    local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
    local /*0x35EA0000-0x00000000*/ private name Key[8388609];
    local /*0x35EA0000-0x00000000*/ private byte EventType[8388609];
    local /*0x35EA0000-0x00000000*/ private float AmountDepressed[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bGamepad[9437185], ReturnValue;

    1.0000000    
    //return ReturnValue;    
}

delegate OnReceivedNativeInputAxis()
{
    local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
    local /*0x35EA0000-0x00000000*/ private name Key[8388609];
    local /*0x35EA0000-0x00000000*/ private float Delta[8388609], DeltaTime;
    local /*0x35EA0000-0x00000000*/ private bool bGamepad[9437185], ReturnValue;

    //return ReturnValue;    
}

delegate OnReceivedNativeInputChar()
{
    local /*0x35EA0000-0x00000000*/ private int ControllerId[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Unicode[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

event Tick()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

event PostRender()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Canvas[8388609];

    //return;    
}

// Export UInteraction::execInit(FFrame&, void* const)
native final function Init();

delegate OnInitialize()
{
    //return;    
}

function Initialized()
{
    //return;    
}

function NotifyGameSessionEnded()
{
    //return;    
}

function NotifyPlayerAdded()
{
    local /*0x35EA0000-0x00000000*/ private int PlayerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL AddedPlayer[8388609];

    //return;    
}

function NotifyPlayerRemoved()
{
    local /*0x35EA0000-0x00000000*/ private int PlayerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL RemovedPlayer[8388609];

    //return;    
}

defaultproperties
{
    OnInitialize=Initialized
}