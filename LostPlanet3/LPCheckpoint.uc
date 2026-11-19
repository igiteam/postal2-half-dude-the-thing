class LPCheckpoint extends SPCheckpoint;

static function CanSaveCheckpoints()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MyEngine, OnlineSub;

    -1
    // End:0x1BE
    if(Class'Engine.WorldInfo'.static.GetWorldInfo().IsConsoleBuild(1))
    {
        MyEngine = SPEngine(Class'Engine.Engine'.static.GetEngine());
        // End:0x1BC
        if((MyEngine != none) && !MyEngine.StorageAccessDisabled())
        {
            // End:0xFD
            if(ControllerId == -1)
            {
                ControllerId = MyEngine.GamePlayers[0].ControllerId;
            }
            OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
            // End:0x1BC
            if((OnlineSub != none) && int(OnlineSub.PlayerInterface.GetLoginStatus(byte(ControllerId))) != int(0))
            {
                return MyEngine.IsCurrentDeviceValid(MyEngine.2097152);
            }
        }
        return false;
    }
    return true;
    //return ReturnValue;    
}

static function ShowSavingContentWarning()
{
    local /*0x97E50000-0x00000000*/ private float MinDisplayTime[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL MyPC;

    3.0000000
    MyPC = LPPlayerController(Class'Engine.Engine'.static.GetEngine().GamePlayers[0].Actor);
    // End:0x86
    if((MyPC != none) && CanSaveCheckpoints())
    {
    }
    //return;    
}

defaultproperties
{
    ActorClassesToRecord=/* Array type was not detected. */
    ActorClassesToDestroy=/* Array type was not detected. */
}