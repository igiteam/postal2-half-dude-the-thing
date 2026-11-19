//=============================================================================
//  SWAT Mac10 AI Controller
//  Script by Gamefan74, modified to fit matinee by CJ
//  Creation date: February 18th, 2007
//  Edits: 5-13-08
//=============================================================================
class SWATMac10AIController extends DOTZAIController;



var const Material OtisDeadOverlay;


//===========================================================================
//
//===========================================================================

/**
 */
function Possess( Pawn p ) {
    super.Possess( p );
    p.GiveWeapon( "DEWeapons2.Mac10Weapon" );
}

/**
 */
function bool SameTeamAs(Controller C) {
    // not a zombie, on my team.
    return (ZombieAIController(c) == None);
}


//===========================================================================
// Otis-death game logic...
//===========================================================================



/*function PawnDied(Pawn P) {
    local AdvancedPlayerController apc;

    Super.PawnDied(P);
    apc = AdvancedPlayerController( Level.GetLocalPlayerController() );
    //make sure that the player doesn't die too
    AdvancedPawn(apc.Pawn).bGodMode = true;
    //make the view of the dead otis
    apc.bBehindView = true;
    apc.SetViewTarget(p);
    apc.Unpossess();
    //apc.SpectatingOverlay = OtisDeadOverlay;
    //XBOX
    if (apc.IsA('XDotzPlayerController') == true){
      apc.SpectatingMsg = "Game Over. Press START to continue.";
    } else {
      apc.SpectatingMsg = "Game Over. Press fire to continue.";
    }
}*/


/*function bool FireWeaponAt(Actor A)
{
    //DebugLog( "Trying to fire at" @ A );
    if ( A == None ) A = Enemy;
    Target = A;
    if ( (Pawn.Weapon != None) && Pawn.Weapon.HasAmmo()
             && !Pawn.Weapon.IsFiring() ) {
        NumShotsToGo = iRandRange(MinNumShots,MaxNumShots);
        CalculateMissVectorScale();
        return WeaponFireAgain(Pawn.Weapon.RefireRate(),false);
    }
    else {
        DebugLog( "Unable to fire weapon:" @ Pawn.weapon, DEBUG_FIRING );
        return false;
    }
}*/

function Perform_NotEngaged_AtRest()
{
    curBehaviour = "Rest";
    //GotoState('NotEngaged_AtRest');
    Perform_Engaged_StandGround();
}

//===========================================================================
// Helpers
//===========================================================================



//===========================================================================
// Default Properties
//===========================================================================


// Decompiled with UE Explorer.
defaultproperties
{
    MinNumShots=1
    MaxNumShots=1
    MinShotPeriod=0.0250000
    MaxShotPeriod=0.0250000
    MaxAimRange=1000.0000000
    MaxSecondsOfLOS=5.0000000
}