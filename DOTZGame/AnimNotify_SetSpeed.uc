class AnimNotify_SetSpeed extends AnimNotify_Scripted;

var() float Rate;

event Notify( Actor Owner )
{
   AdvancedPawn(Owner).Notify_SetSpeed(Rate);
}


// Decompiled with UE Explorer.
defaultproperties
{
    Rate=1.0000000
}