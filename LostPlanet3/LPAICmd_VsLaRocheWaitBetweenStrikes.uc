class LPAICmd_VsLaRocheWaitBetweenStrikes extends LPAICmd_BasicWaitBetweenStrikes within LPAIControllerVsLaroche;

function Pushed()
{
    super.Pushed();
    Outer.VsLarochePawn.EnableWinchPoints(true);
    //return;    
}

function Popped()
{
    // End:0x59
    if(Outer.VsLarochePawn != none)
    {
        Outer.VsLarochePawn.EnableWinchPoints(false);
    }
    super.Popped();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function ShouldTurnToFaceEnemyDuringWaitBetweenStrikes()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xEB
    if(Outer.MyLPEnemy != none)
    {
        // End:0xEB
        if(Outer.IsTurnToFaceTargetCommandNeeded(Outer.MyLPEnemy, Outer.VsLarochePawn.TuneDataVsLaroche.MinAngleNeededForTurnToFaceCommandDuringWaitBetweenStrikes))
        {
            Outer.Focus = Outer.MyLPEnemy;
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}
