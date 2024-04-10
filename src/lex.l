%option noyywrap

/* 定义模式 */
DIGIT   [0-9]
LETTER  [a-zA-Z]
ID      {LETTER}({LETTER}|{DIGIT})*
NUMBER  {DIGIT}+

%%

{ID}    {
            /* 识别标识符 */
            printf("Identifier: %s\n", yytext);
        }

{NUMBER} {
            /* 识别整数字面量 */
            printf("Integer: %s\n", yytext);
        }

[ \t]+  {
            /* 忽略空格和制表符 */
        }

\n      {
            /* 遇到行尾结束 */
            return 0;
        }

.       {
            /* 其他字符 */
            printf("Unrecognized character: %s\n", yytext);
            return 1;
        }

%%
