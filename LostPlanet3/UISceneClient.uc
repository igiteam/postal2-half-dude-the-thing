class UISceneClient extends UIRoot
    abstract
    transient
    config(Engine)
    hidecategories(Object,UIRoot);

const SCENEFILTER_None = 0x00000000;
const SCENEFILTER_IncludeTransient = 0x00000001;
const SCENEFILTER_InputProcessorOnly = 0x00000002;
const SCENEFILTER_PausersOnly = 0x00000004;
const SCENEFILTER_PrimitiveUsersOnly = 0x00000008;
const SCENEFILTER_UsesPostProcessing = 0x00000010;
const SCENEFILTER_ReceivesFocus = 0x00000020;
const SCENEFILTER_Any = 0xFFFFFFFF;

var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_FExec[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RenderViewport[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MousePosition[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DataStoreManager[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CanvasToScreen[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL InvCanvasToScreen[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL UIScenePostProcess[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bEnablePostProcess[536870913];

// Export UUISceneClient::execIsUIActive(FFrame&, void* const)
native final function IsUIActive()
{
    local /*0x35EA0000-0x00000000*/ private int Flags[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    -1            
}

// Export UUISceneClient::execGetCanvasToScreen(FFrame&, void* const)
native final function GetCanvasToScreen()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UUISceneClient::execGetInverseCanvasToScreen(FFrame&, void* const)
native final function GetInverseCanvasToScreen()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

event InitializeSceneClient()
{
    //return;    
}

defaultproperties
{
    bEnablePostProcess=true
}