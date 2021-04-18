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
const util_1 = require("./util");
const execute = (args) => __awaiter(void 0, void 0, void 0, function* () {
    var _a;
    const vscode = args.require('vscode');
    const path = args.require('path');
    try {
        const input = yield vscode.window.showInputBox({
            placeHolder: 'enter atcoder contest id'
        });
        if (!input)
            return;
        const param = ((_a = args.options) === null || _a === void 0 ? void 0 : _a.params) || {};
        param.config = 'atcodertools.toml';
        const dir = path.join(__dirname, '../');
        const terminal = vscode.window.terminals.find(t => t.name === 'atcoder') ||
            vscode.window.createTerminal({
                name: 'atcoder'
            });
        terminal.show(true);
        terminal.sendText(`cd ${dir} &&atcoder-tools gen ${util_1.toCmdParam(param)} ${input}`);
    }
    catch (e) {
        vscode.window.showErrorMessage(e);
    }
});
exports.execute = execute;
