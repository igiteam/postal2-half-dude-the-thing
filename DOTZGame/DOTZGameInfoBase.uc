class DOTZGameInfoBase extends AdvancedGameInfo;

//these are in game variables that apply to the current game
var int CurrentChapter;
var int CurrentPage;
var ObjectivesManager theObjMgr;

//these are global values tha apply to the entire game
var config int BestChapter;
var config int BestPage;
//var bool bPauseWithMenu;

var bool bNameCheat;


function string GetCurrentProfileName(){
   return DOTZPlayerControllerBase(Level.GetLocalPlayerController()).GetCurrentProfileName();
}


/*****************************************************************
 * GameOver
 * Call to game over whenever a human pawn dies in singleplayer
 * set the local player controller to 'dead'
 *****************************************************************
 */
function GameOver(){
    AdvancedPlayerController(Level.GetLocalPlayerController()).GameOver();
    Level.Game.SetPause(true,Level.GetLocalPlayerController());
}

/*****************************************************************
 * GiveDefaultInventory
 *****************************************************************
 */
function GiveDefaultInventory(Pawn P){
   AdvancedPawn(P).SetInventoryLimit(1,'MeleeWeapon');
   AdvancedPawn(P).SetInventoryLimit(1,'GlockWeapon');
   AdvancedPawn(P).SetInventoryLimit(1,'M16Weapon');
   AdvancedPawn(P).SetInventoryLimit(1,'RevolverWeapon');
   AdvancedPawn(P).SetInventoryLimit(1,'RifleWeapon');
   AdvancedPawn(P).SetInventoryLimit(1,'ShotgunWeapon');
   AdvancedPawn(P).SetInventoryLimit(1,'SniperWeapon');
   AdvancedPawn(P).SetInventoryLimit(1,'GrenadeWeapon');
   AdvancedPawn(P).SetInventoryLimit(1,'MolotovWeapon');
   Log("Giving Weapon to the player");
   P.GiveWeapon(DefaultInventory);
}

/*****************************************************************
 * RevealChapter
 *****************************************************************
 */
function RevealChapter(int ChapterNumber, int PageNumber){

    //update the local game copies
    CurrentChapter = ChapterNumber;
    CurrentPage = PageNumber;

    //Update the global copies, set chapter if it is better
    if (ChapterNumber > class'DOTZGameInfoBase'.default.BestChapter){
        class'DOTZGameInfoBase'.default.BestChapter = ChapterNumber;
    }

    //make sure that an old chapter doesn't adjust this value
    if (CurrentChapter >= class'DOTZGameInfoBase'.default.BestChapter){
        //set page if it is better
        if (PageNumber > class'DOTZGameInfoBase'.default.BestPage || PageNumber == -1){
            class'DOTZGameInfoBase'.default.BestPage  = PageNumber;
        }
    }
    class'DOTZGameInfoBase'.static.StaticSaveConfig();
}

/*****************************************************************
 * GetCurrentChapter
 *****************************************************************
 */
static function int GetBestChapter(){
    return class'DOTZGameInfoBase'.default.BestChapter;
}

/*****************************************************************
 * GetCurrentPage
 *****************************************************************
 */
static function int GetBestPage(){
    return class'DOTZGameInfoBase'.default.BestPage;
}




//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    PreloadObjects=/* Array type was not detected. */
    PreloadMesh=/* Array type was not detected. */
    PreloadMaterial=/* Array type was not detected. */
    DefaultInventory="DOTZWeapons.FistWeapon"
}