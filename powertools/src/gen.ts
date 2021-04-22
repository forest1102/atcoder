import type * as Vscode from 'vscode'
import type * as Path from 'path'
import {toCmdParam} from './util'
export const execute = async (args: any) => {
  const vscode: typeof Vscode = args.require('vscode')
  const path = args.require('path') as typeof Path
  try {
    const input = await vscode.window.showInputBox({
      placeHolder: 'enter atcoder contest id'
    })
    if(!input) return 
    const param=args.options?.params||{}
    const dir=path.join(__dirname,'../')
    const cmdStr=args.replaceValues(args.options?.params?.join(' '))
    
    const terminal =
      vscode.window.terminals.find(t=>t.name==='atcoder')||
      vscode.window.createTerminal({
        name: 'atcoder'
      })
    terminal.show(true)
    terminal.sendText(`cd ${dir} &&atcoder-tools gen ${cmdStr} ${input}`)
  } catch (e) {
    vscode.window.showErrorMessage(e)
  }
}
