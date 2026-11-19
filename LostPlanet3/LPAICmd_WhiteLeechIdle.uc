class LPAICmd_WhiteLeechIdle extends LPAICommand within LPAIControllerWhiteLeech;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMatingCallFinished;

function Pushed()
{
    super.Pushed();
    Outer.LeechPawn.ZeroMovementVariables();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.LeechPawn.EndSpecialMove(Class'LPSM_LeechMatingCall');
    //return;    
}

function Paused()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCommand[8388609];

    super.Paused(NewCommand);
    Outer.LeechPawn.EndSpecialMove(Class'LPSM_LeechMatingCall');
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    Outer.LeechPawn.ZeroMovementVariables();
    //return;    
}

function OnMatingCallFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bMatingCallFinished = true;
    //return;    
}

function StartMatingCall()
{
    bMatingCallFinished = false;
    Outer.LeechPawn.DoSpecialMove(Class'LPSM_LeechMatingCall', true, false, OnMatingCallFinished, none);
    //return;    
}

function TimeToNextMatingCall()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return RandRange(Outer.LeechPawn.TuneDataLeech.TimeBetweenMatingCall_Min.GetValue(), Outer.LeechPawn.TuneDataLeech.TimeBetweenMatingCall_Max.GetValue());
    //return ReturnValue;    
}

state StateCmdActive
{Begin:

    Outer.LeechPawn.ZeroMovementVariables();
    J0x34:

    // End:0x96 [Loop If]
    if(true)
    {
        Outer.Sleep(TimeToNextMatingCall());
        StartMatingCall();
        J0x64:

        // End:0x93 [Loop If]
        if(!bMatingCallFinished)
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x64;
        }
        // [Loop Continue]
        goto J0x34;
    }
    Outer.PopCommand(self);
    stop;        
}
