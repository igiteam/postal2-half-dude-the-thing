class LPTuneDataGrabPointId_Laroche extends LPTuneDataGrabPointId
    editinlinenew
    hidecategories(Object);

enum eVsLarocheGrabPoints
{
    egpLeftArm,                     // 0
    egpLeftShoulder,                // 1
    egpRightShoulder,               // 2
    egpRightBicep,                  // 3
    egpCockpitCrossBarForShield,    // 4
    egpCockpitCrossBar,             // 5
    egpRightInnerShoulder,          // 6
    egpLeftArmWhenStuned,           // 7
    egpLeftShoulderWhenStuned,      // 8
    egpRightShoulderWhenStuned,     // 9
    egpRightBicepWhenStuned,        // 10
    egpCockpitCrossBarForShieldWhenStuned,// 11
    egpCockpitCrossBarWhenStuned,   // 12
    egpCockpitFinal,                // 13
    eVsLarocheGrabPoints_MAX        // 14
};

enum eVsLarocheWinchPoints
{
    eVsLarocheWinchPoints_LeftShoulder,// 0
    eVsLarocheWinchPoints_CenterBar,// 1
    eVsLarocheWinchPoints_MAX       // 2
};

var(0.25_Pct) /*0x89CC0000-0x00000000*/ private byte GrabPointId[65537];

event GetGrabPointId()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return int(GrabPointId);
    //return ReturnValue;    
}
