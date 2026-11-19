class LPAccessControl extends SPAccessControl
    config(Game)
    hidecategories(AnimDependency,Navigation,Movement,Collision);

function ForceKickPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string KickReason[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0xD8
    if((C != none) && NetConnection(C.Player) != none)
    {
        C.ClientWasKicked();
        LPPC = LPPlayerController(C);
        // End:0xAF
        if(LPPC != none)
        {
            LPPC.DelayedDestroy(2.0000000);            
        }
        else
        {
            // End:0xD6
            if(C != none)
            {
                C.Destroy();
            }
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    AdminClass=Class'LPAdmin'
}