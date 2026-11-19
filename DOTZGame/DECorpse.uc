class DECorpse extends AdvancedActor placeable;

var(Corpse) bool bNoHead;
var(Corpse) bool bNoTorso;
var(Corpse) bool bNoLegs;

var Material rskin0;
var Material rskin1;

replication {
	unreliable if(Role == ROLE_Authority && (bNetInitial || bNetDirty))
	    rskin0, rskin1, bNoHead, bNoTorso, bNoLegs;
}

simulated function PostNetReceive() {
	if(Level.NetMode == NM_Client) {
		if(rskin0 != None) Skins[0] = rskin0;
		if(rskin1 != None) Skins[1] = rskin1;
		if(bNoHead) RemoveHead();
		if(bNoTorso) RemoveTorso();
		if(bNoLegs) RemoveLegs();
	}
}

simulated function RemoveHead() {
	bNoHead=True;
	SetBoneScale(1, 0.001, 'Head');
}

simulated function RemoveTorso() {
	bNoTorso=True;
	RemoveHead();
	SetBoneScale(4, 0.001, 'Spine');
}

simulated function RemoveLegs() {
	bNoLegs=true;
	SetBoneScale(2, 0.001, 'RThigh');
	SetBoneScale(3, 0.001, 'LThigh');
}

simulated function PostBeginPlay() {
	super.PostBeginPlay();
	if(Level.NetMode != NM_Client && Skins.Length > 0) {
		if(Skins[0] != None) rskin0 = Skins[0];
		if(Skins[1] != None) rskin1 = Skins[1];
	}
	BoneRefresh();
	if(bNoHead) RemoveHead();
	if(bNoTorso) RemoveTorso();
	if(bNoLegs) RemoveLegs();
	KarmaMe();
}

simulated function KarmaMe() {
	local KarmaParamsSkel SkelParams;

	// TODO: destroy, rather than sit here?
	if(Level.NetMode == NM_DedicatedServer) {
		return;
	}

	if(Physics != PHYS_KarmaRagdoll) {
		StopAnimating();
  		KMakeRagdollAvailable();
  		skelParams = KarmaParamsSkel(KParams);
  		skelParams.KSkeleton = "Zombie";

  		skelParams.KStartLinVel = Pawn(Owner).TearOffMomentum / 50;
	  	skelParams.KStartAngVel = Pawn(Owner).TearOffMomentum / 50;
  		KParams = skelParams;

		KSetBlockKarma(true);

  		SetPhysics(PHYS_KarmaRagdoll);
  		iActionablePriority = -1;
  		}
}


// Decompiled with UE Explorer.
defaultproperties
{
    DrawType=2
    bNoDelete=true
    bAlwaysRelevant=true
    bReplicateAnimations=true
    bGameRelevant=true
    bCollideActors=true
    bCollideWorld=true
    bBlockKarma=true
    bNetNotify=true
    RemoteRole=2
    Mesh=SkeletalMesh'DOTZAHumans.JackSlade'
    CollisionRadius=88.0000000
    CollisionHeight=68.0000000
    Mass=180.0000000
    Buoyancy=105.0000000
    // Reference: KarmaParamsSkel'DECorpse.CorpseKParams'
    begin object name=CorpseKParams class=Class'Engine.KarmaParamsSkel'
        KLinearDamping=0.5000000
        KAngularDamping=0.5000000
        KBuoyancy=1.0000000
        KStartEnabled=true
        KVelDropBelowThreshold=125.0000000
        bHighDetailOnly=false
        KFriction=0.6000000
        KRestitution=0.3000000
        KImpactThreshold=500.0000000
    end object
    KParams=CorpseKParams
}