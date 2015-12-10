import linenoise.LineNoise;
import Sys;

class Test {
    static function main() {
        var stdin = Sys.stdin();
        trace("Hello Terminal, ready to clean?");
        //var a = stdin.readLine();
        LineNoise.linenoiseClearScreen();
        LineNoise.linenoisePrintKeyCodes();
        trace("Bye!");

    }
}