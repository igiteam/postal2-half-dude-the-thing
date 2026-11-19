class LPSM_GrappleFall extends LPSM_GrapplingFinishBase
    config(Game);

function GetRootMotionMode()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 2;
    //return ReturnValue;    
}

function SetUpPawnGrappleDest()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrappleHookTarget[8388609], LPP, HandOffset, ReturnValue, Loc;

    Loc = LPP.GrappleActorLocation;
    Loc.Z -= float(100);
    return Loc;
    //return ReturnValue;    
}

defaultproperties
{
    GrapplePointOffset=75.0000000
    AnimationTemplateNodeNames=/* Array type was not detected. */
}