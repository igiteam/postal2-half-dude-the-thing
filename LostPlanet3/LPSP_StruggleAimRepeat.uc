class LPSP_StruggleAimRepeat extends LPStrugglePhase;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAiming;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AimPhaseIdx;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AimPhase;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SuccessPhaseIdx;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SuccessPhase;

function InitObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL inSMStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bOk;

    bOk = super.InitObject(inSMStruggleMode);
    MyTuneData = LPTuneDataStrugglePhaseAimRepeat(TuneData);
    AimPhaseIdx = inSMStruggleMode.GetPhaseIndex(MyTuneData.AimPhaseName);
    // End:0xD2
    if(AimPhaseIdx != -1)
    {
        AimPhase = LPSP_StruggleAim(inSMStruggleMode.StrugglePhases[AimPhaseIdx]);        
    }
    else
    {
        bOk = false;
    }
    // End:0x1A4
    if(bOk)
    {
        SuccessPhaseIdx = inSMStruggleMode.GetPhaseIndex(AimPhase.MyTuneData.SuccessPhaseName);
        // End:0x198
        if(SuccessPhaseIdx != -1)
        {
            SuccessPhase = LPSP_StruggleAim(inSMStruggleMode.StrugglePhases[SuccessPhaseIdx]);            
        }
        else
        {
            bOk = false;
        }
    }
    // End:0x1C6
    if(inSMStruggleMode.bLocalPlayer)
    {
    }
    return bOk;
    //return ReturnValue;    
}

function Start()
{
    local /*0x97E50000-0x00000000*/ private name PrevPhaseName[8388609];

    super.Start(PrevPhaseName);
    AimPhase.Start(PrevPhaseName);
    bAiming = true;
    // End:0x69
    if(smStruggleMode.bLocalPlayer)
    {
    }
    //return;    
}

function Stop()
{
    local /*0x97E50000-0x00000000*/ private name NextPhaseName[8388609];

    AimPhase.Stop(NextPhaseName);
    // End:0x4A
    if(smStruggleMode.bLocalPlayer)
    {
    }
    super.Stop(NextPhaseName);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bFinished;

    // End:0x11
    if(AimPhase == none)
    {
        return true;
    }
    bFinished = super.Update(DeltaTime);
    // End:0x3E
    if(bFinished)
    {
        return true;
    }
    // End:0x18F
    if(bAiming)
    {
        // End:0x18C
        if(AimPhase.Update(DeltaTime))
        {
            // End:0x180
            if(AimPhase.GetNextPhase() == AimPhase.MyTuneData.SuccessPhaseName)
            {
                AimPhase.Stop(AimPhase.MyTuneData.SuccessPhaseName);
                SuccessPhase.Start(AimPhase.TuneData.PhaseName);
                bAiming = false;                
            }
            else
            {
                bFinished = true;
            }
        }        
    }
    else
    {
        // End:0x29D
        if(SuccessPhase.Update(DeltaTime))
        {
            // End:0x291
            if(!smStruggleMode.CheckWinning())
            {
                SuccessPhase.Stop(AimPhase.TuneData.PhaseName);
                AimPhase.Start(AimPhase.MyTuneData.SuccessPhaseName);
                bAiming = true;                
            }
            else
            {
                bFinished = true;
            }
        }
    }
    return bFinished;
    //return ReturnValue;    
}

function GetNextPhase()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return AimPhase.GetNextPhase();
    //return ReturnValue;    
}

function StruggleStabAttempt()
{
    AimPhase.StruggleStabAttempt();
    //return;    
}
