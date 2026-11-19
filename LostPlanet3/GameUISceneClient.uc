class GameUISceneClient extends UISceneClient within UIInteraction
    transient
    config(UI)
    hidecategories(Object,UIRoot);

var(*) /*0x35EA0000-0x00000000*/ private float LatestDeltaTime[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DoubleClickStartTime[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DoubleClickStartPosition[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL InitialPressedKeys[805437441];
var(*) /*0x35EA0000-0x00000000*/ private bool bUpdateInputProcessingStatus[537001985];
var(*) /*0x35EA0000-0x00000000*/ private bool bUpdateSceneViewportSizes[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bEnableDebugInput[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bRenderDebugInfo[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private bool bCaptureUnprocessedInput[1073872897];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array NavAliases[537001985];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AxisInputKeys[537001985];

// Export UGameUISceneClient::execGetCurrentNetMode(FFrame&, void* const)
native static final function GetCurrentNetMode()
{
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];


}

// Export UGameUISceneClient::execRequestInputProcessingUpdate(FFrame&, void* const)
native final function RequestInputProcessingUpdate();

// Export UGameUISceneClient::execCanUnpauseInternalUI(FFrame&, void* const)
native final function CanUnpauseInternalUI()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

event PauseGame()
{
    local /*0x35EA0000-0x00000000*/ private bool bDesiredPauseState[8388609];
    local /*0x35EA0000-0x00000000*/ private int PlayerIndex[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerOwner;

    0
    // End:0x170
    if(Outer.Outer.Outer.GamePlayers.Length > 0)
    {
        PlayerIndex = Clamp(PlayerIndex, 0, Outer.Outer.Outer.GamePlayers.Length - 1);
        PlayerOwner = Outer.Outer.Outer.GamePlayers[PlayerIndex].Actor;
        // End:0x170
        if(PlayerOwner != none)
        {
            PlayerOwner.SetPause(bDesiredPauseState, CanUnpauseInternalUI);
        }
    }
    //return;    
}

function NotifyClientTravel()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TravellingPlayer[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string TravelURL[8388609];
    local /*0x35EA0000-0x00000000*/ private byte TravelType[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bIsSeamlessTravel[8388609];

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

    // End:0x19
    if(IsUIActive(2))
    {
        RequestInputProcessingUpdate();
    }
    //return;    
}

function NotifyPlayerRemoved()
{
    local /*0x35EA0000-0x00000000*/ private int PlayerIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL RemovedPlayer[8388609];

    // End:0x19
    if(IsUIActive(2))
    {
        RequestInputProcessingUpdate();
    }
    //return;    
}

function FindLocalPlayerIndex()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Engine;
    local /*0x35EA0000-0x00000000*/ private int I;

    Engine = Class'Engine'.static.GetEngine();
    I = 0;
    J0x34:

    // End:0xAF [Loop If]
    if(I < Engine.GamePlayers.Length)
    {
        // End:0xA1
        if(Engine.GamePlayers[I] == P)
        {
            return I;
        }
        I++;
        // [Loop Continue]
        goto J0x34;
    }
    return 0;
    //return ReturnValue;    
}

defaultproperties
{
    bEnableDebugInput=true
    bCaptureUnprocessedInput=true
    NavAliases=/* Array type was not detected. */
    AxisInputKeys=/* Array type was not detected. */
}