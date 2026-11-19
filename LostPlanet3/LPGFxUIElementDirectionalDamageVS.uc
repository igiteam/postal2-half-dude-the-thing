class LPGFxUIElementDirectionalDamageVS extends LPGFxUIElement;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSHitLocMC[4];

function setVSDamageIndicator()
{
    MoviePlayer.ActionScriptVoid("setVSDamageIndicator");
    //return;    
}

function setVSDamageRotation()
{
    local /*0x97E50000-0x00000000*/ private float Number[8388609];

    MoviePlayer.ActionScriptVoid("setVSDamageRotation");
    //return;    
}

function SetDirectionalDamage()
{
    local /*0x97E50000-0x00000000*/ private float AngleInDegrees[8388609];

    setVSDamageIndicator();
    setVSDamageRotation(AngleInDegrees);
    //return;    
}

function ClearDirectionalDamage()
{
    SetActive(false);
    //return;    
}
