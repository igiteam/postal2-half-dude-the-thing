class SPAICountdownTimer extends SPAIObject within SPAIResourceManager
    editinlinenew
    hidecategories(Object);

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private name UniqueName;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float ExpireTime;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float CountDownTimeMin;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float CountDownTimeMax;

function Init()
{
    super.Init();
    ExpireTime = 0.0000000;
    FixMinMax();
    //return;    
}

function ShutDown()
{
    ExpireTime = 0.0000000;
    //return;    
}

function HasExpired()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private float CurTime;

    CurTime = Outer.ResourceManagerOuter.WorldInfo.TimeSeconds;
    return CurTime >= ExpireTime;
    //return ReturnValue;    
}

function GetTimeLeft()
{
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];

    return ExpireTime - Outer.ResourceManagerOuter.WorldInfo.TimeSeconds;
    //return ReturnValue;    
}

function Clear()
{
    ExpireTime = 0.0000000;
    //return;    
}

function Reset()
{
    local /*0x03A30000-0x00000000*/ private float DesiredCountDownTimeMin[9437185], DesiredCountDownTimeMax, CurTime, Time;

    -1.0000000
    -1.0000000
    FixMinMax();
    CurTime = Outer.ResourceManagerOuter.WorldInfo.TimeSeconds;
    // End:0x92
    if(DesiredCountDownTimeMin < float(0))
    {
        DesiredCountDownTimeMin = CountDownTimeMin;
    }
    // End:0xB6
    if(DesiredCountDownTimeMax < float(0))
    {
        DesiredCountDownTimeMax = CountDownTimeMax;
    }
    // End:0x106
    if(DesiredCountDownTimeMin > CountDownTimeMax)
    {
        Time = DesiredCountDownTimeMin;
        DesiredCountDownTimeMin = DesiredCountDownTimeMax;
        DesiredCountDownTimeMax = Time;
    }
    Time = RandRange(DesiredCountDownTimeMin, DesiredCountDownTimeMax);
    ExpireTime = CurTime + Time;
    //return;    
}

protected function FixMinMax()
{
    local /*0x03A30000-0x00000000*/ private float Time;

    // End:0x20
    if(CountDownTimeMin < float(0))
    {
        CountDownTimeMin = 0.0000000;
    }
    // End:0x40
    if(CountDownTimeMax < float(0))
    {
        CountDownTimeMax = 0.0000000;
    }
    // End:0x90
    if(CountDownTimeMin > CountDownTimeMax)
    {
        Time = CountDownTimeMin;
        CountDownTimeMin = CountDownTimeMax;
        CountDownTimeMax = Time;
    }
    //return;    
}

function SetFromTuneData()
{
    //return;    
}

function BeginPlay()
{
    //return;    
}
