class LPAnimatedPathHelper extends SPKyAnimatedPathHelper
    hidecategories(AnimDependency,Navigation,Physics,Object,Destruct,Interaction,Attachment,Collision,Debug);

enum EAnimatedPathType
{
    EAPT_Bridge,                    // 0
    EAPT_LockedDoor,                // 1
    EAPT_OpenDoor,                  // 2
    EAPT_UsableDoor,                // 3
    EAPT_MAX                        // 4
};

var(0.25_Pct) /*0x062A0000-0x00000000*/ private byte PathType[65537];

// Export ULPAnimatedPathHelper::execSetPathType(FFrame&, void* const)
native function SetPathType()
{
    local /*0x97E50000-0x00000000*/ private byte InPathType[8388609];


}

function OnSetAnimatedPathType()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    SetPathType(Action.PathType);
    //return;    
}

defaultproperties
{
    // Reference: SPKyAnimatedPathComponent'Default__LPAnimatedPathHelper.KyComp'
    begin object name=KyComp
    end object
    AnimatedPathComponent=KyComp
    Components[0]=none
    Components[1]=none
    Components[2]=KyComp
    SupportedEvents=/* Array type was not detected. */
}