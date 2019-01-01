(function webpackUniversalModuleDefinition(root, factory) {
	if(typeof exports === 'object' && typeof module === 'object')
		module.exports = factory();
	else if(typeof define === 'function' && define.amd)
		define([], factory);
	else if(typeof exports === 'object')
		exports["Neutrominator"] = factory();
	else
		root["Neutrominator"] = factory();
})(typeof self !== 'undefined' ? self : this, function() {
return /******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

module.exports = __webpack_require__(1);


/***/ }),
/* 1 */
/***/ (function(module, exports) {

var Neutrominator;

Neutrominator = (function() {
  var haystack, languagePrefixes, tagNames;

  class Neutrominator {
    constructor(doStrict = true) {
      this.doStrict = doStrict;
      console.log('workit baby, ' + this.doStrict);
    }

    cleanText() {
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
    }

    parseAndRewrite() {
      this.replaceIt(/[\*_]innen/g, "Innen");
      return this.defaultRewrite();
    }

    parseAndRewriteStrict() {
      var i, lang, len;
      for (i = 0, len = languagePrefixes.length; i < len; i++) {
        lang = languagePrefixes[i];
        this.replaceIt(new RegExp(lang + "[\*_]innen", "g"), lang + "en");
      }
      this.replaceIt(/(\sd|D)en ([a-zA-ZßäöüÄÖÜ]*)en ([a-zA-ZßäöüÄÖÜ]*)er[\*_]innen([a-zßäöü])/g, "$1en $2en $3er$4");
      this.replaceIt(/(\sd|D)en ([a-zA-ZßäöüÄÖÜ]*)en ([a-zA-ZßäöüÄÖÜ]*)er[\*_]innen/g, "$1en $2en $3ern");
      this.replaceIt(/(\sd|D)en ([a-zA-ZßäöüÄÖÜ]*)en ([a-zA-ZßäöüÄÖÜ\s]*)r[\*_]innen/g, "$1en $2en $3ren");
      this.replaceIt(/on ([a-zA-ZßäöüÄÖÜ]*)er[\*_]innen/g, "on $1ern");
      this.replaceIt(/on ([a-zA-ZßäöüÄÖÜ]*)r[\*_]innen/g, "on $1ren");
      this.replaceIt(/die ([a-zA-ZßäöüÄÖÜ]*)en ([a-zA-ZßäöüÄÖÜ]*)er[\*_]innen/g, "die $1en $2er");
      this.replaceIt(/(\sd|D)en ([a-zA-ZäöüÄÖÜ]*)er[\*_]innen/g, "$1en $2ern");
      this.replaceIt(/or[\*_]innen/g, "oren");
      this.replaceIt(/er[\*_]innen/g, "er");
      this.replaceIt(/([gt])[\*_]innen/g, "$1en");
      this.replaceIt(/(\sd|D)en ([a-zA-ZäöüÄÖÜ]*)[\*_]innen/g, "$1en $2en");
      this.replaceIt(/Freund[\*_]innen/g, "Freunde");
      this.replaceIt(/Herr[\*_]innen/g, "Herren");
      this.replaceIt(/d[\*_]innen/g, "den");
      this.replaceIt(/r[\*_]innen/g, "re");
      this.replaceIt(/f[\*_]innen/g, "fs");
      this.replaceIt(/[\*_]innen/g, "");
      this.replaceIt(/e[\*_]r/g, "er");
      this.replaceIt(/einen[\*_]ihren/g, "einen");
      this.replaceIt(/(\se|E)ine[\*_]r /g, "einer ");
      return this.defaultRewrite();
    }

    replaceIt(needle, term) {
      return this.haystack.innerHTML = this.haystack.innerHTML.replace(needle, term);
    }

    defaultRewrite() {
      this.replaceIt(/[\*_]in([ ,.])/g, "$1");
      this.replaceIt(/[\*_]n([ ,.])/g, "n$1");
      this.replaceIt(/Studierenden/g, "Studenten");
      this.replaceIt(/([eine|die]) Studierende/g, "$1 Studentin");
      this.replaceIt(/Studierende/g, "Studenten");
      this.replaceIt(/Studierender/g, "Student");
      this.replaceIt(/(\sd|D)er[\*_]diejenige/g, "$1erjenige");
      this.replaceIt(/(\sd|D)ie[\*_]derjenige/g, "$1erjenige");
      this.replaceIt(/(\se|E)ine[\*_]r /g, "$1iner ");
      this.replaceIt(/([eE])in[\*_]e /g, "$1ine ");
      this.replaceIt(/([sS])eine[\*_]ihre/g, "$1eine");
      this.replaceIt(/ihre[\*_]seine/g, "seine");
      return this.replaceIt(/Ihre[\*_]seine/g, "Seine");
    }

    getDativ(noun) {
      noun = noun.replace(/ler[\*_]innen/g, "lern");
      noun = noun.replace(/er[\*_]innen/g, "ern");
      noun = noun.replace(/r[\*_]innen/g, "rn");
      noun = noun.replace(/[\*_]innen/g, "n");
      return noun;
    }

  };

  tagNames = ['h1', 'h2', 'h3', 'h4', 'h5', 'p'];

  languagePrefixes = ['Pol', 'Russ', 'Schwed', 'Finn', 'Dän', 'Lett', 'Türk', 'Portugies'];

  haystack = null;

  return Neutrominator;

}).call(this);

module.exports = Neutrominator;


/***/ })
/******/ ]);
});