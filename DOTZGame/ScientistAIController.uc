//=============================================================================
//  Lab Guard AI Controller
//  Just a modified controller from the Kaufman controller.
//  Script by Demian
//  Edited by Gamefan74
//  April 1st, 2007
//=============================================================================
class ScientistAIController extends ZombieAIController;

var const Material OtisDeadOverlay;
var localized string xboxMsg;
var localized string PCMsg;

function Possess( Pawn p ) {
    super.Possess( p );
    p.GiveWeapon(DefaultWeaponType);
}

function Perform_NotEngaged_AtRest()
{
    curBehaviour = "Rest";
    //GotoState('NotEngaged_AtRest');
    Perform_Engaged_StandGround();
}


// Decompiled with UE Explorer.
defaultproperties
{
    iAwarenessRange=2000
    DefaultWeaponType="DEWeapons2.Glock17Weapon"
    bForceRun=true
    bMeleeAttackCapable=false
    bRangedAttackCapable=true
    MinNumShots=1
    MaxNumShots=1
    MinShotPeriod=0.4000000
    MaxShotPeriod=0.4000000
    MaxAimRange=1300.0000000
    MaxSecondsOfLOS=5.0000000
    AIType=Class'ScientistAIRole'
}