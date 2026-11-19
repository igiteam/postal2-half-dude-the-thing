class VolumeTimer extends Info
    notplaceable
    hidecategories(AnimDependency,Navigation,Movement,Collision);

var(*) /*0x35EA0000-0x00000000*/ private @NULL V;

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    V = PhysicsVolume(Owner);
    SetTimer(V.PainInterval, true);
    //return;    
}

event Timer()
{
    V.TimerPop(self);
    //return;    
}
