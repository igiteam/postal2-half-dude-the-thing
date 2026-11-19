class LPSM_PlayerPickUpScrap extends LPSM_PlayerPickUpGeneric
    config(Game);

function DoesUseChoreography()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ScrapPickUp;

    ScrapPickUp = LPScrapPickupFactory(MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor);
    // End:0x86
    if(ScrapPickUp != none)
    {
        return ScrapPickUp.bAutoFaceActor;
    }
    return super.DoesUseChoreography();
    //return ReturnValue;    
}

defaultproperties
{
    SoundEventName="PickedUpScrap"
    FXEventName="PickedUpScrap"
    AnimationTemplateNodeNames=/* Array type was not detected. */
}