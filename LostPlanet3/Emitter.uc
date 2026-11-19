class Emitter extends Actor
    placeable
    hidecategories(AnimDependency,Navigation);

struct CheckpointRecord
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsActive;
    var(*) /*0x35EA0000-0x00000000*/ private bool bShowObjective;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsQuestActive;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string CurrentActiveWaypointPathName;

    structdefaultproperties
    {
        bIsActive=false
        bShowObjective=false
        bIsQuestActive=false
        CurrentActiveWaypointPathName=""
    }
};

var(*) /*0x1FAF0000-0x00000400*/ private const export @NULL ParticleSystemComponent[720897];
var(*) /*0x1FAF0000-0x00000400*/ private const export @NULL LightEnvironment[720897];
var(*) /*0x35EA0000-0x00000000*/ private bool bDestroyOnSystemFinish;
var(*) /*0x1FAF0000-0x00000000*/ private bool bPostUpdateTickGroup[65537];
var(*) /*0x35EA0000-0x00000000*/ private travel bool bCurrentlyActive[2097153];

// Export UEmitter::execSetTemplate(FFrame&, void* const)
native event SetTemplate()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewTemplate[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bDestroyOnFinish[9437185];


}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x67
    if((int(WorldInfo.NetMode) == int(NM_DedicatedServer)) && (int(RemoteRole) == int(ROLE_None)) || bNetTemporary)
    {
        LifeSpan = 0.2000000;
    }
    // End:0xD0
    if(ParticleSystemComponent != none)
    {
        ParticleSystemComponent.__OnSystemFinished__Delegate = OnParticleSystemFinished;
        bCurrentlyActive = ParticleSystemComponent.bAutoActivate;
    }
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x44
    if(VarName == 'bCurrentlyActive')
    {
        ParticleSystemComponent.SetActive(bCurrentlyActive);        
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
    //return;    
}

simulated function @NULL OnParticleSystemFinished()
{
    local /*0x35EA0000-0x00000400*/ private @NULL FinishedComponent[8388609];

    // End:0x1C
    if(bDestroyOnSystemFinish)
    {
        LifeSpan = 0.0001000;
    }
    bCurrentlyActive = false;
    //return;    
}

function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x66
    if(Action.InputLinks[0].bHasImpulse)
    {
        ParticleSystemComponent.ActivateSystem();
        bCurrentlyActive = true;        
    }
    else
    {
        // End:0xCB
        if(Action.InputLinks[1].bHasImpulse)
        {
            ParticleSystemComponent.DeactivateSystem();
            bCurrentlyActive = false;            
        }
        else
        {
            // End:0x190
            if(Action.InputLinks[2].bHasImpulse)
            {
                // End:0x165
                if(ParticleSystemComponent.bSuppressSpawning || !bCurrentlyActive)
                {
                    ParticleSystemComponent.ActivateSystem();
                    bCurrentlyActive = true;                    
                }
                else
                {
                    ParticleSystemComponent.DeactivateSystem();
                    bCurrentlyActive = false;
                }
            }
        }
    }
    ParticleSystemComponent.LastRenderTime = WorldInfo.TimeSeconds;
    ForceNetRelevant();
    // End:0x214
    if(int(RemoteRole) != int(ROLE_None))
    {
        SetForcedInitialReplicatedProperty(BoolProperty'Emitter.bCurrentlyActive', bCurrentlyActive == default.bCurrentlyActive);
    }
    //return;    
}

function OnParticleEventGenerator()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    //return;    
}

simulated function ShutDown()
{
    super.ShutDown();
    bCurrentlyActive = false;
    //return;    
}

simulated function SetFloatParameter()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Param[8388609];

    // End:0x43
    if(ParticleSystemComponent != none)
    {
        ParticleSystemComponent.super(Emitter).SetFloatParameter(ParameterName, Param);        
    }
    //return;    
}

simulated function SetVectorParameter()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Param[8388609];

    // End:0x43
    if(ParticleSystemComponent != none)
    {
        ParticleSystemComponent.super(Emitter).SetVectorParameter(ParameterName, Param);        
    }
    //return;    
}

simulated function SetColorParameter()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Param[8388609];

    // End:0x43
    if(ParticleSystemComponent != none)
    {
        ParticleSystemComponent.super(Emitter).SetColorParameter(ParameterName, Param);        
    }
    //return;    
}

simulated function SetExtColorParameter()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private byte Red[8388609], Green, Blue, Alpha;
    local /*0x35EA0000-0x00000000*/ private @NULL C;

    // End:0xDB
    if(ParticleSystemComponent != none)
    {
        C.R = Red;
        C.G = Green;
        C.B = Blue;
        C.A = Alpha;
        ParticleSystemComponent.SetColorParameter(ParameterName, C);        
    }
    //return;    
}

simulated function SetActorParameter()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Param[8388609];

    // End:0x43
    if(ParticleSystemComponent != none)
    {
        ParticleSystemComponent.super(Emitter).SetActorParameter(ParameterName, Param);        
    }
    //return;    
}

simulated function OnSetParticleSysParam()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];
    local /*0x35EA0000-0x00000000*/ private int Idx, ParamIdx;

    // End:0x267
    if((ParticleSystemComponent != none) && Action.InstanceParameters.Length > 0)
    {
        Idx = 0;
        J0x41:

        // End:0x267 [Loop If]
        if(Idx < Action.InstanceParameters.Length)
        {
            // End:0x259
            if(int(Action.InstanceParameters[Idx].ParamType) != int(0))
            {
                ParamIdx = ParticleSystemComponent.InstanceParameters.Find('Name', Action.InstanceParameters[Idx].Name);                
                // End:0x18C
                if(ParamIdx == -1)
                {
                    ParamIdx = ParticleSystemComponent.InstanceParameters.Length;
                    ParticleSystemComponent.InstanceParameters.Length = ParamIdx + 1;
                }
                ParticleSystemComponent.InstanceParameters[ParamIdx] = Action.InstanceParameters[Idx];
                // End:0x259
                if(Action.bOverrideScalar)
                {
                    ParticleSystemComponent.InstanceParameters[ParamIdx].Scalar = Action.ScalarValue;
                }
            }
            Idx++;
            // [Loop Continue]
            goto J0x41;
        }
    }
    //return;    
}

function ShouldSaveForCheckpoint()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return bNoDelete && int(RemoteRole) != int(ROLE_None);
    //return ReturnValue;    
}

function CreateCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Record[25165825];

    Record.bIsActive = bCurrentlyActive;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Record[25296897];

    bCurrentlyActive = Record.bIsActive;
    // End:0x58
    if(bCurrentlyActive)
    {
        ParticleSystemComponent.ActivateSystem();        
    }
    else
    {
        ParticleSystemComponent.DeactivateSystem();
    }
    ForceNetRelevant();
    //return;    
}

simulated function HideSelf()
{
    //return;    
}

defaultproperties
{
    // Reference: ParticleSystemComponent'Default__Emitter.ParticleSystemComponent0'
    begin object name=ParticleSystemComponent0 class=Class'ParticleSystemComponent'
    end object
    ParticleSystemComponent=ParticleSystemComponent0
    Components[0]=none
    Components[1]=ParticleSystemComponent0
    Components[2]=none
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    bNoDelete=true
    bHardAttach=true
    bGameRelevant=true
    bEdShouldSnap=true
    SupportedEvents=/* Array type was not detected. */
}