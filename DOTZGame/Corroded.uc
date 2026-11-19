class Corroded extends DamageType
	abstract;

static function class<Effects> GetPawnDamageEffect( vector HitLocation, float Damage, vector Momentum, Pawn Victim, bool bLowDetail )
{
	return Default.PawnDamageEffect;
}


// Decompiled with UE Explorer.
defaultproperties
{
    DeathString="%o was dissolved by %k's."
    FemaleSuicide="%o dissolved in slime."
    MaleSuicide="%o dissolved in slime."
    bNoSpecificLocation=true
    FlashFog=(X=450.0000000,Y=700.0000000,Z=230.0000000)
}