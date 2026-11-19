class DrNecroAIRole extends ZombieAIRole;

const VOMIT_RANGE   = 4096;
const VOMIT_TIMER   = 2984;
const REVOMIT_TIMER = 3084;

function BeginPlay()
{
    super.BeginPlay();
    SetMultiTimer(VOMIT_TIMER, 1.1, true);
}

function MultiTimer(int timerID)
{
    switch ( timerID )
    {
        case REVOMIT_TIMER:      SetMultiTimer(VOMIT_TIMER, 1.1, true);

        case VOMIT_TIMER:        TryVomit();
                                 break;

        default:                 super.MultiTimer( timerID );
    }
}

function TryVomit()
{
    if ( bot != none && bot.Enemy != none && bot.Pawn != none && VSize(bot.Enemy.location - bot.pawn.location) < VOMIT_RANGE )
    {
                    // Log( self @ "VOMIT!"  )    ;
        // trigger the spew...
        bot.pawn.Weapon.CauseAltFire();
        // and hold off heaving again for a while...
        SetMultiTimer( VOMIT_TIMER, 0, false );
        SetMultiTimer( REVOMIT_TIMER, 5, false );
    }
}

function OnThreatSpotted(Pawn threat)
{
    if ( threat.IsHumanControlled() && threat != bot.Enemy )
    {
        bot.AcquireEnemy(threat, true);
        if (TrySeekTarget(threat))
            TryVomit();
    }
}

state Wander {

    /**
     */
    function NotEngagedWanderFailed() {
        // don't attack.
    }
}


// Decompiled with UE Explorer.
defaultproperties
{
    DebugFlags=0
}