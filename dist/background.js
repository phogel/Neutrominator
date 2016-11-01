
chrome.extension.onMessage.addListener(
  function(request, sender, sendResponse){
    if(request.msg == "cleanUp") {
      chrome.tabs.executeScript(null, {file: 'hardcleaner.js'});
    } else if(request.msg == "cleanUpSoftly") {
      chrome.tabs.executeScript(null, {file: 'softcleaner.js'});
    }
  }
);
