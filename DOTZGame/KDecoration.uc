class KDecoration extends KActor;

function TakeDamage(int Damage, Pawn instigatedBy, Vector hitlocation, Vector momentum, class<DamageType> damageType)
{
	if(bKTakeShot)
		KAddImpulse(momentum, hitlocation);
}


// Decompiled with UE Explorer.
defaultproperties
{
    StaticMesh=StaticMesh'AdvancedEngine.DefaultMesh'
    // Reference: KarmaParams'KDecoration.KarmaParams0'
    begin object name=KarmaParams0 class=Class'Engine.KarmaParams'
        bHighDetailOnly=false
        bKAllowRotate=true
        KImpactThreshold=0.0000000
    end object
    KParams=KarmaParams0
}