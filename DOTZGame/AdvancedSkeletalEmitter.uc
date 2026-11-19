//-----------------------------------------------------------
//
//-----------------------------------------------------------
class AdvancedSkeletalEmitter extends AdvancedActor;

var name AnimationName;

simulated function PostNetBeginPlay(){
   super.PostNetBeginPlay();
   PlayAnim(AnimationName);
   SetMultiTimer(1,3.0,false);
}

function MultiTimer(int SlotID){
   switch(SlotID){
      case 1:
      Destroy();
      break;
   }
}


event AnimEnd(int channel){
   bHidden=true;
   self.Destroy();
}


// Decompiled with UE Explorer.
defaultproperties
{
    DrawType=2
}