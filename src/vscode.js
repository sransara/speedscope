;(function () {
  const vscode = acquireVsCodeApi()
  vscode.postMessage({type: 'ready'})
})()
