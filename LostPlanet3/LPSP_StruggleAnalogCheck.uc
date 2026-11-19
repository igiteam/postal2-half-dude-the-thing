class LPSP_StruggleAnalogCheck extends LPStrugglePhaseAnim;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyTuneData;

function InitObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL inSMStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bOk;

    bOk = super.InitObject(inSMStruggleMode);
    MyTuneData = LPTuneDataStrugglePhaseAnalogCheck(TuneData);
    return bOk;
    //return ReturnValue;    
}

function Start()
{
    local /*0x97E50000-0x00000000*/ private name PrevPhaseName[8388609];

    super.Start(PrevPhaseName);
    //return;    
}

function Stop()
{
    local /*0x97E50000-0x00000000*/ private name inNextPhaseName[8388609];

    super.Stop(inNextPhaseName);
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super.Update(DeltaTime);
    //return ReturnValue;    
}

function GetNextPhase()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL AnimControlPhase;
    local /*0x97E50000-0x00000000*/ private float MeterValue;
    local /*0x97E50000-0x00000000*/ private int I;

    AnimControlPhase = LPSP_StruggleAnimControl(smStruggleMode.GetPhase(MyTuneData.MeterPhaseName));
    // End:0x239
    if(AnimControlPhase != none)
    {
        MeterValue = AnimControlPhase.GetMeterValue();
        I = 0;
        J0x93:

        // End:0x19E [Loop If]
        if(I < MyTuneData.CheckMeterRanges.Length)
        {
            // End:0x190
            if((MeterValue >= MyTuneData.CheckMeterRanges[I].MinMeterValue) && MeterValue <= MyTuneData.CheckMeterRanges[I].MaxMeterValue)
            {
                return MyTuneData.CheckMeterRanges[I].PhaseName;
            }
            ++I;
            // [Loop Continue]
            goto J0x93;
        }
        // End:0x21A
        if((MeterValue >= MyTuneData.MinMeterValue) && MeterValue <= MyTuneData.MaxMeterValue)
        {
            return MyTuneData.SuccessPhaseName;            
        }
        else
        {
            return MyTuneData.failPhaseName;
        }
    }
    return 'None';
    //return ReturnValue;    
}
