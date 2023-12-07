/**
 * Util scripts	for dialogs
 */

function hideProp() {
	$('#orderForm\\:focusProp').hide();
}

function showModal( ) {
	window.history.scrollRestoration = 'auto';
	window.history.pushState('backPressed', null, null);
	window.addEventListener('popstate', onBackPress, { once: true });
}
function onBackPress( ) {
	$('#orderForm\\:addbskdlg').hide();
	$('#orderForm\\:addbskdlg_modal').hide();
	$('#guestDialogForm\\:newguestdlg').hide();
	$('#guestDialogForm\\:newguestdlg_modal').hide();
	$('#guestDialogForm\\:editguestdlg').hide();
	$('#guestDialogForm\\:editguestdlg_modal').hide();
}

function hideModal( ) {
	// window.history.go(-1);
}
