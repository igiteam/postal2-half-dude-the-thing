class LPSP_StruggleComposite extends LPStrugglePhase;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOk;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MainPhaseIdx;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MainPhase;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array SecondaryPhasesIdx;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array SecondaryPhases;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PhaseThatFinished;

function InitObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL inSMStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    bOk = super.InitObject(inSMStruggleMode);
    MyTuneData = LPTuneDataStrugglePhaseComposite(TuneData);
    MainPhaseIdx = inSMStruggleMode.GetPhaseIndex(MyTuneData.MainPhaseName);
    // End:0xC9
    if(MainPhaseIdx != -1)
    {
        MainPhase = inSMStruggleMode.StrugglePhases[MainPhaseIdx];        
    }
    else
    {
        bOk = false;
    }
    SecondaryPhasesIdx.Add(MyTuneData.SecondaryPhasesName.Length);    
    SecondaryPhases.Add(MyTuneData.SecondaryPhasesName.Length);    
    I = 0;
    J0x134:

    // End:0x23C [Loop If]
    if(I < MyTuneData.SecondaryPhasesName.Length)
    {
        SecondaryPhasesIdx[I] = inSMStruggleMode.GetPhaseIndex(MyTuneData.SecondaryPhasesName[I]);
        // End:0x222
        if(SecondaryPhasesIdx[I] != -1)
        {
            SecondaryPhases[I] = inSMStruggleMode.StrugglePhases[SecondaryPhasesIdx[I]];            
        }
        else
        {
            bOk = false;
        }
        ++I;
        // [Loop Continue]
        goto J0x134;
    }
    return bOk;
    //return ReturnValue;    
}

function Start()
{
    local /*0x97E50000-0x00000000*/ private name PrevPhaseName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SecondaryPhase;

    super.Start(PrevPhaseName);
    MainPhase.Start(PrevPhaseName);
    // End:0x7B
    foreach SecondaryPhases(SecondaryPhase)
    {
        SecondaryPhase.Start(PrevPhaseName);        
    }    
    //return;    
}

function Stop()
{
    local /*0x97E50000-0x00000000*/ private name NextPhaseName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SecondaryPhase;

    MainPhase.Stop(NextPhaseName);
    // End:0x68
    foreach SecondaryPhases(SecondaryPhase)
    {
        SecondaryPhase.Stop(NextPhaseName);        
    }    
    PhaseThatFinished = none;
    super.Stop(NextPhaseName);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL SecondaryPhase;
    local /*0x97E50000-0x00000000*/ private bool bFinished;

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
    bFinished = MainPhase.Update(DeltaTime);
    // End:0xC2
    if(bFinished && MainPhase.GetNextPhase() != 'None')
    {
        PhaseThatFinished = MainPhase;
        return true;
    }
    // End:0x183
    foreach SecondaryPhases(SecondaryPhase)
    {
        bFinished = SecondaryPhase.Update(DeltaTime);
        // End:0x182
        if((MyTuneData.bAllowAllPhasesToSuggestNextPhase && bFinished) && SecondaryPhase.GetNextPhase() != 'None')
        {
            PhaseThatFinished = SecondaryPhase;            
            return true;
        }        
    }    
    return false;
    //return ReturnValue;    
}

function GetNextPhase()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return PhaseThatFinished.GetNextPhase();
    //return ReturnValue;    
}

function StruggleStabAttempt()
{
    local /*0x97E50000-0x00000000*/ private @NULL SecondaryPhase;

    MainPhase.StruggleStabAttempt();
    // End:0x56
    foreach SecondaryPhases(SecondaryPhase)
    {
        SecondaryPhase.StruggleStabAttempt();        
    }    
    //return;    
}

function StruggleButton()
{
    local /*0x97E50000-0x00000000*/ private @NULL SecondaryPhase;

    MainPhase.StruggleButton();
    // End:0x56
    foreach SecondaryPhases(SecondaryPhase)
    {
        SecondaryPhase.StruggleButton();        
    }    
    //return;    
}

simulated function DrawHUD()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609], SecondaryPhase;

    MainPhase.DrawHUD(H);
    // End:0x68
    foreach SecondaryPhases(SecondaryPhase)
    {
        SecondaryPhase.DrawHUD(H);        
    }    
    //return;    
}

function DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609], SecondaryPhase;

    MainPhase.DrawDebug(H);
    // End:0x68
    foreach SecondaryPhases(SecondaryPhase)
    {
        SecondaryPhase.DrawDebug(H);        
    }    
    //return;    
}
