class disinfectionStation extends ActionableStaticMesh
placeable;

var localized string DisabledMessage;

/****************************************************************
 * DoActionableAction
 ****************************************************************
 */
function DoActionableAction(Controller C){

   local XDotzPawnBase dpb;

   super.DoActionableAction(C);

   dpb = XDotzPawnBase(C.Pawn);
   dpb.SetInfectionState(false);
}

/****************************************************************
 * GetActionableMessage
 ****************************************************************
 */
function string GetActionableMessage(Controller C){

   if (XDotzPawnBase(Level.GetLocalPlayerController().Pawn).bInfected == true){
      return ActionMessage;
   } else {
      return DisabledMessage;
   }
}



// Decompiled with UE Explorer.
defaultproperties
{
    DisabledMessage="You are not infected"
    ActionMessage="Press Action to cure infection"
    StaticMesh=StaticMesh'DOTZSSpecial.Pickups.InfectionCure'
    CollisionRadius=35.0000000
}