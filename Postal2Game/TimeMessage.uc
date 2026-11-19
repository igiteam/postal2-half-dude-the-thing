class TimeMessage extends GameEventPlus;

var localized string TimeMessage[16];
var Sound TimeSound[16];

static function string GetString(
	PlayerController P,
	optional int N,
	optional PlayerReplicationInfo RelatedPRI_1, 
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	N = Static.TranslateSwitch(N);
	if ( N > 0 )
		return Default.TimeMessage[N];
}

/* Translate the number of seconds passed in to the appropriate message index
*/
static function int TranslateSwitch(int N)
{	
	if ( N <= 10 )
		return (N-1);

	if ( N == 30 )
		return 10;

	N = N/60;
	if ( (N > 0) && (N < 6) )
		return (N + 10);

	return -1;
}

static simulated function ClientReceive( 
	PlayerController P,
	optional int N,
	optional PlayerReplicationInfo RelatedPRI_1, 
	optional PlayerReplicationInfo RelatedPRI_2,
	optional Object OptionalObject
	)
{
	N = Static.TranslateSwitch(N);
	if ( N > 0 )
		MpPlayer(P).PlayAnnouncement(default.TimeSound[N],1,true);
}


// Decompiled with UE Explorer.
defaultproperties
{
    TimeMessage[0]="1..."
    TimeMessage[1]="2..."
    TimeMessage[2]="3..."
    TimeMessage[3]="4..."
    TimeMessage[4]="5 seconds and counting..."
    TimeMessage[5]="6..."
    TimeMessage[6]="7..."
    TimeMessage[7]="8..."
    TimeMessage[8]="9..."
    TimeMessage[9]="10 seconds left!"
    TimeMessage[10]="30 seconds left!"
    TimeMessage[11]="1 minute left in the game!"
    TimeMessage[12]="2 minutes left in the game!"
    TimeMessage[13]="3 minutes left in the game!"
    TimeMessage[14]="4 minutes left in the game!"
    TimeMessage[15]="5 minutes left in the game!"
    TimeSound[0]=Sound'MpAnnouncer.Announcer1'
    TimeSound[1]=Sound'MpAnnouncer.Announcer2'
    TimeSound[2]=Sound'MpAnnouncer.Announcer3'
    TimeSound[3]=Sound'MpAnnouncer.Announcer4'
    TimeSound[4]=Sound'MpAnnouncer.Announcer5'
    TimeSound[5]=Sound'MpAnnouncer.Announcer6'
    TimeSound[6]=Sound'MpAnnouncer.Announcer7'
    TimeSound[7]=Sound'MpAnnouncer.Announcer8'
    TimeSound[8]=Sound'MpAnnouncer.Announcer9'
    TimeSound[9]=Sound'MpAnnouncer.Announcer10'
    TimeSound[10]=Sound'MpAnnouncer.Announcer30sec'
    TimeSound[11]=Sound'MpAnnouncer.Announcer1min'
    TimeSound[13]=Sound'MpAnnouncer.Announcer3min'
    TimeSound[15]=Sound'MpAnnouncer.Announcer5min'
    Lifetime=1
}