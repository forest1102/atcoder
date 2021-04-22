import type * as Vscode from 'vscode'
import type * as Path from 'path'
import { toCmdParam } from './util'
export const execute = async (args: any) => {
  const vscode: typeof Vscode = args.require('vscode')
  const path = args.require('path') as typeof Path
  try {
    let compiler:string |null=args.options?.compiler
    compiler=args.replaceValues(compiler)
    if (!compiler)
      throw new Error('Command Not specified')
    const filename=args.replaceValues('${activeFile}')
    if (!filename)
      throw new Error('File not specified')
    const parsedPath = path.parse(filename)
    const cmdStr=args.replaceValues(args.options?.params?.join(' '))
    
    const terminal =
      vscode.window.terminals.find(t=>t.name==='atcoder')||
      vscode.window.createTerminal({
        name: 'atcoder'
      })
    terminal.show(true)
    terminal.sendText(`cd ${parsedPath.dir}`)
    terminal.sendText(compiler+'&& atcoder-tools submit '+cmdStr)
  } catch (e) {
    vscode.window.showErrorMessage(e)
  }
}