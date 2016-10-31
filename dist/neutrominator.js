(function webpackUniversalModuleDefinition(root, factory) {
	if(typeof exports === 'object' && typeof module === 'object')
		module.exports = factory();
	else if(typeof define === 'function' && define.amd)
		define([], factory);
	else if(typeof exports === 'object')
		exports["Neutrominator"] = factory();
	else
		root["Neutrominator"] = factory();
})(this, function() {
return /******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports) {

	var Neutrominator;

	Neutrominator = (function() {
	  var tagNames;

	  tagNames = ['h1', 'h2', 'h3', 'h4', 'h5', 'p'];

	  function Neutrominator() {
	    console.log('Neutrumator geladen');
	  }

	  Neutrominator.prototype.cleanText = function() {
	    var element, i, len, results, tagName;
	    results = [];
	    for (i = 0, len = tagNames.length; i < len; i++) {
	      tagName = tagNames[i];
	      if (document.getElementsByTagName(tagName).length > 0) {
	        results.push((function() {
	          var j, len1, ref, results1;
	          ref = document.getElementsByTagName(tagName);
	          results1 = [];
	          for (j = 0, len1 = ref.length; j < len1; j++) {
	            element = ref[j];
	            results1.push(this.parseAndRewrite(element));
	          }
	          return results1;
	        }).call(this));
	      } else {
	        results.push(void 0);
	      }
	    }
	    return results;
	  };

	  Neutrominator.prototype.parseAndRewrite = function(content) {
	    this.replaceIt(content, /\*innen/, "Innen");
	    this.replaceIt(content, /\_innen/, "Innen");
	    this.replaceIt(content, /\*in /, " ");
	    this.replaceIt(content, /\*n /, "n ");
	    this.replaceIt(content, /Studierenden/, "Studenten");
	    this.replaceIt(content, /Studierende/, "Studentin");
	    return this.replaceIt(content, /Studierender/, "Student");
	  };

	  Neutrominator.prototype.replaceIt = function(haystack, needle, term) {
	    var results;
	    results = [];
	    while (haystack.innerText.match(needle)) {
	      results.push(haystack.innerText = haystack.innerText.replace(needle, term));
	    }
	    return results;
	  };

	  return Neutrominator;

	})();

	window.cleanser = new Neutrominator();

	window.onload = function() {
	  return window.cleanser.cleanText();
	};


/***/ }
/******/ ])
});
;