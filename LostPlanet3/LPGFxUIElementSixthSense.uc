class LPGFxUIElementSixthSense extends LPGFxUIElement;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InitialSenseAngleInDegrees;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InitialViewAngle;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastViewAngle;

function setSixthSenseIndicator()
{
    MoviePlayer.ActionScriptVoid("setSixthSenseIndicator");
    //return;    
}

function setSixthSenseRotation()
{
    local /*0x97E50000-0x00000000*/ private float AngleInDegrees[8388609];

    MoviePlayer.ActionScriptVoid("setSixthSenseRotation");
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Angle;
    local /*0x97E50000-0x00000000*/ private @NULL Loc, Rot;
    local /*0x97E50000-0x00000000*/ private float angledelta;
    local /*0x97E50000-0x00000000*/ private @NULL CachedLPPC;

    // End:0x109
    if(IsActive())
    {
        CachedLPPC = GetLPPC();
        // End:0x109
        if(CachedLPPC != none)
        {
            CachedLPPC.GetPlayerViewPoint(Loc, Rot);
            angledelta = float(Rot.Yaw) - InitialViewAngle;
            angledelta = angledelta * 0.0054932;
            Angle = InitialSenseAngleInDegrees - angledelta;
            // End:0x109
            if(Angle != LastViewAngle)
            {
                LastViewAngle = Angle;
                UpdateSixthSense(Angle);
            }
        }
    }
    return super(SPGFxUIElement).Update(DeltaTime);
    //return ReturnValue;    
}

function hide()
{
    local /*0x97E50000-0x00000000*/ private bool bHide[8388609], bImmediate;

    // End:0x1D
    if(bHide)
    {
        LastViewAngle = 0.0000000;
    }
    super(SPGFxUIElement).hide(bHide, bImmediate);
    //return;    
}

function UpdateSixthSense()
{
    local /*0x97E50000-0x00000000*/ private float AngleInDegrees[8388609];

    setSixthSenseRotation(AngleInDegrees);
    //return;    
}

function SetSixthSenseWarning()
{
    local /*0x97E50000-0x00000000*/ private float AngleInDegrees[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Loc, Rot;

    SetActive(true);
    InitialSenseAngleInDegrees = AngleInDegrees;
    GetLPPC().GetPlayerViewPoint(Loc, Rot);
    InitialViewAngle = float(Rot.Yaw);
    setSixthSenseIndicator();
    setSixthSenseRotation(AngleInDegrees);
    //return;    
}
