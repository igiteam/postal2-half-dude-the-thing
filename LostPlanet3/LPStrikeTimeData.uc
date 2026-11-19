class LPStrikeTimeData extends Object
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte StrikeType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTimeBetweenStrikes;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTimeBetweenStrikes;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeForNextStrike;

static function SetTimeFromTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TD_StrikeTime[8388609], outStrikeTime;

    // End:0x27
    if(outStrikeTime == none)
    {
        outStrikeTime = new Class'LPStrikeTimeData';
    }
    outStrikeTime.StrikeType = TD_StrikeTime.StrikeType;
    outStrikeTime.MinTimeBetweenStrikes = TD_StrikeTime.MinTimeBetweenStrikes.GetValue();
    outStrikeTime.MaxTimeBetweenStrikes = TD_StrikeTime.MaxTimeBetweenStrikes.GetValue();
    outStrikeTime.TimeForNextStrike = -1.0000000;
    //return;    
}

defaultproperties
{
    MinTimeBetweenStrikes=-1.0000000
    MaxTimeBetweenStrikes=-1.0000000
    TimeForNextStrike=-1.0000000
}