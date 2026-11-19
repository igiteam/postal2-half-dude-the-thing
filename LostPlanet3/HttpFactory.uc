class HttpFactory extends Object
    config(Engine);

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string HttpRequestClassName[1073741825];

static function CreateRequest()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private class HttpRequestClass;
    local /*0x35EA0000-0x00000000*/ private @NULL HttpReq;

    HttpRequestClass = class<Object>(DynamicLoadObject(default.HttpRequestClassName, Class'Core.Class'));
    HttpReq = new HttpRequestClass;
    return HttpRequestInterface(HttpReq);
    //return ReturnValue;    
}

defaultproperties
{
    HttpRequestClassName="WinDrv.HttpRequestWindows"
}