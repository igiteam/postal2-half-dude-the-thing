class LPSM_VSFutureRotate180 extends LPSM_VSFutureRotateBase
    config(Game);

function GetDesiredAnimIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CurrentDir, DirToTarget;
    local /*0x97E50000-0x00000000*/ private float dotprod;
    local /*0x97E50000-0x00000000*/ private @NULL vLeft;

    // End:0x11
    if(RotateDestinationActor == none)
    {
        return 0;
    }
    CurrentDir = Vector(MySPPawn.Rotation);
    vLeft = CurrentDir Cross vect(0.0000000, 0.0000000, 1.0000000);
    DirToTarget = RotationDestination - MySPPawn.Location;
    DirToTarget.Z = 0.0000000;
    DirToTarget = Normal(DirToTarget);
    dotprod = DirToTarget Dot vLeft;
    // End:0xFB
    if(dotprod < float(0))
    {
        return 1;        
    }
    else
    {
        return 0;
    }
    //return ReturnValue;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}