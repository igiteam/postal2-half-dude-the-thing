class LPSM_PlayerPickUpTEngPickupFactory extends LPSM_PlayerPickUpGeneric
    config(Game);

function DoesUseChoreography()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Pickup;

    Pickup = LPThermalEnergyPickupFactory(MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor);
    // End:0x86
    if(Pickup != none)
    {
        return Pickup.bAutoFaceActor;
    }
    return super.DoesUseChoreography();
    //return ReturnValue;    
}

defaultproperties
{
    SoundEventName="TEnergyPickup"
    FXEventName="TEnergyPickup"
    AnimationTemplateNodeNames=/* Array type was not detected. */
}