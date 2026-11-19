class PawnFire extends DOTZFire;
/*
simulated function PostBeginPlay(){
   SetMultiTimer(1,0.5,true);
   super.PostBeginPlay();
}
*/

simulated function PostNetBeginPlay(){
   SetMultiTimer(1,0.5,true);
   super.PostNetBeginPlay();
}


simulated function MultiTimer(int SlotID){
   super.MultiTimer(SlotID);
   if (Level.NetMode == NM_Client){
      if (NetBaseActor !=None){
         if (FlameEmitter != None){
            FlameEmitter.bHardAttach = true;
            FlameEmitter.SetLocation(NetBaseActor.Location);
            FlameEmitter.SetBase(NetBaseActor);
         }
      }
   }

   Log(self $ " " $ location $ " Flame: "  $ FlameEmitter $ " " $ NetBaseActor);
}


// Decompiled with UE Explorer.
defaultproperties
{
    FlameEmitterClass=Class'BBParticles.BBPFirePawn'
    FadingEmitterClass=Class'BBParticles.BBPFireSmallFade'
    DamagePerSec=4
    FireBurnRadius=100
    FadeRate=15
    IgnitionTime=3
    ChildFireType=Class'PawnFire'
    RemoteRole=2
}