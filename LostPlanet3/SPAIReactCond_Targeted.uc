class SPAIReactCond_Targeted extends SPAIReactCondition_Base within SPAIController;

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL shooter;
var(__NotifyAccessLostDelegate__Delegate) /*0x051D0000-0x00000000*/ private float ShooterRangeThreshold[65537];

event Activate()
{
    local /*0x03A30000-0x00000000*/ private @NULL EventInstigator[8388609], OriginatingChannel;

    Outer.AddTarget(EventInstigator);
    super.Activate(EventInstigator, OriginatingChannel);
    //return;    
}

defaultproperties
{
    ShooterRangeThreshold=1024.0000000
    AutoSubscribeChannels=/* Array type was not detected. */
}