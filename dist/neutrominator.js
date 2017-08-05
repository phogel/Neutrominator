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
	  var haystack, languagePrefixes, tagNames;

	  tagNames = ['h1', 'h2', 'h3', 'h4', 'h5', 'p'];

	  languagePrefixes = ['Pol', 'Russ', 'Schwed', 'Finn', 'Dän', 'Lett', 'Türk', 'Portugies'];

	  haystack = null;

	  function Neutrominator(doStrict) {
	    this.doStrict = doStrict != null ? doStrict : true;
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
	            this.haystack = element;
	            if (this.doStrict) {
	              results1.push(this.parseAndRewriteStrict());
	            } else {
	              results1.push(this.parseAndRewrite());
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

	  Neutrominator.prototype.parseAndRewrite = function() {
	    this.replaceIt(/[\*_]innen/g, "Innen");
	    return this.defaultRewrite();
	  };

	  Neutrominator.prototype.parseAndRewriteStrict = function() {
	    var i, lang, len;
	    for (i = 0, len = languagePrefixes.length; i < len; i++) {
	      lang = languagePrefixes[i];
	      this.replaceIt(new RegExp(lang + "[\*_]innen", "g"), lang + "en");
	    }
	    this.replaceIt(/(\sd|D)en ([a-zA-Z]*)en ([a-zA-Z]*)er[\*_]innen([a-z])/g, "$1en $2en $3er$4");
	    this.replaceIt(/(\sd|D)en ([a-zA-Z]*)en ([a-zA-Z]*)er[\*_]innen/g, "$1en $2en $3ern");
	    this.replaceIt(/(\sd|D)en ([a-zA-Z]*)en ([\s\S]*)r[\*_]innen/g, "$1en $2en $3ren");
	    this.replaceIt(/die ([a-zA-Z]*)en ([a-zA-Z]*)er[\*_]innen/g, "die $1en $2er");
	    this.replaceIt(/(\sd|D)en ([a-zA-Z]*)er[\*_]innen/g, "$1en $2ern");
	    this.replaceIt(/or[\*_]innen/g, "oren");
	    this.replaceIt(/er[\*_]innen/g, "er");
	    this.replaceIt(/([gtd])[\*_]innen/g, "$1en");
	    this.replaceIt(/r[\*_]innen/g, "re");
	    this.replaceIt(/f[\*_]innen/g, "fs");
	    this.replaceIt(/[\*_]innen/g, "");
	    this.replaceIt(/e[\*_]r/g, "er");
	    return this.defaultRewrite();
	  };

	  Neutrominator.prototype.defaultRewrite = function() {
	    this.replaceIt(/[\*_]in([ ,.])/g, "$1");
	    this.replaceIt(/[\*_]n([ ,.])/g, "n$1");
	    this.replaceIt(/Studierenden/g, "Studenten");
	    this.replaceIt(/Studierende/g, "Studentin");
	    return this.replaceIt(/Studierender/g, "Student");
	  };

	  Neutrominator.prototype.replaceIt = function(needle, term) {
	    return this.haystack.innerHTML = this.haystack.innerHTML.replace(needle, term);
	  };

	  Neutrominator.prototype.getDativ = function(noun) {
	    noun = noun.replace(/ler[\*_]innen/g, "lern");
	    noun = noun.replace(/er[\*_]innen/g, "ern");
	    noun = noun.replace(/r[\*_]innen/g, "rn");
	    noun = noun.replace(/[\*_]innen/g, "n");
	    return noun;
	  };

	  return Neutrominator;

	})();

	module.exports = Neutrominator;


/***/ }
/******/ ])
});
;