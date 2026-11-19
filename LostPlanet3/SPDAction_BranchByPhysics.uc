class SPDAction_BranchByPhysics extends SPDAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__OnDestroyed__Delegate) /*0x02670000-0x00000400*/ private editfixedsize @NULL BranchedActionLists[589825];
var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private byte PhysicsType[65537];
var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private bool bBranchIfNotPhysType[65537];

event Run()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x01C00000-0x00000000*/ private bool bPhysMatch;

    // End:0x143
    if(Actor != none)
    {
        // End:0x7A
        if((int(PhysicsType) == int(4)) && SPPawn(Actor) != none)
        {
            bPhysMatch = int(SPPawn(Actor).Physics) == int(4);            
        }
        else
        {
            bPhysMatch = int(Actor.Physics) == int(PhysicsType);
        }
        // End:0x143
        if((bPhysMatch && bBranchIfNotPhysType == false) || !bPhysMatch && bBranchIfNotPhysType == true)
        {
            // End:0x140
            if(BranchedActionLists != none)
            {
                manager.AddActionListWithDamageInfo(BranchedActionLists, Actor, 0, DamageInfo);
            }
            return 2;
        }
    }
    return 1;
    //return ReturnValue;    
}
