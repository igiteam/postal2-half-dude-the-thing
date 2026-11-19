class HumanFactory extends OpponentFactory;


var array<name> SpawnAnims; //no longer configurable by LD's
var(OpponentFactory) string AlternateAnimationSet;
var() string DefaultWeaponType;


struct SpawnType{
    var() string Package;
    var() name Animation;
};

var(OpponentFactory) array<SpawnType> xSpawnAnims;

/**
 */
function OpponentInfo spawnOpponent() {
    local int i;
    local OpponentInfo result;
    local AdvancedPawn p;

    result = super.spawnOpponent();
    p = AdvancedPawn( result.pawn );

    if ( p != none && AlternateAnimationSet != "" ) {
        p.SwapAnimationSet( alternateAnimationSet );
    }

    //set up the pawn with all the spawn packages specified
    for (i=0;i<xSpawnAnims.Length;i++){
        p.bHidden = true;
        p.AddAnimationPackage(xSpawnAnims[i].Package);
        SpawnAnims[i] = xSpawnAnims[i].Animation;
    }

    return result;
}


//===========================================================================
// Default Properties
//===========================================================================

