class VictimMessage extends CriticalEventPlus;

var localized string YouWereKilledBy, KilledByTrailer;

static function string GetString(
	PlayerController P,
	optional int Switch,
	optional PlayerReplicationInfo RelatedPRI_1, 
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject 
	)
{
	if (RelatedPRI_1 == None)
		return "";

	if (RelatedPRI_1.PlayerName != "")
		return Default.YouWereKilledBy@RelatedPRI_1.PlayerName$Default.KilledByTrailer;
}


// Decompiled with UE Explorer.
defaultproperties
{
    YouWereKilledBy="You were killed by"
    KilledByTrailer="!"
    Lifetime=6
}