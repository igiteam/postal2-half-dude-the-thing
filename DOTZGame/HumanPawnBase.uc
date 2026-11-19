/**
 * HumanPawn - base class for all "regular" people in DOTZ, i.e. non-zombies.
 *
 * @version $Rev: 5489 $
 * @author  Jesse LaChapelle (jesse@digitalextremes.com)
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @date    June 2004
 */
class HumanPawnBase extends XDOTZPawnBase
abstract notplaceable
   HideDropDown;



/**
 */
function bool TakeHeadShotsFrom(Pawn Instigator){
   return false;
}

/**
 * ShouldDoRagdoll - ragdolls can move away from the pawn location,
 * which makes eating look dumb.
 */
function bool ShouldDoRagdoll(){
   return false;
}

function AdvancedPlayAnim( name Sequence, optional float Rate,
                           optional float TweenTime, optional int Channel,
                           optional bool bLoop, optional bool bFocus){
    super.AdvancedPlayAnim(Sequence, Rate, TweenTime, Channel, bLoop, bFocus);
    Log (self @ sequence @ channel);
}


/**
 * Otis and Jack should never really get destroyed during gameplay, but just in
 * case something weird happens, let the player controller sort it out...
 */
simulated function Destroyed() {
    super.Destroyed();
    if (Level.Game !=None){
      AdvancedGameInfo(Level.Game).GameOver(); //@@@
    }
}


// Decompiled with UE Explorer.
defaultproperties
{
    AdditionalAnimPkg=/* Array type was not detected. */
    AnimJump="JumpF"
    AnimJumpForward="JumpF"
    AnimJumpBack="JumpB"
    AnimJumpLeft="JumpL"
    AnimJumpRight="JumpR"
    AnimCrouchTurnLeft="CrouchTurnL"
    AnimCrouchTurnRight="CrouchTurnR"
    AnimCrouchDeathBack="DeathB"
    AnimCrouchDeathForward="DeathF"
    AnimCrouchDeathLeft="DeathL"
    AnimCrouchDeathRight="DeathR"
    AnimCrawlDeathBack="DeathB"
    AnimCrawlDeathForward="DeathF"
    AnimCrawlDeathLeft="DeathL"
    AnimCrawlDeathRight="DeathR"
    BoredomThreshold=8
    BoredomDeviation=1
}