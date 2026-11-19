/**
 * ZombiePawn - base class for all enemies (zombies) in DOTZ
 *
 * @version $Rev: 5241 $
 * @author  Jesse LaChapelle (jesse@digitalextremes.com)
 * @date    June 2004
 */
class ZombiePawnBase extends XDOTZPawnBase
abstract notplaceable
   HideDropDown;



const MELEE_DAMAGE = 1;


var array<string> Names;
var class<emitter> InfectiousEmitterClass;
var emitter InfectiousEmitter;
var bool bInfectious;

struct MeleeInfo{
   var name MeleeAttackAnim;
   var bool bFunctional;
   var int DamageDelay;
   var array<name> ReqBones;
};

var int iMeleeDamageRadius;
var int iMeleeAttackRange;
var int iMeleeDamageAmount;

var array<MeleeInfo> MeleeAttacks;
var array<MeleeInfo> CrawlingMeleeAttacks;
var class<DamageType> ZombieDamage;

var array<name> Walks;
var array<name> LegBones;
var array<name> LeftArmBones;
var array<name> RightArmBones;

var bool bCrawlTransition;
var name AnimCrawlingTransition;
var bool bPlayedFallOnFace;

var sound SquiggleSound;

var array<sound> PlayerHitSound;
var array<sound> NonPlayerHitSound;

const SQUIRMTIMER = 334;


/*****************************************************************
 *
 *****************************************************************
 */
simulated function PostNetReceive(){
   super.PostNetReceive();
   if (Health <=0){
      if (InfectiousEmitter != none){
         //DetachFromBone(InfectiousEmitter);
         InfectiousEmitter.Destroy();
      }
   }
}

/*****************************************************************
 * BeginPlay
 * Provides multiple walk cycles for the the zombies
 *****************************************************************
 */
function BeginPlay(){
   Super.BeginPlay();
   AnimWalkForward = Walks[int(Frand()*Walks.length)];
   SetToughness(AdvancedGameInfo(Level.Game).iEnemyDiffLevel);
   if (DOTZGameInfoBase(Level.Game).bNameCheat==true){
      HudCaption = Names[int(Frand()*Names.length)];
   }
  if(bInfectious==true && InfectiousEmitter ==None){
      InfectiousEmitter = Spawn(InfectiousEmitterClass);
      InfectiousEmitter.bHardAttach = true;
      InfectiousEmitter.SetBase(self);
    }
}

/*****************************************************************
 * PostNetBeginPlay
 *****************************************************************
 */
//function PostNetBeginPlay(){
//   super.PostNetBeginPlay();

//}

/*****************************************************************
 *
 *****************************************************************
 */
function SetToughness(int toughness){
   switch(toughness){
   case 0:
      DiffDamageMultiplier = 2;
      break;
   case 1:
      DiffDamageMultiplier = 1;
       break;
   case 2:
      DiffDamageMultiplier = 0.3;
      break;
   }

}


/*****************************************************************
 * UpdateDifficultyLevel
 * zombies don't change toughness with difficulty level
 *****************************************************************
 */
function UpdateDifficultyLevel(int NewDifficulty){
   DifficultyLevel = NewDifficulty;
   switch NewDifficulty{
      case 0:
      DiffDamageMultiplier = 2;
      break;
      case 1:
      DiffDamageMultiplier = 1;
      break;
      case 3:
      DiffDamageMultiplier= 0.8;
      break;
   }
}

simulated function PostNetBeginPlay(){
    super.PostNetBeginPlay();
    if(bInfectious==true && InfectiousEmitter ==None){
      InfectiousEmitter = Spawn(InfectiousEmitterClass);
      InfectiousEmitter.bHardAttach = true;
      InfectiousEmitter.SetBase(self);
    }
   SetAppearance();
}

/*****************************************************************
 * SetAppearance
 * Crazy cool tech to randomize characters head/bodies. Might want
 * to add some attachment arrays here to do things like add hats/glasses
 * to some characters and not other,
 *****************************************************************
 */
function SetAppearance(){
   SetCustomAppearance(int(HeadTextures.length * Frand()),
                    int(BodyTextures.length * Frand()));
}

/*****************************************************************
 * Touch
 * An attempt to pass more info to the controller, to make it more
 * responsive to its environment
 *****************************************************************
 */
function Touch(Actor A){
    Super.Touch(A);
                // Log( self @ "touched by" @ a  )    ;
    if (Controller !=None){
        DOTZAIController(Controller).Touch(A);
    }
}



