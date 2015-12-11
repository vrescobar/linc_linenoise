import linenoise.LineNoise;
import Sys;
using StringTools;

class Test {
    static function main() {

        LineNoise.linenoiseSetMultiLine(5);
        // A couple more of options:
        //LineNoise.linenoiseClearScreen();
        //LineNoise.linenoisePrintKeyCodes();

        LineNoise.linenoiseHistoryLoad("history.txt"); /* Load the history at startup */
        Sys.println("Type 'quit' or end-of-line to end the session.");
        var reg = ~/^\/historylen [0-9]+/;
        while (true) {
            try {
                var line:String = LineNoise.linenoise("prompt> ");
                if (line == "") continue;
                if (line == "quit") break;
                if (line.startsWith("/historylen")) {
                    if (reg.match(line)) {
                        var num:Int = Std.parseInt(line.substr("/historylen ".length, reg.matchedPos().len));
                        LineNoise.linenoiseHistorySetMaxLen(num);
                        LineNoise.linenoiseHistoryAdd(line); /* Add to the history. */
                        LineNoise.linenoiseHistorySave("history.txt"); /* Save the history on disk. */
                        continue;
                    } throw "you should write a number to set the history length: /historylen";
                }
                if (line.charAt(0) == "/") throw 'Command "${line}" not recognized';
                LineNoise.linenoiseHistoryAdd(line); /* Add to the history. */
                LineNoise.linenoiseHistorySave("history.txt"); /* Save the history on disk. */

                Sys.println(" " + line);
                // free line?
            } catch(ex:haxe.io.Eof) { // ctrl+D
                break;
            } catch(parsingError:String) {
                Sys.println("Error: " + parsingError);
            }
        }

    }
}