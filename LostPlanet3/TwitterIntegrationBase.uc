class TwitterIntegrationBase extends PlatformInterfaceBase
    transient;

enum ETwitterRequestMethod
{
    TRM_Get,                        // 0
    TRM_Post,                       // 1
    TRM_Delete,                     // 2
    TRM_MAX                         // 3
};

enum ETwitterIntegrationDelegate
{
    TID_AuthorizeComplete,          // 0
    TID_TweetUIComplete,            // 1
    TID_RequestComplete,            // 2
    TID_MAX                         // 3
};

// Export UTwitterIntegrationBase::execInit(FFrame&, void* const)
native event Init();

// Export UTwitterIntegrationBase::execCanShowTweetUI(FFrame&, void* const)
native event CanShowTweetUI()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UTwitterIntegrationBase::execShowTweetUI(FFrame&, void* const)
native event ShowTweetUI()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InitialMessage[9437185], URL, Picture;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UTwitterIntegrationBase::execAuthorizeAccounts(FFrame&, void* const)
native event AuthorizeAccounts()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UTwitterIntegrationBase::execGetNumAccounts(FFrame&, void* const)
native event GetNumAccounts()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UTwitterIntegrationBase::execGetAccountName(FFrame&, void* const)
native event GetAccountName()
{
    local /*0x35EA0000-0x00000000*/ private int AccountIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UTwitterIntegrationBase::execGetAccountId(FFrame&, void* const)
native event GetAccountId()
{
    local /*0x35EA0000-0x00000000*/ private int AccountIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];


}

// Export UTwitterIntegrationBase::execTwitterRequest(FFrame&, void* const)
native event TwitterRequest()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string URL[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ParamKeysAndValues[8388609];
    local /*0x35EA0000-0x00000000*/ private byte RequestMethod[8388609];
    local /*0x35EA0000-0x00000000*/ private int AccountIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}
