class NavMeshPath_SameCoverLink extends NavMeshPathConstraint;

var(*) /*0x35EA0000-0x00000000*/ private @NULL TestLink;

static final function SameCoverLink()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NavHandle[8388609], InLink, NewConstraint;

    NewConstraint = NavMeshPath_SameCoverLink(NavHandle.CreatePathConstraint(default.Class));
    NewConstraint.TestLink = InLink;
    NavHandle.AddPathConstraint(NewConstraint);
    //return;    
}

function Recycle()
{
    super.Recycle();
    TestLink = none;
    //return;    
}
