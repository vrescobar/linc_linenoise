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
    static function linenoiseClearScreen(): Void;

    @:native("linenoiseSetMultiLine")
    static function linenoiseSetMultiLine(ml:Int):Void;

    @:native("linenoisePrintKeyCodes")
    static function linenoisePrintKeyCodes():Void;

    @:native("linenoise")
    static function linenoise(prompt:String):String;


} //LineNoise


/*
typedef struct linenoiseCompletions {
  size_t len;
  char **cvec;
} linenoiseCompletions;

typedef void(linenoiseCompletionCallback)(const char *, linenoiseCompletions *);
void linenoiseSetCompletionCallback(linenoiseCompletionCallback *);
void linenoiseAddCompletion(linenoiseCompletions *, const char *);

int linenoiseHistoryAdd(const char *line);
int linenoiseHistorySetMaxLen(int len);
int linenoiseHistorySave(const char *filename);
int linenoiseHistoryLoad(const char *filename);

*/