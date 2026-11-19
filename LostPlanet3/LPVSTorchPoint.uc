class LPVSTorchPoint extends Actor
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x8AE00000-0x00000000*/ private travel bool bEnabled[2162689];
var(0.25_Pct) /*0x8AE00000-0x00000000*/ private float DelayTimeToFireEvent[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL Mesh[524289];

function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bEnabled = true;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bEnabled = false;            
        }
        else
        {
            // End:0xDB
            if(Action.InputLinks[2].bHasImpulse)
            {
                bEnabled = !bEnabled;
            }
        }
    }
    //return;    
}

simulated function IsInViewableRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL CameraLocation[8388609], CameraDir;
    local /*0x97E50000-0x00000000*/ private float RequiredDot[8388609], MaxDist, ReturnValue;

    return -1.0000000;
    //return ReturnValue;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    // End:0xCE
    if(DamageType == Class'LPDamageTypeVSWelder')
    {
        // End:0x85
        if(Instigator == none)
        {
            Instigator = EventInstigator.Pawn;
            // End:0x7B
            if(DelayTimeToFireEvent > float(0))
            {
                SetTimer(DelayTimeToFireEvent, false, 'TriggerEventDestroyed');                
            }
            else
            {
                TriggerEventDestroyed();
            }
        }
        super.TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    }
    //return;    
}

function TriggerEventDestroyed()
{
    TriggerEventClass(Class'LPSeqEvent_TorchPoint', Instigator.Controller, 0);
    //return;    
}

defaultproperties
{
    // Reference: CylinderComponent'Default__LPVSTorchPoint.CollisionCylinder'
    begin object name=CollisionCylinder class=Class'Engine.CylinderComponent'
    end object
    Components[0]=CollisionCylinder
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bNoDelete=true
    bGameRelevant=true
    bCollideActors=true
    SupportedEvents=/* Array type was not detected. */
}