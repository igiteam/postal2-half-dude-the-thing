class AnimNodeBlendBySpeed extends AnimNodeBlendList
    hidecategories(Object,Object,Object,Object);

var(*) /*0x35EA0000-0x00000000*/ private float Speed;
var(*) /*0x35EA0000-0x00000000*/ private int LastChannel;
var(*) /*0x02D30000-0x00000000*/ private float BlendUpTime[65537];
var(*) /*0x02D30000-0x00000000*/ private float BlendDownTime[65537];
var(*) /*0x02D30000-0x00000000*/ private float BlendDownPerc[65537];
var(*) /*0x02D30000-0x00000000*/ private editfixedsize array Constraints[65537];
var(*) /*0x02D30000-0x00000000*/ private bool bUseAcceleration[65537];
var(*) /*0x02D30000-0x00000000*/ private float BlendUpDelay[65537];
var(*) /*0x02D30000-0x00000000*/ private float BlendDownDelay[65537];
var(*) /*0x35EA0000-0x00000000*/ private float BlendDelayRemaining[536870913];

defaultproperties
{
    BlendUpTime=0.1000000
    BlendDownTime=0.1000000
    BlendDownPerc=0.2000000
    Constraints=/* Array type was not detected. */
}