class LPSeqAct_AIWave extends SPSeqAct_AIWave
    forcescriptorder(true)
    hidecategories(Object,Object);

defaultproperties
{
    // Reference: LPAIWaveSpawnCondition_Default'Default__LPSeqAct_AIWave.SpawnCondition'
    begin object name=SpawnCondition class=Class'LPAIWaveSpawnCondition_Default'
    end object
    WaveSpawnCondition=SpawnCondition
    // Reference: LPAIWaveEndCondition_AllKilled'Default__LPSeqAct_AIWave.EndCondition'
    begin object name=EndCondition class=Class'LPAIWaveEndCondition_AllKilled'
    end object
    WaveEndCondition=EndCondition
    FactorySequenceClass=Class'LPSeqAct_ActorFactory'
    ActorFactoryClass=Class'LPActorFactoryAI'
    DamageTypeForForceDamage=Class'LPDamageTypeForced'
}