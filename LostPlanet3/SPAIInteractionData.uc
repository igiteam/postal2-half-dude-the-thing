class SPAIInteractionData extends Object
    abstract
    editinlinenew
    hidecategories(Object);

struct native InteractionAnimationInfo
{
    var(__NotifyAccessLostDelegate__Delegate) /*0x02C80000-0x00000000*/ private @NULL TemplateAnimTree[65537];
    var(__NotifyAccessLostDelegate__Delegate) /*0x02C80000-0x00000000*/ private name TemplateAnimName[65537];
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL Interaction;

    structdefaultproperties
    {
        TemplateAnimTree=none
        TemplateAnimName="None"
        Interaction=none
    }
};

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private class GeneratedInteractionClass[131073];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL MySmartActor[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000400*/ private export @NULL MyInteractionComponent[537395201];

// Export USPAIInteractionData::execIsAllowedToInteractWithActor(FFrame&, void* const)
native event IsAllowedToInteractWithActor()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIInteractionData::execIsAccessPossible(FFrame&, void* const)
native function IsAccessPossible()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

function OnBeginPlay()
{
    //return;    
}

function CreateInteractionInstance()
{
    local /*0x03A30000-0x00000000*/ private @NULL User[8388609], ReturnValue, NewInteraction;

    NewInteraction = none;
    // End:0x123
    if((User != none) && MySmartActor != none)
    {
        NewInteraction = SPAIInteraction(GeneratedInteractionClass.static.Create());
        // End:0x123
        if(NewInteraction != none)
        {
            NewInteraction.User = User;
            NewInteraction.Data = self;
            // End:0xF9
            if(NewInteraction.InitInteraction())
            {
                NewInteraction.StartInteraction();                
            }
            else
            {
                NewInteraction.Destroy();
                NewInteraction = none;
            }
        }
    }
    return NewInteraction;
    //return ReturnValue;    
}

function GetAccessToSmartActor()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x03A30000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    return MyInteractionComponent.GetAccess('SmartObjectAccess', Requester, RevokeTolerance);
    //return ReturnValue;    
}

function GetController()
{
    local /*0x03A30000-0x00000000*/ private @NULL Requester[8388609], ReturnValue, inPawn, InController;

    InController = SPAIController(Requester);
    // End:0x87
    if(InController == none)
    {
        inPawn = SPAIPawn(Requester);
        // End:0x87
        if(inPawn != none)
        {
            InController = SPAIController(inPawn.Controller);
        }
    }
    return InController;
    //return ReturnValue;    
}
