class LPAnimNode_AdditiveHitBlender extends LPAnimNode_MultiBlendPerBone
    hidecategories(Object,Object,Object);

var(0.25_Pct) /*0x7B840000-0x00000000*/ private float BaseBlendStrength[65537];

function SetAdditiveStrength()
{
    local /*0x97E50000-0x00000000*/ private float InValue[8388609], InBlendTime;

    0.1000000
    // End:0x41
    if(MaskList.Length > 0)
    {
        SetMaskWeight(0, InValue * BaseBlendStrength, InBlendTime);
    }
    //return;    
}

defaultproperties
{
    BaseBlendStrength=1.0000000
}