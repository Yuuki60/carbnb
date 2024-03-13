var e={};(function(t,n){e=n()})(0,(function(){function __spreadArrays(){for(var e=0,t=0,n=arguments.length;t<n;t++)e+=arguments[t].length;var i=Array(e),o=0;for(t=0;t<n;t++)for(var a=arguments[t],r=0,u=a.length;r<u;r++,o++)i[o]=a[r];return i}function rangePlugin(e){void 0===e&&(e={});return function(t){var n,i,o,a="";var createSecondInput=function(){if(e.input){n=e.input instanceof Element?e.input:window.document.querySelector(e.input);if(!n){t.config.errorHandler(new Error("Invalid input element specified"));return}t.config.wrap&&(n=n.querySelector("[data-input]"))}else{n=t._input.cloneNode();n.removeAttribute("id");n._flatpickr=void 0}if(n.value){var o=t.parseDate(n.value);o&&t.selectedDates.push(o)}n.setAttribute("data-fp-omit","");if(t.config.clickOpens){t._bind(n,["focus","click"],(function(){if(t.selectedDates[1]){t.latestSelectedDateObj=t.selectedDates[1];t._setHoursFromDate(t.selectedDates[1]);t.jumpToDate(t.selectedDates[1])}i=true;t.isOpen=false;t.open(void 0,"left"===e.position?t._input:n)}));t._bind(t._input,["focus","click"],(function(e){e.preventDefault();t.isOpen=false;t.open()}))}t.config.allowInput&&t._bind(n,"keydown",(function(e){if("Enter"===e.key){t.setDate([t.selectedDates[0],n.value],true,a);n.click()}}));e.input||t._input.parentNode&&t._input.parentNode.insertBefore(n,t._input.nextSibling)};var r={onParseConfig:function(){t.config.mode="range";a=t.config.altInput?t.config.altFormat:t.config.dateFormat},onReady:function(){createSecondInput();t.config.ignoredFocusElements.push(n);if(t.config.allowInput){t._input.removeAttribute("readonly");n.removeAttribute("readonly")}else n.setAttribute("readonly","readonly");t._bind(t._input,"focus",(function(){t.latestSelectedDateObj=t.selectedDates[0];t._setHoursFromDate(t.selectedDates[0]);i=false;t.jumpToDate(t.selectedDates[0])}));t.config.allowInput&&t._bind(t._input,"keydown",(function(e){"Enter"===e.key&&t.setDate([t._input.value,t.selectedDates[1]],true,a)}));t.setDate(t.selectedDates,false);r.onValueUpdate(t.selectedDates);t.loadedPlugins.push("range")},onPreCalendarPosition:function(){if(i){t._positionElement=n;setTimeout((function(){t._positionElement=t._input}),0)}},onChange:function(){t.selectedDates.length||setTimeout((function(){if(!t.selectedDates.length){n.value="";o=[]}}),10);i&&setTimeout((function(){n.focus()}),0)},onDestroy:function(){e.input||n.parentNode&&n.parentNode.removeChild(n)},onValueUpdate:function(e){var r,u,s;if(n){o=!o||e.length>=o.length?__spreadArrays(e):o;if(o.length>e.length){var l=e[0];var c=i?[o[0],l]:[l,o[1]];c[0].getTime()>c[1].getTime()&&(i?c[0]=c[1]:c[1]=c[0]);t.setDate(c,false);o=__spreadArrays(c)}r=t.selectedDates.map((function(e){return t.formatDate(e,a)})),u=r[0],t._input.value=void 0===u?"":u,s=r[1],n.value=void 0===s?"":s}}};return r}}return rangePlugin}));var t=e;export{t as default};

