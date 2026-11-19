class SPCameraBlendTimed extends SPCameraBlend
    abstract;

var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float Progress;
var(__Filter1__Delegate) /*0x05570000-0x00000000*/ private float TotalSeconds[65537];

simulated function GetProgress()
{
    local /*0x043A0000-0x00000000*/ private float ReturnValue[92274689];

    return Progress;
    //return ReturnValue;    
}

simulated function InitTimed()
{
    local /*0x043A0000-0x00000000*/ private float Seconds[8388609];

    Init();
    TotalSeconds = Seconds;
    Reset();
    //return;    
}

static function CreateTimed()
{
    local /*0x043A0000-0x00000000*/ private @NULL Owner[8388609];
    local /*0x043A0000-0x00000000*/ private float Seconds[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    //return ReturnValue;    
}

static final function CreateTimedClass()
{
    local /*0x043A0000-0x00000000*/ private @NULL Owner[8388609];
    local /*0x043A0000-0x00000000*/ private class blendclass[8388609];
    local /*0x043A0000-0x00000000*/ private float Seconds[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689], Filter;

    Filter = new (Owner) blendclass;
    Filter.InitTimed(Seconds);
    return Filter;
    //return ReturnValue;    
}

simulated function Reset()
{
    Progress = 0.0000000;
    //return;    
}

simulated function Update()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x77
    if(Progress < 1.0000000)
    {
        // End:0x57
        if(TotalSeconds > float(0))
        {
            Progress = FMin(1.0000000, Progress + (DeltaTime / TotalSeconds));            
        }
        else
        {
            Progress = 1.0000000;
        }
        return Progress < 1.0000000;
    }
    return false;
    //return ReturnValue;    
}

simulated function DebugString()
{
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return (((super.DebugString() @ "Duration:") @ string(TotalSeconds)) @ "Progress:") @ string(Progress);
    //return ReturnValue;    
}

defaultproperties
{
    TotalSeconds=1.0000000
}