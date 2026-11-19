class SPDActionList extends Object
    editinlinenew
    hidecategories(Object);

var(__OnDestroyed__Delegate) /*0x02890000-0x00000000*/ private bool bEnabled[65537];
var(__OnDestroyed__Delegate) /*0x02890000-0x00000000*/ private bool ShowDebug[65537];
var(__OnDestroyed__Delegate) /*0x02890000-0x00000400*/ private editfixedsize array Action[589825];
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private editfixedsize string DebugString;

simulated function HasActions()
{
    local /*0x01C00000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x01C00000-0x00000000*/ private int Idx;

    // End:0x12
    if(Action.Length < 0)
    {
        return false;
    }
    Idx = 0;
    J0x1D:

    // End:0x5E [Loop If]
    if(Idx < Action.Length)
    {
        // End:0x50
        if(Action[Idx] != none)
        {
            return true;
        }
        Idx++;
        // [Loop Continue]
        goto J0x1D;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    bEnabled=true
}