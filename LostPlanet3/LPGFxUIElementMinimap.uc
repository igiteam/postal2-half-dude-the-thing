class LPGFxUIElementMinimap extends LPGFxUIElement
    config(UI);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Minimap;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MinimapRoot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurZoomf;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NormalZoomf[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxZoomf[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinZoomf[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinimapScale[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EdgeIconRadiusPercent[1073741825];

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super(SPGFxUIElement).Init(MP);
    // End:0x6C
    if(MoviePlayer != none)
    {
        MinimapRoot = MoviePlayer.GetVariableObject("_root.stagePanel.panel_Minimap");
    }
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPMPHUD;
    local /*0x97E50000-0x00000000*/ private bool bShouldBeActive;

    bShouldBeActive = super(SPGFxUIElement).Update(DeltaTime) && Minimap != none;
    // End:0xA0
    if(bShouldBeActive)
    {
        LPMPHUD = LPGFxMoviePlayerHUD(MoviePlayer);
        // End:0xA0
        if((LPMPHUD != none) && Minimap != none)
        {
            Minimap.Update(CurZoomf);
        }
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

function SetZoom()
{
    local /*0x97E50000-0x00000000*/ private float zoom[8388609];

    NormalZoomf = zoom;
    CurZoomf = zoom;
    //return;    
}

function MinimapZoomOut()
{
    // End:0x26
    if(CurZoomf < MaxZoomf)
    {
        CurZoomf *= float(2);
    }
    //return;    
}

function MinimapZoomIn()
{
    // End:0x27
    if(CurZoomf > MinZoomf)
    {
        CurZoomf *= 0.5000000;
    }
    //return;    
}

function registerMiniMapView()
{
    local /*0x97E50000-0x00000000*/ private @NULL MC[8388609];
    local /*0x97E50000-0x00000000*/ private float R[8388609];

    Minimap = MC;
    Minimap.Init();
    Minimap.Radius = R;
    Minimap.EdgeIconRadiusPercent = EdgeIconRadiusPercent;
    Minimap.SetFloat("_xscale", MinimapScale);
    Minimap.SetFloat("_yscale", MinimapScale);
    CurZoomf = NormalZoomf;
    SetActive(false, true);
    //return;    
}

function SetUmbilicalState()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];

    switch(NewState)
    {
        // End:0x40
        case 2:
            // End:0x3D
            if(Minimap != none)
            {
                SetActive(true);
                GoToUmbilicalIntro();
            }
            // End:0x9D
            break;
        // End:0x6D
        case 3:
            // End:0x6A
            if(Minimap != none)
            {
                SetActive(true);
                GoToUmbilicalOn();
            }
            // End:0x9D
            break;
        // End:0x9A
        case 4:
            // End:0x97
            if(Minimap != none)
            {
                GoToUmbilicalOutro();
                bPendingInactive = true;
            }
            // End:0x9D
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function MinimapOutroComplete()
{
    // End:0x19
    if(bPendingInactive)
    {
        SetActive(false, true);
    }
    //return;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x89
    if(Minimap != none)
    {
        DI = Minimap.GetDisplayInfo();
        DI.Visible = bShow;
        Minimap.SetDisplayInfo(DI);
    }
    //return;    
}

function GoToUmbilicalIntro()
{
    // End:0x42
    if(Minimap != none)
    {
        Minimap.ActionScriptVoid("GoToUmbilicalIntro");
    }
    //return;    
}

function GoToUmbilicalOn()
{
    // End:0x3F
    if(Minimap != none)
    {
        Minimap.ActionScriptVoid("GoToUmbilicalOn");
    }
    //return;    
}

function GoToUmbilicalOutro()
{
    // End:0x42
    if(Minimap != none)
    {
        Minimap.ActionScriptVoid("GoToUmbilicalOutro");
    }
    //return;    
}

function SetCurrentMapDisplayIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];

    Minimap.SetCurrentMapDisplayIndex(Index);
    //return;    
}

defaultproperties
{
    NormalZoomf=27.0000000
    MaxZoomf=500.0000000
    MinZoomf=1.0000000
    MinimapScale=60.0000000
    EdgeIconRadiusPercent=1.0000000
}