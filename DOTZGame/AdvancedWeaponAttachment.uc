class AdvancedWeaponAttachment extends WeaponAttachment;

var class<emitter> ThirdPersonMuzzleFlashClass;
var class<emitter> TraceEmitterClass;
var sound FireSound;

/*****************************************************************
 * ThirdPersonEffects
 *****************************************************************
 */
simulated event ThirdPersonEffects()
{
	// spawn 3rd person effects
   super.ThirdPersonEffects();
   DrawEmitters();

}

/*****************************************************************
 * ClientThirdPersonFX
 *****************************************************************
*/
simulated function ClientThirdPersonFX(){
   DrawEmitters();
}


/*****************************************************************
 * DrawEmitters
 *****************************************************************
 */
simulated function DrawEmitters(){
   local vector StartTrace, FireDirection; //, HitLocation;
   local actor temp;
   if (Instigator == Level.GetLocalPlayerController().Pawn){
      return;
   }

   // if (HitLocation == vect(0,0,0)) {
//        HitLocation = Instigator.Location
//            + vector(Instigator.Rotation) * vect(1000,1000,1000);
//    }
    StartTrace = GetBoneCoords('Flash01').Origin;
    FireDirection = GetBoneCoords('Flash01').XAxis;   //HitLocation - StartTrace;

    if ( FireSound != none) {
       Instigator.PlaySound(FireSound, SLOT_None, 1.0);
    }

    //if there is something to spawn and you are rendering this
    if ( ThirdPersonMuzzleFlashClass != None ){
        temp = Spawn(ThirdPersonMuzzleFlashClass,,,
            StartTrace,Rotator(FireDirection));
        Emitter(temp).AutoDestroy = true;
        AttachToBone(temp,'Flash01');
    }

   if (TraceEmitterClass != none){
        temp = Spawn(TraceEmitterClass,,,
                     StartTrace,Rotator(FireDirection));
        Emitter(temp).AutoDestroy = true;
        AttachToBone(temp,'Flash01');
    }

}



// Decompiled with UE Explorer.
defaultproperties
{
    bAlwaysRelevant=true
    SoundOcclusion=2
    TransientSoundVolume=0.5000000
    TransientSoundRadius=80.0000000
}