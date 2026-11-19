//-----------------------------------------------------------
//
//-----------------------------------------------------------
class Chapters extends Actor
config(Story);

struct PageStruct{
    var string Text;
    var Material Image;
    var sound Audio;
};

var config array<PageStruct> Page;

