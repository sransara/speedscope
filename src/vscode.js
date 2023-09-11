function overrideConsoleLogging(vscode) {
  const console = window.console
  const methods = ['log', 'info', 'warn', 'error']
  for (const method of methods) {
    console[method] = (...args) => {
      vscode.postMessage({clientCommand: `console`, method, args})
    }
  }
}

;(function () {
  const vscode = acquireVsCodeApi()
  window.vscode = vscode
  overrideConsoleLogging(vscode)
  vscode.postMessage({clientEvent: 'ready'})
})()
