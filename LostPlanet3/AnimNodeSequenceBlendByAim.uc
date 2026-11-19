class AnimNodeSequenceBlendByAim extends AnimNodeSequenceBlendBase
    hidecategories(Object,Object,Object,Animations);

var(*) /*0x02E40000-0x00000000*/ private @NULL Aim[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PreviousAim[537001985];
var(*) /*0x02E40000-0x00000000*/ private @NULL HorizontalRange[65537];
var(*) /*0x02E40000-0x00000000*/ private @NULL VerticalRange[65537];
var(*) /*0x02E40000-0x00000000*/ private @NULL AngleOffset[65537];
var(*) /*0x02E40000-0x00000000*/ private name AnimName_LU[65537];
var(*) /*0x02E40000-0x00000000*/ private name AnimName_LC[65537];
var(*) /*0x02E40000-0x00000000*/ private name AnimName_LD[65537];
var(*) /*0x02E40000-0x00000000*/ private name AnimName_CU[65537];
var(*) /*0x02E40000-0x00000000*/ private name AnimName_CC[65537];
var(*) /*0x02E40000-0x00000000*/ private name AnimName_CD[65537];
var(*) /*0x02E40000-0x00000000*/ private name AnimName_RU[65537];
var(*) /*0x02E40000-0x00000000*/ private name AnimName_RC[65537];
var(*) /*0x02E40000-0x00000000*/ private name AnimName_RD[65537];

// Export UAnimNodeSequenceBlendByAim::execCheckAnimsUpToDate(FFrame&, void* const)
native final function CheckAnimsUpToDate();

defaultproperties
{
    HorizontalRange=(X=-1.0000000,Y=1.0000000)
    VerticalRange=(X=-1.0000000,Y=1.0000000)
    Anims=/* Array type was not detected. */
}