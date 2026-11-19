class DBB extends HumanPawnBase
placeable;

var() string DefaultWeaponType;
/**
 */

event PreBeginPlay()
{
    Super.PreBeginPlay();
    if(DefaultWeaponType != "")
    {
    GiveWeapon(DefaultWeaponType);
    }
}



function bool TakeHeadShotsFrom(Pawn Instigator){

//if(IsHumanControlled()){
return true;
//}
  // return false;
}


simulated function Destroyed() {
    super(AdvancedPawn).Destroyed();
  //  if (Level.Game !=None){
   //   AdvancedGameInfo(Level.Game).GameOver(); //@@@
  //  }
}

/*****************************************************************
 * TakeDamage
 * Like the normal take damage but doesn't add velocity to the player
 * if they are mounted in a mount point.
 *****************************************************************
 */
function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
                     vector momentum, class<DamageType> damageType)
{
    local AdvancedPlayerController apc;
    local E_HitPart hitPart;

    apc = AdvancedPlayerController(Controller);
    SetBoredomTimer(true);
    Spawn(BloodEmitter,,,HitLocation);


   Log(Damage $ " Damage caused by: " $ instigatedBy);

    Damage = Damage * DiffDamageMultiplier;
    // SV:: fire damage gets set to 0 here, reset it to 1
    if(Damage < 1)
        Damage = 1;

    if (Damage < MinimumDamageThreshold){
      PlayHit(Damage,InstigatedBy, hitLocation, damageType, Momentum);
      Damage = 0; //still want momentum'n'stuff applied
    }

    //We only add the velocity to the player if they are NOT
    //mounted. This is to stop them from jumping around'n'stuff
    if ( apc != None && objMount != None ){
        momentum = vect(0,0,0);
    }


    if ( bUseSpecialDamage
            && damageType.default.bNoSpecificLocation==false
            && !bGodMode) {

        // CARROT: Get a better vector
        if ( instigatedBy != None ) {
            Damage = DoSpecialDamage(HitLocation, instigatedBy.Location + instigatedBy.EyePosition() - Location, Damage);
        } else {
            Damage = DoSpecialDamage(HitLocation,Momentum, Damage);
        }


    }
    else if ( bDoHeadShots == true ) {
        hitPart = CalcHitPart( hitLocation );
        if ( hitPart == HIT_Head && TakeHeadShotsFrom(instigatedBy) && (DamageType == class'DOTZBulletDamage' || DamageType == class'DOTZBigBulletDamage' ) ) {
            // head shots are really fatal!
            damage *= health;
            Level.Game.Broadcast( instigatedBy, HeadShotTxt,
                                  class'AdvancedHud'.default.INFO );
        }
    }

    // ignore any fatal damage, after final damage has been calculated...
    if ( bGodMode && damage >= health ) {
        if ( apc != None ) {
            apc.numFailures++;
        }
        health = default.health;
        damage = 0;
    }


    if ( apc != None ) apc.ClientFlash(0.5,vect(1000,0,0));
    Super(Pawn).TakeDamage( Damage, instigatedBy, hitlocation,
                      momentum, damageType );

    //apply damage from the parent functions first
    if (VSize(Momentum) > 10000 && Health > 0){
       FallDown(Momentum);
       if(PlayerController(Controller) != none){
        AdvancedPlayerController(Controller).Fall(); // camera effect
       }

    }
}

//===========================================================================
// DefaultProperties
//===========================================================================


// Decompiled with UE Explorer.
defaultproperties
{
    bUseNotifyFootStep=true
    RagdollLifeSpan=0.0000000
    FootStepVolume=0.5000000
    DeathSounds=/* Array type was not detected. */
    bDoHeadShots=true
    bUpdateEyeheight=true
    bCanPickupInventory=true
    SightRadius=250000.0000000
    GroundSpeed=460.0000000
    CrouchHeight=55.0000000
    CrouchRadius=25.0000000
    ControllerClass=Class'NAIController'
    Mesh=SkeletalMesh'DOTZAZombies.MaleSwat'
}