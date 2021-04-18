"use strict";
// The MIT License (MIT)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to
// deal in the Software without restriction, including without limitation the
// rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.getTitle = exports.onDispose = exports.execute = void 0;
const execute = (args) => __awaiter(void 0, void 0, void 0, function* () {
    const vscode = args.require('vscode');
    const path = args.require('path');
    try {
        const { exec, spawn } = args.require('child_process');
        if (args.file) {
            const uri = vscode.Uri.parse(args.file);
            const parsedPath = path.parse(uri.path);
            const terminal = vscode.window.activeTerminal ||
                vscode.window.createTerminal({
                    name: 'atcoder'
                });
            terminal.show(true);
            terminal.sendText(`cd ${parsedPath.dir}`);
            terminal.sendText(`g++ -std=c++17 -fsanitize=address -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC ${parsedPath.base} && atcoder-tools test`);
        }
        else if (args.folder) {
            // folder => vscode.Uri
            vscode.window.showInformationMessage(`Folder: '${args.folder}'`);
        }
    }
    catch (e) {
        vscode.window.showErrorMessage(e);
    }
});
exports.execute = execute;
/**
 * The web view is going to be disposed.
 */
const onDispose = args => { };
exports.onDispose = onDispose;
/**
 * This returns the title, which is displayed in the tab
 * of the web view.
 */
const getTitle = () => {
    return 'Atcoder';
};
exports.getTitle = getTitle;
