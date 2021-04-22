"use strict";
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
exports.execute = void 0;
const execute = (args) => __awaiter(void 0, void 0, void 0, function* () {
    var _a, _b, _c;
    const vscode = args.require('vscode');
    const path = args.require('path');
    try {
        let compiler = (_a = args.options) === null || _a === void 0 ? void 0 : _a.compiler;
        compiler = args.replaceValues(compiler);
        if (!compiler)
            throw new Error('Command Not specified');
        const filename = args.replaceValues('${activeFile}');
        if (!filename)
            throw new Error('File not specified');
        const parsedPath = path.parse(filename);
        const cmdStr = args.replaceValues((_c = (_b = args.options) === null || _b === void 0 ? void 0 : _b.params) === null || _c === void 0 ? void 0 : _c.join(' '));
        const terminal = vscode.window.terminals.find(t => t.name === 'atcoder') ||
            vscode.window.createTerminal({
                name: 'atcoder'
            });
        terminal.show(true);
        terminal.sendText(`cd ${parsedPath.dir}`);
        terminal.sendText(compiler + '&& atcoder-tools test ' + cmdStr);
    }
    catch (e) {
        vscode.window.showErrorMessage(e.message || JSON.stringify(e));
    }
});
exports.execute = execute;
