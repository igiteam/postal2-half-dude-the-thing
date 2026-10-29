// ThingHUD.uc
// Extends Postal 2's HUD to add sanity-based screen effects.
class ThingHUD extends HUD;

// The texture you will import (a blood splatter or red vignette with alpha)
var Texture BloodOverlayTexture; 
var float MaxNearbyFear; // The highest FearLevel found in nearby NPCs

simulated function PostRender(Canvas Canvas)
{
    local ThingSquadController SquadMate;
    local float AlphaValue;
    
    Super.PostRender(Canvas); // Draw the normal Postal 2 HUD first
    
    // 1. Find the most terrified squadmate near the player
    MaxNearbyFear = 0.0;
    foreach AllActors(class'ThingSquadController', SquadMate)
    {
        if (SquadMate.MyPawn != None && VSize(SquadMate.MyPawn.Location - Pawn.Location) < 500)
        {
            if (SquadMate.FearLevel > MaxNearbyFear)
                MaxNearbyFear = SquadMate.FearLevel;
        }
    }
    
    // 2. If fear is high, draw the blood overlay
    if (MaxNearbyFear > 60.0 && BloodOverlayTexture != None)
    {
        // Calculate how opaque the overlay should be (0.0 to 1.0)
        // Starts showing at 60 fear, maxes out at 100.
        AlphaValue = (MaxNearbyFear - 60.0) / 40.0;
        
        // Use Canvas to draw the texture stretched to the whole screen.
        Canvas.SetDrawColor(255, 255, 255, AlphaValue * 255);
        Canvas.DrawTile(BloodOverlayTexture, Canvas.ClipX, Canvas.ClipY, 0, 0, BloodOverlayTexture.USize, BloodOverlayTexture.VSize);
    }
}
