class InAppMessageBase extends PlatformInterfaceBase
    transient;

enum EInAppMessageInterfaceDelegate
{
    IAMD_InAppSMSUIComplete,        // 0
    IAMD_InAppEmailComplete,        // 1
    IAMD_MAX                        // 2
};

// Export UInAppMessageBase::execInit(FFrame&, void* const)
native event Init();

// Export UInAppMessageBase::execShowInAppSMSUI(FFrame&, void* const)
native event ShowInAppSMSUI()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InitialMessage[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UInAppMessageBase::execShowInAppEmailUI(FFrame&, void* const)
native event ShowInAppEmailUI()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InitialSubject[9437185], InitialMessage;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}
