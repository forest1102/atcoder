"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.toCmdParam = void 0;
const toCmdParam = (obj) => obj
    ? Object.keys(obj).reduce((acc, key) => acc + ` --${key} "${obj[key]}"`, '')
    : '';
exports.toCmdParam = toCmdParam;
