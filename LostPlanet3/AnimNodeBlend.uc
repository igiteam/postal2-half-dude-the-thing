class AnimNodeBlend extends AnimNodeBlendBase
    hidecategories(Object,Object,Object,Object);

var(*) /*0x35EA0000-0x00000000*/ private float Child2Weight;
var(*) /*0x35EA0000-0x00000000*/ private float Child2WeightTarget;
var(*) /*0x35EA0000-0x00000000*/ private float BlendTimeToGo;
var(*) /*0x02CC0000-0x00000000*/ private bool bSkipBlendWhenNotRendered[65537];

// Export UAnimNodeBlend::execSetBlendTarget(FFrame&, void* const)
native function SetBlendTarget()
{
    local /*0x35EA0000-0x00000000*/ private float BlendTarget[8388609], BlendTime;


}

defaultproperties
{
    bSkipBlendWhenNotRendered=true
    Children=/* Array type was not detected. */
    bFixNumChildren=true
}