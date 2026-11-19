class RB_Spring extends ActorComponent;

var(*) /*0x35EA0000-0x00000400*/ private export @NULL Component1[655361];
var(*) /*0x35EA0000-0x00000000*/ private name BoneName1[131073];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL Component2[655361];
var(*) /*0x35EA0000-0x00000000*/ private name BoneName2[131073];
var(*) /*0x35EA0000-0x00000000*/ private int SceneIndex[268566529];
var(*) /*0x35EA0000-0x00000000*/ private bool bInHardware[268566529];
var(*) /*0x3FF50000-0x00000000*/ private bool bEnableForceMassRatio[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SpringData[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float TimeSinceActivation[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float MinBodyMass[131073];
var(*) /*0x3FF50000-0x00000000*/ private float SpringSaturateDist[65537];
var(*) /*0x3FF50000-0x00000000*/ private float SpringMaxForce[65537];
var(*) /*0x3FF50000-0x00000000*/ private float MaxForceMassRatio[65537];
var(*) /*0x3FF50000-0x00000000*/ private editfixedsize @NULL SpringMaxForceTimeScale[65537];
var(*) /*0x3FF50000-0x00000000*/ private float DampSaturateVel[65537];
var(*) /*0x3FF50000-0x00000000*/ private float DampMaxForce[65537];

// Export URB_Spring::execSetComponents(FFrame&, void* const)
native function @NULL SetComponents()
{
    local /*0x35EA0000-0x00000400*/ private @NULL InComponent1[8388609];
    local /*0x35EA0000-0x00000000*/ private name InBoneName1[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Position1[8388609], InComponent2;
    local /*0x35EA0000-0x00000000*/ private name InBoneName2[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Position2[8388609];


}

// Export URB_Spring::execClear(FFrame&, void* const)
native function Clear();
