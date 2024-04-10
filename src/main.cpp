#include "lex.yy.h"
#include <iostream>
#include <sstream>

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            std::stringstream sst;
            sst << "Error: could not open file '" << argv[1] << "'";
            perror(sst.str().c_str());
            return 1;
        }

        yyin = file;

        yylex();

        fclose(file);
    } else {
        std::cerr << "Usage: " << argv[0] << " <filename>" << std::endl;
        return 1;
    }

    return 0;
}
