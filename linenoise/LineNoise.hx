package linenoise;

@:keep
@:structAccess
@:include('linenoise.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('linenoise'))
#end

extern class LineNoise {
    @:native("linenoiseClearScreen")
    static function linenoiseClearScreen():Void;

    @:native("linenoiseSetMultiLine")
    static function linenoiseSetMultiLine(ml:Int):Void;

    @:native("linenoisePrintKeyCodes")
    static function linenoisePrintKeyCodes():Void;

    @:native("linenoise")
    static function _linenoise(prompt:cpp.ConstCharStar):cpp.ConstCharStar;
    static inline function linenoise(prompt:String):String return cast _linenoise(prompt);

    @:native("linenoiseHistoryAdd")
    static function linenoiseHistoryAdd(line:cpp.ConstCharStar):Int;

    @:native("linenoiseHistorySetMaxLen")
    static function linenoiseHistorySetMaxLen(len:Int):Int;

    @:native("linenoiseHistorySave")
    static function linenoiseHistorySave(filename:cpp.ConstCharStar):Int;

    @:native("linenoiseHistoryLoad")
    static function linenoiseHistoryLoad(filename:cpp.ConstCharStar):Int;
} //LineNoise


/*
typedef struct linenoiseCompletions {
  size_t len;
  char **cvec;
} linenoiseCompletions;

typedef void(linenoiseCompletionCallback)(const char *, linenoiseCompletions *);
void linenoiseSetCompletionCallback(linenoiseCompletionCallback *);
void linenoiseAddCompletion(linenoiseCompletions *, const char *);
*/