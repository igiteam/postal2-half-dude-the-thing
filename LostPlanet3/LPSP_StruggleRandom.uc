class LPSP_StruggleRandom extends LPStrugglePhase;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOk;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CandidatePhasesIdx;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CandidatePhases;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentPhaseIdx;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name CandidateNextPhaseName;

function InitObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL inSMStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    bOk = super.InitObject(inSMStruggleMode);
    CurrentPhaseIdx = -1;
    MyTuneData = LPTuneDataStrugglePhaseRandom(TuneData);
    CandidatePhasesIdx.Add(MyTuneData.PhaseCandidateNames.Length);    
    CandidatePhases.Add(MyTuneData.PhaseCandidateNames.Length);    
    I = 0;
    J0xA8:

    // End:0x1B0 [Loop If]
    if(I < MyTuneData.PhaseCandidateNames.Length)
    {
        CandidatePhasesIdx[I] = inSMStruggleMode.GetPhaseIndex(MyTuneData.PhaseCandidateNames[I]);
        // End:0x196
        if(CandidatePhasesIdx[I] != -1)
        {
            CandidatePhases[I] = inSMStruggleMode.StrugglePhases[CandidatePhasesIdx[I]];            
        }
        else
        {
            bOk = false;
        }
        ++I;
        // [Loop Continue]
        goto J0xA8;
    }
    return bOk;
    //return ReturnValue;    
}

function Start()
{
    local /*0x97E50000-0x00000000*/ private name PrevPhaseName[8388609];

    super.Start(PrevPhaseName);
    CurrentPhaseIdx = MyTuneData.StartPhaseNameIdx;
    // End:0x58
    if(CurrentPhaseIdx == -1)
    {
        StartNextRandomPhase();
    }
    CandidatePhases[CurrentPhaseIdx].Start(PrevPhaseName);
    //return;    
}

function Stop()
{
    local /*0x97E50000-0x00000000*/ private name NextPhaseName[8388609];

    CandidatePhases[CurrentPhaseIdx].Stop(NextPhaseName);
    CurrentPhaseIdx = -1;
    super.Stop(NextPhaseName);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bFinished;

    // End:0x11
    if(!bOk)
    {
        return true;
    }
    bFinished = super.Update(DeltaTime);
    // End:0x3E
    if(bFinished)
    {
        return true;
    }
    bFinished = CandidatePhases[CurrentPhaseIdx].Update(DeltaTime);
    // End:0xE8
    if(bFinished)
    {
        CandidateNextPhaseName = CandidatePhases[CurrentPhaseIdx].GetNextPhase();
        // End:0xE8
        if(CandidateNextPhaseName == 'None')
        {
            StartNextRandomPhase();
            bFinished = false;
        }
    }
    return bFinished;
    //return ReturnValue;    
}

function StartNextRandomPhase()
{
    local /*0x97E50000-0x00000000*/ private name PrevPhaseName, NextPhaseName;
    local /*0x97E50000-0x00000000*/ private int NextPhaseIdx;

    NextPhaseIdx = Rand(CandidatePhases.Length);
    NextPhaseName = MyTuneData.PhaseCandidateNames[NextPhaseIdx];
    // End:0xBF
    if(CurrentPhaseIdx != -1)
    {
        PrevPhaseName = MyTuneData.PhaseCandidateNames[CurrentPhaseIdx];
        CandidatePhases[CurrentPhaseIdx].Stop(NextPhaseName);
    }
    CurrentPhaseIdx = NextPhaseIdx;
    CandidatePhases[CurrentPhaseIdx].Start(PrevPhaseName);
    //return;    
}

function GetNextPhase()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return CandidateNextPhaseName;
    //return ReturnValue;    
}

function StruggleStabAttempt()
{
    CandidatePhases[CurrentPhaseIdx].StruggleStabAttempt();
    //return;    
}

function StruggleButton()
{
    CandidatePhases[CurrentPhaseIdx].StruggleButton();
    //return;    
}

simulated function DrawHUD()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];

    CandidatePhases[CurrentPhaseIdx].DrawHUD(H);
    //return;    
}

function DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];

    CandidatePhases[CurrentPhaseIdx].DrawDebug(H);
    //return;    
}
