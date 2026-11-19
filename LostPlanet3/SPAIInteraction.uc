class SPAIInteraction extends SPTickableObject
    abstract
    hidecategories(Object,Object);

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL Data[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL User[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bInteractionStarted[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000400*/ private export @NULL InteractionComponent[537395201];

function InitInteraction()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function StartInteraction()
{
    // End:0x25
    if(!bInteractionStarted)
    {
        StartExecuting();
        bInteractionStarted = true;
    }
    //return;    
}

function IsValid()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return (((Data != none) && !Data.IsPendingKill()) && User != none) && !User.IsPendingKill();
    //return ReturnValue;    
}

function HasFailed()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function HasFinished()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function NotifyAnimationDone()
{
    //return;    
}

function ReStartInteraction()
{
    // End:0x1C
    if(!bInteractionStarted)
    {
        StartExecuting();        
    }
    else
    {
        GotoState('Auto', 'Begin');
    }
    //return;    
}

defaultproperties
{
    bStartExecutionOnCreate=false
}