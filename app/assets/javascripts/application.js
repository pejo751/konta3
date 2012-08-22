// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui-1.8.22.custom.min
//= require_tree .

function setFocusDefault() {
	if (document.forms[0] == null) return;
	for (var i = 0; i < document.forms[0].elements.length; i++) {
		e = document.forms[0].elements[i];
		if (((e.type == "text") || (e.type == "textarea")) && (!e.disabled)) {
			e.focus();
			break;
		}
	}
}

function setFocusNewTarja() {
	if (document.forms[0] == null) return;
	for (var i = 0; i < document.forms[0].elements.length; i++) {
		e = document.forms[0].elements[i];
		switch(e.name) {
			case "tarja[entrada]":
				e.focus();
				break;
			case "tarja[tipo_de_tarja_id]":
				e.focus();
				break;
			case "tarja[fecha]":
				if (e.value == '') {
					e.focus();
					return;
				}
			case "tarja[numero_legajo]":
				e.focus();
				break;
		}
	}
}

function setFocusInformarRegularidad() {
	if (document.forms[0] == null) return;
	for (var i = 0; i < document.forms[0].elements.length; i++) {
		e = document.forms[0].elements[i];
		switch(e.name) {
			case "formulario[desde]":
				e.focus();
			case "formulario[numero_legajo]":
				if (e.value != '') {
					e.focus();
				}
		}
	}
}
