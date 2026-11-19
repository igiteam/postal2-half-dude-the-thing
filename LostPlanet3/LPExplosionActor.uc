class LPExplosionActor extends SPGFGameExplosionActor
    hidecategories(AnimDependency,Navigation);

simulated function DoFullDamageToActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Victim[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x64
    if(ClassIsChildOf(ExplosionTemplate.MyDamageType, Class'LPDamageTypeVSISSExplosion'))
    {
        // End:0x61
        if((LPAIPawn(Victim) != none) || LPTrigger(Victim) != none)
        {
            return true;
        }        
    }
    else
    {
        // End:0x98
        if((LPSnowcatInterpTransport(Victim) != none) || LPSnowcatInterpTransportWheels(Victim) != none)
        {
            return false;
        }
    }
    return super(GameExplosionActor).DoFullDamageToActor(Victim);
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: RB_RadialImpulseComponent'Default__LPExplosionActor.ImpulseComponent0'
    begin object name=ImpulseComponent0
    end object
    RadialImpulseComponent=ImpulseComponent0
    Components[0]=ImpulseComponent0
}