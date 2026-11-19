class MorphNodeWeightBase extends MorphNodeBase
    abstract
    hidecategories(Object,Object,Object);

struct native MorphNodeConn
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ChildNodes;
    var(*) /*0x35EA0000-0x00000000*/ private name ConnName;
    var(*) /*0x35EA0000-0x00000000*/ private int DrawY;

    structdefaultproperties
    {
        ChildNodes=none
        ConnName="None"
        DrawY=0
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array NodeConns;
