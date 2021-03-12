'use strict';
/* globals $, app */

define('admin/plugins/encontext', ['settings'], function(Settings) {

	var ACP = {};

	ACP.init = function() {
		Settings.load('encontext', $('.encontext-settings'));

		$('#save').on('click', function() {
			Settings.save('encontext', $('.encontext-settings'), function() {
				app.alert({
					type: 'success',
					alert_id: 'encontext-saved',
					title: 'Settings Saved',
					message: 'EnContext settings saved'
				});
			});
		});
	};

	return ACP;
});