class SPCameraSeqAct_Interp extends SPSeqAct_Interp
    abstract
    config(Engine)
    forcescriptorder(true)
    hidecategories(Object);

struct native SPCameraTimeHelper
{
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL CamActor;
    var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float Time;

    structdefaultproperties
    {
        CamActor=none
        Time=0.0000000
    }
};

var(__Filter1__Delegate) /*0x06420000-0x00000400*/ private @NULL TransitionBlendIn[65537];
var(__Filter1__Delegate) /*0x06420000-0x00000400*/ private @NULL TransitionToMode[65537];
var(__Filter1__Delegate) /*0x06420000-0x00000400*/ private @NULL TransitionBlendOut[65537];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL BlendIn[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL FirstCamera[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL LastCamera[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL GameCamera[536870913];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private @NULL CameraStartingVelocity[536870913];

event MakeBlends()
{
    // End:0x39
    if(TransitionBlendIn != none)
    {
        BlendIn = TransitionBlendIn.MakeBlend(self);
    }
    //return;    
}

defaultproperties
{
    ObjName="Matinee (SPCamera)"
}