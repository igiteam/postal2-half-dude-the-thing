class ReplicationInfo extends Info
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation,Movement,Collision);

defaultproperties
{
    Components=none
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bAlwaysRelevant=true
}