//-----------------------------------------------------------
//
//-----------------------------------------------------------
class KungFuVideo extends SpecialItem;

/****************************************************************
 * DoActionableAction
 ****************************************************************
 */
function DoActionableAction(Controller C){
    super.DoActionableAction(C);
    if (DOTZPlayerControllerBase(Level.GetLocalPlayerController()).KungFuMode == false){
        DOTZPlayerControllerBase(Level.GetLocalPlayerController()).KungFu();
    } else {
        Level.GetLocalPlayerController().Pawn.GiveWeapon("DOTZWeapons.KungFuWeapon");
    }
     Level.GetLocalPlayerController().Pawn.PlaySound(ActionSound);

}


// Decompiled with UE Explorer.
defaultproperties
{
    bStartsEnabled=true
    ActionMessage=""
    ActionSound=Sound'DOTZXInterface.PickupKungFu'
    iActionablePriority=8
    DrawType=8
    StaticMesh=StaticMesh'DOTZSSpecial.Pickups.KungFu'
    bHardAttach=true
    bUnlit=true
}