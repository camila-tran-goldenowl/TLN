/**
 * Note that path, label and actualPriceDisabled vars must be provided. See currency.inc.xhtml. 
 */

function updateCurrency( currency ) {
	var curbase = fx.base;
	if ( currency !== undefined ) {
		fx.base = currency.value;
	}
	if ( fx.base != curbase || typeof fx.rates == "undefined" ) {
		var data = { base: fx.base };
		if (companyId) {
			data.uid = companyId;
		}
		$.ajax({
			method: "GET",
			dataType: "json",
			cache: false,
	    	// Using cache see CurrencyExchangeRatesCache.
			url: path + "/currency",
			data: data,
	        success: function(data) {
	            // Check money.js has finished loading:
	            if ( typeof fx !== "undefined" ) {
	                fx.rates = data.rates;
	            } else {
	                // If not, apply to fxSetup global:
	                var fxSetup = {
	                    rates : data.rates
	                }
	            }
	            replaceOriginalValue();
	        },
	        error: function() { 
    			replaceOriginalValue( true );
    		}
		});
	} else {
		replaceOriginalValue();
	}
}

function replaceOriginalValue( error ) {
	// Get the symbol
	var symbol = currency_symbols[ fx.base ];
	if( symbol === undefined) {
		symbol = "$";
	}
	var precision = 2;
	if ( fx.base === "JPY" || fx.base === "KRW" || fx.base === "TWD" ) {
		precision = 0;
	}
	$( ".cur" ).each( function( index, obj ) {
    	var numval = obj.getAttribute( "original-value" );
    	var curval = obj.getAttribute( "original-value-currency" );
    	var fmtval = obj.getAttribute( "original-value-formatted" );
    	var sufix = obj.getAttribute( "sufix" );
    	if ( numval !== undefined && curval !== undefined && fmtval !== undefined ) {
    		if ( sufix === undefined || sufix == null ) {
    			sufix = "";
    		}
    		if ( curval == fx.base || error == true || typeof fx.rates === "undefined" ) {
    			obj.innerHTML = fmtval + sufix;
    		} else if ( typeof fx.rates[curval] !== "undefined" && fx.rates[curval] != 0 ) {
    			obj.innerHTML = accounting.formatMoney(fx(numval).from(curval).to(fx.base), symbol, precision) + sufix;
    			var tmpactual = obj.getAttribute( "show-actual" );
    			if (actualPriceDisabled !== true) {
	    			var actual;
	        		if ( tmpactual === undefined || tmpactual == null ) {
	        			actual = true;
	        		} else {
	        			actual = (tmpactual === "true");
	        		}
	        		if ( actual ) {
	        			obj.innerHTML += "<br /><div class='cur-orig-val'>(" + label + " " + fmtval + " " + curval + ")</div>";
	        		}
    			}
    		} else {
    			obj.innerHTML = fmtval + sufix;
    		}
    	}
	} );
}

var currency_symbols = {
	'JPY': '¥', // Japanese Yen
	'USD': '$', // US Dollar
	'EUR': '€', // Euro
	'GBP': '£', // British Pound Sterling
	'CNY': '¥', // Chinese Yuan
	'SGD': 'S$', // Singapore dollar
	'KRW': '₩', // South Korean Won
	'MYR': 'RM', // Malaysian ringgit
	'INR': '₹', // Indian Rupee
	'IDR': 'RP', // Indonesian rupiah
	'THB': '฿', // Thai Baht
	'TWD': 'NT$' // Taiwan New Taiwan dollar
};