import linenoise.LineNoise;
import Sys;

class Test {
    static function main() {
        //trace("Hello Terminal, ready to clean?");
        //LineNoise.linenoiseSetMultiLine(1);
        //LineNoise.linenoiseClearScreen();
        LineNoise.linenoisePrintKeyCodes();
        Sys.println("Type 'quit' or end-of-line to end the session.");
        while (true) {
            var a:String = LineNoise.linenoise("prompt> ");
            if (a == "quit") break;
            if (a == "") continue;
            trace(a);
            Sys.println(" " + a);
        }

    }
}