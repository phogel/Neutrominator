chrome.browserAction.onClicked.addListener(function(tab) {
  console.log('Bereinigung der Sprache...');
  chrome.tabs.executeScript(null, {file: "neutrum.js"});
});
