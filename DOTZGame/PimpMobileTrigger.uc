class PimpMobileTrigger extends ScriptedSequence
    notplaceable;

var float BTReTriggerDelay;
var float TriggerTime;
var bool  bCarFlipTrigger;
var localized string ActionPickupMessage;

function Touch( Actor Other )
{
    local Pawn User;

    if( Other.Instigator != None )
    {
        User = Pawn(Other);

        if(User == None)
            return;

        if ( BTReTriggerDelay > 0 )
        {
            if ( Level.TimeSeconds - TriggerTime < BTReTriggerDelay )
                return;
            TriggerTime = Level.TimeSeconds;
        }

        // Send a string message to the toucher.
        if(!bCarFlipTrigger){
            //User.ReceiveLocalizedMessage(class'Vehicles.BulldogMessage', 0);
        //else
            //User.ReceiveLocalizedMessage(class'Vehicles.BulldogMessage', 3);
            }
    }
}

function UsedBy( Pawn user )
{
    if(bCarFlipTrigger)
    {
        PimpMobile(Owner).StartFlip(User);
    }
    else
    {
        // Enter vehicle code
        PimpMobile(Owner).TryToDrive(User);
    }
}

///////////////////////////////////////////////////////////////
/*****************************************************************
 * GetActionableMessage
 *****************************************************************
 */
simulated function string GetActionableMessage(Controller C){

return ActionPickupMessage;
}

//////////////////////////////////////////////////////////////////
/*****************************************************************
 * GetActionablePriority
 *****************************************************************
 */
function int GetActionablePriority(Controller C){
    return iActionablePriority;
}


// Decompiled with UE Explorer.
defaultproperties
{
    BTReTriggerDelay=0.1000000
    ActionPickupMessage="press  use  for enter"
    iActionablePriority=6
    bStatic=false
    bOnlyAffectPawns=true
    bHardAttach=true
    bCollideWhenPlacing=false
    RemoteRole=0
    CollisionRadius=80.0000000
    CollisionHeight=400.0000000
}