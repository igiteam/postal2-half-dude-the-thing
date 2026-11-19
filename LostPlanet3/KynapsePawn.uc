class KynapsePawn extends GamePawn
    abstract
    config(Game)
    hidecategories(AnimDependency,Navigation);

var(accidentRatio) /*0x018B0000-0x00000400*/ private export @NULL myKynapseHandle[589825];
var(accidentRatio) /*0x018B0000-0x00000000*/ private bool bIsUsingKynapsePathing[65537];
var(accidentRatio) /*0x02000000-0x00000000*/ private bool bDontStopDesiredSpeedOnSpeedUpdate;

defaultproperties
{
    // Reference: KynapseBodyHandle'Default__KynapsePawn.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle class=Class'KynapseBodyHandle'
    end object
    myKynapseHandle=myKynapseBodyHandle
    bIsUsingKynapsePathing=true
    // Reference: CylinderComponent'Default__KynapsePawn.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=CollisionCylinder
    Components[2]=none
    Components[3]=myKynapseBodyHandle
    CollisionComponent=CollisionCylinder
}