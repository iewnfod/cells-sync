#!/bin/bash

cd $(dirname $0)

./cells-sync-bin & ./cells-sync-bin webview
