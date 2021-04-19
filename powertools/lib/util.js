"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.toCmdParam = void 0;
const toCmdParam = (obj) => obj
    ? Object.keys(obj).reduce((acc, key) => acc + (obj[key] ? ` --${key} "${obj[key]}"` : ` --${key}`), '')
    : '';
exports.toCmdParam = toCmdParam;
