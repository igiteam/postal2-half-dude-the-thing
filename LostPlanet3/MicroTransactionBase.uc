class MicroTransactionBase extends PlatformInterfaceBase
    transient;

enum EMicroTransactionDelegate
{
    MTD_PurchaseQueryComplete,      // 0
    MTD_PurchaseComplete,           // 1
    MTD_MAX                         // 2
};

enum EMicroTransactionResult
{
    MTR_Succeeded,                  // 0
    MTR_Failed,                     // 1
    MTR_Canceled,                   // 2
    MTR_RestoredFromServer,         // 3
    MTR_MAX                         // 4
};

struct native PurchaseInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Identifier;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string DisplayName;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string DisplayDescription;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string DisplayPrice;

    structdefaultproperties
    {
        Identifier=""
        DisplayName=""
        DisplayDescription=""
        DisplayPrice=""
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AvailableProducts;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string LastError;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string LastErrorSolution;

// Export UMicroTransactionBase::execInit(FFrame&, void* const)
native event Init();

// Export UMicroTransactionBase::execQueryForAvailablePurchases(FFrame&, void* const)
native event QueryForAvailablePurchases()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UMicroTransactionBase::execIsAllowedToMakePurchases(FFrame&, void* const)
native event IsAllowedToMakePurchases()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UMicroTransactionBase::execBeginPurchase(FFrame&, void* const)
native event BeginPurchase()
{
    local /*0x35EA0000-0x00000000*/ private int Index[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UMicroTransactionBase::execGetProductIndex(FFrame&, void* const)
native event GetProductIndex()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Identifier[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}