/*****************************************************************
 * Melee_Attack
 * Called by the controller to make the pawn do a melee attack
 *****************************************************************
 */
function Melee_Attack(){

   local int index;

//    Log("Melee Attack!");

   //don't do anything while playing focus
   if (IsAnimating(FOCUSCHANNEL) == true){
                  // Log( self @ "Melee damage failed" )    ;
      return;
   }

   SetBoredomTimer(false);

   //Walking
   if (!bIsCrawling){
      index = int(Frand()*MeleeAttacks.length);
      if (ConfirmBonesUnDamaged(MeleeAttacks[index].ReqBones)) {
         AnimBlendParams(FIRINGCHANNEL,1,,,FIRINGBLENDBONE);
         AdvancedPlayAnim(MeleeAttacks[index].MeleeAttackAnim,1,0.2,FIRINGCHANNEL);
         //ServerSetAnimAction(MeleeAttacks[index].MeleeAttackAnim);
      } else {
         MeleeAttacks.remove(index, 1);
      }

   //Crawling (cannot attack while moving)
   } else if (velocity.X == 0 && velocity.Y == 0) {
      index = int(Frand()*CrawlingMeleeAttacks.length);
      if (ConfirmBonesUnDamaged(CrawlingMeleeAttacks[index].ReqBones)){
         AnimBlendParams(FIRINGCHANNEL,1,,,);
         AdvancedPlayAnim(CrawlingMeleeAttacks[index].MeleeAttackAnim,1,0.2,FIRINGCHANNEL);
         //ServerSetAnimAction(CrawlingMeleeAttacks[index].MeleeAttackAnim);
      } else {
         CrawlingMeleeAttacks.remove(index, 1);
      }
   }
}

/*****************************************************************
 * DoSpecialDamage
 * Overridden to check for leg damage to convert these guys into crawlers.
 *****************************************************************
 */
function int DoSpecialDamage( vector Hitlocation, vector HitDirection,
                                int Damage ) {
    local float newDamage;

    newDamage = Super.DoSpecialDamage(Hitlocation, HitDirection, Damage);

    if (!ConfirmBonesUndamaged(LegBones) || bIsCrawling == true){
        //SwitchToCrawling();

        //legs must have just been broken
        if (bIsCrawling == false){
            bIsCrawling = true;

            Controller.bRun = 0; // in case they are running
            Velocity = Velocity + (250 * (vector(Rotation) + vect(0,0,0.5)));

            if (AnimCrawlingTransition != '' && HasAnim(AnimCrawlingTransition)){
//                AnimBlendParams(FIRINGCHANNEL,0.8,,,FIRINGBLENDBONE);
                AnimBlendParams(FIRINGCHANNEL,0.8);
                //AdvancedPlayAnim(AnimCrawlingTransition,1,0.1);
                AdvancedPlayAnim(AnimCrawlingTransition, 1,0.1,FIRINGCHANNEL);
                bCrawlTransition = true;
            }
        }
        //both arms missing means fall on your face
        if ( (!ConfirmBonesUndamaged(RightArmBones)
                || !ConfirmBonesUndamaged(LeftArmBones))
                && bPlayedFallOnFace == false ) {
            bPlayedFallOnFace = true;
            AmbientSound      = SquiggleSound;
            //PlayFocusedAnimation('CrawlAttackSqwirm');
            bTakesDamageInFocused=true;
            AdvancedPlayAnim('CrawlAttackSqwirm',,,,,true);
            SetPhysics(PHYS_Falling);
            SetMultiTimer(SQUIRMTIMER, 30, false);
        }

    }
    return NewDamage;
}



/*****************************************************************
 * Died
 * turn off you timers
 *****************************************************************
 */
function Died(Controller killer, class<DamageType> type, vector hitlocation){
    super.Died(killer, type, hitlocation);
    SetMultiTimer(SQUIRMTIMER,0,false);
}

/*****************************************************************
 * Destroyed
 *****************************************************************
 */
simulated function Destroyed(){
   super.Destroyed();
    if (InfectiousEmitter != none){
      InfectiousEmitter.Destroy();
    }
}

function MultiTimer(int ID){

    if (ID ==SQUIRMTIMER){
        TakeDamage(200,self,vect(0,0,0),vect(0,0,0),none);
    }
    super.MultiTimer(ID);
}

/**
 */
