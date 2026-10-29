// ============================================================================
// ThingRecruitTrigger.uc
// The Interaction Logic.
//
// This is a Trigger actor that you place in the map. When the player
// presses the "Use" key (or the "Talk" key) near an NPC, this trigger
// fires and calls TryRecruit() on the NPC's controller.
//
// Usage in POSTed: Place this trigger near an NPC, set its Collision
// to a reasonable radius (e.g., 100), and link it to a keybinding.
// ============================================================================

class ThingRecruitTrigger extends Trigger;

// ============================================================================
// TOUCH EVENT — Called when the player touches the trigger
// ============================================================================
function Touch(Actor Other)
{
    local ThingSquadController TargetController;
    local Pawn PlayerPawn;
    
    Super.Touch(Other);
    
    // We only care about the player.
    if (!Other.IsA('Pawn') || Other.IsA('ThingMonster')) return;
    
    PlayerPawn = Pawn(Other);
    
    // Find the nearest ThingSquadController.
    // In a real mod, you would trace forward from the player to find
    // the NPC they're looking at. For this example, we just find the
    // nearest one.
    foreach AllActors(class'ThingSquadController', TargetController)
    {
        if (VSize(TargetController.MyPawn.Location - PlayerPawn.Location) < 200)
        {
            // Try to recruit the NPC.
            if (TargetController.TryRecruit(PlayerPawn))
            {
                // Play a success sound.
                // PlayerPawn.PlaySound(Sound'ThingDialog.RecruitSuccess', SLOT_Interface);
            }
            else
            {
                // Play a failure sound.
                // PlayerPawn.PlaySound(Sound'ThingDialog.RecruitFailure', SLOT_Interface);
            }
            break; // Only recruit one NPC at a time.
        }
    }
}
