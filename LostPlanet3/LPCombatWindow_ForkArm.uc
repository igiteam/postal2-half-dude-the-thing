class LPCombatWindow_ForkArm extends LPCombatWindow
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x7CAC0000-0x00000000*/ private class InitialForkArmGrabSpecialMove[65537];

function IsValid()
{
    local /*0x97E50000-0x00000000*/ private @NULL Performer[8388609], Target;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x30
    if(!Target.IsValidGrabPointIndex(GetGrabPointIndex()))
    {
        return false;
    }
    return super.IsValid(Performer, Target);
    //return ReturnValue;    
}

event GetGrabPointIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return -1;
    //return ReturnValue;    
}

static function IsBetterWindow()
{
    local /*0x97E50000-0x00000000*/ private @NULL TestWindow[25296897], BaselineWindow, inPawn;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL GrabInfo, SocketLocation, Direction, ToSocket;
    local /*0x97E50000-0x00000000*/ private float dotDirTest, dotDirBaseline;

    // End:0x337
    if(ClassIsChildOf(TestWindow.CombatWindow.Class, Class'LPCombatWindow_ForkArm') && ClassIsChildOf(BaselineWindow.CombatWindow.Class, Class'LPCombatWindow_ForkArm'))
    {
        Direction = Vector(inPawn.Rotation);
        GrabInfo = TestWindow.Publisher.GrabPoints[LPCombatWindow_ForkArm(TestWindow.CombatWindow).GetGrabPointIndex()];
        // End:0x1E7
        if(TestWindow.Publisher.Mesh.GetSocketWorldLocationAndRotation(GrabInfo.SocketName, SocketLocation))
        {
            ToSocket = Normal(SocketLocation - inPawn.Location);
            dotDirTest = Direction Dot ToSocket;
        }
        GrabInfo = TestWindow.Publisher.GrabPoints[LPCombatWindow_ForkArm(BaselineWindow.CombatWindow).GetGrabPointIndex()];
        // End:0x322
        if(BaselineWindow.Publisher.Mesh.GetSocketWorldLocationAndRotation(GrabInfo.SocketName, SocketLocation))
        {
            ToSocket = Normal(SocketLocation - inPawn.Location);
            dotDirBaseline = Direction Dot ToSocket;
        }
        return dotDirTest > dotDirBaseline;
    }
    return super.IsBetterWindow(TestWindow, BaselineWindow, inPawn);
    //return ReturnValue;    
}
