class LPGFxUIElementMinimapVSFuture extends LPGFxUIElementMinimap
    config(UI);

function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL MP[8388609];

    super.Init(MP);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x37
    if(Minimap != none)
    {
        Minimap.Update(NormalZoomf);
    }
    return IsActive();
    //return ReturnValue;    
}

function SetMinimapInstrumentDamage()
{
    GoToBeginInstrumentDamage();
    //return;    
}

function ClearMinimapInstrumentDamage()
{
    GoToEndInstrumentDamage();
    //return;    
}

function GoToBeginInstrumentDamage()
{
    // End:0x49
    if(MinimapRoot != none)
    {
        MinimapRoot.ActionScriptVoid("GoToBeginInstrumentDamage");
    }
    //return;    
}

function GoToEndInstrumentDamage()
{
    // End:0x47
    if(MinimapRoot != none)
    {
        MinimapRoot.ActionScriptVoid("GoToEndInstrumentDamage");
    }
    //return;    
}

defaultproperties
{
    MinimapScale=90.0000000
}