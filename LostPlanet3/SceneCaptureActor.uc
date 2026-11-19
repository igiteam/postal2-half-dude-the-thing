class SceneCaptureActor extends Actor
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x42FC0000-0x00000400*/ private export @NULL SceneCapture[720897];

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bEnable;

    // End:0x11
    if(SceneCapture == none)
    {
        return;
    }
    // End:0x57
    if(Action.InputLinks[0].bHasImpulse)
    {
        bEnable = true;        
    }
    else
    {
        // End:0x9D
        if(Action.InputLinks[1].bHasImpulse)
        {
            bEnable = false;            
        }
        else
        {
            // End:0x101
            if(Action.InputLinks[2].bHasImpulse)
            {
                bEnable = !SceneCapture.bEnabled;
            }
        }
    }
    SceneCapture.SetEnabled(bEnable);
    //return;    
}

defaultproperties
{
    Components[0]=none
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bNoDelete=true
}