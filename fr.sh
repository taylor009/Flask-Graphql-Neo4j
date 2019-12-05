#!/usr/bin/env bash
freeze=$(pip freeze > requirements.txt)

echo "Python requirements should be updated. $freeze"