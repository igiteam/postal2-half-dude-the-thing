/**
 * DOTZPawnBase - The game specific pawn class, mostly ripped from HG
 *
 * @version $1.0$
 * @author  Jesse (jesse@digitalextremes.com)
 * @date    Nov 2003
 */
class XDOTZPawnBase extends AdvancedPawn
abstract notplaceable
   HideDropDown;

var() Class<ExclaimManager> CharacterExclaimMgrClass;
var(Pawn) Material StandPoseIcon;
var(Pawn) Material CrouchPoseIcon;
var(Pawn) Material MountPoseIcon;
var(Pawn) int PoseIconSize;
var(Pawn) Array<Name> LyingAnims;
var(Pawn) Name GettingupAnim;

// internal
var bool bInfected;
var private Material currentPoseIcon;
var bool    bSoakDebug;
var bool    bPlayingGetUp;
var sound FallSound;
var bool IsMale;
var bool bUseNotifyFootStep;



replication
{
    // Variables the server should send to the client.
    reliable if( bNetDirty && (Role==ROLE_Authority) )
      bInfected;
}


/*****************************************************************
 * SetInfectionState
 *****************************************************************
 */
function SetInfectionState(bool iState, optional bool bForce) {}


/*****************************************************************
 * Mount
 *****************************************************************
 */
function Mount() {
    super.Mount();
    currentPoseIcon = MountPoseIcon;
}

/*****************************************************************
 * Unmount
 *****************************************************************
 */
function Unmount() {
    super.Unmount();
    currentPoseIcon = None;
    if ( bIsCrouched ) SwitchToCrouching();
    else SwitchToStanding();
}

/*****************************************************************
 * DrawHud
 *****************************************************************
 */
function DrawToHUD( Canvas c, float scaleX, float scaleY ) {
    super.DrawToHUD( c, scaleX, scaleY );
    // draw pose icon...
    /*
    c.setPos( 64 * scaleX, 829 * scaleY );
    c.DrawTile( currentPoseIcon,
                poseIconSize * scaleX, poseIconSize * scaleY,
                0, 0, poseIconSize, poseIconSize );
    */
}

function Died(Controller killer, class<DamageType> type, vector hitlocation){
   Super.Died(killer,type,hitlocation);
}

/*****************************************************************
 * DisplayDebug
 *****************************************************************
 */
simulated function DisplayDebug (Canvas Canvas, out float YL, out float YPos) {

    local string T;
    local float XL;

    if (!bSoakDebug) {
        Super.DisplayDebug (Canvas, YL, YPos);
        return;
    }

    Canvas.Style = ERenderStyle.STY_Normal;
    Canvas.StrLen ("TEST", XL, YL);
    YPos = YPos + 8*YL;
    Canvas.SetPos (4, YPos);
    Canvas.SetDrawColor (255, 255, 0);
    T = GetDebugName ();
    if (bDeleteMe) { T = T$" DELETED (bDeleteMe == true)"; }
    Canvas.DrawText (T, false);
    YPos += 3 * YL;
    Canvas.SetPos (4, YPos);

    if (Controller == None) {
        Canvas.SetDrawColor (255, 0, 0);
        Canvas.DrawText ("NO CONTROLLER");
        YPos += YL;
        Canvas.SetPos (4, YPos);
    }
    else { Controller.DisplayDebug (Canvas, YL, YPos); }

    YPos += 2*YL;
    Canvas.SetPos (4, YPos);
    Canvas.SetDrawColor (0, 255, 255);
    Canvas.DrawText ("Anchor "$Anchor$" Serpentine Dist "$SerpentineDist$" Time "$SerpentineTime);
    YPos += YL;
    Canvas.SetPos (4, YPos);

    T = "Floor "$Floor$" DesiredSpeed "$DesiredSpeed$" Crouched "$bIsCrouched$" Try to uncrouch "$UncrouchTime;
    if ((OnLadder != None) || (Physics == PHYS_Ladder)) { T = T$" on ladder "$OnLadder; }
    Canvas.DrawText (T);
    YPos += YL;
    Canvas.SetPos (4, YPos);
}

/*****************************************************************
 * Melee_Attack
 * Called by the controller to make the pawn do a melee attack
 *****************************************************************
 */
function Melee_Attack(){

}

/**
 */
function LieDown() {
    Velocity     = vect(0,0,0);
    Acceleration = vect(0,0,0);
    LoopAnim(LyingAnims[Frand()*(LyingAnims.Length -1)]);
    //AdvancedPlayAnim(LyingAnims[Frand()*(LyingAnims.Length -1)],1,0.1,FOCUSCHANNEL,true);

    bGodMode     = true;
    SetBoredomTimer(false);
    GotoState('LyingDown');
}

/**
 */
