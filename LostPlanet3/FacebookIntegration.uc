class FacebookIntegration extends PlatformInterfaceBase
    transient
    config(Engine);

enum EFacebookIntegrationDelegate
{
    FID_AuthorizationComplete,      // 0
    FID_FacebookRequestComplete,    // 1
    FID_DialogComplete,             // 2
    FID_FriendsListComplete,        // 3
    FID_MAX                         // 4
};

struct native FacebookFriend
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Name;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Id;

    structdefaultproperties
    {
        Name=""
        Id=""
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string AppID[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Permissions[1073741825];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string UserName;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string UserId;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string AccessToken;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FriendsList;

// Export UFacebookIntegration::execInit(FFrame&, void* const)
native event Init()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UFacebookIntegration::execAuthorize(FFrame&, void* const)
native event Authorize()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UFacebookIntegration::execIsAuthorized(FFrame&, void* const)
native event IsAuthorized()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UFacebookIntegration::execFacebookRequest(FFrame&, void* const)
native event FacebookRequest()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string GraphRequest[8388609];


}

// Export UFacebookIntegration::execFacebookDialog(FFrame&, void* const)
native event FacebookDialog()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Action[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array ParamKeysAndValues[8388609];


}

// Export UFacebookIntegration::execDisconnect(FFrame&, void* const)
native event Disconnect();
