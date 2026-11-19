class LPMunitionsLocker extends LPStaticMeshActor
    abstract
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x812C0000-0x00000400*/ private export @NULL ScreenMesh[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GFxFlashMovie;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class GFxFlashMovieInstanceClass;

function ValidTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x14
    if(Other == none)
    {
        return false;        
    }
    else
    {
        // End:0x50
        if(Other.Controller == none)
        {
            SetTimer(0.2000000, false, 'RecheckValidTouch');
            return false;            
        }
        else
        {
            // End:0x96
            if(!FastTrace(Other.Location, Location))
            {
                SetTimer(0.5000000, false, 'RecheckValidTouch');
                return false;
            }
        }
    }
    return true;
    //return ReturnValue;    
}

function RecheckValidTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL P;

    // End:0x43
    foreach TouchingActors(Class'Engine.Pawn', P)
    {
        Touch(P, none, Location, vect(0.0000000, 0.0000000, 1.0000000));        
    }    
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, LPP, LPC;

    LPP = LPPlayerPawn(Other);
    // End:0xA5
    if((LPP != none) && ValidTouch(LPP))
    {
        LPC = LPPlayerController(LPP.Controller);
        // End:0xA5
        if(LPC != none)
        {
            LPC.ClientNotifyProximityToMunitionsLocker(self, true);
        }
    }
    //return;    
}

event UnTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], LPP, LPC;

    LPP = LPPlayerPawn(Other);
    // End:0x8D
    if(LPP != none)
    {
        LPC = LPPlayerController(LPP.Controller);
        // End:0x8D
        if(LPC != none)
        {
            LPC.ClientNotifyProximityToMunitionsLocker(self, false);
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: StaticMeshComponent'Default__LPMunitionsLocker.ScreenStaticMesh'
    begin object name=ScreenStaticMesh class=Class'Engine.StaticMeshComponent'
    end object
    ScreenMesh=ScreenStaticMesh
    // Reference: StaticMeshComponent'Default__LPMunitionsLocker.LockerStaticMesh'
    begin object name=LockerStaticMesh class=Class'Engine.StaticMeshComponent'
    end object
    StaticMeshComponent=LockerStaticMesh
    // Reference: StaticMeshComponent'Default__LPMunitionsLocker.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    Components[0]=StaticMeshComponent0
    // Reference: CylinderComponent'Default__LPMunitionsLocker.CollisionCylinder'
    begin object name=CollisionCylinder class=Class'Engine.CylinderComponent'
    end object
    Components[1]=CollisionCylinder
    Components[2]=LockerStaticMesh
    Components[3]=ScreenStaticMesh
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bWorldGeometry=false
    bNoEncroachCheck=true
    CollisionComponent=CollisionCylinder
}