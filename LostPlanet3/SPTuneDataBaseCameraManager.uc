class SPTuneDataBaseCameraManager extends SPEngineTuneDataBase
    abstract
    hidecategories(Object,Object);

var(__Filter1__Delegate) /*0x05D20000-0x00000000*/ private float FOV[65537];
var(__Filter1__Delegate) /*0x05D20000-0x00000000*/ private float SpringK[65537];
var(__Filter1__Delegate) /*0x05D20000-0x00000000*/ private float DampK[65537];

defaultproperties
{
    FOV=90.0000000
    SpringK=40.0000000
    DampK=10.0000000
}