//==================================================================================
// Trin Extended
//
// This extension implements the ability for the glock and .22 rifle
// to produce headshots.
// Also keeps zombies from hurting each other.
// And makes lying down zombies lie down on the clients.
//
// Modifed for DE use, all credit goes to Trin.
//
// REVISED: 12-26-2008 -- Zombies now Blend Animations!
//==================================================================================

class DETrinZombiePawnBase extends ZombiePawnBase
abstract notplaceable
   HideDropDown;

//==================================================================================

var protected DECorpse MyCorpse;
var bool bBodySevered;


//==================================================================================

simulated function PostNetReceive() {
    super.PostNetReceive();
    if(bBodySevered && MyCorpse == None) {
        SeverBody();
    }
}

simulated function SeverBody() {
    if(Level.NetMode != NM_Client) {
        bBodySevered = True;
        if(Level.NetMode == NM_DedicatedServer)
            return;
    }
    // TODO: should probably consider ignoring this call if we're slow already?
    // TODO: allow this call to happen when we are still alive, and convert to crawling?
    SetBoneScale(2, 0.001, 'RThigh');
    SetBoneScale(3, 0.001, 'LThigh');
    if(Skins.Length < 2)
        CopyMaterialsToSkins();
    MyCorpse = spawn(class'DECorpse', self);
    if(MyCorpse != None) {
        MyCorpse.LinkMesh(self.Mesh, false);
        MyCorpse.Skins[0] = Skins[0];
        myCorpse.Skins[1] = Skins[1];
        MyCorpse.rskin0 = Skins[0];
        MyCorpse.rskin1 = Skins[1];
        MyCorpse.RemoveTorso();
        MyCorpse.KarmaMe();
    }
    bBodySevered = true;
}

// Added to fix LoopAnim with AdvancedPlayAnim.
function LieDown()
{
    // LogMessage("LieDown Called");

    Velocity     = vect(0,0,0);
    Acceleration = vect(0,0,0);
    //LoopAnim(LyingAnims[Frand()*(LyingAnims.Length -1)]);
    AdvancedPlayAnim(LyingAnims[Frand()*(LyingAnims.Length -1)],,,,true);

    bGodMode     = false;
    SetBoredomTimer(false);

    // LogMessage("LieDown - GotoState LyingDown");

    GotoState('LyingDown');

    // LogMessage("LieDown Ended");
}

function LogMessage(string Message)
{
	if (DebugFlags == 1)
	{
        Log("PAWN " $ GetStateName() $ " " $ self $ " " $ Message, 'TrinLogMessage');
	}
}

function PlaySpawnAnim(){

   local int iSpawnIndex;
   //play a start up animation
   bHidden = false;
   if (AnimSpawn.Length > 0){
      iSpawnIndex = Frand() * AnimSpawn.Length;
      if (HasAnim(AnimSpawn[iSpawnIndex])){
         bPlayingSpawn = true;
         //bWasGodMode = bGodMode;
         //bGodMode = true;
         //SetCollision(false,false,false);
         //PlayFocusedAnimation(AnimSpawn[iSpawnIndex]);
         AdvancedPlayAnim(AnimSpawn[iSpawnIndex],,,,false,true);
         SetPhysics(PHYS_Falling);
      }
   }
}

state FocusedAnimation
{
    ignores AdvancedPlayAnim,PlayFocusedAnimation,Fire,PlayFiring,PlayMoving,PlayJump,PlayHit;

    function TakeDamage(int Damage, Pawn instigatedBy, Vector hitlocation,vector momentum, class<DamageType> damageType)
    {
         global.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
    }
}

state LyingDown
{
    ignores PlayTakeHit, AnimateStanding;

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


// Decompiled with UE Explorer.
defaultproperties
{
    Walks=/* Array type was not detected. */
    AdditionalAnimPkg=/* Array type was not detected. */
    AnimJump="JumpF"
    AnimJumpForward="JumpF"
    AnimJumpBack="JumpB"
    AnimJumpLeft="JumpL"
    AnimJumpRight="JumpR"
    BloodEmitter=Class'DEParticles.DEFleshEmitter'
    SpecialDamage=/* Array type was not detected. */
    bFatal=/* ERROR: System.Exception */
    Txt=true
    bJumpCapable=true
    bCanStrafe=true
    GroundSpeed=500.0000000
    JumpZ=512.0000000
    Health=750
    BaseMovementRate=500.0000000
    BlendChangeTime=0.5000000
    DebugFlags=0
}