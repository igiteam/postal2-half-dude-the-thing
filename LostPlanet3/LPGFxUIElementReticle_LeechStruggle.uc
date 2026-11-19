class LPGFxUIElementReticle_LeechStruggle extends LPGFxUIElementReticle;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StruggleReticuleMC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int StruggleReticleInRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StruggleTimeIncrement;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bReticleTimerEnabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStruggleModeEnabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StruggleTimeRemaining;

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super.Init(MP);
    StruggleReticleInRange = -1;
    // End:0x11D
    if(MoviePlayer != none)
    {
        ReticleRoot = "_root.stagePanel.panel_reticle";
        StruggleReticuleMC = MoviePlayer.GetVariableObject(ReticleRoot $ ".leechReticle");
        // End:0x11D
        if(StruggleReticuleMC != none)
        {
            AimHalfWidth = StruggleReticuleMC.GetFloat("_width") / float(2);
            AimHalfHeight = StruggleReticuleMC.GetFloat("_height") / float(2);
        }
    }
    //return;    
}

// Export ULPGFxUIElementReticle_LeechStruggle::execSetPosition(FFrame&, void* const)
native function SetPosition()
{
    local /*0x97E50000-0x00000000*/ private float PosX[8388609], PosY;


}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private @NULL DI;
    local /*0x97E50000-0x00000000*/ private bool bStateChanged;

    bStateChanged = false;
    // End:0xC9
    if(StruggleReticuleMC != none)
    {
        DI = StruggleReticuleMC.GetDisplayInfo();
        bStateChanged = bShow != DI.Visible;
        DI.Visible = bShow;
        StruggleReticuleMC.SetDisplayInfo(DI);
    }
    // End:0xFE
    if(bStateChanged)
    {
        StruggleReticleInRange = -1;
        // End:0xFE
        if(!bShow)
        {
            StopTargeting();
        }
    }
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bShouldBeActive;

    bShouldBeActive = super.Update(DeltaTime);
    // End:0x9B
    if(bShouldBeActive)
    {
        // End:0x9B
        if(bReticleTimerEnabled)
        {
            // End:0x80
            if(StruggleTimeRemaining > 0.0000000)
            {
                StruggleTimeRemaining -= (StruggleTimeIncrement * DeltaTime);
                SetStruggleTimer(StruggleTimeRemaining);                
            }
            else
            {
                StruggleTimeRemaining = 0.0000000;
                bReticleTimerEnabled = false;
            }
        }
    }
    return bShouldBeActive;
    //return ReturnValue;    
}

function TurnOnStruggleDisplayState()
{
    Show(true);
    //return;    
}

function TurnOffStruggleDisplayState()
{
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0x7F
    if(StruggleReticuleMC != none)
    {
        DI = StruggleReticuleMC.GetDisplayInfo();
        DI.Visible = false;
        StruggleReticuleMC.SetDisplayInfo(DI);
    }
    StruggleReticleInRange = -1;
    StopTargeting();
    //return;    
}

function ShowStruggleReticle()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    Show(bShow);
    //return;    
}

function ToggleStruggleReticleInRange()
{
    local /*0x97E50000-0x00000000*/ private bool bInRange[8388609];

    // End:0x45
    if(bInRange && StruggleReticleInRange != 1)
    {
        StruggleTimeRemaining = 0.0000000;
        GoToTargetOff();
        StruggleReticleInRange = 1;        
    }
    else
    {
        // End:0x7A
        if(!bInRange && StruggleReticleInRange != 0)
        {
            GoToTargetOn();
            StruggleReticleInRange = 0;
        }
    }
    //return;    
}

function GoToTargetOn()
{
    // End:0x11
    if(StruggleReticuleMC == none)
    {
        return;
    }
    StruggleReticuleMC.ActionScriptVoid("GoToTargetOn");
    //return;    
}

function StopTargeting()
{
    // End:0x11
    if(StruggleReticuleMC == none)
    {
        return;
    }
    StruggleReticuleMC.GotoAndPlay("TargetStop");
    //return;    
}

function GoToTargetOff()
{
    // End:0x11
    if(StruggleReticuleMC == none)
    {
        return;
    }
    StruggleReticuleMC.ActionScriptVoid("GoToTargetOff");
    //return;    
}

function SetStruggleTimer()
{
    local /*0x97E50000-0x00000000*/ private float Time[8388609];

    // End:0x11
    if(StruggleReticuleMC == none)
    {
        return;
    }
    StruggleReticuleMC.ActionScriptVoid("SetStruggleTimer");
    //return;    
}

function UpdateStruggleModeDirection()
{
    local /*0x97E50000-0x00000000*/ private float AngleDegrees[8388609];

    // End:0x11
    if(StruggleReticuleMC == none)
    {
        return;
    }
    StruggleReticuleMC.ActionScriptVoid("SetStruggleDirection");
    //return;    
}

function SetStruggleReticleProgress()
{
    local /*0x97E50000-0x00000000*/ private float NewTime[8388609];

    // End:0x4B
    if(NewTime > 0.0000000)
    {
        StruggleTimeIncrement = 100.0000000 / NewTime;
        StruggleTimeRemaining = 100.0000000;
        bReticleTimerEnabled = true;        
    }
    else
    {
        StruggleTimeRemaining = 0.0000000;
        bReticleTimerEnabled = false;
    }
    //return;    
}
