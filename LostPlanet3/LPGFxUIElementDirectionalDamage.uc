class LPGFxUIElementDirectionalDamage extends LPGFxUIElement;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HitLocMC[8];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DistanceFromCenter;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InitialDamageAngleInDegrees;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InitialViewAngle;

function setPofDamageIndicator()
{
    MoviePlayer.ActionScriptVoid("setPofDamageIndicator");
    //return;    
}

function setPofDamageRotation()
{
    local /*0x97E50000-0x00000000*/ private float AngleInDegrees[8388609];

    MoviePlayer.ActionScriptVoid("setPofDamageRotation");
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

    // End:0xDF
    if(IsActive())
    {
        CachedLPPC = GetLPPC();
        // End:0xDF
        if(CachedLPPC != none)
        {
            CachedLPPC.GetPlayerViewPoint(Loc, Rot);
            angledelta = float(Rot.Yaw) - InitialViewAngle;
            angledelta = angledelta * 0.0054932;
            Angle = InitialDamageAngleInDegrees - angledelta;
            UpdateDirectionalDamage(Angle);
        }
    }
    return super(SPGFxUIElement).Update(DeltaTime);
    //return ReturnValue;    
}

function UpdateDirectionalDamage()
{
    local /*0x97E50000-0x00000000*/ private float AngleInDegrees[8388609];

    setPofDamageRotation(AngleInDegrees);
    //return;    
}

function SetDirectionalDamage()
{
    local /*0x97E50000-0x00000000*/ private float AngleInDegrees[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Loc, Rot;

    SetActive(true);
    InitialDamageAngleInDegrees = AngleInDegrees;
    GetLPPC().GetPlayerViewPoint(Loc, Rot);
    InitialViewAngle = float(Rot.Yaw);
    setPofDamageIndicator();
    setPofDamageRotation(AngleInDegrees);
    //return;    
}

function ClearDirectionalDamage()
{
    SetActive(false);
    //return;    
}

protected function Show()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609], bImmediate;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL DI;

    // End:0xCF
    if(bShow == false)
    {
        // End:0xCF
        if(HitLocMC[0] != none)
        {
            I = 0;
            J0x2D:

            // End:0xCF [Loop If]
            if(I < 8)
            {
                DI = HitLocMC[I].GetDisplayInfo();
                DI.Visible = false;
                HitLocMC[I].SetDisplayInfo(DI);
                I++;
                // [Loop Continue]
                goto J0x2D;
            }
        }
    }
    //return;    
}

defaultproperties
{
    DistanceFromCenter=100.0000000
}