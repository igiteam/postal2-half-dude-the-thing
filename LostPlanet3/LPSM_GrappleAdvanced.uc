class LPSM_GrappleAdvanced extends LPSM_GrappleMantleUp
    config(Game);

function GetAdvancedGrappleType()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn, GrappleTarget;

    PlayerPawn = LPPlayerPawn(MySPPawn);
    // End:0x9F
    if(PlayerPawn.GrappleActor != none)
    {
        GrappleTarget = LPHookMeshActor(PlayerPawn.GrappleActor);
        // End:0x9F
        if(GrappleTarget != none)
        {
            return GrappleTarget.AdvancedGrappleType;
        }
    }
    return 0;
    //return ReturnValue;    
}

simulated function HasAdvancedGrapple()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x17
    if(int(GetAdvancedGrappleType()) == int(0))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}