function FocusedAnimEnd(){
   Super.FocusedAnimEnd();

   if (bPlayedFallOnFace == true){
      //PlayFocusedAnimation('CrawlAttackSqwirm');
      bTakesDamageInFocused=true;
      AdvancedPlayAnim('CrawlAttackSqwirm',,,,,true);
      AttemptMeleeDamage();
   }
}


/*****************************************************************
 * PlayTakeHit
 *****************************************************************
 */
function PlayTakeHit(vector HitLoc, int Damage, class<DamageType> damageType) {

   local name HitAnim;
   local E_HitPart hitPart;

   //turn off the boredom timer
   SetBoredomTimer(false);

   hitPart = calcHitPart( hitLoc );
   Spawn(BloodEmitter,,,HitLoc);

   PlayHitSound();
   ViewKick(ViewKickMagnitude);


      switch ( hitPart ) {
   case HIT_Back:
       HitAnim = HitBack[int(Frand()*HitBack.length)];
       break;
   case HIT_Head:
       HitAnim = HitHead[int(Frand()*HitHead.length)];
       break;
   case HIT_Chest:
       HitAnim = HitFront[int(Frand()*HitFront.length)];
       break;
   case HIT_Left:
       HitAnim = HitLeft[int(Frand()*HitLeft.length)];
       break;
   case HIT_Right:
   default:
       HitAnim = HitRight[int(Frand()*HitRight.length)];
       break;
   }

               // Log( self @ "Hitanim : " $ Hitanim )    ;
   if (bCrawlTransition == false){
                  // Log( self @ "Playing Hit animation" )    ;
      AnimBlendParams(TAKEHITCHANNEL,1,,,FIRINGBLENDBONE);
      AdvancedPlayAnim(HitAnim,1,hitblend,TAKEHITCHANNEL);
   }
   bCrawlTransition = false;
}

/*****************************************************************
 * Notify_MeleeDamage
 *****************************************************************
 */
function Notify_MeleeDamage(){
               // Log( self @ "MeleeDamage" )    ;
    //don't do anything while playing focus
   if (IsAnimating(FOCUSCHANNEL) == true){
                  // Log( self @ "Melee damage failed" )    ;
      return;
   }
   AttemptMeleeDamage();
}

/*****************************************************************
 * AttemptMeleeDamage
 *****************************************************************
 */
function AttemptMeleeDamage(){

   local actor temp;
   local vector DamageLocation;
   local bool hittest;
   local bool hitplayer;

   hittest = false;
   hitplayer = false;

   //do damage to a radius a little in front of the zombie
   DamageLocation = Location + (Normal(vector(Rotation)) * iMeleeAttackRange);
   Foreach CollidingActors(class'actor', temp,
                           iMeleeDamageRadius, DamageLocation){
      if (temp != self){
         //if not doing damage through a wall
         if (temp.IsA('Pawn')){
            if (FastTrace(Location, temp.Location)){
               hitplayer = true;
               hittest = true;
            } else {
               continue;
            }
         } else  if (FastTrace(Location, temp.Location)){
               hittest = true;
         }
         temp.TakeDamage(iMeleeDamageAmount, self,vect(0,0,0),
                            vect(0,0,0),ZombieDamage);

      }
   }

   //yet another sound hack to keep up with Jared
   if (hittest == true){
        if (hitplayer == true){
            PlaySound(PlayerHitSound[Frand()*PlayerHitSound.length]);
        } else {
            PlaySound(NonPlayerHitSound[Frand()*NonPlayerHitSound.length]);
        }
   }
}


