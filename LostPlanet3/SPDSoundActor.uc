class SPDSoundActor extends Actor
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(__OnDestroyed__Delegate) /*0x024E0000-0x00000000*/ private @NULL PlaySound[65537];
var(__OnDestroyed__Delegate) /*0x024E0000-0x00000000*/ private float ExtraDelay[65537];
var(__OnDestroyed__Delegate) /*0x024E0000-0x00000000*/ private float FadeInTime[65537];
var(__OnDestroyed__Delegate) /*0x024E0000-0x00000000*/ private float FadeOutTime[65537];
var(__OnDestroyed__Delegate) /*0x024E0000-0x00000000*/ private bool ShowDebug[65537];
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000400*/ private export @NULL AudioComp[537395201];
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private float SoundDuration[536870913];
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000400*/ private export @NULL RenderComponent[524289];

// Export USPDSoundActor::execInit(FFrame&, void* const)
native function Init()
{
    local /*0x01C00000-0x00000000*/ private bool ReturnValue[92274689];


}

event TryToStartSoundActor()
{
    // End:0x1B
    if(Init())
    {
        GotoState('Finished');
    }
    //return;    
}

auto state Startup
{Begin:

    TryToStartSoundActor();
    stop;        
}

state Finished
{
    ignores TryToStart;
Begin:

    Sleep(SoundDuration);
    Destroy();
    stop;                    
}

defaultproperties
{
    // Reference: DrawSphereComponent'Default__SPDSoundActor.DrawSphere0'
    begin object name=DrawSphere0 class=Class'Engine.DrawSphereComponent'
    end object
    RenderComponent=DrawSphere0
    Components[0]=DrawSphere0
}