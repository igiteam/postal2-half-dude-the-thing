class MeleeBase extends ZombiePawnBase
abstract notplaceable
   HideDropDown;

var() class<WeaponAttachment> MeleeWeaponClass;
var() class<WeaponPickup> MeleePickupClass;
var WeaponAttachment MeleeWeapon;
var int HeadShotHack;


simulated function PostNetReceive(){
   super.PostNetReceive();
   if (Health <=0){
    if (MeleeWeapon != none){
      DetachFromBone(MeleeWeapon);
      MeleeWeapon.Destroy();
    }

   }
}

simulated function PostNetBeginPlay(){

   super.PostNetBeginPlay();
   //attach a weapon
   SetCollision(false,false,false);
   MeleeWeapon = Spawn(MeleeWeaponClass,self,,Location);
   if (MeleeWeapon != none){
      AttachToBone(MeleeWeapon, 'Weapon');
   }
   SetCollision( default.bCollideActors, default.bBlockActors, default.bBlockPlayers);

}

/*****************************************************************
 * PostBeginPlay
 *****************************************************************
 */
function BeginPlay(){

   walks.length = 1;
   walks[0] = 'WalkF';
   super.BeginPlay();

   //No dashing
   ZombieAIRole(ZombieAIController(Controller).myAIRole).bAllowedToCharge = false;

   //set attack anims for melee
    MeleeAttacks.remove(1,2); //leave attackrighta
    MeleeAttacks.remove(2,4); //leave attacklefta

    //Hack out the ablility to blow off arms and legs
    SpecialDamage.Remove( 6, 2 );
    SpecialDamage.Remove(0,4);
}


/*****************************************************************
 * DoSpecialDamage
 * Overridden to check for leg damage to convert these guys into crawlers.
 *****************************************************************
 */
function int DoSpecialDamage( vector Hitlocation, vector HitDirection,
                                int Damage ) {
   HeadShotHack++;
   if (HeadShotHack < 7){
      return Damage;
   }

   return super.DoSpecialDamage(HitLocation, HitDirection, Damage);

}

/*****************************************************************
 * Melee_Attack
 * Called by the controller to make the pawn do a melee attack
 *****************************************************************
 */
function Melee_Attack(){
   local int index;
   //don't do anything while playing focus
   if (IsAnimating(FOCUSCHANNEL) == true){
    // ("Melee damage failed");
      return;
   }
   SetBoredomTimer(false);
   //Walking
   index = int(Frand()*MeleeAttacks.length);
   //Log(MeleeAttacks[index].MeleeAttackAnim);
   AnimBlendParams(FIRINGCHANNEL,1,,,FIRINGBLENDBONE);
   AdvancedPlayAnim(MeleeAttacks[index].MeleeAttackAnim,1,0.8,FIRINGCHANNEL);
}


/*****************************************************************
 * Notify_MeleeDamage
 *****************************************************************
 */
function Notify_MeleeDamage(){
   AttemptMeleeDamage();
}


//===========================================================================
// State FocusedAnimation
//
//===========================================================================
//state  FocusedAnimation
//{
//
//}

/*****************************************************************
 * Died
 * turn off you timers
 *****************************************************************
 */
function Died(Controller killer, class<DamageType> type, vector hitlocation){
    local WeaponPickup temp;
    super.Died(killer, type, hitlocation);
    if (MeleeWeapon != none){
      DetachFromBone(MeleeWeapon);
      MeleeWeapon.Destroy();
    }
    temp = Spawn(MeleePickupClass);
    temp.InitDroppedPickupFor(None);
    temp.Velocity.X = FRand()*30;
    temp.Velocity.Y = FRand()*30;
    temp.Velocity.Z = FRand()*30;
}


//===========================================================================
// defaultproperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    iMeleeDamageRadius=110
    iMeleeAttackRange=100
    iMeleeDamageAmount=35
    AnimRunForward="WalkF"
    AnimRunBack="WalkB"
    AnimRunLeft="WalkL"
    AnimRunRight="WalkR"
    bAllowedToFall=false
    Health=200
    ControllerClass=Class'DOTZAI.NoChargeZombieController'
    MovementAnims[1]="WalkB"
    MovementAnims[2]="WalkL"
}