class PotentialClimbWatcher extends Info
    notplaceable
    hidecategories(AnimDependency,Navigation,Movement,Collision);

simulated event Tick()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL PawnRot, L;
    local /*0x35EA0000-0x00000000*/ private bool bFound;

    // End:0x67
    if(((Owner == none) || Owner.bDeleteMe) || !Pawn(Owner).CanGrabLadder())
    {
        Destroy();
        return;
    }
    PawnRot = Owner.Rotation;
    PawnRot.Pitch = 0;
    // End:0x181
    foreach Owner.TouchingActors(Class'LadderVolume', L)
    {
        // End:0x180
        if(L.Encompasses(Owner))
        {
            // End:0x174
            if((Vector(PawnRot) Dot L.LookDir) > 0.9000000)
            {
                Pawn(Owner).ClimbLadder(L);
                Destroy();                
                return;
                // End:0x180
                continue;
            }
            bFound = true;
        }        
    }    
    // End:0x194
    if(!bFound)
    {
        Destroy();
    }
    //return;    
}
