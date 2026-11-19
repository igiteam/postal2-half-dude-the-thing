class SPAISmartObjectInteractionComponent extends SPAIResManSmartObject
    editinlinenew
    hidecategories(Object,SPAIResManSmartObject);

struct native SmartObjectBroadcast
{
    var(__NotifyAccessLostDelegate__Delegate) /*0x04D80000-0x00000000*/ private bool bBroadcastPresence[65537];
    var(__NotifyAccessLostDelegate__Delegate) /*0x04D80000-0x00000000*/ private float Radius[65537];
    var(__NotifyAccessLostDelegate__Delegate) /*0x04D80000-0x00000000*/ private float TimeFrequency[65537];
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float TimeForNextBroadcast;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bReady;

    structdefaultproperties
    {
        bBroadcastPresence=false
        Radius=1000.0000000
        TimeFrequency=2.0000000
        TimeForNextBroadcast=0.0000000
        bReady=false
    }
};

var(__NotifyAccessLostDelegate__Delegate) /*0x02CB0000-0x00000400*/ private editfixedsize array InteractionData[589825];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL Broadcast;

// Export USPAISmartObjectInteractionComponent::execIsAllowedToInteractWithActor(FFrame&, void* const)
native function IsAllowedToInteractWithActor()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAISmartObjectInteractionComponent::execFindByClass(FFrame&, void* const)
native function FindByClass()
{
    local /*0x03A30000-0x00000000*/ private class InInteractionClass[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL inPawn[8388609], ReturnValue;


}

event BeginPlay()
{
    local /*0x03A30000-0x00000000*/ private int I;
    local /*0x03A30000-0x00000000*/ private float ActorRadius, ActorHeight;

    super(SPAIResourceManager).BeginPlay();
    // End:0xE6
    if(bReady)
    {
        I = 0;
        J0x22:

        // End:0xE6 [Loop If]
        if(I < InteractionData.Length)
        {
            // End:0xD8
            if(InteractionData[I] != none)
            {
                InteractionData[I].MyInteractionComponent = self;
                InteractionData[I].MySmartActor = ResourceManagerOuter;
                InteractionData[I].OnBeginPlay();
            }
            ++I;
            // [Loop Continue]
            goto J0x22;
        }
    }
    // End:0x21C
    if(Broadcast.bBroadcastPresence)
    {
        // End:0x172
        if((Broadcast.Radius < float(0)) || Broadcast.TimeFrequency < float(0))
        {
            Broadcast.bBroadcastPresence = false;            
        }
        else
        {
            GetOuterRadiusAndHeight(ActorRadius, ActorHeight);
            Broadcast.Radius += ActorRadius;
            Broadcast.TimeForNextBroadcast = RandRange(0.0000000, Broadcast.TimeFrequency);
            Broadcast.bReady = true;
        }
    }
    //return;    
}

event Update()
{
    local /*0x03A30000-0x00000000*/ private @NULL CurrentPawn, CurrentController;

    super.Update();
    // End:0x19B
    if(((bReady && Broadcast.bBroadcastPresence) && Broadcast.bReady) && Broadcast.TimeForNextBroadcast < GetTimeSeconds())
    {
        Broadcast.TimeForNextBroadcast = GetTimeSeconds() + Broadcast.TimeFrequency;
        // End:0x19A
        foreach GetWorldInfo().AllPawns(Class'SPEngine.SPPawn', CurrentPawn, GetOuterLocation(), Broadcast.Radius)
        {
            CurrentController = SPAIController(CurrentPawn.Controller);
            // End:0x199
            if(CurrentController != none)
            {
                CurrentController.AddSmartActor(Actor(Outer));
            }            
        }        
    }
    //return;    
}

event ShutDown()
{
    Broadcast.bReady = false;
    super(SPAIResourceManager).ShutDown();
    //return;    
}

defaultproperties
{
    Broadcast=(bBroadcastPresence=false,Radius=1000.0000000,TimeFrequency=2.0000000,TimeForNextBroadcast=0.0000000,bReady=false)
    // Reference: SPAIResLocation'Default__SPAISmartObjectInteractionComponent.SPAIResource_Access'
    begin object name=SPAIResource_Access
    end object
    AccessResource=SPAIResource_Access
}