state LyingDown {
    ignores TakeDamage, PlayTakeHit, AnimateStanding;

    function PostLoad() {
        super.PostLoad();
        LoopAnim( LyingAnims[Frand()*(LyingAnims.Length -1)]);
        //AdvancedPlayAnim( LyingAnims[Frand()*(LyingAnims.Length -1)],1,0.1,FOCUSCHANNEL,true);
    }

    function BeginState() {
         FreezeMovement(true, false);
    }

    function EndState() {
         FreezeMovement(false);
         SetPhysics( PHYS_Falling );
    }

    function MultiTimer( int timerID ) {
        // ignore the boredom system while lying down.
        if ( timerID == BORED_TIMER ) return;
        else global.multitimer( timerID );

    }
}

/**
 */
function GetUp() {
    StopAnimating( true );
    bPlayingGetUp = true;
    AdvancedPlayAnim(GettingUpAnim,,,,,true);
}

/**
 * Reset the pawn for normal use when get-up anim completes...
 */
function FocusedAnimEnd(){

    if ( bPlayingGetUp == true ) {
        bPlayingGetUp = false;
        bGodMode = false;
        SetBoredomTimer(true);
    }
    super.FocusedAnimEnd();
}

/*****************************************************************
 * PlayFallingSound
 * Play a sound when the controller tells you it has fallen
 *****************************************************************
 */
function PlayFallingSound(){
    PlaySound(FallSound);
}


/*****************************************************************
 * NotifyDoFootStep
 * A different system for footsteps
 *****************************************************************
 */
function Notify_FootStep(){
    if (bUseNotifyFootStep == true){
        PlayFootStep();
    }
}

/*****************************************************************
 * PlayDyingAnim
 * Chance to clean up any fire
 *****************************************************************
 */
simulated function PlayDyingAnim(class<DamageType> DamageType,vector HitLoc){
    local Fire temp;

    //fall back death looks stupid with fire
    foreach BasedActors(class'Fire', temp){
        temp.DestroyFire();
    }

    super.PlayDyingAnim(DamageType,HitLoc);
}

//===========================================================================
// default Properties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    LyingAnims[0]="LyingPose"
    GettingupAnim="RisingUp"
    IsMale=true
    RedTeamIndicator=Class'DOTZRedIndicator'
    BlueTeamIndicator=Class'DOTZBlueIndicator'
    AnimJump="'"
    AnimJumpForward="'"
    AnimJumpBack="'"
    AnimJumpLeft="'"
    AnimJumpRight="'"
    CrawlingCollisionHeight=35.0000000
    CrawlingCollisionRadius=45.0000000
    BloodEmitter=Class'BBParticles.BBPImpactFlesh'
    RagdollLifeSpan=30.0000000
    RagInvInertia=4.0000000
    RagDeathVel=75.0000000
    RagShootStrength=4096.0000000
    RagSpinScale=75.0000000
    RagDeathUpKick=5.0000000
    RagImpactSoundInterval=0.5000000
    RagImpactVolume=1.0000000
    RagdollOverride="Ragdolls"
    RagSkelName="Zombie"
    FootStepSound=/* Array type was not detected. */
    FootStepDirt=/* Array type was not detected. */
    FootStepMetal=/* Array type was not detected. */
    FootStepPlant=/* Array type was not detected. */
    FootStepRock=/* Array type was not detected. */
    FootStepWater=/* Array type was not detected. */
    FootStepWood=/* Array type was not detected. */
    FootStepSnow=/* Array type was not detected. */
    GrenadeThrowAnim="GrenadeThrow"
    GrenadeAnimLength=1
    bInfiniteAmmo=true
    WeaponBone="Weapon"
    TweenTime=0.2000000
    hitblend=0.0200000
    bCanCrouch=true
    bJumpCapable=false
    bCanClimbLadders=true
    bCanStrafe=true
    bCanWalkOffLedges=true
    bSameZoneHearing=true
    bAdjacentZoneHearing=true
    bMuffledHearing=true
    bAroundCornerHearing=true
    HearingThreshold=4096.0000000
    SightRadius=12000.0000000
    MeleeRange=20.0000000
    GroundSpeed=150.0000000
    JumpZ=480.0000000
    AirControl=0.3500000
    BaseEyeHeight=59.0000000
    EyeHeight=60.0000000
    CrouchHeight=43.0000000
    UnderWaterTime=20.0000000
    bPhysicsAnimUpdate=true
    LightBrightness=70.0000000
    LightRadius=6.0000000
    LightHue=40
    LightSaturation=128
    bStasis=false
    bHardAttach=true
    CollisionHeight=72.0000000
    Buoyancy=99.0000000
    RotationRate=(Pitch=0,Yaw=20000,Roll=2048)
    // Reference: KarmaParamsSkel'XDOTZPawnBase.PawnKParams'
    begin object name=PawnKParams class=Class'Engine.KarmaParamsSkel'
        bKDoConvulsions=true
        KConvulseSpacing=(Min=10.0000000,Max=15.0000000)
        KLinearDamping=0.1500000
        KAngularDamping=0.0500000
        KBuoyancy=1.0000000
        KStartEnabled=true
        KVelDropBelowThreshold=50.0000000
        bHighDetailOnly=false
        KFriction=0.6000000
        KRestitution=0.3000000
        KImpactThreshold=500.0000000
    end object
    KParams=PawnKParams
    ForceType=1
    ForceRadius=100.0000000
    ForceScale=2.5000000
}