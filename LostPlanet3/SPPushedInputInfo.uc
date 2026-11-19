class SPPushedInputInfo extends Object
    abstract
    editinlinenew
    hidecategories(Object);

function GetPushedInputClassType()
{
    local /*0x01E60000-0x00000000*/ private class ReturnValue[92274689];

    return none;
    //return ReturnValue;    
}

final function GetNewInput()
{
    local /*0x01E60000-0x00000000*/ private @NULL InOuter[8388609], ReturnValue, newinput;
    local /*0x01E60000-0x00000000*/ private class NewClass;

    NewClass = GetPushedInputClassType();
    // End:0x84
    if(NewClass != none)
    {
        newinput = new (InOuter) NewClass;
        // End:0x84
        if(newinput != none)
        {
            newinput.OnInputObjectCreate();
            InitNewInput(newinput);
        }
    }
    return newinput;
    //return ReturnValue;    
}

function InitNewInput()
{
    local /*0x01E60000-0x00000000*/ private @NULL newinput[8388609];

    //return;    
}
