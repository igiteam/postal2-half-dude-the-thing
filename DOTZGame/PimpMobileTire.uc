class PimpMobileTire extends KTire;
var() int HP;
function TakeDamage(int Damage, Pawn instigatedBy, Vector hitlocation, Vector momentum, class<DamageType> damageType);

////////////

/////////////


// Decompiled with UE Explorer.
defaultproperties
{
    HP=1
    StaticMesh=StaticMesh'Dcar.pimpmobileTireSM'
    CollisionRadius=34.0000000
    CollisionHeight=34.0000000
    // Reference: KarmaParamsRBFull'PimpMobileTire.KParams0'
    begin object name=KParams0 class=Class'Engine.KarmaParamsRBFull'
        KInertiaTensor[0]=1.8000000
        KInertiaTensor[3]=1.8000000
        KInertiaTensor[5]=1.8000000
        KLinearDamping=0.0000000
        KAngularDamping=0.0000000
        bHighDetailOnly=false
        bClientOnly=false
        bKDoubleTickRate=true
    end object
    KParams=KParams0
}