// ============================================================================
// ThingGameInfo.uc
// The Injection Point.
//
// This class is the bridge between Postal 2's native game and your custom
// Thing AI. It overrides the standard game info class and runs a function
// called PrepActorsByGroup() before the level starts.
//
// Base Class: P2GameInfoSingle (Postal 2's single-player game info)
// Source for PrepActorsByGroup: ModDB "Basic AI Changes" Tutorial
// ============================================================================

class ThingGameInfo extends P2GameInfoSingle;

// ============================================================================
// PREP ACTORS BY GROUP — The Injection Hook
// ============================================================================
// This function runs BEFORE the level starts. It loops through every Actor
// in the map. If it finds a Pawn with a Controller, it swaps the Controller
// for our ThingSquadController.
function PrepActorsByGroup()
{
    local Pawn P;
    local ThingSquadController NewController;
    local int SwapCount;

    Super.PrepActorsByGroup(); // Call the parent function first.

    SwapCount = 0;

    // Loop through every Pawn in the level.
    foreach AllActors(class'Pawn', P)
    {
        // We only want to swap human NPCs (Bystanders, Cops, etc.)
        // We skip the Player, and we skip any Pawn that is already a Thing.
        if (P.Controller != None && !P.IsA('PlayerController') && !P.IsA('ThingMonster'))
        {
            // Spawn our custom controller.
            NewController = Spawn(class'ThingSquadController', P);
            
            if (NewController != None)
            {
                // Destroy the old controller.
                P.Controller.Destroy();
                
                // Possess the Pawn with our new controller.
                NewController.Possess(P);
                
                // Copy over any important data from the old controller.
                // (This is a simplified example. In a full mod, you would copy
                // the Pawn's inventory, health, and any other state.)
                
                SwapCount++;
                Log("THING: Injected ThingSquadController into " $ P);
            }
        }
    }
    
    Log("THING: Total NPCs infected with new AI: " $ SwapCount);
}
