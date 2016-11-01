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
/***/ function(module, exports, __webpack_require__) {

	module.exports = __webpack_require__(1);


/***/ },
/* 1 */
/***/ function(module, exports) {

	var Neutrominator;

	Neutrominator = (function() {
	  var tagNames;

	  tagNames = ['h1', 'h2', 'h3', 'h4', 'h5', 'p'];

	  function Neutrominator(doStrict) {
	    this.doStrict = doStrict != null ? doStrict : true;
	    console.log('workit baby, ' + this.doStrict);
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
	            if (this.doStrict) {
	              results1.push(this.parseAndRewriteStrict(element));
	            } else {
	              results1.push(this.parseAndRewrite(element));
	            }
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
	    this.replaceIt(content, /\*innen/g, "Innen");
	    this.replaceIt(content, /\_innen/g, "Innen");
	    return this.defaultRewrite(content);
	  };

	  Neutrominator.prototype.parseAndRewriteStrict = function(content) {
	    this.replaceIt(content, /en ([a-zA-Z]*)er\*innen/g, "en $1ern");
	    this.replaceIt(content, /en ([a-zA-Z]*)er_innen/g, "en $1ern");
	    this.replaceIt(content, /or\*innen/g, "oren");
	    this.replaceIt(content, /er\*innen/g, "er");
	    this.replaceIt(content, /t\*innen/g, "ten");
	    this.replaceIt(content, /or_innen/g, "oren");
	    this.replaceIt(content, /er_innen/g, "er");
	    this.replaceIt(content, /t\_innen/g, "ten");
	    this.replaceIt(content, /\*innen/g, "");
	    this.replaceIt(content, /_innen/g, "");
	    return this.defaultRewrite(content);
	  };

	  Neutrominator.prototype.defaultRewrite = function(content) {
	    this.replaceIt(content, /\*in /g, " ");
	    this.replaceIt(content, /\_in /g, " ");
	    this.replaceIt(content, /\*n /g, "n ");
	    this.replaceIt(content, /\_n /g, "n ");
	    this.replaceIt(content, /Studierenden/g, "Studenten");
	    this.replaceIt(content, /Studierende/g, "Studentin");
	    return this.replaceIt(content, /Studierender/g, "Student");
	  };

	  Neutrominator.prototype.replaceIt = function(haystack, needle, term) {
	    return haystack.textContent = haystack.textContent.replace(needle, term);
	  };

	  return Neutrominator;

	})();

	module.exports = Neutrominator;


/***/ }
/******/ ])
});
;