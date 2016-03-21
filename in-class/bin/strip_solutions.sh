#!/bin/sh

sed '/\\begin{solution}/,/\\end{solution}/c\
\\begin\{solution\}\
\  % Write your answer here.\
\\end\{solution\}\
' $1
