class CriticalEventPlus extends LocalMessage;

static function float GetOffset(int Switch, float YL, float ClipY )
{
	return (Default.YPos/768.0) * ClipY;
}


// Decompiled with UE Explorer.
defaultproperties
{
    bIsUnique=true
    bFadeMessage=true
    DrawColor=(R=0,G=160,B=255,A=255)
    FontSize=1
}