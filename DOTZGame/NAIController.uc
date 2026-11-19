class NAIController extends DOTZAiController;


// settings
var name EatingAnim;
var name CrawlEatingAnim;
var int iAwarenessRange;
var config string DefaultWeaponType;
 //var() class<DOTZGunWeapon> DefaultWeaponType;
// internal
var class<ExclaimManager> TheExclaimManager;
var bool bForceRun;
const CONFIGURE_HACK_TIMER = 294850;
var bool bConfigured;
const EATCHANNEL = 20;

////////////////////////////////////////////
function Restart() {
    //NOTE: does this apply to our codebaes?
    Super.Restart();
    SetMultiTimer(STRING_PULL_TIMER, FRand() * 0.3 + 0.15, false);
    myStringPullMarker = Spawn(class'StringPullMarker');
    pawn.bCanCrouch=true;
}


/**
 */
function BeginPlay() {
    super.BeginPlay();
    SetMultiTimer( CONFIGURE_HACK_TIMER, 3, false );
    Class'NAIController'.SaveConfig();
}

/**
 */
function MultiTimer( int timerID ) {
    //NOTE: an ugly hack to make sure that pawns not spawned from factories get
    //      their weapon.
    if ( timerID == CONFIGURE_HACK_TIMER ) {
        if ( !bConfigured ) configure( none, none );
    }
    else super.MultiTimer( timerID );
}


function Possess( Pawn p ) {
    super.Possess( p );
    p.GiveWeapon( DefaultWeaponType );
}


/**
 */
function bool SameTeamAs(Controller C) {
    // only zombies
   // return (ZombieAIController(c) == None);
   return (NAIController (c) != None);
}

/**
 */
function configure( OpponentFactory f, Stage initialStage ) {
    bConfigured = true;
    super(VGSPAIController).configure( f, initialStage );
    if (Pawn != None){
      // Pawn.GiveWeapon( DefaultWeaponType );
      
    if(HumanFactory(f).DefaultWeaponType != "" ){
     DefaultWeaponType = HumanFactory(f).DefaultWeaponType;
     Pawn.GiveWeapon( DefaultWeaponType );
    }
       if (AdvancedPawn(Pawn) != none &&
           ZombieFactory(f) != none &&
           ZombieFactory(f).SpawnAnims.length > 0){
          AdvancedPawn(Pawn).AnimSpawn = ZombieFactory(f).SpawnAnims;
          AdvancedPawn(Pawn).PlaySpawnAnim();
        }
    }
}

/**
 */
function bool shouldWalk() {
    local AdvancedPawn ap;

    ap = AdvancedPawn( Pawn );
    // make sure crawlers don't try to force through a run...
    if ( ap != none && ap.bIsCrawling ) return true;
    else return !bForceRun;
}

/**
 */
function bool ShouldStrafe() {
    return false;
}


/****************************************************************
 * Perform_Eating
 * Command to start the eating animation
 ****************************************************************
 */
function Perform_Eating() {
   GotoState('Eating');
}


/****************************************************************
 * InAwarnessRange
 ****************************************************************
 */
function bool InAwarenessRange(actor enemy){
   if(VSize(pawn.location - enemy.location) < iAwarenessRange){
      return true;
   } else {
      return false;
   }
}

function SpawnExclaimManager(){
   exclaimMgr = Spawn(TheExclaimManager, self);
   exclaimMgr.init(self);
}

/**
 * Override firing to trigger the melee flail of a zombie.
 *
 * NOTE This won't be necessary if we make the ZombieGrope weapon fully
 * NOTE functional.
 */
function TimedFireWeaponAtEnemy() {
                // Log( self @ "firing!"  )    ;
    //NOTE assumes the weapon is a melee attack weapon...
    if ( (Pawn.Weapon != None) && !Pawn.Weapon.IsFiring() ) {
        WeaponFireAgain( Pawn.Weapon.RefireRate(), false );
    }
}


//===============================================================
// state Eating
//===============================================================
state Eating
{
    ignores KilledBy, EnemyNotVisible;

    function BeginState() {
        local AdvancedPawn ap;
        ap = AdvancedPawn( pawn );
        if (ap.bIsCrawling) EatingAnim = CrawlEatingAnim;
    }

    function EndState() {
        // clobber the eat anim loop
        //AdvancedPawn(pawn).PlayAnim( EatingAnim );
        //LoopAnim( EatingAnim );
        AdvancedPawn(pawn).AdvancedPlayAnim( EatingAnim,,,,true );
        bControlAnimations = false;
    }


    /**
     */
    function SeePlayer(Pawn Seen){
        if ( InAwarenessRange(Seen) ) {
            Super.SeePlayer(Seen);
        }
    }

    /**
     */
    function HearNoise( float Loudness, Actor NoiseMaker){
        if (InAwarenessRange(NoiseMaker)){
            Super.HearNoise(Loudness, NoiseMaker);
        }
    }


BEGIN:
    Sleep( RandRange( 0.1, 0.8 ) );
    AdvancedPawn(Pawn).AdvancedPlayAnim(EatingAnim,,,,true);
    bControlAnimations = true;
    //Pawn.LoopAnim(EatingAnim);
}

/////////////////////////////////////
function AdjustView(float DeltaTime)
{


        local float TargetYaw, TargetPitch;
	local rotator OldViewRotation,ViewRotation;
	Pawn.bUpdateEyeHeight =true;
	Super.AdjustView(DeltaTime);
	if( !Pawn.bUpdateEyeHeight )
		return;

	// update viewrotation
	ViewRotation = Rotation;
	OldViewRotation = Rotation;			

	if ( Enemy == None )
	{
		ViewRotation.Roll = 0;
		if ( DeltaTime < 0.2 )
		{
			OldViewRotation.Yaw = OldViewRotation.Yaw & 65535;
			OldViewRotation.Pitch = OldViewRotation.Pitch & 65535;
			TargetYaw = float(Rotation.Yaw & 65535);
			if ( Abs(TargetYaw - OldViewRotation.Yaw) > 32768 )
			{
				if ( TargetYaw < OldViewRotation.Yaw )
					TargetYaw += 65536;
				else
					TargetYaw -= 65536;
			}
			TargetYaw = float(OldViewRotation.Yaw) * (1 - 5 * DeltaTime) + TargetYaw * 5 * DeltaTime;
			ViewRotation.Yaw = int(TargetYaw);

			TargetPitch = float(Rotation.Pitch & 65535);
			if ( Abs(TargetPitch - OldViewRotation.Pitch) > 32768 )
			{
				if ( TargetPitch < OldViewRotation.Pitch )
					TargetPitch += 65536;
				else
					TargetPitch -= 65536;
			}
			TargetPitch = float(OldViewRotation.Pitch) * (1 - 5 * DeltaTime) + TargetPitch * 5 * DeltaTime;
			ViewRotation.Pitch = int(TargetPitch);
			SetRotation(ViewRotation);
		}
	}

}



//===============================================================
// DefaultProperties
//===============================================================


// Decompiled with UE Explorer.
defaultproperties
{
    EatingAnim="Eating"
    CrawlEatingAnim="CrawlEating"
    iAwarenessRange=3200
    MinNumShots=5
    MaxNumShots=10
    MinShotPeriod=0.0000000
    MaxShotPeriod=1.1000000
    MaxAimRange=1000.0000000
    MaxAimVelocity=50.0000000
}