//===========================================================================
// Default Properties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    InfectiousEmitterClass=Class'BBParticles.BBPPawnFlies'
    iMeleeDamageRadius=90
    iMeleeAttackRange=85
    iMeleeDamageAmount=20
    MeleeAttacks[0]=(MeleeAttackAnim="AttackRightA",bFunctional=true,DamageDelay=0,ReqBones=ReqBones[0]="RUpperArm"
    ReqBones[1]="RForearm")
    MeleeAttacks[1]=(MeleeAttackAnim="AttackRightB",bFunctional=true,DamageDelay=0,ReqBones=ReqBones[0]="RUpperArm"
    ReqBones[1]="RForearm")
    MeleeAttacks[2]=(MeleeAttackAnim="AttackRightC",bFunctional=true,DamageDelay=0,ReqBones=ReqBones[0]="RUpperArm"
    ReqBones[1]="RForearm")
    MeleeAttacks[3]=(MeleeAttackAnim="AttackLeftA",bFunctional=true,DamageDelay=0,ReqBones=ReqBones[0]="LUpperArm"
    ReqBones[1]="LForearm")
    MeleeAttacks[4]=(MeleeAttackAnim="AttackLeftB",bFunctional=true,DamageDelay=0,ReqBones=ReqBones[0]="LUpperArm"
    ReqBones[1]="LForearm")
    MeleeAttacks[5]=(MeleeAttackAnim="AttackLeftC",bFunctional=true,DamageDelay=0,ReqBones=ReqBones[0]="LUpperArm"
    ReqBones[1]="LForearm")
    MeleeAttacks[6]=(MeleeAttackAnim="AttackTwoHand",bFunctional=true,DamageDelay=0,ReqBones=ReqBones[0]="RUpperArm"
    ReqBones[1]="RForearm"
    ReqBones[2]="LUpperArm"
    ReqBones[3]="LForearm")
    MeleeAttacks[7]=(MeleeAttackAnim="AttackBite",bFunctional=true,DamageDelay=0,ReqBones=none)
    CrawlingMeleeAttacks[0]=(MeleeAttackAnim="CrawlAttackBite",bFunctional=true,DamageDelay=0,ReqBones=none)
    CrawlingMeleeAttacks[1]=(MeleeAttackAnim="CrawlAttackFall",bFunctional=true,DamageDelay=0,ReqBones=ReqBones[0]="RUpperArm"
    ReqBones[1]="RForearm")
    CrawlingMeleeAttacks[2]=(MeleeAttackAnim="CrawlAttackRight",bFunctional=true,DamageDelay=0,ReqBones=ReqBones[0]="RUpperArm"
    ReqBones[1]="RForearm")
    ZombieDamage=Class'DOTZEngine.DOTZBluntImpactDamage'
    Walks[0]="WalkF"
    LegBones[0]="LCalf"
    LegBones[1]="RCalf"
    LeftArmBones[0]="LUpperArm"
    LeftArmBones[1]="LForearm"
    RightArmBones[0]="RUpperArm"
    RightArmBones[1]="RForearm"
    AnimCrawlingTransition="CrawlTrans"
    PlayerHitSound[0]=Sound'DOTZXCharacters.PlayerImpactSounds.MeleeImpact1'
    PlayerHitSound[1]=Sound'DOTZXCharacters.PlayerImpactSounds.MeleeImpact2'
    PlayerHitSound[2]=Sound'DOTZXCharacters.PlayerImpactSounds.MeleeImpact3'
    PlayerHitSound[3]=Sound'DOTZXCharacters.PlayerImpactSounds.MeleeImpact4'
    PlayerHitSound[4]=Sound'DOTZXCharacters.PlayerImpactSounds.MeleeImpact5'
    PlayerHitSound[5]=Sound'DOTZXCharacters.PlayerImpactSounds.MeleeImpact6'
    NonPlayerHitSound[0]=Sound'DOTZXDestruction.DoorImpactSounds.DoorImpact1'
    NonPlayerHitSound[1]=Sound'DOTZXDestruction.DoorImpactSounds.DoorImpact2'
    NonPlayerHitSound[2]=Sound'DOTZXDestruction.DoorImpactSounds.DoorImpact3'
    NonPlayerHitSound[3]=Sound'DOTZXDestruction.DoorImpactSounds.DoorImpact4'
    bUseNotifyFootStep=true
    AdditionalAnimPkg=/* Array type was not detected. */
    BoredStandingAnimList=/* Array type was not detected. */
    BoredCrawlAnimList=/* Array type was not detected. */
    SplutEmitter=Class'BBParticles.BBPGibZombie'
    BoredomThreshold=6
    BoredomDeviation=2
    FootStepSound=/* Array type was not detected. */
    FootStepDirt=/* Array type was not detected. */
    FootStepMetal=/* Array type was not detected. */
    FootStepPlant=/* Array type was not detected. */
    FootStepRock=/* Array type was not detected. */
    FootStepWater=/* Array type was not detected. */
    FootStepWood=/* Array type was not detected. */
    SpecialDamage=/* Array type was not detected. */
    bUseSpecialDamage=true
    OnKilledEvent="ZombieKilled"
    MinimumDamageThreshold=2
    bCanCrouch=false
    bCanStrafe=false
    GroundSpeed=300.0000000
    JumpZ=100.0000000
    WalkingPct=0.4000000
    Health=130
    ControllerClass=Class'DOTZAI.ZombieAIController'
    BaseMovementRate=300.0000000
    MovementAnims[1]="WalkL"
    MovementAnims[2]="WalkR"
    BlendChangeTime=0.0200000
}