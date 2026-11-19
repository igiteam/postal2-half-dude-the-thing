class LPCameraModeDirector extends SPCameraModeDirector;

// Export ULPCameraModeDirector::execGetPawnRotationType(FFrame&, void* const)
native function GetPawnRotationType()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];


}

defaultproperties
{
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeDirector.LocationFilterObj'
    begin object name=LocationFilterObj
    end object
    StaticLocationFilter=LocationFilterObj
    // Reference: SPCameraBlendLowPassFilter'Default__LPCameraModeDirector.RotationFilterObj'
    begin object name=RotationFilterObj
    end object
    StaticRotationFilter=RotationFilterObj
}