#! /bin/sh

# Build PDF deck
md_file=presentation.md

# bs pdf $md_file
title=head -n 1 presentation.md | sed -En 's/title: (.*)/\1/p'
echo($title)