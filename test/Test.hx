import linenoise.LineNoise;
import Sys;

class Test {
    static function main() {
        //trace("Hello Terminal, ready to clean?");
        LineNoise.linenoiseSetMultiLine(5);
        //LineNoise.linenoiseClearScreen();
        //LineNoise.linenoisePrintKeyCodes();

        LineNoise.linenoiseHistoryLoad("history.txt"); /* Load the history at startup */
        Sys.println("Type 'quit' or end-of-line to end the session.");
        while (true) {
            var line:String = LineNoise.linenoise("prompt> ");
            if (line == "quit") break; // Eof quits
            if (line == "") continue;
            LineNoise.linenoiseHistoryAdd(line); /* Add to the history. */
            LineNoise.linenoiseHistorySave("history.txt"); /* Save the history on disk. */
            Sys.println(" " + line);
            // free line?
        }

    }
}