class LPAimControlVsISS extends SPGFAimControlBase
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastReferenceAimPoint[536870913];

function GetAimingReferencePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LastReferenceAimPoint;
    //return ReturnValue;    
}

event UpdateAim()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyVSPawn, myCtrl, MyWeapon, myWeaponLoc;
    local /*0x97E50000-0x00000000*/ private name SocketName;

    MyVSPawn = LPAIPawnVSISS(PawnOuter);
    myCtrl = LPAIControllerVSISS(PawnOuter.Controller);
    MyWeapon = SPGFWeapon(PawnOuter.Weapon);
    // End:0xF3
    if((myCtrl != none) && myCtrl.FireTarget == none)
    {
        WorldAimRotator = MyVSPawn.Rotation;
        WorldAimDir = Vector(WorldAimRotator);        
    }
    else
    {
        // End:0x277
        if((myCtrl != none) && MyWeapon != none)
        {
            SocketName = MyVSPawn.AimingSocket();
            // End:0x19D
            if(PawnOuter.Mesh.GetSocketWorldLocationAndRotation(SocketName, myWeaponLoc))
            {
                LastReferenceAimPoint = myWeaponLoc;                
            }
            else
            {
                LastReferenceAimPoint = PawnOuter.GetWeaponStartTraceLocation();
            }
            WorldAimRotator = MyWeapon.GetBaseAIAimRotation(LastReferenceAimPoint, myCtrl.GetAimLocation(true));
            // End:0x262
            if(int(MyVSPawn.GetActiveWeaponID()) == int(2))
            {
                WorldAimRotator.Pitch = 0;
            }
            WorldAimDir = Vector(WorldAimRotator);
        }
    }
    //return;    
}
