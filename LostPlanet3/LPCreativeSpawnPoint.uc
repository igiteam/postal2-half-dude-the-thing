class LPCreativeSpawnPoint extends LPPawnSpawnPoint
    hidecategories(Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAvailableForSpawning;
var(0.25_Pct) /*0x28A00000-0x00000000*/ private bool bManageRootMotionMode[65537];
var(0.25_Pct) /*0x28A00000-0x00000000*/ private bool bUseChoreography[65537];
var(0.25_Pct) /*0x28A00000-0x00000000*/ private bool bChoreographyIgnoreTargetRot[65537];
var(0.25_Pct) /*0x28A00000-0x00000000*/ private bool bFallAfterSpawning[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyBaby;
var(0.25_Pct) /*0x28A00000-0x00000000*/ private class SpecialMoveClass[65537];
var(0.25_Pct) /*0x28A00000-0x00000000*/ private name AnimationName[65537];
var(0.25_Pct) /*0x28A00000-0x00000000*/ private float PlayBackRate[65537];
var(0.25_Pct) /*0x28A00000-0x00000000*/ private float BlendOutTime[65537];
var(0.25_Pct) /*0x28A00000-0x00000000*/ private byte RootMotionMode[65537];
var(0.25_Pct) /*0x28A00000-0x00000000*/ private byte TranslationExtraction[65537];
var(0.25_Pct) /*0x28A00000-0x00000000*/ private byte RotationExtraction[65537];
var(0.25_Pct) /*0x28A00000-0x00000000*/ private @NULL ChoreographyObject[65537];
var(0.25_Pct) /*0x28A00000-0x00000000*/ private float FallImpulseStrength[65537];
var(0.25_Pct) /*0x28A00000-0x00000000*/ private float FallImpulseVariance[65537];
var(0.25_Pct) /*0x28A00000-0x00000000*/ private float FallingAIDelayTime[65537];

simulated event PawnSpawnedAtPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609], AIC;

    // End:0xDD
    if(int(Role) == int(ROLE_Authority))
    {
        MyBaby = P;
        MyBaby.SetPhysics(4);
        AIC = SPAIController(P.Controller);
        // End:0xA1
        if(AIC != none)
        {
            AIC.ForceDisableAI();
        }
        MyBaby.DoSpecialMove(SpecialMoveClass, true, true, None, self);
    }
    //return;    
}

simulated function GetSpawnImpulse()
{
    local /*0x97E50000-0x00000000*/ private @NULL outVec[25165825];
    local /*0x97E50000-0x00000000*/ private float outAIDelayTime[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Dir;
    local /*0x97E50000-0x00000000*/ private float Strength;

    // End:0x2C
    if((FallImpulseStrength == float(0)) || FallImpulseStrength < FallImpulseVariance)
    {
        return false;
    }
    Dir = Vector(Rotation);
    Strength = RandRange(FallImpulseStrength - FallImpulseVariance, FallImpulseStrength + FallImpulseVariance);
    Dir *= Strength;
    outVec = Dir;
    outAIDelayTime = FallingAIDelayTime;
    return true;
    //return ReturnValue;    
}

defaultproperties
{
    bAvailableForSpawning=true
    bManageRootMotionMode=true
    SpecialMoveClass=Class'LPSM_CreativeSpawnBase'
    PlayBackRate=1.0000000
    BlendOutTime=0.2500000
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    Components[0]=none
    Components[1]=none
    bHidden=false
}