class LPKynapseExclusionVolume extends SPKynapseExclusionVolume
    hidecategories(AnimDependency,Navigation,Movement,Display,Actor,Advanced,Attachment,Brush,Collision,Volume,Debug,Destruct,Interaction,Mobile,Physics);

var(0.25_Pct) /*0x80240000-0x00000000*/ private bool bBlockAIs[196609];

defaultproperties
{
    bPawnsOnly=true
    // Reference: BrushComponent'Default__LPKynapseExclusionVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    CollisionComponent=BrushComponent0
}