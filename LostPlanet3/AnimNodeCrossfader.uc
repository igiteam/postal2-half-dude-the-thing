class AnimNodeCrossfader extends AnimNodeBlend
    hidecategories(Object,Object,Object,Object,Object);

var(*) /*0x02D80000-0x00000000*/ private name DefaultAnimSeqName[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bDontBlendOutOneShot[131073];
var(*) /*0x35EA0000-0x00000000*/ private float PendingBlendOutTimeOneShot[131073];

// Export UAnimNodeCrossfader::execPlayOneShotAnim(FFrame&, void* const)
native final function PlayOneShotAnim()
{
    local /*0x35EA0000-0x00000000*/ private name AnimSeqName[8388609];
    local /*0x35EA0000-0x00000000*/ private float BlendInTime[9437185], BlendOutTime;
    local /*0x35EA0000-0x00000000*/ private bool bDontBlendOut[9437185];
    local /*0x35EA0000-0x00000000*/ private float Rate[9437185];


}

// Export UAnimNodeCrossfader::execBlendToLoopingAnim(FFrame&, void* const)
native final function BlendToLoopingAnim()
{
    local /*0x35EA0000-0x00000000*/ private name AnimSeqName[8388609];
    local /*0x35EA0000-0x00000000*/ private float BlendInTime[9437185], Rate;


}

// Export UAnimNodeCrossfader::execGetAnimName(FFrame&, void* const)
native final function GetAnimName()
{
    local /*0x35EA0000-0x00000000*/ private name ReturnValue[92274689];


}

// Export UAnimNodeCrossfader::execGetActiveChild(FFrame&, void* const)
native final function GetActiveChild()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}
