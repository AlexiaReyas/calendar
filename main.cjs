'use strict';
const { app, BrowserWindow, Menu, session, dialog } = require('electron');
const path = require('node:path');
const { pathToFileURL } = require('node:url');
app.setName('privelifeof_reyas');
app.setAppUserModelId('com.reyas.privelife');
const entry = pathToFileURL(path.join(__dirname,'app','index.html')).href;
let window;
if (!app.requestSingleInstanceLock()) app.quit();
else {
  app.on('second-instance', () => { if (window) { if(window.isMinimized())window.restore(); window.focus(); } });
  app.whenReady().then(() => {
    session.defaultSession.setPermissionRequestHandler((_wc,_permission,callback)=>callback(false));
    session.defaultSession.webRequest.onBeforeRequest((details,callback)=>callback({cancel:!details.url.startsWith('file:')&&!details.url.startsWith('devtools:')&&!details.url.startsWith('blob:')}));
    window = new BrowserWindow({ width:1360,height:900,minWidth:720,minHeight:580,show:false,title:'privelifeof_reyas',backgroundColor:'#fcf6fa',icon:path.join(__dirname,'assets','icon.png'),webPreferences:{nodeIntegration:false,contextIsolation:true,sandbox:true,webSecurity:true,allowRunningInsecureContent:false} });
    window.webContents.setWindowOpenHandler(()=>({action:'deny'}));
    window.webContents.on('will-navigate',(event,url)=>{if(url!==entry&&!url.startsWith(entry+'#'))event.preventDefault();});
    window.once('ready-to-show',()=>window.show());
    window.webContents.on('did-fail-load',(_event,code,description)=>{if(code!==-3)dialog.showErrorBox('Ouverture impossible',description);});
    Menu.setApplicationMenu(Menu.buildFromTemplate([
      {label:'Application',submenu:[{label:'Quitter',role:'quit'}]},
      {label:'Édition',submenu:[{role:'undo'},{role:'redo'},{type:'separator'},{role:'cut'},{role:'copy'},{role:'paste'},{role:'selectAll'}]},
      {label:'Affichage',submenu:[{role:'reload'},{role:'resetZoom'},{role:'zoomIn'},{role:'zoomOut'},{role:'togglefullscreen'}]}
    ]));
    window.loadFile(path.join(__dirname,'app','index.html'));
  });
  app.on('window-all-closed',()=>app.quit());
}
