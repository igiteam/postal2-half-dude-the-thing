class LPBlendByAimProfile extends SPBlendByAimProfile
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x7C500000-0x00000000*/ private byte AimState[65537];
var(0.25_Pct) /*0x7C500000-0x00000000*/ private editfixedsize array WeaponTypes[65537];

// Export ULPBlendByAimProfile::execScriptGetAim(FFrame&, void* const)
native event ScriptGetAim()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609], ReturnValue;


}
