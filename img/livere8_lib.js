/* 2015.08.05 10:12 - Final : Lee Sang Wook
 *	livere lib area
 */
LivereLib = function() {

	this.mergedMemberData = false;
	this.reloadSyncCount = 0;
	this.baseServerURL = "dev.livere.co.kr";

	this.charset = typeof(document.charset) == "undefined" ? document.characterSet : document.charset;
	this.doctype = document.doctype != null || document.compatMode == "CSS1Compat" ? true : false;
	this.quirks = document.compatMode == "BackCompat" ? true : false;
	this.ie6 = navigator.userAgent.indexOf("MSIE 6");

	this.setSecure = function(protocol) {
		livereSharedData.protocol = protocol;
		livereSharedData.url = protocol + livereLib.baseServerURL;
		livereSharedData.common.api_login_url = protocol + livereLib.baseServerURL + "/API_Service";
	};

	this.dispatchEvent = function(paramData) {
		jQuery(this).trigger(paramData['type'], paramData);
	};

	var initDataRequest = false;
	this.dataInited = function() {
		if (!initDataRequest) {
			initDataRequest = true;
			return false;
		}
		return initDataRequest;
	};

	this.loadingComplete = function() {
		jQuery("#livereReplyLoading").remove();
		jQuery("#liverePlugIn").css("display", "block");
		return false;
	};

	this.isLogged = function() {

		if (!livereLib.mergedMemberData) {
			livereLib.fire(null, "updateLinkAccData");
		}

		var s_datas = livereLib.getSmartLoginData();
		var returnFlag = false;
		if (s_datas) {
			jQuery(s_datas['linkage_accs']).each(function(ii, vv) {
				if (eval(vv).member_islogin == '1') returnFlag = true;
			});
		}

		return returnFlag;
	};

	this.isOwner = function(member_group_seq) {
		if (!livereLib.mergedMemberData) {
			livereLib.fire(null, "updateLinkAccData");
		}

		var s_datas = livereLib.getSmartLoginData();
		var returnFlag = false;
		if (s_datas) {
			jQuery(s_datas['linkage_accs']).each(function(ii, vv) {
				if (eval(vv).member_group_seq == member_group_seq) returnFlag = true;
			});
		}

		return returnFlag;
	};

	this.isPrimary = function(member_seq) {

		if (!livereLib.mergedMemberData) {
			livereLib.fire(null, "updateLinkAccData");
		}
		var s_datas = livereLib.getSmartLoginData();
		if (typeof(s_datas) == 'object') {
			var group_data = s_datas['group_data'];
			return group_data.primary_member_seq == member_seq;
		} else
			return false;
	};

	this.fire = function(params, commands) {
		params = params == null ? {} : params;
		if (commands == 'customAPI') {
			livereLib.control.customAPI(params);
		} else {
			var fun = eval("livereLib.control." + commands);
			if (typeof(fun) == 'function') {
				params['command'] = commands;
				fun(params);
			}
		}
	};

	this.setRedirectPath = function() {
		if (typeof(livereLib.redirect_path) == 'string') {
			livereSharedData.smartLogin.redirect_path = encodeURIComponent(livereLib.redirect_path);
		} else {
			if (typeof(livereSharedData.smartLogin.redirect_path) == 'string') {
				livereSharedData.smartLogin.redirect_path = livereSharedData.smartLogin.redirect_path;
			} else {
				livereSharedData.smartLogin.redirect_path = encodeURIComponent(window.location.href);
			}
		}
	};


	this.smartLoginInited = false;

	this.isSecure = !! (location.protocol == 'https:');

	this.start = function(callbackFunction) {
		try {
			var t = eval("jQuery");
			window.jQueryImport = true;
			livereLib.starting(callbackFunction);
		} catch (e) {
			var head = document.getElementsByTagName('head')[0];
			var script = document.createElement('script');
			script.type = 'text/javascript';
			script.charset = "UTF-8";
			var loaded = false;
			script.onreadystatechange = function() {
				if (this.readyState == 'loaded' || this.readyState == 'complete') {
					if (loaded) return;
					loaded = true;
					window.jQueryImport = true;
					livereLib.starting(callbackFunction);
				}
			};
			script.onload = function() {
				if (loaded) return;
				loaded = true;
				window.jQueryImport = true;
				livereLib.starting(callbackFunction);
			};
			script.src = "https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js";

			head.appendChild(script);
		}
	};

	this.starting = function(callbackFunction) {
		if (!window.binded) {
			window.eventBinding();
		}

		if (livereLib.smartLoginInited) {
			if (typeof(callbackFunction) == 'function') {
				callbackFunction();
			}
			return;
		}

		livereLib.smartLoginInited = true;
		livereLib.setRedirectPath();

		livereSharedData.smartLogin.smartlogin_seq = smartlogin_seq;
		livereSharedData.common.consumer_seq = consumer_seq;

		var request = livereLib.url("smartlogin", null);

		jQuery.getJSON(request, function(data) {

			var result = livereLib.util.toJson(data);

			livereSharedData.smartLogin.datas = result.resultData;

			livereLib.fire(null, "updateLinkAccData");

			var eventData = {};
			eventData['type'] = 'livereEvent';
			eventData['key'] = 'commitProperties';
			eventData['value'] = 'smartlogin';

			livereLib.dispatchEvent(eventData);

			if (typeof(callbackFunction) == 'function') {
				callbackFunction();
			}

			syncManager.init();
		});
	};

	this.livereInited = false;
	this.initLivereReply = function(params) {
		if (livereLib.livereInited) return;
		livereLib.livereInited = true;

		var request = livereLib.url("livereDataLoad", params);
		jQuery.getJSON(request, function(data) {
			var result = livereLib.util.toJson(data);
			livereSharedData.livereReply.consumer_status = result['CONSUMER_STATUS'];
			livereSharedData.livereReply.managers = result['MANAGERS'];
			livereSharedData.livereReply.livere_data = result['LIVERE'];
			livereSharedData.livereReply.plugin_data = result['PLUGINS'];
			livereSharedData.livereReply.rep_data = result['REP'];
			livereSharedData.livereReply.reply_data = result['RE_LIST'];
			livereSharedData.livereReply.initMessage = result['initMessage'];
			livereSharedData.livereReply.message_emotion = result['message_emotion'];
			livereSharedData.livereReply.livere_ad = result['livere_ad'];

			var fun = function() {
				var eventData = {};
				eventData['type'] = 'livereEvent';
				eventData['key'] = 'livereDataInitComplete';
				eventData['value'] = 'livereReply';

				livereLib.dispatchEvent(eventData);
			};

			livereLib.fire(fun, "pluginLoad");
		});
	};

	this.renewLivere = function(n_refer, n_title) {
		refer = n_refer;
		title = n_title;

		jQuery("#" + livereSharedData.livereReply.livere_data.targetDiv + " > *").remove();

		if (livereSharedData.livereReply.livere_data.use_emotions > 0) {
			jQuery("#" + livereSharedData.livereReply.livere_data.emotions_target_div + " > *").remove();
		}

		livereLib.livereInited = false;
		livereLib.smartLoginInited = false;
		livereSharedData.livereReply.rep_data = null;
		livereReply = new Livere(livere_seq, refer, title);
		livereLib.start();
	};

	this.control = {};

	this.control.pluginLoad = function(callbackFunction) {

		if (livereLib.util.isEmpty(livereSharedData.livereReply.plugin_data) && livereLib.util.isEmpty(livereSharedData.livereReply.livere_data.custom_script_path)) {
			callbackFunction();
			return;
		}

		if (livereLib.util.isEmpty(livereSharedData.livereReply.plugin_data))
			livereSharedData.livereReply.plugin_data = [];

		if (!livereLib.util.isEmpty(livereSharedData.livereReply.livere_data.custom_script_path))
			livereSharedData.livereReply.plugin_data.push({
				script_path: livereSharedData.livereReply.livere_data.custom_script_path
			});


		var loaded_plugin_length = 0;
		var plugin_length = livereSharedData.livereReply.plugin_data.length;

		jQuery(livereSharedData.livereReply.plugin_data).each(function(ii, vv) {

			if (!livereLib.util.isEmpty(vv.css_path)) livereLib.cssLoad(vv.css_path);
			if (!livereLib.util.isEmpty(vv.custom_css_path)) livereLib.cssLoad(vv.custom_css_path);
			vv.script_path = vv.script_path;
			jQuery.getScript(vv.script_path, function() {
				var var_id = vv.id;
				var plugin = eval("livereReply." + var_id);

				if (plugin) {
					if (vv.param_data != '') {
						var params = vv.param_data.split(",");
						jQuery(params).each(function(xx, vals) {
							var value = eval("vv.param" + (xx + 1));
							eval("livereReply." + var_id + "." + vals + " = '" + value + "';");
						});
					}

					if (vv.plugin_type == 'object' || typeof(plugin.init) == 'function') {
						plugin.init();
					}

				}

				if (++loaded_plugin_length >= plugin_length) {
					callbackFunction();
				}
			});
		});


	};
	this.control.s_s = function(params) {
		params = params == null ? {} : params;

		var request = livereLib.url("API_Livere", params);
		jQuery.getJSON(request, function(data) {

		});
	};
	this.control.getMessage = function(params) {
		params = params == null ? {} : params;

		var request = livereLib.url("API_Livere", params);
		jQuery.getJSON(request, function(data) {
			if (data.result == "200") {
				var eventData = {
					type: "livereEvent",
					key: "getMessageComplete",
					value: data,
					requestData: params
				};

				livereLib.dispatchEvent(eventData);
			}
		});
	};
	this.control.action = function(params) {
		params = params == null ? {} : params;

		var request = livereLib.url("API_Livere", params);
		jQuery.getJSON(request, function(data) {
			var result = livereLib.util.toJson(data);

			var eventData = {
				type: "livereEvent",
				key: "actionComplete",
				value: result,
				requestData: params
			};

			livereLib.dispatchEvent(eventData);

			livereLib.processComplete();
		});
	};
	this.control.customAPI = function(params) {
		params = params == null ? {} : params;

		var callbackFun = params['callback'];
		var eventKeyStr = params['eventKey'];

		params['callback'] = null;

		var request = livereLib.url("API_Livere", params);

		jQuery.getJSON(request, function(data) {
			var result = livereLib.util.toJson(data);
			if (!livereLib.util.isEmpty(callbackFun)) {
				var fun = eval(callbackFun);
				fun(data);
			}
			if (!livereLib.util.isEmpty(eventKeyStr)) {
				var eventData = {};
				eventData['type'] = 'livereEvent';
				eventData['key'] = eventKeyStr;
				eventData['value'] = result;

				livereLib.dispatchEvent(eventData);
			}
			livereLib.processComplete();
		});
	};
	this.control.snsAction = function(params) {
		params = params == null ? {} : params;

		var request = livereLib.url("API_Livere", params);
		jQuery.getJSON(request, function(data) {
			var result = livereLib.util.toJson(data);

			var eventData = {};
			eventData['type'] = 'livereEvent';
			eventData['key'] = 'snsActionComplete';
			eventData['value'] = result;

			livereLib.dispatchEvent(eventData);
		});
	};
	this.control.searchMemberData = function(params) {
		params = params == null ? {} : params;

		var request = livereLib.url("API_Livere", params);
		jQuery.getJSON(request, function(data) {
			var result = livereLib.util.toJson(data);

			var eventData = {};
			eventData['type'] = 'livereEvent';
			eventData['key'] = 'searchMemberDataComplete';
			eventData['value'] = result;

			livereLib.dispatchEvent(eventData);
		});
	};
	this.control.getExCount = function(params) {
		params = params == null ? {} : params;
		var url = "https://secure.livere.co.kr/count/getCount.php?livereCallBack=?&type=" + params['type'];
		url += "&" + params['key'] + "=" + params['value'];

		jQuery.getJSON(url, function(data) {
			var eventData = {};
			eventData['type'] = 'livereEvent';
			eventData['key'] = 'getExCountComplete';
			eventData['value'] = data;

			livereLib.dispatchEvent(eventData);
		});
	};
	this.control.plusExCount = function(params) {
		params = params == null ? {} : params;
		var url = "https://secure.livere.co.kr/count/plusCount.php?livereCallBack=?&type=" + params['type'];
		url += "&" + params['key'] + "=" + params['value'] + "&plus=" + params['plus'];

		jQuery.getJSON(url, function(data) {
			var eventData = {};
			eventData['type'] = 'livereEvent';
			eventData['key'] = 'plusExCountComplete';
			eventData['value'] = data;

			livereLib.dispatchEvent(eventData);
		});
	};
	this.articleActionFlag = false;
	this.control.articleAction = function(params) {

		if (livereLib.articleActionFlag) return;
		livereLib.articleActionFlag = true;

		params = params == null ? {} : params;

		var request = livereLib.url("API_Livere", params);
		jQuery.getJSON(request, function(data) {
			var result = livereLib.util.toJson(data);

			result['reply'] = params['reply'];

			var eventData = {};
			eventData['type'] = 'livereEvent';
			eventData['key'] = 'articleActionComplete';
			eventData['value'] = result;

			livereLib.dispatchEvent(eventData);
			livereLib.processComplete();
			livereLib.articleActionFlag = false;
		});
	};
	this.control.deleteReply = function(params) {

		params = params == null ? {} : params;

		params['command'] = 'deleteReply';
		params['reply_seq'] = livereLib.util.isEmpty(params['reply_seq']) ? params['target_seq'] : params['reply_seq'];

		var request = livereLib.url("API_Livere", params);

		jQuery.getJSON(request, function(data) {
			var result = livereLib.util.toJson(data);
			result['reply'] = livereReply.getReplyObject(params.target_seq);

			var eventData = {};
			eventData['type'] = 'livereEvent';
			eventData['key'] = 'replyDeleteEvent';
			eventData['value'] = result;

			livereLib.dispatchEvent(eventData);
			livereLib.processComplete();
		});
	};

	this.control.changeUserData = function(params) {
		var request = livereLib.url("API_Livere", params);
		jQuery.getJSON(request, function(data) {
			var result = livereLib.util.toJson(data);
			livereSharedData.smartLogin.datas = result.resultData;

			livereLib.fire(null, "updateLinkAccData");

			var eventData = {};
			eventData['type'] = 'livereEvent';
			eventData['key'] = 'renewMemberData';
			eventData['value'] = 'fin';

			livereLib.dispatchEvent(eventData);
			livereLib.processComplete();
		});
	};

	this.control.serviceLogout = function(params) {

		var needSyncOff = false;

		if (!livereLib.util.isEmpty(syncManager.syncMembership) && eval(syncManager.syncMembership).member_islogin == 1 && eval(syncManager.syncMembership).member_seq == params['member_seq']) {
			needSyncOff = true;
		}

		jQuery(livereSharedData.smartLogin.datas.linkage_accs).each(function(ii, vv) {
			if (eval(vv).member_seq = params['member_seq']) {
				needSyncLogout = true;
				return false;
			};
		});

		params = params == null ? {} : params;
		var request = livereLib.url("API_Livere", params);

		jQuery.getJSON(request, function(data) {
			var result = livereLib.util.toJson(data);
			if (result.result == '200') {

				if (result.command == 'clearLoginData') {
					livereSharedData.smartLogin.datas.accessable_group_data = null;

					jQuery(livereSharedData.smartLogin.datas.linkage_accs).each(function(ii, vv) {
						eval(vv).member_islogin = '0';
					});

					var eventData = {};
					eventData['type'] = 'livereEvent';
					eventData['key'] = 'livereLogout';
					eventData['value'] = 'fin';

					livereLib.dispatchEvent(eventData);
				} else {
					livereSharedData.smartLogin.datas = result.resultData;
					livereLib.fire(null, "updateLinkAccData");

					var eventData = {};
					eventData['type'] = 'livereEvent';
					eventData['key'] = 'renewMemberData';
					eventData['value'] = 'fin';

					livereLib.dispatchEvent(eventData);
				}

				if (needSyncOff)
					syncManager.syncOff();

			} else {
				livereLib.control.checkError(result);
			}
			livereLib.processComplete();
		});

	};
	this.control.setPosting		= function( params ) {
		params = params == null ? {} : params;
		var request = livereLib.url( "API_Livere" , params );

		jQuery.getJSON( request , function(data) {
			var result = livereLib.util.toJson( data );
			if( result.result == '200' ) {
				livereSharedData.smartLogin.datas = result.resultData;
				livereLib.fire( null , "updateLinkAccData" );

				var eventData = {};
				eventData['type']	= 'livereEvent';
				eventData['key']	= 'renewMemberData';
				eventData['value']	= result;

				eventData['requestData'] = params;

				livereLib.dispatchEvent( eventData );
			} else {
				livereLib.control.checkError( result );
			}
			livereLib.processComplete();
		} );
	};
	this.control.setPrimary		= function( params ) {
		params = params == null ? {} : params;

		var request = livereLib.url( "API_Livere" , params );

		jQuery.getJSON( request , function(data) {
			var result = livereLib.util.toJson( data );
			if( result.result == '200' ) {
				livereSharedData.smartLogin.datas = result.resultData;
				livereLib.fire( null , "updateLinkAccData" );

				var eventData = {};
				eventData['type']	= 'livereEvent';
				eventData['key']	= 'renewMemberData';
				eventData['value']	= result;
				eventData['requestData'] = params;

				livereLib.dispatchEvent( eventData );
			} else {
				livereLib.control.checkError( result );
			}
			livereLib.processComplete();
		} );
	};
	this.control.livereLogout	= function( params ) {

		var needSyncOff = false;
		if( !livereLib.util.isEmpty(syncManager.syncMembership) && eval(syncManager.syncMembership).member_islogin == 1 ) {
			needSyncOff = true;
		}

		params = params == null ? {} : params;
		params = params.type == 'click' ? {} : params;
		params['command'] = 'livereLogout';

		if(params.reloadmode) {
			needSyncOff=false;
			livereLib.reloadSyncCount++;
		}

		var request = livereLib.url( "API_Livere" , params );
		jQuery.getJSON( request , function(data) {
			var result = livereLib.util.toJson( data );
			if( result.result == '200' ) {

				livereSharedData.smartLogin.datas.accessable_group_data = null;

				jQuery( livereSharedData.smartLogin.datas.linkage_accs ).each( function( ii , vv ) {
					eval( vv ).member_islogin = '0';
				} );

				var eventData = {};
				eventData['type']	= 'livereEvent';
				eventData['key']	= 'livereLogout';
				eventData['value']	= result;
				eventData['requestData'] = params;

				livereLib.dispatchEvent( eventData );

				if( needSyncOff )
					syncManager.syncOff();

				if(params.reloadmode && livereLib.reloadSyncCount < 3) {
					syncManager.tryLogin = false;
					syncManager.syncStart();
				}

			} else {
				livereLib.control.checkError( result );
			}
			livereLib.processComplete();
		} );
	};

	this.control.renewMemberData = function(params) {
		params = params == null ? {} : params;
		params['command'] = 'sessionLogin';

		var request = livereLib.url("API_Livere", params, true);
		jQuery.getJSON(request, livereLib.control.renewMemberProcess);
	};

	this.control.renewMemberProcess = function(params) {
		var result = livereLib.util.toJson(params);
		livereSharedData.smartLogin.datas = result.resultData;

		livereLib.fire(null, "updateLinkAccData");

		var eventData = {};
		eventData['type'] = 'livereEvent';
		eventData['key'] = 'renewMemberData';
		eventData['value'] = 'fin';

		livereLib.dispatchEvent(eventData);
		livereLib.processComplete();
	};

	this.control.updateLinkAccData = function(params) {

		var smartlogindata = livereLib.getSmartLoginData();

		if (smartlogindata != null) {
			var group_data = smartlogindata['group_data'];
			var linkage_accs = smartlogindata['linkage_accs'];

			if (group_data != null) {

				var member_datas = group_data['member_datas'];

				jQuery(linkage_accs).each(function(ii, linked_acc) {
					linked_acc = eval(linked_acc);
					jQuery(member_datas).each(function(ii, login_acc) {
						if (linked_acc.name == login_acc.member_domain) {
							jQuery.extend(linked_acc, login_acc);
							livereLib.mergedMemberData = true;
						}
					});
				});
			}
		}

	};

	this.control.writeReply = function(params) {
		var request = livereLib.url("API_Livere", params);

		jQuery.getJSON(request, function(data) {
			var result = livereLib.util.toJson(data);
			if (result.result == '200') {

				var reply = result.resultData;
				livereSharedData.livereReply.rep_data.rep_seq = reply.rep_seq;
				reply.regdate = result.requestDate;

				var eventData = {};
				eventData['type'] = 'livereEvent';
				eventData['key'] = 'writeDone';
				eventData['value'] = reply;

				livereLib.dispatchEvent(eventData);
			} else {
				if (result.result == '520') {
					alert(result.message);
					return;
				}

				if (result.result >= 1500 && result.result <= 1502) {
					alert(livereLib.getMessage('plasterBlock' + (result.result - 1499)));

					return;
				}
			}

			livereLib.processComplete();

		});
	};

	this.control.checkError = function(result) {
		return;
		if (!livereLib.util.isEmpty(result)) {
			switch (result.result) {
				case 1200:
					window.location.href = livereSharedData.url + "/API_Livere" + "?command=redirect&redirect_path=" + encodeURIComponent(window.location.href);
					break;
				default:
					break;
			}
		}
	};

	this.control.relationAction = function(params) {
		var request = livereLib.url("API_Livere", params);
		jQuery.getJSON(request, function(data) {
			var result = livereLib.util.toJson(data);

			var eventData = {};
			eventData['type'] = 'livereEvent';
			eventData['key'] = 'relationComplete';
			eventData['value'] = result;

			livereLib.dispatchEvent(eventData);
			livereLib.processComplete();
		});
	};

	this.control.getCount = function(params) {
		var request = livereLib.url("API_Livere", params);

		jQuery.getJSON(request, function(data) {
			var result = livereLib.util.toJson(data);
			if (result.result == '200') {

				var replyData = result.resultData;

				var eventData = {};
				eventData['type'] = 'livereEvent';
				eventData['key'] = 'getCountComplete';
				eventData['value'] = replyData;

				livereLib.dispatchEvent(eventData);

				livereLib.processComplete();
			}
		});
	};
	this.control.getArticle = function(params) {
		var request = livereLib.url("API_Livere", params);

		jQuery.getJSON(request, function(data) {
			var result = livereLib.util.toJson(data);
			var replyData = result.resultData;

			var eventData = {};
			eventData['type'] = 'livereEvent';
			eventData['key'] = 'getArticleComplete';
			eventData['value'] = replyData;

			livereLib.dispatchEvent(eventData);

			livereLib.processComplete();
		});
	};

	this.processing = false;
	this.wakeUpEvent = null;
	this.processingCount = 0;
	this.control.processing = function(callBackFunc) {
		if (!livereLib.processing) {
			callBackFunc();
		} else {
			++livereLib.processingCount;
			if (livereLib.util.isEmpty(livereLib.wakeUpEvent)) {
				livereLib.wakeUpEvent = setTimeout(function() {
					livereLib.processing = false;
					livereLib.wakeUpEvent = null;
				}, 4000);
			} else {
				alert(livereLib.getMessage("proccesingMsg_8"));
			}
		}
	};

	this.processComplete = function() {
		livereLib.dispatchEvent({
			type: "livereEvent",
			key: "processComplete"
		});
	};

	this.initRepData = function() {
		params = {
			refer: refer,
			title: title,
			command: 'initRepData'
		};
		var request = livereLib.url("API_Livere", params);
		jQuery.getJSON(request);
	};

	this.smartloginInit = function() {
		if (!livereLib.dataInited()) {

			livereLib.setRedirectPath();

			var params = {
				redirect_path: livereSharedData.smartLogin.redirect_path,
				smartlogin_seq: smartlogin_seq,
				consumer_seq: consumer_seq
			};

			livereLib.fire(params, "smartLoginStart");
		}
	};

	this.getReply = function(reply_seq) {
		return livereReply.getReplyObject(reply_seq);
	};

	this.getMemberDataByServiceName = function(serviceName) {
		var returnService = null;
		jQuery(serviceArray).each(function(ii, vv) {
			if (vv.name == serviceName) {
				returnService = eval(vv);
			}
		});
		return returnService;
	};

	this.getSmartLoginData = function() {
		var u_data = livereSharedData.smartLogin.datas;
		if (u_data != null) {
			var returnObject = {
				linkage_accs: u_data.linkage_accs,
				group_data: u_data.accessable_group_data,
				member_datas: u_data.accessable_group_data ? u_data.accessable_group_data.member_datas : null,
				sync_type: u_data.sync_type,
				sync_acc: u_data.sync_acc,
				custom_script_path: u_data.custom_script_path,
				button_container: u_data.button_container,
				view_container: u_data.view_container,
				checkurl: u_data.checkurl,
				loginurl: u_data.loginurl,
				logouturl: u_data.logouturl
			};
			return returnObject;
		}
		return null;
	};

	this.readyObject = function(objName) {
		var obj = navigator.appName.indexOf("Microsoft") != -1 ? window[objName] : window.document[objName];
		if (typeof(obj.startWithPrimaryData) == 'function') {
			obj.startWithPrimaryData(livereLib.getPrimaryDomain());
		}
	};

	this.debug = function(obj) {
		livereLib.util.debug(obj);
	};

	this.alert = function(obj) {
		txtValue = "";

		if (typeof(obj) == 'string') {
			txtValue = obj;
		} else {
			obj = eval(obj);

			for (var x in obj) {
				txtValue += [x, obj[x]] + "\n\r\n";
			}
		}

		alert(txtValue);
	};

	this.getPrimaryDomain = function() {
		var domain_object = null;
		var s_l = livereLib.getSmartLoginData();

		if (s_l != null && s_l.member_datas != null) {
			var prim_mem_seq = s_l.group_data.primary_member_seq;
			jQuery.each(s_l.member_datas, function(ii, vv) {
				if (vv.member_seq == prim_mem_seq) {
					domain_object = eval(vv.member_domain);
					return false;
				}
			});
			return domain_object;
		}
		return null;
	};

	this.getPrimaryDomainToString = function() {
		var data = livereLib.getPrimaryDomain();
		if (data == null) return "";
		var str = "";
		str += "{";
		str += "'member_domain':'" + data.member_domain + "' ,";
		str += "'member_group_seq' : '" + data.member_group_seq + "',";
		str += "'member_icon': '" + data.member_icon + "',";
		str += "'member_name': '" + data.member_name + "',";
		str += "'member_id': '" + data.member_id + "',";
		str += "'member_islogin': '" + data.member_islogin + "',";
		str += "'member_ispost': '" + data.member_ispost + "' ,";
		str += "'member_seq': '" + data.member_seq + "' ,";
		str += "'member_pw': '" + data.member_pw + "'";
		str += "}";
		return str;
	};


	this.request = function(params, callback) {
		var url = params['url'];
		params['url'] = null;
		var paramsString = livereLib.util.objectToParameters(params);
		var requestURL = url + "?" + paramsString + "&livereCallBack=?&dummy=" + Math.random();
		jQuery.getJSON(requestURL, function(data) {
			if (typeof(callback) == 'function') callback(data);
		});
	};


	this.url = function(urlAddon, params) {
		urlAddon = this.getUrl(urlAddon);

		var paramsString = "";

		if (params != null) {
			paramsString = livereLib.util.objectToParameters(params);
		}

		paramsString = paramsString == "" ? "?" : paramsString + "&";
		paramsString += "dummy=" + Math.random() + "&livereCallback=?";

		if (paramsString.indexOf("smartlogin_seq=") < 0 && livereSharedData.smartLogin.smartlogin_seq)
			paramsString += "&smartlogin_seq=" + livereSharedData.smartLogin.smartlogin_seq;

		if (paramsString.indexOf("consumer_seq=") < 0)
			paramsString += "&consumer_seq=" + livereSharedData.common.consumer_seq;

		if (paramsString.indexOf("rep_seq=") < 0 && livereSharedData.livereReply.rep_data)
			paramsString += "&rep_seq=" + livereSharedData.livereReply.rep_data.rep_seq;

		if (paramsString.indexOf("livere_seq=") < 0 && livereSharedData.livereReply.livere_seq)
			paramsString += "&livere_seq=" + livereSharedData.livereReply.livere_seq;

		if (paramsString.indexOf("?") == 0) {
			paramsString = paramsString.substring(1);
		}

		return livereSharedData.url + "/" + urlAddon + "?" + paramsString;
	};

	this.normalUrl = function(url, params) {
		url = "http://" + url;
		var paramsString = livereLib.util.objectToParameters(params);
		if (paramsString != "")
			return url += "?" + paramsString;
		return url;
	};

	this.getUrl = function(val) {
		var charset = this.charset.toUpperCase();
		var flag = (charset == "UTF-8" || charset == "UTF8" || charset == "UTF");

		switch (val) {
			case "upload":
				return flag ? val : "upload_kr";
			case "livereDataLoad":
				return flag ? val : "livereDataLoad_kr";
			case "smartlogin":
				return flag ? val : "smartlogin_kr";
			case "API_Livere":
				return flag ? val : "API_Livere_kr";
			case "External_Auth_API":
				return flag ? val : "External_Auth_API_kr";

			default:
				return val;
		}
	};

	this.jsLoad = function(js_name, js_src) {
		var loadComplete = function() {
			var eventData = {};
			eventData["type"]	= "livereEvent";
			eventData["key"]	= "livereJSLoadComplete";
			eventData["value"]	= js_name
			livereLib.dispatchEvent( eventData );
		};

		try {
			var t = eval(js_name);
			eval("window." + js_name + "Import = " + "true;");
			loadComplete();
		} catch (e) {
			var head	= document.getElementsByTagName("head")[0];
			var script	= document.createElement("script");
			script.type	= "text/javascript";
			script.charset = "UTF-8";
			var loaded = false;
			script.onreadystatechange= function () {
				if (this.readyState == "loaded" || this.readyState == "complete") {
					if (loaded)return;
					loaded = true;
					eval("window." + js_name + "Import = " + "true;");
					loadComplete();
				}
			};
			script.onload = function () {
				if (loaded)return;
				loaded = true;
				eval("window." + js_name + "Import = " + "true;");
				loadComplete();
			};
			script.src = js_src;

			head.appendChild(script);
		}
	};

	this.cssLoad = function(cssPath) {
		if (!window.livere_cssArray) window.livere_cssArray = Array();
		jQuery(window.livere_cssArray).each(function(ii, vv) {
			if (vv == cssPath) cssPath = null;
			return true;
		});

		if (!livereLib.util.isEmpty(cssPath)) {
			window.livere_cssArray.push(cssPath);
			var head = document.getElementsByTagName('head')[0];
			var link = document.createElement('link');
			link.type = "text/css";
			link.rel = "stylesheet";
			link.href = cssPath;

			head.appendChild(link);
		}

	};

	this.setRegdate = function(reply) {
		reply.reply_regdate = reply.regdate.year + 1900 + "-" + livereLib.util.addZero(parseInt(reply.regdate.month) + 1) + "-" + livereLib.util.addZero(reply.regdate.date);
		reply.reply_regdate += " " + livereLib.util.addZero(reply.regdate.hours) + ":" + livereLib.util.addZero(reply.regdate.minutes) + ":" + livereLib.util.addZero(reply.regdate.seconds);
	};

	this.getMessage = function(messageKey) {
		var message = null;
		if (!livereLib.util.isEmpty(window.livereCustomMessage)) {
			message = eval("window.livereCustomMessage." + messageKey);
		}

		if(livereLib.util.isEmpty(message) && livereSharedData.livereReply.message_emotion) {
			message = eval("livereSharedData.livereReply.message_emotion." + messageKey);
		}

		if(livereLib.util.isEmpty(message) && livereSharedData.livereReply.initMessage) {
			message = eval("livereSharedData.livereReply.initMessage." + messageKey);
		}

		return message;
	};

	this.userActionHistoryArrays = {};
	this.userActionHistory = function(type, seq) {
		var arrObject = eval("livereLib.userActionHistoryArrays." + type);
		if (!arrObject) {
			arrObject = eval("livereLib.userActionHistoryArrays." + type + " = Array();");
		}

		var result = false;
		jQuery(arrObject).each(function(ii, vv) {
			if (seq == vv) {
				result = true;
				return false;
			}
		});

		if (!result) arrObject.push(seq);

		return result;
	}

	this.util = {};
	this.util.beforeRegdate = function(regdate) {

		var r_regdate = livereLib.util.replaceAll(regdate,'-','/'),
			nowDate = new Date().getTime(),
			writeDate = new Date(r_regdate).getTime(),
			interval = nowDate - writeDate,
			second = 1000,
			minute = second*60,
			hour = minute*60,
			day = hour*24,
			month = day*30,
			year = month*12,
			result = '锟斤拷 ';

		if(parseInt(interval/second) < 59) {
			return '璜涒懛韴� 锟斤拷';
		} else if(parseInt(interval/minute) < 59) {
			result += parseInt(interval/minute) + '閬猴拷'
		} else if(parseInt(interval/hour) < 23) {
			result += parseInt(interval/hour) + '锟届挀旎�';
		} else if(parseInt(interval/day) < 32) {
			result += parseInt(interval/day) + '锟斤拷';
		} else if(parseInt(interval/month) < 12) {
			result += parseInt(interval/month) + '濯涭挅鞃�';
		} else {
			var remainder = interval%year;

			result += parseInt(interval/year) + '锟斤拷';
			if(parseInt(remainder/month) > 0) result += parseInt(remainder/month) + '濯涭挅鞃�';
		}

		return result + ' 锟斤拷';
	}
	this.util.matchingRegExp = function(reply) {
		var checkFlag = false;
		var regExp = {
			only : new RegExp("[0-9]{11}", "gi"),
			social 	: new RegExp("(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-6][0-9]{6}|(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))[1-6][0-9]{6}", "gi"),
			passport: new RegExp("[a-zA-Z]{1,2}[0-9]{7,8}", "gi"),
			driver	: new RegExp("[0-9]{2}[-][0-9]{6}[-][0-9]{2}", "gi"),
			phone : new RegExp("01[016789][-~]([0-9]{3,4})[-~]([0-9]{4})|01[016789]([0-9]{3,4})([0-9]{4})" ,"gi"),
			credit : new RegExp("[34569][0-9]{3}-~?[0-9]{4}-~?[0-9]{4}-~?[0-9]{4}","gi"),
			health : new RegExp("[1257][-~][0-9]{10}","gi"),
			bank : new RegExp("([0-9]{2}[-~][0-9]{2}-~?[0-9]{6}|[0-9]{3}-~?([0-9]{5,6}[-~][0-9]{3}|[0-9]{6}-~?[0-9]{5}|[0-9]{2,3}-~?[0-9]{6}|[0-9]{2}-~?[0-9]{7}|[0-9]{2}-~?[0-9]{4,6}-~?[0-9]|[0-9]{5}-~?[0-9]{3}-~?[0-9]{2}|[0-9]{2}-~?[0-9]{5}[-~.][0-9]{3}|[0-9]{4}-~?[0-9]{4}-~?[0-9]{3}|[0-9]{6}[-~.][0-9]{2}-~?[0-9]{3}|[0-9]{2}-~?[0-9]{2}-~?[0-9]{7})|[0-9]{4}-~?([0-9]{3}-~?[0-9]{6}|[0-9]{2}-~?[0-9]{6}-~?[0-9])|[0-9]{5}-~?[0-9]{2}-~?[0-9]{6}|[0-9]{6}-~?[0-9]{2}-~?[0-9]{5,6})","gi"),
			foreinger : new RegExp("([01][0-9]{5}[~-]+[1-8][0-9]{6}|[2-9][0-9]{5}[~-]+[1256][0-9]{6})","gi")
		};

		var repl = {
			only : '***********',
			social	: "******-*******",
			passport: "********",
			driver	: "**-******-**",
			phone : "***-****-****",
			credit : "****-****-****-****",
			health : "*-**********",
			bank : "**-**-******",
			foreinger : "***"
		};

		for(var i in regExp) {
			if(regExp[i].test(reply) === true) {
				checkFlag = true;
				reply = reply.replace(regExp[i], repl[i]);
			}
		}

		if(checkFlag) {
			alert(livereLib.getMessage('personal_information_hide'));
		}
		return reply;
	};
	this.util.autoLink = function(obj) {
		if (livereLib.util.isEmpty(obj)) return;
		var re = /((http|https|ftp):\/\/[\w?=&.\/-;#~%-]+(?![\w\s?&.\/;#~%"=-]*>))/g;
		return obj.replace(re, '<a href="$1" target="_blank">$1</a>');
	};

	this.util.isEmpty = function(value) {
		return (typeof(value) == 'undefined' || value == null || value == '' || value == 'null') ? true : false;
	};

	this.util.mouseClickCalc = function(e) {
		this.x = e.clientX + (document.documentElement.scrollLeft ? document.documentElement.scrollLeft : document.body.scrollLeft);
		this.y = e.clientY + (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);
		return this;
	};

	this.util.centerCalc = function(targetObject, obj_width) {
		var top = ($(window).height() - $(targetObject).outerHeight()) / 2;
		var left = ($(window).width() - obj_width) / 2;
		return {
			left: left,
			top: top
		};
	};
	this.util.getLoginPageURL = function(serviceName) {
		var url = livereSharedData.common.api_login_url + "?service=" + serviceName + "&redirect_path=";
		url += typeof(livereSharedData.smartLogin.redirect_path) == 'string' ? livereSharedData.smartLogin.redirect_path : encodeURIComponent(window.location.href);
		return url;
	};
	this.util.stripProtocol = function(url) {
		if (url != null && url.indexOf("//") > 0) {
			url = url.substring(url.indexOf("//") + 2);
		}
		return url;
	};
	this.util.formToParameters = function(fmObject) {
		var params = "";
		for (i = 0; i < fmObject.length; i++) {
			if (fmObject[i].type != "button" && fmObject[i].value != "") {
				if (fmObject[i].type == "checkbox") {
					params += fmObject[i].name + "=" + (fmObject[i].checked ? "1" : "0");
				} else {
					params += fmObject[i].name + "=" + encodeURIComponent(fmObject[i].value);
				}
				params = i != (fmObject.length - 1) ? params += "&" : params;
			}
		}
		return params;
	};
	this.util.objectToParameters = function(object) {

		var paramsString = "";

		jQuery.each(object, function(ii, vv) {
			paramsString += (ii + "=" + encodeURIComponent(vv) + "&");
		});

		if (paramsString != "") {
			var value = paramsString.substring(paramsString.length - 1);
			if (value == "&")
				paramsString = paramsString.substring(0, paramsString.length - 1);
		}

		return paramsString;
	};
	this.util.addZero = function(val) {
		return val < 10 ? "0" + val : val;
	};
	this.util.timer = function(time, fun) {
		setTimeout(time, fun);
	};
	this.util.alert = function(memo, command) {
		alert(memo + "\r\n" + command);
	};

	this.util.isMobileVisitor = function() {
		var mobileKeyWords = new Array('iphone', 'ipod', 'blackberry', 'android', 'windows ce', 'lg', 'mot', 'samsung', 'sonyericsson', 'iemobile');
		var padKeyWords = new Array('ipad', 'shw-m180s', 'shw-m380k' ,'shw-m480k' , 'sm-p600');
		var returnFlag = false;
		jQuery(mobileKeyWords).each(function(ii, vv) {
			var agent = navigator.userAgent.toLowerCase();
			if (agent.match(vv) != null) {
				returnFlag = true;
				return false;
			}
		});

		if (returnFlag) {
			jQuery(padKeyWords).each(function(ii, vv) {
				var agent = navigator.userAgent.toLowerCase();
				if (agent.match(vv) != null) {
					returnFlag = false;
					return false;
				}
			});
		}

		return returnFlag;
	};

	this.util.isTouchDevice = function() {
		return !!("ontouchstart" in window);
	};

	this.util.replaceAll = function(str, orgStr, repStr) {
		return str.split(orgStr).join(repStr);
	};

	this.util.toolTip = function(obj) {
		if (livereLib.notUseTooltip) return false;

		jQuery.each(obj, function(ii, vv) {
			jQuery(vv).bind("mouseenter focus", function() {

				if (jQuery(this).attr("rel") != "tooltip") return false;

				jQuery(".livereToolTip").remove();
				var tooltip = jQuery("<div class='livereToolTip'><p class='livereToolTipInner'></p></div>");

				if (!livereLib.util.isEmpty(jQuery(vv).attr("aria-label"))) {
					tooltip.find(".livereToolTipInner").html(jQuery(vv).attr("aria-label"));
				} else if (!livereLib.util.isEmpty(jQuery(vv).attr("title"))) {
					tooltip.find(".livereToolTipInner").html(jQuery(vv).attr("title"));
				} else {
					tooltip.find(".livereToolTipInner").html(jQuery(vv).find("span").text());
				}

				jQuery("body").append(tooltip);

				var objOffsetTop = jQuery(vv).offset().top;
				var objOffsetLeft = jQuery(vv).offset().left;

				var tooltipOffsetTop = objOffsetTop - tooltip.outerHeight(true);
				var tooltipOffsetLeft = objOffsetLeft - tooltip.outerWidth(true) / 2 + jQuery(vv).outerWidth(true) / 2;

				var objScrollTop = jQuery(window).scrollTop() + tooltip.outerHeight(true);

				if (objScrollTop >= objOffsetTop) { // arrow top
					tooltipOffsetTop = objOffsetTop + jQuery(vv).outerHeight(true);
					tooltip.addClass("livereToolTipArrow_top");
				} else { // arrow bottom
					tooltip.addClass("livereToolTipArrow_bottom");
				}

				var tooltipOverflowSize = objOffsetLeft + tooltip.outerWidth(true) - jQuery(window).width();

				if (tooltipOffsetLeft > 0 && tooltipOverflowSize > 0) {
					tooltipOffsetLeft = objOffsetLeft - tooltipOverflowSize - (jQuery(window).width() - (objOffsetLeft + jQuery(vv).outerWidth(true)));

					if (tooltipOffsetLeft < 0) { // arrow center
						tooltipOffsetLeft = objOffsetLeft - tooltip.outerWidth(true) / 2 + jQuery(vv).outerWidth(true) / 2;
						tooltip.addClass("livereToolTipArrow_center");
					} else { // arrow right
						tooltip.addClass("livereToolTipArrow_right");
					}
				} else { // arrow left
					if (tooltipOffsetLeft < 0) {
						tooltipOffsetLeft = objOffsetLeft;
						tooltip.addClass("livereToolTipArrow_left");
					} else { // arrow center
						tooltip.addClass("livereToolTipArrow_center");
					}
				}

				tooltip.css({
					"top": tooltipOffsetTop,
					"left": tooltipOffsetLeft
				});

			}).bind("click mouseleave blur", function() {
				jQuery(".livereToolTip").remove();
			});
		});
	};

	this.util.toJson2 = function(str) {
		return str;
	};
	this.util.toJson = function(str) {
		return str;
	};

	this.util.viewExtended = false;
	this.util.debugInited = false;
	this.util.debugInit = function() {
		if (livereLib.util.debugInited) return;
		livereLib.util.debugInited = true;

		jQuery("body").prepend("<textarea id='debugTextArea' style='width: 500px; height: 150px;'></textarea><input type='button' value='extends' />");
	};
	this.util.debug = function(obj, isAppend) {
		txtValue = "";

		if (typeof(obj) == 'string') {
			txtValue = obj;
		} else {
			obj = eval(obj);

			for (var x in obj) {
				txtValue += [x, obj[x]] + "\n\r\n";
			}
		}

		if (jQuery("#debugTextArea").length > 0) {
			txtValue = new Date().toString() + "\r\n" + txtValue;

			txtValue = isAppend ? txtValue + "\r\n\r\n=======================================\r\n\r\n" + jQuery("#debugTextArea").val() : txtValue;

			jQuery("#debugTextArea").val(txtValue);
		}

	};
	this.util.msieversion= function(){
      var ua = window.navigator.userAgent
      var msie = ua.indexOf ( "MSIE " )
      if ( msie > 0 )      // If Internet Explorer, return version number
         return parseInt (ua.substring (msie+5, ua.indexOf (".", msie )))
      else                 // If another browser, return 0
         return 0
   };

};

SyncManager = function() {

	this.tryLogin = false;

	this.syncStart = function() {
		if (syncManager.syncMembership) {
			var syncService = eval(syncManager.syncMembership);

			if (!syncManager.tryLogin) {
				syncManager.tryLogin = true;

				var syncProcess = function(additionalResult) {
					if (syncService.member_islogin != 1 && !livereLib.util.isEmpty(additionalResult.user_id) && !livereLib.util.isEmpty(additionalResult.user_name)) {
						var params = {};
						params['member_id'] = additionalResult.user_id;
						params['member_name'] = additionalResult.user_name;

						if (!livereLib.util.isEmpty(additionalResult.user_icon)) {
							params['member_icon'] = additionalResult.user_icon;
						} else if (!livereLib.util.isEmpty(additionalResult.user_image)) {
							params['member_icon'] = additionalResult.user_image;
						}

						var request = livereLib.url("External_Auth_API", params);

						jQuery.getJSON(request, livereLib.control.renewMemberProcess);
					}
					if (!livereLib.util.isEmpty(additionalResult.user_id) && syncService.member_id != additionalResult.user_id) {
						livereLib.fire({
							reloadmode: true
						}, 'livereLogout');
					}
				};

				if (syncManager.syncAccessType == 1 || syncManager.syncAccessType == 2) {
					jQuery.getScript(syncManager.checkurl, function() {
						if (typeof(additionalResult) == 'object') {
							syncProcess(additionalResult);
						} else {
							if (syncManager.syncAccessType == 2 && syncService.member_islogin == 1) {
								livereLib.fire({
									member_seq: syncService.member_seq
								}, "serviceLogout");
							}
						}
					});

				} else {
					if (typeof(additionalResult) == 'object') {
						syncProcess(additionalResult);
					} else {
						if (syncManager.syncAccessType == 4 && syncService.member_islogin == 1) {
							livereLib.fire({
								member_seq: syncService.member_seq
							}, "serviceLogout");
						}
					}
				}

			}
		}

	};

	this.syncOff = function() {
		jQuery.getScript(syncManager.checkurl, function() {
			if (typeof(additionalResult) == 'object') {
				if (syncManager.logouturl.indexOf("javascript:") == 0) {
					eval(syncManager.logouturl);
				} else {
					window.location.href = syncManager.logouturl;
				}
			}
		});
	};

	this.syncCheck = function() {
		if (syncManager.syncMembership) {
			syncManager.syncStart();
		}
	};

	this.init = function() {
		var smartlogindata = livereLib.getSmartLoginData();

		if (smartlogindata.sync_type != '0') {
			syncManager.syncAccessType = smartlogindata.sync_type;
			syncManager.syncMembership = smartlogindata.sync_acc;

			var re_path = livereSharedData.smartLogin.redirect_path;
			syncManager.checkurl = smartlogindata.checkurl;
			if (syncManager.checkurl.indexOf("?") > 0) {
				syncManager.checkurl += "&dummy=" + Math.random();
			} else {
				syncManager.checkurl += "?dummy=" + Math.random();
			}
			syncManager.loginurl = smartlogindata.loginurl.replace("[[REDIRECT_URL]]", re_path);
			syncManager.logouturl = smartlogindata.logouturl.replace("[[REDIRECT_URL]]", re_path);

			var service = eval(syncManager.syncMembership);

			service.loginGate = function(url) {
				if (!livereLib.util.isEmpty(syncManager.loginurl)) {
					if (syncManager.loginurl.indexOf("javascript:") == 0) {
						eval(syncManager.loginurl);
					} else if (syncManager.loginurl.indexOf("popup:") == 0) {
						var url = syncManager.loginurl.replace("popup:", "").split(",");
						window.open(url[0], "login", "width=" + url[1] + ",height=" + url[2]);
					} else {
						var params = {
							command: "redirect",
							redirect_path: syncManager.loginurl
						};
						var request = livereLib.url("API_Livere", params);
						window.location.href = request;
					}
				}
			};

			syncManager.syncCheck();
		}
	};

};

/*
 *	livere js area
 */

HTMLFactory = function() {
	this.defaultHtml = function() {
		var formHTML = "";

		formHTML += "<div id='liverePlugIn'>";
		formHTML += "	<h3 class='livereNone'>" + livereLib.getMessage("pluginHeadTitle_8") + "</h3>";
		formHTML += "	<div id='livereWriteForm'>";
		formHTML += "		<div id='livereWriteFormTop'>";
		formHTML += "			<span id='livereSNSLoginTitle'>" + livereLib.getMessage("socialLogin_8") + "</span>";
		formHTML += "			<div id='livereSNSLoginIconContainer'>";
		formHTML += "				<ul id='livereLogged' class='livereNone'></ul>";
		formHTML += "				<ul id='livereNotLogged'></ul>";
		formHTML += "			</div>";
		formHTML += "		</div>";
		formHTML += "		<div id='livereWriteFormMiddle'>";
		formHTML += "			<div id='livereWriteFromMiddleLeft'>";
		formHTML += "				<ul id='liverePrimaryStatus'>";
		formHTML += "					<li>";
		formHTML += "						<span id='liverePrimaryThumb'>";
		formHTML += "							<img src='https://101.livere.co.kr/images/_.gif'/>";
		formHTML += "						</span>";
		formHTML += "					</li>";
		formHTML += "				</ul>";
		formHTML += "			</div>";
		formHTML += "			<div id='livereWriteFormMiddleRightContainer'>";
		formHTML += "				<label for='livere_contentText' class='livereNone'>" + livereLib.getMessage("contentInputArea") + "</label>";
		formHTML += "				<ul id='livereWriteFormMiddleRight' class='livereWriteFormWrapper'>";
		formHTML += "					<li class='livereAccInfoWrapper'>";
		formHTML += "						<p id='livereAccInfo' class='livereAccInfo'></p>";
		formHTML += "					</li>";
		formHTML += "					<li id='livereWriteParamsForm' class='livereContentTextForm'>";
		formHTML += "						<input id='livere_short_url' name='livere_short_url' type='hidden' />";
		formHTML += "         	    	    <input id='livere_name' name='livere_name' type='hidden' />";
		formHTML += "         	        	<input id='livere_parent_seq' name='livere_parent_seq' type='hidden' />";
		formHTML += "						<textarea tabindex='0' id='livere_contentText' class='livere_contentText' name='livere_content' targetName='livereParentStrCount' title='" + livereLib.getMessage("contentInputArea") + "' aria-label='" + livereLib.getMessage("contentInputArea") + "'>" + livereLib.getMessage("title") + "</textarea>";
		formHTML += "					</li>";
		formHTML += "					<li id='livereWriteFormFunction' class='livereFunctionContainer'>";
		formHTML += "						<ul id='livereFunctionWrapper' class='livereFunctionWrapper'>";
		formHTML += "							<li class='livereTextCountWrapper'>";
		formHTML += "								<strong id='livereParentStrCount'>0</strong>/<span id='livereStrMaxCount'>" + livereSharedData.livereReply.livere_data.content_maxlen + "</span>";
		formHTML += "							</li>";
		formHTML += "						</ul>";
		formHTML += "					</li>";
		formHTML += "					<li id='livereWriteFormMiddleBottom'>";
		formHTML += "						<button type='button' id='livereWriteBtn' class='livereWriteBtn livereBtn2'><span class='livereFont5'>" + livereLib.getMessage("sendBtn") + "</span></button>";
		formHTML += "					</li>";
		formHTML += "				</ul>";
		formHTML += "			</div>";
		formHTML += "		</div>";
		formHTML += "		<div id='livereHome'><span id='livereHomeBtn'><a href='http://www.livere.com' title='" + livereLib.getMessage("livereHome_8") + " - " + livereLib.getMessage('openWindow') + "' aria-label='" + livereLib.getMessage("livereHome_8") + " - " + livereLib.getMessage('openWindow') + "' target='_blank'>Powered by <strong class='livereColor1'>Live</strong><strong class='livereColor2'>Re</strong></a></span></div>";
		formHTML += "	</div>";
		formHTML += "</div>";

		return formHTML;
	};

	this.isMobileLogin = function() {
		var html = "";

		html += "<div id='livereMobileLoginContainer'>";
		html += "	<button type='button' id='livereIsMobileBtn'><span>" + livereLib.getMessage("smartLoginNotLoggedBtn_8") + "</span></button>";
		html += "	<dl id='livereShareSNS' class='livereShareSNSWrapper'>";
		html += "		<dt><span class='livereFont6'>" + livereLib.getMessage("shareSNS_8") + "</span></dt>";
		html += "	</dl>";
		html += "</div>";

		return html;
	};

	this.isLoggedSNS = function(domain) {
		var html = "";
		html += "<dd class='livereShareSNS livereFavicon_mobile_L livereFavicon_mobile_L_" + domain + " livere_t_indent' rel='tooltip' aria-label='" + eval(domain).title + "' >" + eval(domain).title + "</dd>";
		return html;
	};

	this.all_logout = function() {
		var all_logout = "";

		all_logout += "<button type='button' id='livereLogoutBtn' class='livereBtn3'><span class='livereFont6'>" + livereLib.getMessage("all_logout") + "</span></button>";

		return all_logout;
	};

	this.linkage_accountHtmlObject = function(domain) {
		var accountHtmlObject = "";
			accountHtmlObject += "<li id='livere_" + domain.name + "'>";

		if (domain.member_islogin != 1) {
			accountHtmlObject += "	<button type='button' class='livereSNSLoginIcon livereClick livereBtn1' clickType='snsLoginBtn' rel='tooltip'>";
			accountHtmlObject += "		<span class='livereSNSImage_B livere_t_indent'>" + livereLib.getMessage("loginPageOpen_8") + "</span>";
		} else {
			accountHtmlObject += "	<button type='button' class='livereSNSLoginIcon livereClick livereBtn1' clickType='snsLoginBtn' rel='tooltip'>";
			accountHtmlObject += "		<span class='livereSNSImage_B livere_t_indent'>" + livereLib.getMessage("primarySet_8") + "</span>";
		}

		accountHtmlObject += "	</button>";

		var is_naver = typeof isNaverPosting=='undefined' ? false : isNaverPosting; //by lsw

		if ( domain.posting_enable === 1 || (is_naver && domain.posting_enable !== 1 && domain.name === 'naver') ){
			accountHtmlObject += "	<input id='livereSNSPostCheck_" + domain.name + "' class='livereSNSPostCheck livereClick livereCheckBtn' type='checkbox' clickType='snsPostingCheck' rel='tooltip' aria-label='" + livereLib.getMessage("replyPostConf_8") + "' title='" + livereLib.getMessage("replyPostConf_8") + "' />";
			accountHtmlObject += "	<label for='livereSNSPostCheck_" + domain.name + "' class='livereNone'>" + livereLib.getMessage("replyPostConf_8") + "</label>";
		}

		accountHtmlObject += "</li>";
		accountHtmlObject = livereLib.util.replaceAll(accountHtmlObject, "#DOMAIN#", domain.title);

		return accountHtmlObject;
	};

	this.setPrimarySNSFavicon = function() {
		var setPrimarySNSFavicon = "";

		setPrimarySNSFavicon += "<span id='liverePrimarySNSFavicon' class='livere_t_indent'>" + livereLib.getMessage("isPrimary_8") + "</span>";

		return setPrimarySNSFavicon;
	};

	this.defaultListHeader = function() {
		var listHeaderHTML = "";

		listHeaderHTML += "<div id='livereReplySort'>";
		listHeaderHTML += "	<strong id='livereReplyCountWrapper' class='livereFont8'>" + livereLib.getMessage("replyTotalCount_8") + " <b id='livereReplyCount' class='livereFont4'>" + livereSharedData.livereReply.rep_data.total_count + "</b></strong>";
		listHeaderHTML += "	<ul id='livereSortTabWrapper'>";
		listHeaderHTML += "		<li id='livereSort_new_wrapper'><button type='button' id='livereSort_new' class='livereSortTabBtn livereBtn3 livereSorted'><span class='livereFont4'>" + livereLib.getMessage("time") + "</span></button></li>";
		listHeaderHTML += "		<li id='livereSort_good_wrapper'><button type='button' id='livereSort_good' class='livereSortTabBtn livereBtn3'><span>" + livereLib.getMessage("good") + "</span></button></li>";
		listHeaderHTML += "		<li id='livereSort_bad_wrapper'><button type='button' id='livereSort_bad' class='livereSortTabBtn livereBtn3'><span>" + livereLib.getMessage("bad") + "</span></button></li>";
		listHeaderHTML += "	</ul>";
		listHeaderHTML += "</div>";
		listHeaderHTML += "<div id='livereReplyWrapper'></div>";
		listHeaderHTML += "<div id='livereNavigatorWrapper'></div>";

		return listHeaderHTML;
	};

	this.defaultParentReplyHtml = function(reply) {
		var member_domain_Upper = reply.member_domain.substr(0, 1).toUpperCase() + reply.member_domain.substr(1, reply.member_domain.length);
		var wrapper = "<div class='livereParentReplyWrapper'></div>";

		var replyThumb = "";

		if ( reply.member_url != "" ){
			replyThumb += "<button type='button' class='livereReplyThumb livereReplyTumb_" + reply.member_domain + "' rel='tooltip' aria-label='" + livereLib.getMessage("profilePageOpen_8") + "' title='" + livereLib.getMessage("profilePageOpen_8") + "'>";
		} else {
			replyThumb += "<button type='button' class='livereReplyThumb livereReplyTumb_" + reply.member_domain + " livereReplyNoProf' >";
		}


		if (reply.member_icon.indexOf("api.twitter.com/1/users") > -1) reply.member_icon = "https://si0.twimg.com/sticky/default_profile_images/default_profile_1_normal.png";

		if (livereLib.isSecure) {
			if (reply.member_domain == "twitter" || reply.member_domain == "facebook") {
				replyThumb += "	<img class='livereReplyThumb_L' alt='" + livereLib.getMessage("profileImg_8") + "' src='" + reply.member_icon.replace("http://", "https://") + "'/>";
			} else if (reply.member_domain == "cyworld") {
				replyThumb += "	<img class='livereReplyThumb_L' alt='" + livereLib.getMessage("profileImg_8") + "' src='https://101.livere.co.kr/images/ver8/unknown_profile.gif'/>";
			} else {
				replyThumb += "	<img class='livereReplyThumb_L' alt='" + livereLib.getMessage("profileImg_8") + "' src='" + reply.member_icon.replace("http://", "https://secure.livere.co.kr:8443/") + "'/>";
			}
		} else {
			replyThumb += "	<img class='livereReplyThumb_L' alt='" + livereLib.getMessage("profileImg_8") + "' src='" + reply.member_icon + "'/>";
		}

		if (!livereLib.switchMobileView) {
			if (reply.member_domain != "guest") {
				replyThumb += "	<span class='livereThumbFavicon livereFavicon_L livereFavicon_L_" + reply.member_domain + "'></span>";
			}
		}
		replyThumb += "</button>";

		replyThumb = livereLib.util.replaceAll(replyThumb, "#DOMAIN#", member_domain_Upper);
		reply.replyThumb = jQuery(replyThumb);

		var replyBody = "";
		replyBody += "<div class='livereReplyBodyContainer'>";
		replyBody += "	<dl class='livereReplyBody'>";
		replyBody += "		<dt class='livereArticleUserInfoWrapper'>";
		replyBody += "			<ul class='livereArticleUserInfo'>";

		if ( reply.member_url != "" ){
			replyBody += "				<li><button type='button' class='livereReplyWriterName livereBtn3' aria-label='" + livereLib.getMessage("profilePageOpen_8") + "' title='" + livereLib.getMessage("profilePageOpen_8") + "'>";
		} else {
			replyBody += "				<li><button type='button' class='livereReplyWriterName livereBtn3 livereReplyNoProf' >";
		}

		if (livereLib.switchMobileView) {
			replyBody += "	<span class='livereFavicon_mobile_L livereFavicon_mobile_L_" + reply.member_domain + " livereFont9'>" + reply.name + "</span>";
		} else {
			replyBody += "	<span class='livereFont9'>" + reply.name + "</span>";
		}

		replyBody += "					</button></li>";
		replyBody += "				<li><span class='livereReplyWritedRegdate livereFont3'>" + reply.reply_regdate + "</span></li>";
		replyBody += "			</ul>";
		replyBody += "		</dt>";
		replyBody += "		<dd class='livereArticleText'>";
		replyBody += "			<p>" + reply.content + "</p>";
		replyBody += "		</dd>";
		replyBody += "		<dd class='livereReplyFuncWrapper'>";
		replyBody += "			<ul class='livereReplyFunc'>";

		if (livereReply.status.sort == "new" || livereReply.forceUseReplyFunc) {
			replyBody += "				<li><button type='button' class='livereReply_addchild livereReplyFuncBtn livereBtn3' targetName='addchild'><span class='livereReplyFuncFavicon livereFont3'>" + livereLib.getMessage("replyBtn") + "</span></button></li>";
		}

		var m_police_bundle = livereLib.getMessage('police_bundle'),
			police_bundle_arr = m_police_bundle.split(',');
		replyBody += "				<li class='livereReply_police_wrapper'>";
		replyBody += "					<button type='button' class='livereReply_police livereReplyFuncBtn livereBtn3' targetName='police'><span class='livereReplyFuncFavicon livereFont3'>" + livereLib.getMessage("police") + "</span></button>";
		/*replyBody += "					<dl class='livere_police_layer' style='display:none;'>";
		replyBody += "						<dt class='livere_police_layer_top'>";
		replyBody += "							<span>" + police_bundle_arr[0] + "</span>"
		replyBody += "						</dt>";
		replyBody += "						<dd class='livere_police_layer_content' >";
		replyBody += "						<label for='livere_police_centet_select' class='livereNone'>" + police_bundle_arr[1] + "</label>";
		replyBody += "							<select id='livere_police_centet_select' class='livere_police_centet_select' name='report' title='" + police_bundle_arr[1] + "'>";
		replyBody += "								<option value='0'>" + police_bundle_arr[1] + "</option>"
		replyBody += "								<option value='1'>" + police_bundle_arr[2] + "</option>"
		replyBody += "								<option value='2'>" + police_bundle_arr[3] + "</option>"
		replyBody += "								<option value='3'>" + police_bundle_arr[4] + "</option>"
		replyBody += "								<option value='4'>" + police_bundle_arr[5] + "</option>"
		replyBody += "							</select><br>";
		replyBody += "							<div class='livere_police_layer_txt' style='display:none;'>"
		replyBody += "								<label for='livere_report_txt' class='livereNone' >" + police_bundle_arr[6] + "</label>"
		replyBody += "								<textarea id='livere_report_txt' title='" + police_bundle_arr[6] + "' class='livere_report_txt'></textarea>";
		replyBody += "							</div>"
		replyBody += "							<button class='livere_report_btn' type='button'><span>" + police_bundle_arr[7] + "</span></button>"
		replyBody += "							<button class='livere_police_layer_close' type='button' aria-label='" + livereLib.getMessage('close_8') + "'><span>X</span></button>"
		replyBody += "						</dd>";
		replyBody += "					</dl>";*/
		replyBody += "				</li>";
		replyBody += "				<li><button type='button' class='livereReply_delete livereReplyFuncBtn livereBtn3' targetName='delete'><span class='livereReplyFuncFavicon livereFont3'>" + livereLib.getMessage("deletebtn") + "</span></button></li>";
		replyBody += "			</ul>";
		replyBody += "		</dd>";
		replyBody += "		<dd class='livereChildReplyWrapper'></dd>";
		replyBody += "	</dl>";
		replyBody += "</div>";

		var evaluationBtn = "";
		evaluationBtn += "<ul class='livereReplyEvaluation'>";
		evaluationBtn += "	<li class='livereReply_good_wrapper'><button type='button' class='livereReply_good livereReplyEvaluationBtn livereBtn1' targetName='good' rel='tooltip' aria-label='" + livereLib.getMessage("goodbtn") + "'><span class='livere_t_indent'>" + livereLib.getMessage("goodbtn") + "</span><strong class='livereReply_good_count'>" + reply.good + "</strong></button></li>";
		evaluationBtn += "	<li class='livereReply_bad_wrapper'><button type='button' class='livereReply_bad livereReplyEvaluationBtn livereBtn1' targetName='bad' rel='tooltip' aria-label='" + livereLib.getMessage("badbtn") + "'><span class='livere_t_indent'>" + livereLib.getMessage("badbtn") + "</span><strong class='livereReply_bad_count'>" + reply.bad + "</strong></button></li>";
		evaluationBtn += "</ul>";

		var septSNS = "";
		if (!livereLib.util.isEmpty(reply.septSNSObj)) {
			septSNS += "<dl class='livereSharedSNSWrapper'>";
			septSNS += "	<dt><span class='livereFont6'>" + livereLib.getMessage("sharedSNS_8") + "</span></dt>";

			jQuery.each(reply.septSNSObj.reverse(), function(ii, vv) {
				septSNS += "<dd class='livereSharedSNS livereFavicon_L livereFavicon_L_" + vv + " livere_t_indent' rel='tooltip' aria-label='" + vv.substr(0, 1).toUpperCase() + vv.substr(1, vv.length) + "' >" + vv.substr(0, 1).toUpperCase() + vv.substr(1, vv.length) + "</dd>";
			});

			septSNS += "</dl>";
		}

		replyBody = livereLib.util.replaceAll(replyBody, "#DOMAIN#", member_domain_Upper);
		reply.replyBody = jQuery(replyBody);

		if (livereLib.switchMobileView) {
			reply.replyBody.find(".livereReplyFuncWrapper").append(evaluationBtn);
			reply.replyBody.find(".livereReplyFuncWrapper").before(septSNS);
		} else {
			reply.replyBody.find(".livereArticleText").prepend(evaluationBtn);
			reply.replyBody.find(".livereReplyFuncWrapper").append(septSNS);
		}

		reply.wrapper = jQuery(wrapper);
		reply.wrapper.append(reply.replyThumb);
		reply.wrapper.append(reply.replyBody);
		reply.wrapper.data(reply);

		return reply;
	};

	this.defaultEmptyReplyHtmlObject = function() {
		var reply = {};
		var wrapper = "<div class='livereParentReplyWrapper livereEmptyReplyWrapper'></div>";

		var replyThumb = "";
		replyThumb += "<button type='button' class='livereReplyThumb'>";
		replyThumb += "	<img class='livereReplyThumb_L' alt='" + livereLib.getMessage("profileImg_8") + "' src='https://101.livere.co.kr/images/ver8/delete.png'/>";
		replyThumb += "</button>";

		replyThumb = livereLib.util.replaceAll(replyThumb, "#DOMAIN#", livereLib.getMessage("deletedReply_8"));
		reply.replyThumb = jQuery(replyThumb);

		var replyBody = "";
		replyBody += "<div class='livereReplyBodyContainer'>";
		replyBody += "	<dl class='livereReplyBody'>";
		replyBody += "		<dt>";
		replyBody += "			<span class='livereFont9'>" + livereLib.getMessage("deletedReply_8") + "</span>";
		replyBody += "		</dt>";
		replyBody += "		<dd class='livereArticleText'>";
		replyBody += "			<p class='livereDeletedText'><span>" + livereLib.getMessage("deleteReplyMsg_8") + "</span></p>";
		replyBody += "		</dd>";
		replyBody += "		<dd class='livereChildReplyWrapper'></dd>";
		replyBody += "	</dl>";
		replyBody += "</div>";

		reply.replyBody = jQuery(replyBody);

		reply.wrapper = jQuery(wrapper);
		reply.wrapper.append(reply.replyThumb);
		reply.wrapper.append(reply.replyBody);

		return reply;
	};

	this.defaultChildReplyHtml = function(reply) {
		var member_domain_Upper = reply.member_domain.substr(0, 1).toUpperCase() + reply.member_domain.substr(1, reply.member_domain.length);
		var wrapper = "<div class='livereChildReply'></div>";

		var replyThumb = "";

		if ( reply.member_url != "" ){
			replyThumb += "<button type='button' class='livereReplyThumb livereReplyTumb_" + reply.member_domain + "' rel='tooltip' aria-label='" + livereLib.getMessage("profilePageOpen_8") + "'>";
		} else {
			replyThumb += "<button type='button' class='livereReplyThumb livereReplyTumb_" + reply.member_domain + " livereReplyNoProf' >";
		}


		if (reply.member_icon.indexOf("api.twitter.com/1/users") > -1) reply.member_icon = "https://si0.twimg.com/sticky/default_profile_images/default_profile_1_normal.png";

		if (livereLib.isSecure) {
			if (reply.member_domain == "twitter" || reply.member_domain == "facebook") {
				replyThumb += "	<img class='livereReplyThumb_S' alt='" + livereLib.getMessage("profileImg_8") + "' src='" + reply.member_icon.replace("http://", "https://") + "'/>";
			} else if (reply.member_domain == "cyworld") {
				replyThumb += "	<img class='livereReplyThumb_L' alt='" + livereLib.getMessage("profileImg_8") + "' src='https://101.livere.co.kr/images/ver8/unknown_profile.gif'/>";
			} else {
				replyThumb += "	<img class='livereReplyThumb_S' alt='" + livereLib.getMessage("profileImg_8") + "' src='" + reply.member_icon.replace("http://", "https://secure.livere.co.kr:8443/") + "'/>";
			}
		} else {
			replyThumb += "	<img class='livereReplyThumb_S' alt='" + livereLib.getMessage("profileImg_8") + "' src='" + reply.member_icon + "'/>";
		}

		if (!livereLib.switchMobileView) {
			if (reply.member_domain != "guest") {
				replyThumb += "	<span class='livereThumbFavicon livereFavicon_S livereFavicon_S_" + reply.member_domain + "'></span>";
			}
		}

		replyThumb += "</button>";

		replyThumb = livereLib.util.replaceAll(replyThumb, "#DOMAIN#", member_domain_Upper);
		reply.replyThumb = jQuery(replyThumb);

		var replyBody = "";
		replyBody += "<dl class='livereReplyBody'>";
		replyBody += "	<dt class='livereArticleUserInfoWrapper'>";
		replyBody += "		<ul class='livereArticleUserInfo'>";

		if(reply.member_url != ""){
			replyBody += "			<li><button type='button' class='livereReplyWriterName livereBtn3' aria-label='" + livereLib.getMessage("profilePageOpen_8") + "'>";
		} else {
			replyBody += "			<li><button type='button' class='livereReplyWriterName livereBtn3 livereReplyNoProf' >";
		}

		if (livereLib.switchMobileView) {
			replyBody += "				<span class='livereFavicon_mobile_S livereFavicon_mobile_S_" + reply.member_domain + " livereFont9'>" + reply.name + "</span>";
		} else {
			replyBody += "				<span class='livereFont9'>" + reply.name + "</span>";
		}

		var m_police_bundle = livereLib.getMessage('police_bundle'),
			police_bundle_arr = m_police_bundle.split(',');

		replyBody += "				</button></li>";
		replyBody += "			<li><span class='livereReplyWritedRegdate livereFont3'>" + reply.reply_regdate + "</span></li>";
		replyBody += "		</ul>";
		replyBody += "	</dt>";
		replyBody += "	<dd class='livereArticleText'>";
		replyBody += "		<p>" + reply.content + "</p>";
		replyBody += "	</dd>";
		replyBody += "	<dd class='livereReplyFuncWrapper'>";
		replyBody += "		<ul class='livereReplyFunc'>";
		replyBody += "			<li class='livereReply_police_wrapper'><button type='button' class='livereReply_police livereReplyFuncBtn livereBtn3' targetName='police'><span class='livereReplyFuncFavicon livereFont3'>" + livereLib.getMessage("police") + "</span></button>";
		/*replyBody += "			<dl class='livere_police_layer' style='display:none;'>";
		replyBody += "				<dt class='livere_police_layer_top'>";
		replyBody += "					<span>" + police_bundle_arr[0] + "</span>"
		replyBody += "				</dt>";
		replyBody += "				<dd class='livere_police_layer_content'>";
		replyBody += "					<label for='livere_police_centet_select' class='livereNone'>" + police_bundle_arr[1] + "</label>";
		replyBody += "					<select id='livere_police_centet_select' class='livere_police_centet_select' name='report' aria-label='" + police_bundle_arr[1] + "'>";
		replyBody += "						<option value='0'>" + police_bundle_arr[1] + "</option>"
		replyBody += "						<option value='1'>" + police_bundle_arr[2] + "</option>"
		replyBody += "						<option value='2'>" + police_bundle_arr[3] + "</option>"
		replyBody += "						<option value='3'>" + police_bundle_arr[4] + "</option>"
		replyBody += "						<option value='4'>" + police_bundle_arr[5] + "</option>"
		replyBody += "					</select><br>";
		replyBody += "					<div class='livere_police_layer_txt' style='display:none;'>"
		replyBody += "						<label for='livere_report_txt' class='livereNone' >" + police_bundle_arr[6] + "</label>"
		replyBody += "						<textarea id='livere_report_txt' title='" + police_bundle_arr[6] + "' class='livere_report_txt'></textarea>";
		replyBody += "					</div>"
		replyBody += "					<button class='livere_report_btn' type='button'><span>" + police_bundle_arr[7] + "</span></button>"
		replyBody += "					<button class='livere_police_layer_close' type='button' aria-label='" + livereLib.getMessage('close_8') + "'><span>X</span></button>"
		replyBody += "				</dd>";
		replyBody += "			</dl>";*/
		replyBody += "          </li>";
		replyBody += "			<li><button type='button' class='livereReply_delete livereReplyFuncBtn livereBtn3' targetName='delete'><span class='livereReplyFuncFavicon livereFont3'>" + livereLib.getMessage("deletebtn") + "</span></button></li>";
		replyBody += "		</ul>";
		replyBody += "	</dd>";
		replyBody += "</dl>";

		var septSNS = "";
		if (!livereLib.util.isEmpty(reply.septSNSObj)) {
			septSNS += "<dl class='livereSharedSNSWrapper'>";
			septSNS += "	<dt><span class='livereFont6'>" + livereLib.getMessage("sharedSNS_8") + "</span></dt>";

			jQuery.each(reply.septSNSObj.reverse(), function(ii, vv) {
				septSNS += "<dd class='livereSharedSNS livereFavicon_L livereFavicon_L_" + vv + " livere_t_indent' rel='tooltip' aria-label='" + vv.substr(0, 1).toUpperCase() + vv.substr(1, vv.length) + "' >" + vv.substr(0, 1).toUpperCase() + vv.substr(1, vv.length) + "</dd>";
			});

			septSNS += "</dl>";
		}

		replyBody = livereLib.util.replaceAll(replyBody, "#DOMAIN#", member_domain_Upper);
		reply.replyBody = jQuery(replyBody);

		if (livereLib.switchMobileView) {
			reply.replyBody.find(".livereReplyFuncWrapper").before(septSNS);
		} else {
			reply.replyBody.find(".livereReplyFuncWrapper").append(septSNS);
		}

		reply.wrapper = jQuery(wrapper);
		reply.wrapper.append(reply.replyThumb);
		reply.wrapper.append(reply.replyBody);
		reply.wrapper.data(reply);

		return reply;
	};

	this.childReplyWriteFormHtml = function() {

		var childReplyWriteForm = "";
		childReplyWriteForm += "<div id='livereChildReplyWriteForm' class='livereChildReply'>";
		childReplyWriteForm += "	<span id='livereChildReplyWriteFormArrow'></span>";
		childReplyWriteForm += "	<label for='livere_childContentText' class='livereNone'>" + livereLib.getMessage("reContentInputArea") + "</label>";
		childReplyWriteForm += "	<ul class='livereWriteFormWrapper'>";
		childReplyWriteForm += "		<li class='livereAccInfoWrapper'>";
		childReplyWriteForm += "			<p class='livereAccInfo'></p>";
		childReplyWriteForm += "		</li>";
		childReplyWriteForm += "		<li class='livereContentTextForm'>";
		childReplyWriteForm += "			<textarea id='livere_childContentText' class='livere_contentText' name='livere_childContent' targetName='livereChildStrCount' title='" + livereLib.getMessage("reContentInputArea") + "' aria-label='" + livereLib.getMessage("reContentInputArea") + "'></textarea>";
		childReplyWriteForm += "		</li>";
		childReplyWriteForm += "		<li class='livereFunctionContainer'>";

		childReplyWriteForm += "			<ul class='livereFunctionWrapper'>";
		childReplyWriteForm += "				<li class='livereTextCountWrapper'>";
		childReplyWriteForm += "					<strong id='livereChildStrCount'>0</strong>/<span id='livereStrMaxCount'>" + livereSharedData.livereReply.livere_data.content_maxlen + "</span>";
		childReplyWriteForm += "				</li>";
		childReplyWriteForm += "			</ul>";
		childReplyWriteForm += "		</li>";
		childReplyWriteForm += "		<li class='livereWriteFormMiddleBottom'>";
		childReplyWriteForm += "			<button type='button' id='livereChildWriteBtn' class='livereWriteBtn livereBtn2'>";
		childReplyWriteForm += "				<span class='livereFont5'>" + livereLib.getMessage("sendBtn") + "</span>";
		childReplyWriteForm += "			</button>";
		childReplyWriteForm += "		</li>";
		childReplyWriteForm += "	</ul>";
		childReplyWriteForm += "</div>";

		return childReplyWriteForm;
	};

	this.moreBtn = function() {
		var moreBtn = "";

		moreBtn += "<p id='livereMoreBtnWrapper'>";
		moreBtn += "	<button type='button' id='livereMoreBtn' class='livereBtn1'>";
		moreBtn += "		<span>" + livereLib.getMessage("moreBtn") + "</span>";
		moreBtn += "	</button>";
		moreBtn += "</p>";

		return moreBtn;
	};

	this.replyLoading = function() {
		var replyLoading = "";

		replyLoading += "<div id='livereReplyLoading' class='livereParentReplyWrapper'>";
		replyLoading += "	<p>";
		replyLoading += "		<img src='https://101.livere.co.kr/images/ver8/viewLoading.gif' />";
		replyLoading += "	</p>";
		replyLoading += "</div>";

		return replyLoading;
	};

};

Livere = function(livere_seq, refer, title) {
	this.isWriteForm = false;
	this.htmlFactory = new HTMLFactory();

	livereSharedData.livereReply.livere_seq = livere_seq;
	livereSharedData.livereReply.refer = refer;
	livereSharedData.livereReply.title = title;

	this.fire = function(command) {
		var fireData = {};
		fireData['ownerObject'] = this;

		livereLib.fire(fireData, command);
	};

	this.init = function() {
		livereSharedData.livereReply.livere_seq = livere_seq;
		livereSharedData.livereReply.refer = refer;
		livereSharedData.livereReply.title = title;

		var params = {
			refer: livereSharedData.livereReply.refer,
			title: livereSharedData.livereReply.title
		};

		livereLib.initLivereReply(params);
	};

	this.secondStep = function() {
		var customCssPath = null;
		var customMCssPath = null;

		/*jQuery("#livereContainer").append(this.htmlFactory.replyLoading);*/

		if (livereSharedData.livereReply.livere_data.load_default_css == '1') {
			var msieversion = livereLib.util.msieversion();
			if( msieversion != 0 && msieversion <= 8 ){
				livereLib.cssLoad("https://101.livere.co.kr/css/default_livere8.css");
			}else{
				livereLib.cssLoad("https://101.livere.co.kr/css/default_livere8_gzip.css");
			}

			if (livereSharedData.livereReply.livere_data.load_default_m_css == '1') {
				// Auto Off
				customCssPath = !livereLib.util.isEmpty(livereSharedData.livereReply.livere_data.css_path) ? livereSharedData.livereReply.livere_data.css_path : "";
				customMCssPath = !livereLib.util.isEmpty(livereSharedData.livereReply.livere_data.mobile_css_path) ? livereSharedData.livereReply.livere_data.mobile_css_path : "";

				if (!livereLib.util.isEmpty(customCssPath)) {
					// PC
					livereLib.cssLoad(customCssPath);
				} else if (!livereLib.util.isEmpty(customMCssPath)) {
					// M
					livereLib.cssLoad("https://101.livere.co.kr/css/default_livere8_m.css");
					livereLib.cssLoad(customMCssPath);
				}
			} else {
				// Auto On
				if (!livereLib.util.isMobileVisitor()) {
					// PC
					customCssPath = !livereLib.util.isEmpty(livereSharedData.livereReply.livere_data.css_path) ? livereSharedData.livereReply.livere_data.css_path : "";

					if (!livereLib.util.isEmpty(customCssPath)) {
						livereLib.cssLoad(customCssPath);
					}
				} else {
					// M
					livereLib.cssLoad("https://101.livere.co.kr/css/default_livere8_m.css");
					customMCssPath = !livereLib.util.isEmpty(livereSharedData.livereReply.livere_data.mobile_css_path) ? livereSharedData.livereReply.livere_data.mobile_css_path : "";

					if (!livereLib.util.isEmpty(customMCssPath)) {
						livereLib.cssLoad(customMCssPath);
					}
				}
			}
		} else {
			customCssPath = !livereLib.util.isEmpty(livereSharedData.livereReply.livere_data.css_path) ? livereSharedData.livereReply.livere_data.css_path : "";
			customMCssPath = !livereLib.util.isEmpty(livereSharedData.livereReply.livere_data.mobile_css_path) ? livereSharedData.livereReply.livere_data.mobile_css_path : "";

			if (!livereLib.util.isEmpty(customCssPath)) {
				// PC
				livereLib.cssLoad(customCssPath);
			} else if (!livereLib.util.isEmpty(customMCssPath)) {
				// M
				livereLib.cssLoad(customMCssPath);
			}
		}

		if(livereSharedData.livereReply.livere_data.use_stickers) {
			livereReply.callToModule("livereSticker");
		}

		var trident = navigator.userAgent.match(/Trident\/(\d)/i);
		if((livereSharedData.livereReply.livere_data.use_actionbar
				&& !livereLib.util.isTouchDevice())
			|| (livereSharedData.livereReply.livere_data.use_actionbar
				&& trident != null)) {
			livereReply.callToModule("livereActionBar");
		}

		if (!jQuery("#" + livereSharedData.livereReply.livere_data.targetDiv).length > 0) {
			return;
		}

		var wf = jQuery(livereReply.htmlFactory.defaultHtml());

		wf.find("#livereWriteBtn").click(function() {
			livereLib.fire(function() {
				livereLib.processing = true;
				livereReply.write();
			}, "processing");
			jQuery(this).focus();
		});

		wf.find("#livere_contentText").bind("change keyup input", function(e) {
			livereReply.textValidate(this);
		});

		/* isTouchDevice */
		if (livereLib.switchMobileView) {
			jQuery("#" + livereSharedData.livereReply.livere_data.targetDiv).addClass("livere_mobile");

			wf.find("#livereWriteFormTop").hide();

			var isMobileLogin = jQuery(livereReply.htmlFactory.isMobileLogin());

			livereLib.isMobileSmartloginView = false;
			isMobileLogin.find("#livereIsMobileBtn").click(function() {
				if( livereLib.isMobileSmartloginView ){
					livereLib.isMobileSmartloginView = false;
					livereSmartLogin.close();
					return;
				}else{
					livereLib.isMobileSmartloginView = true;
				}
				livereSmartLogin.usedWriteForm = true;
				livereSmartLogin.initOpened();
			});

			wf.find("#livereWriteForm").prepend(isMobileLogin);
		}

		if (!livereLib.util.isTouchDevice()) jQuery("#" + livereSharedData.livereReply.livere_data.targetDiv).addClass("livereReply_useMouseOver");

		jQuery("#" + livereSharedData.livereReply.livere_data.targetDiv).append(wf);

		var data = {};
		data["type"] = "livereEvent";
		data["key"] = "writeFormCreated";
		data["value"] = "true";

		livereLib.dispatchEvent(data);

		livereReply.setAccounts();

		if (livereSharedData.livereReply.livere_data.listviewable == 1 && livereSharedData.livereReply.reply_data)
			livereReply.setReplyList(livereSharedData.livereReply.reply_data);

		/*livereLib.loadingComplete();*/
	};

	this.callToModule = function(m_name) {
		var modulePath = "https://101.livere.co.kr/js/" + m_name + ".js";
		jQuery.getScript(modulePath, function() {
			eval(m_name).start();
		});
	};

	this.textValidate = function(obj) {
		var textareaObj = jQuery(obj);
		var max_len = livereSharedData.livereReply.livere_data.content_maxlen;
		var str_len = textareaObj.val().length;

		jQuery("#" + textareaObj.attr("targetName")).text(str_len);

		if (str_len > max_len) {
			alert(livereLib.getMessage("textCount_8").replace("#TEXTCOUNT#", max_len));
			textareaObj.val(textareaObj.val().substring(0, (max_len))).focus();
			livereReply.textValidate(obj);
		}
	};

	this.setAccounts = function() {
		var loggedTarget = jQuery("#livereLogged");
		var notLoggedTarget = jQuery("#livereNotLogged");

		loggedTarget.empty();
		notLoggedTarget.empty();

		var s_datas = livereLib.getSmartLoginData();
		jQuery.each(s_datas.linkage_accs, function(ii, acc) {
			var account = eval(acc);

			account.icon = jQuery(livereReply.htmlFactory.linkage_accountHtmlObject(account));

			livereLib.util.toolTip(account.icon.find("[rel=tooltip]"));

			account.icon.find("[clickType]").click(function() {
				livereReply.iconClick(account.name, jQuery(this));
			});

			livereReply.injectLoginData(account);

			if (!livereLib.util.isEmpty(account.member_islogin) && account.member_islogin == "1") {
				account.icon.addClass("livere_loggedSNS");
				loggedTarget.append(account.icon);
				if (!livereLib.util.isEmpty(account.member_ispost) && account.member_ispost == "1") {
					account.icon.find(".livereSNSPostCheck").attr({
						"checked": true
					});
				}
			} else {
				account.icon.find(".livereSNSPostCheck").remove();
				notLoggedTarget.append(account.icon);
			}
		});

		jQuery("#livereLogoutBtn").remove();
		if (livereLib.isLogged()) {
			var all_logout = jQuery(livereReply.htmlFactory.all_logout());
			all_logout.click(function() {
				livereLib.fire(function() {
					livereLib.processing = true;
					livereLib.fire({}, "livereLogout");
				}, "processing");
			});

			jQuery("#livereWriteFormTop").append(all_logout);
		}

		var eventData = {};
		eventData['type'] = 'livereEvent';
		eventData['key'] = 'livereCreationComplete';

		livereLib.dispatchEvent(eventData);
	};

	this.iconClick = function(account_name, clickObj) {

		livereLib.fire(function() {
			var account = window[account_name];

			if (account.member_islogin != '1') {
				account.loginGate();

				if (clickObj.attr("type") == "checkbox") {
					clickObj.attr("checked", false);
				}
			} else {
				livereLib.processing = true;

				var requestParams = {};
				requestParams['member_seq'] = account.member_seq;

				switch (clickObj.attr("clickType")) {
					case "snsLoginBtn":
						livereLib.fire(requestParams, "setPrimary");
						break;
					case "snsPostingCheck":
						livereLib.fire(requestParams, "setPosting");
						break;
				}
			}
		}, "processing");
	};

	this.injectLoginData = function(account) {
		var s_l = livereLib.getSmartLoginData();

		if (s_l.member_datas)
			jQuery.each(s_l.member_datas, function(ii, login_acc) {
				if (account.name == login_acc.member_domain) {
					jQuery.extend(account, login_acc);
				}
			});
	};

	this.drawPrimaryUserData = function() {
		var logged = livereLib.isLogged();
		jQuery("#livereLogged").removeClass("livereNone")
			.removeClass(function(idx, hasClassNames) {
				var matchedClass = hasClassNames.match(/livere_p_[a-zA-Z0-9_]*/g) || [];
				return matchedClass.join(" ");
			});

		jQuery(".livereAccInfoWrapper").removeClass(function(idx, hasClassNames) {
			var matchedClass = hasClassNames.match(/livere_pWriter_[a-zA-Z0-9_]*/g) || [];
			return matchedClass.join(" ");
		});

		var primaryMember = livereLib.getPrimaryDomain();

		if (logged && !livereLib.util.isEmpty(primaryMember)) {
			var p_domain = eval(primaryMember.member_domain);

			p_domain.icon.addClass("livere_primary");
			jQuery("#livereLogged").addClass("livere_p_" + primaryMember.member_domain);

			if (primaryMember.member_domain == "kakao" && primaryMember.member_icon ==  null) primaryMember.member_icon = "https://101.livere.co.kr/images/ver8/guest.png";

			if (primaryMember.member_icon.indexOf("api.twitter.com/1/users") > -1) primaryMember.member_icon = "https://si0.twimg.com/sticky/default_profile_images/default_profile_1_normal.png";

			if (livereLib.isSecure) {
				if (primaryMember.member_domain == "twitter" || primaryMember.member_domain == "facebook" || primaryMember.member_domain == "kakao") {
					jQuery("#liverePrimaryThumb > img").attr("src", primaryMember.member_icon.replace("http://", "https://"));
				} else {
					jQuery("#liverePrimaryThumb > img").attr("src", primaryMember.member_icon.replace("http://", "https://secure.livere.co.kr:8443/"));
				}
			} else if (primaryMember.member_domain == "google_plus" && primaryMember.member_icon.indexOf("guest.png") > -1) {
				jQuery("#liverePrimaryThumb > img").attr("src", "https://101.livere.co.kr/images/ver8/googleplus_unknown.png");
			} else {
				jQuery("#liverePrimaryThumb > img").attr("src", primaryMember.member_icon);
			}

			jQuery("#liverePrimaryThumb > img").attr("alt", livereLib.getMessage("profileImg_8").replace("#DOMAIN#", primaryMember.title));
			jQuery("#liverePrimaryThumb").removeClass("notLoggedThumb");
			jQuery("#livere_name").val(primaryMember.member_name);
			jQuery(".livereAccInfo").html(primaryMember.member_name).addClass("livereFont5");
			jQuery(".livereAccInfoWrapper").addClass("livere_pWriter_" + primaryMember.member_domain);

			livereReply.currentInputText = jQuery("#livere_contentText").val() != jQuery("#livere_contentText")[0].defaultValue ? jQuery("#livere_contentText").val() : "";

			jQuery("#livere_contentText").attr("disabled", false).val(livereReply.currentInputText);
			jQuery("#livere_" + primaryMember.member_domain).prepend(livereReply.htmlFactory.setPrimarySNSFavicon()).find(".livereSNSImage_B").text(primaryMember.member_domain + " " + livereLib.getMessage("isPrimary_8"));

			if (livereLib.switchMobileView) {
				var s_data = livereLib.getSmartLoginData();

				jQuery("#livereShareSNS").find(".livereShareSNS").remove();

				var isNotShare = true;
				jQuery.each(s_data.linkage_accs, function(ii, vv) {
					if (eval(vv).member_islogin == 1 && eval(vv).member_ispost == 1 && eval(vv).posting_enable === 1) {
						jQuery("#livereShareSNS").append(livereReply.htmlFactory.isLoggedSNS(vv));
						isNotShare = false;
					}
				});

				isNotShare ? jQuery("#livereShareSNS").addClass("livereNone") : jQuery("#livereShareSNS").removeClass("livereNone");

				jQuery("#livereIsMobileBtn").addClass("livereSmartBtnIsLogged");
				jQuery("#livereIsMobileBtn > span").text(livereLib.getMessage("smartLoginLoggedBtn_8"));
			}
		} else {
			jQuery("#livereLogged").addClass("livereNone");
			jQuery("#liverePrimaryThumb > img").attr({
				"src": "https://101.livere.co.kr/images/_.gif",
				"alt": livereLib.getMessage("beforeLoggedImg_8")
			});
			jQuery("#liverePrimaryThumb").addClass("notLoggedThumb");
			jQuery("#livere_name").val();
			jQuery(".livereAccInfo").html(livereLib.getMessage("snsid")).removeClass("livereFont5");
			jQuery("#livere_contentText").attr("disabled", true).val(livereLib.getMessage("title"));
			jQuery("#liverePrimarySNSFavicon").remove();

			if (livereLib.switchMobileView) {
				jQuery("#livereShareSNS").addClass("livereNone");
				jQuery("#livereIsMobileBtn").removeClass("livereSmartBtnIsLogged");
				jQuery("#livereIsMobileBtn > span").text(livereLib.getMessage("smartLoginNotLoggedBtn_8"));
			}
		}

		var eventData = {};
		eventData["type"] = "livereEvent";
		eventData["key"] = "drawPrimaryUserDataComplete";
		eventData["value"] = primaryMember;

		livereLib.dispatchEvent(eventData);
	};

	this.writeHookers = [];
	this.writeDoneHookers = [];
	this.writeHooker = function(fun, isDoneHooker) {
		if (isDoneHooker)
			livereReply.writeDoneHookers.push(fun);
		else
			livereReply.writeHookers.push(fun);
	};

	this.write = function(force) {
		if (!livereLib.isLogged() && !force) {
			alert(livereLib.getMessage("needLogin"));
			livereLib.processComplete();
			return false;
		}

		if (livereLib.util.isEmpty(jQuery("#livere_contentText").val())) {
			alert(livereLib.getMessage("emptyContentLog"));
			livereLib.processComplete();
			jQuery('#livere_contentText').trigger('focus');
			return false;
		}

		var hookerDone;
		jQuery(livereReply.writeHookers).each(function(ii, vv) {
			var fn = eval(vv);
			hookerDone = fn();
		});

		if (typeof(hookerDone) != "undefined") {

			if (!hookerDone) {
				jQuery(livereReply.writeDoneHookers).each(function(ii, vv) {
					var fn = eval(vv);
					fn();
				});

				livereLib.processComplete();
				return false;
			}
		}

		var fmInputs = jQuery("#livereWriteParamsForm").children();

		var params = {};
		jQuery.each(fmInputs, function(ii, vv) {
			params[vv.name.replace("livere_", "")] = jQuery(vv).val();
		});

		var primary = livereLib.getPrimaryDomain();

		if (livereLib.isLogged() && !livereLib.util.isEmpty(primary)) {

			if (!livereLib.util.isEmpty(jQuery("#liverePrimaryThumb > img").attr("src"))) {
				params["member_icon"] = jQuery("#liverePrimaryThumb > img").attr("src");
			}

			params["member_domain"] = primary.member_domain;
			params["member_seq"] = primary.member_seq;
			params["name"] = primary.member_name;
		}

		// descipriton check
		var description = "";

		if (!livereLib.util.isEmpty(livereReply.desc)) {
			description = livereReply.desc;
		} else if (!livereLib.util.isEmpty(livereReply.description)) {
			description = livereReply.description;
		} else {
			jQuery("meta").each(function(ii, vv) {
				var obj = jQuery(vv);
				obj.attr("name", (obj.attr("name") + "").toLowerCase());
			});

			var desc_meta = jQuery("meta[name='description']");
			if (desc_meta.length > 0 && !livereLib.util.isEmpty(desc_meta.attr("content"))) {
				description = desc_meta.attr("content");
			}

			if (description.length > 300) {
				description = description.substr(0, 299);
			}
		}
		params["description"] = description;

		params["refer"] = refer;
		params["title"] = title;

		// facebook og:image check
		var logo = "";
		var og_image = jQuery("meta[property='og:image']");
		if (!livereLib.util.isEmpty(livereReply.logo)) {
			logo = livereReply.logo;
		} else if (og_image.length > 0 && !livereLib.util.isEmpty(og_image.attr("content"))) {
			logo = og_image.attr("content");
		}
		params["logo"] = logo;

		// swf video posting
		if (!livereLib.util.isEmpty(livereReply.videosrc)) params["swf"] = livereReply.videosrc;
		if (!livereLib.util.isEmpty(livereReply.videothumb)) params["swfthumb"] = livereReply.videothumb;

		if (!livereLib.util.isEmpty(livereReply.site)) params["site"] = livereReply.site;

		//filter
		var validate_content = livereLib.util.matchingRegExp(params["content"]);
		params["content"] = validate_content;

		//by lsw
		var is_naver = typeof isNaverPosting=='undefined' ? false : isNaverPosting;
		if(is_naver) {
			params.is_event = 'on';
		}

		livereLib.fire(params, "writeReply");
	};

	this.writeDoneComplete = function(r_data) {
		jQuery("#livere_parent_seq").val("");
		jQuery("#livere_contentText").val("");
		jQuery("#livereParentStrCount").html("0");
		jQuery("#livereReplyCount").text(++livereSharedData.livereReply.rep_data.total_count);

		jQuery(livereReply.writeDoneHookers).each(function(ii, vv) {
			var fn = eval(vv);
			fn();
		});
	};

	this.getReplyObject = function(value, type) {
		switch (type) {
			default: var returnObject = null;
			jQuery(livereReply.listArray).each(function(ii, vv) {
				if (vv.reply_seq == value) {
					returnObject = vv;
					return false;
				}
			});

			return returnObject;
			break;
		}
	};

	this.getArticle = function(pageNo) {
		if (!livereReply.status.nowListLoading) {
			livereReply.status.nowListLoading = true;

			var params = {};
			params["calltype"] = livereReply.status.calltype;
			params["command"] = "getArticle";
			params["sort"] = livereReply.status.sort;
			params["viewpage"] = pageNo ? pageNo : livereReply.status.viewPage;

			if (!livereLib.util.isEmpty(livereReply.status.search_key)) {
				params["search_key"] = livereReply.status.search_key;
				params["search_value"] = livereReply.status.search_value;
			}

			livereLib.fire(params, "getArticle");
		}
	};

	this.getArticleHandler = function(replyData) {

		var tabs = jQuery("#livereSortTabWrapper").find("li");
		jQuery.each(tabs, function(ii, vv) {
			jQuery(vv).find("button").removeClass("livereSorted").find("span").removeClass("livereFont4");
		});

		var sortId = livereReply.status.sort == "past" ? "new" : livereReply.status.sort;
		jQuery("#livereSort_" + sortId).addClass("livereSorted").find("span").addClass("livereFont4");

		if (livereReply.status.viewPage == 1) {
			jQuery("#livereReplyWrapper").empty();
			livereReply.listArray = [];
		}

		if (jQuery("#livereReplyLoading").length > 0) {
			jQuery("#livereReplyLoading").remove();
		}

		livereReply.setReplyList(replyData);

		livereReply.status.nowListLoading = false;
	};

	this.setListHeader = function() {
		if (jQuery("#livereReplySort").length != 0) return;

		var listHeader = jQuery(livereReply.htmlFactory.defaultListHeader());

		jQuery(listHeader).find("#livereSortTabWrapper button").click(function() {
			var id = jQuery(this).attr("id");
			id = id.replace("livereSort_", "");

			livereLib.fire(function() {
				livereLib.processing = true;

				if (livereReply.status.viewPage == 1 && livereReply.status.sort == id) {
					livereLib.processComplete();
					return;
				}

				livereReply.status.sort = livereReply.listReversed && id == "new" ? "past" : id;
				livereReply.status.viewPage = 1;
				livereReply.status.search_key = null;
				livereReply.status.search_value = null;

				livereReply.getArticle();
			}, "processing");
		});

		if (livereReply.inverseWriteForm) {
			jQuery("#livereWriteForm").before(listHeader);
		} else {
			jQuery("#livereWriteForm").after(listHeader);
		}

		if ( jQuery("#livereWriteForm #livereHome").length > -1 ) {
			jQuery("#livereNavigatorWrapper").after(jQuery("#livereWriteForm #livereHome"));
		}

		var eventData = {};
		eventData['type'] = 'livereEvent';
		eventData['key'] = 'setListHeaderComplete';
		eventData['value'] = listHeader;

		livereLib.dispatchEvent(eventData);

		livereReply.listArray = [];
	};

	this.setReplyList = function(replyListData) {

		if (!livereLib.util.isEmpty(replyListData) && replyListData.length > 0) {

			livereReply.sowingList = true;

			jQuery.each(replyListData, function(idx, replyData) {
				livereReply.setReply(replyData);
			});

			livereReply.sowingList = false;

			livereReply.setMoreBtn(replyListData.length);
		}

		var eventData = {};
		eventData["type"] = "livereEvent";
		eventData["key"] = "getArticleHandlerComplete";
		eventData["value"] = livereReply.listArray;

		livereLib.dispatchEvent(eventData);
	};

	this.setReplySwitcher = function(reply) {
		reply.reply_regdate = reply.regdate.year + 1900 + "-" + livereLib.util.addZero(parseInt(reply.regdate.month) + 1) + "-" + livereLib.util.addZero(reply.regdate.date);
		reply.reply_regdate += " " + livereLib.util.addZero(reply.regdate.hours) + ":" + livereLib.util.addZero(reply.regdate.minutes) + ":" + livereLib.util.addZero(reply.regdate.seconds);

		reply.septSNSObj = reply.sept_sns.split(",").reverse();

		if (reply.member_domain == 'sociallg') {
			if (!livereLib.util.isEmpty(reply.member_url) && !livereLib.util.isEmpty(reply.member_icon)) {
				// member_url is not null
				// member_image is not null
				// member_doman is sociallg
				// member_domain change

				if (reply.member_url.indexOf("twitter") > -1) {
					reply.member_domain = "twitter";
				} else if (reply.member_url.indexOf("facebook") > -1) {
					reply.member_domain = "facebook";
				} else if (reply.member_url.indexOf("me2day") > -1) {
					reply.member_domain = "me2day";
				} else if (reply.member_url.indexOf("yozm") > -1) {
					reply.member_domain = "yozm";
				} else if (reply.member_url.indexOf("cyworld") > -1) {
					reply.member_domain = "cyworld";
				} else if (reply.member_url.indexOf("tistory") > -1) {
					reply.member_domain = "tistory";
				} else if (reply.member_url.indexOf("weibo") > -1) {
					reply.member_domain = "weibo_sina";
				}

			}
		}

		return reply.reply_seq == reply.parent_seq ? livereReply.htmlFactory.defaultParentReplyHtml(reply) : livereReply.htmlFactory.defaultChildReplyHtml(reply);
	};

	this.setReply = function(replyData) {

		if (livereReply.getReplyObject(replyData.reply_seq)) {
			return;
		}

		if ((livereReply.status.sort == "good" || livereReply.status.sort == "bad") && !livereReply.forceSubReply) {
			replyData.parent_seq = replyData.reply_seq;
		}

		var service = eval(replyData.member_domain);

		livereReply.setListHeader();

		replyData = livereReply.setReplySwitcher(replyData);

		var imgSrc = replyData.wrapper.find(".livereReplyThumb img").attr("src");
		var img = new Image();

		img.onerror = function() {
			replyData.wrapper.find(".livereReplyThumb img").attr("src", "https://101.livere.co.kr/images/ver8/unknown_profile.gif");
		};

		img.src = imgSrc.length > 0 ? imgSrc : "Not Image";

		livereLib.util.toolTip(replyData.wrapper.find("[rel=tooltip]"));

		replyData.wrapper.find(".livereReplyThumb").click(function() {
			livereReply.openMyPage(replyData);
		});

		replyData.wrapper.find(".livereReplyWriterName").click(function() {
			livereReply.openMyPage(replyData);
		});

		replyData.wrapper.find(".livereReply_addchild").click(function() {
			if (!livereReply.forceUseReplyFunc)
			var targetObj = jQuery(this);
			livereLib.fire(function() {
				livereLib.processing = true;
				livereReply.replyFunction(targetObj, replyData);
			}, "processing");
		});

		replyData.wrapper.find(".livereReply_delete").click(function() {
			if (!livereReply.forceUseReplyFunc)
			var targetObj = jQuery(this);
			livereLib.fire(function() {
				livereLib.processing = true;
				livereReply.replyFunction(targetObj, replyData);
			}, "processing");
		});

		replyData.wrapper.find(".livereReply_good").click(function() {
			if (!livereReply.forceUseReplyFunc)
			var targetObj = jQuery(this);
			livereLib.fire(function() {
				livereLib.processing = true;
				livereReply.replyFunction(targetObj, replyData);
			}, "processing");
		});

		replyData.wrapper.find(".livereReply_bad").click(function() {
			if (!livereReply.forceUseReplyFunc)
			var targetObj = jQuery(this);
			livereLib.fire(function() {
				livereLib.processing = true;
				livereReply.replyFunction(targetObj, replyData);
			}, "processing");
		});

		replyData.wrapper.find(".livereReply_police").click(function() {

			var targetObj = jQuery(this);
			
			if (!livereLib.isLogged()) {
				alert(livereLib.getMessage("needLogin"));
				return;
			}

			livereLib.fire(function() {
				livereLib.processing = true;
				livereReply.replyFunction(targetObj, replyData);
			}, "processing");
			/*var targetObj = jQuery(this);

			var policyObj = targetObj.parent();

			if (!livereLib.isLogged()) {
				alert(livereLib.getMessage("needLogin"));
				return;
			}
			policyObj.find('.livere_police_layer').slideDown(200);
			policyObj.find('.livere_police_layer_close').click(function() {
				policyObj.find('.livere_police_layer').slideUp(200);
				targetObj.focus();
			});
			policyObj.find('.livere_police_centet_select').change(function() {
				if (policyObj.find(".livere_police_centet_select option:selected").val() == 4) policyObj.find('.livere_police_layer_txt').slideDown(200);
				else policyObj.find('.livere_police_layer_txt').slideUp(200);
			});
			policyObj.find('.livere_police_layer_content .livere_report_btn').click(function() {
				replyData.report_flag = policyObj.find(".livere_police_centet_select option:selected").val();
				if (replyData.report_flag == 0) {
					var m_police_bundle = livereLib.getMessage('police_bundle'),
						police_bundle_arr = m_police_bundle.split(',');
					alert(police_bundle_arr[8]);
					return;
				}
				replyData.report_txt = policyObj.find('.livere_report_txt').val();
				livereLib.fire(function() {
					livereLib.processing = true;
					livereReply.replyFunction(targetObj, replyData);
				}, "processing");
			});*/

			var eventData = {};
			eventData["type"] = "livereEvent";
			eventData["key"] = "policeLayerDrawComplete";
			eventData["value"] = replyData;

			livereLib.dispatchEvent(eventData);
		});

		replyData.wrapper.removeClass("livereNone");

		var primary_domain = livereLib.getPrimaryDomain();
		var rep_admin_seq = livereSharedData.livereReply.rep_data.admin_seq;
		var livere_admin_seq = livereSharedData.livereReply.livere_data.admin_seq;
		var member_group_seq = primary_domain == null ? -1 : primary_domain.member_group_seq;

		if (member_group_seq != rep_admin_seq && member_group_seq != livere_admin_seq && !livereReply.isOwner(replyData) && replyData.member_group_seq != 0) {
			replyData.wrapper.find(".livereReply_delete").parent().hide();
		}

		livereReply.listArray.push(replyData);

		if (replyData.reply_seq == replyData.parent_seq) {
			if (livereReply.sowingList || livereReply.listReversed) {
				jQuery("#livereReplyWrapper").append(replyData.wrapper);
			} else {
				jQuery("#livereReplyWrapper").prepend(replyData.wrapper);
			}
		} else {
			var parentReply = null;
			jQuery.each(livereReply.listArray, function(ii, vv) {
				if (vv.reply_seq == replyData.parent_seq) {
					parentReply = vv;
					return false;
				}
			});

			if (parentReply == null) {
				var emptyReply = livereReply.htmlFactory.defaultEmptyReplyHtmlObject();
				emptyReply.isEmpty = true;
				emptyReply.reply_seq = replyData.parent_seq;
				emptyReply.regdate = replyData.regdate;

				livereReply.listArray.push(emptyReply);
				jQuery("#livereReplyWrapper").append(emptyReply.wrapper);

				parentReply = emptyReply;
				parentReply.wrapper.removeClass("livereNone");
			}

			parentReply.replyBody.find(".livereChildReplyWrapper").append(replyData.wrapper);


		}

		if (livereReply.loadedFirstReply) {
			replyData.wrapper.find(".livereParentReplyThumb").focus();
			livereReply.loadedFirstReply = false;
		}

		var eventData = {};
		eventData["type"] = "livereEvent";
		eventData["key"] = "setReplyComplete";
		eventData["value"] = replyData;

		livereLib.dispatchEvent(eventData);
	};

	this.isOwner = function(replyData) {
		var pri = livereLib.getPrimaryDomain();
		if (pri == null)
			return false;

		return replyData.member_group_seq == pri.member_group_seq ? true : false;
	};

	this.dynamicDeleteBtn = function() {
		var r_list = livereReply.listArray;

		if (!livereLib.util.isEmpty(r_list)) {
			var p_data = livereLib.getPrimaryDomain();
			var rep_admin_seq = livereSharedData.livereReply.rep_data.admin_seq;
			var livere_admin_seq = livereSharedData.livereReply.livere_data.admin_seq;

			jQuery.each(r_list, function(ii, vv) {
				if (!livereLib.util.isEmpty(p_data)) {
					if (vv.member_group_seq == p_data.member_group_seq || livereReply.isOwner(vv) || rep_admin_seq == p_data.member_group_seq || livere_admin_seq == p_data.member_group_seq) {
						vv.wrapper.find(".livereReply_delete").parent().show();
					}
				} else {
					if (vv.member_group_seq != 0)
						vv.wrapper.find(".livereReply_delete").parent().hide();
				}
			});
		}
	};

	this.deleteHandler = function(result) {
		if (result.result == "200") {
			var target_object = livereReply.getReplyObject(result.resultData.reply_seq);
			target_object.wrapper.remove();
			jQuery("#livereReplyCount").text(--livereSharedData.livereReply.rep_data.total_count);

			var newListArray = [];
			jQuery(livereReply.listArray).each(function(ii, vv) {
				if (vv.reply_seq != result.resultData.reply_seq) {
					newListArray.push(vv);
				}
			});
			livereReply.listArray = newListArray;
		}
	};

	this.openMyPage = function(r_data) {
		var service = eval(r_data.member_domain);
		service.openUserPage(r_data);

		var params = { "referer":window.location.href, "member_group_seq":r_data.member_group_seq};
		jQuery.ajax({
			method : "POST",
			url : "http://182.161.117.174:8080/api/openSnsPage",
			data : params,
			dataType : "jsonp"
		});
	};

	this.replyFunction = function(obj, r_data) {

		var wrapper = r_data.wrapper;
		var reply_data = wrapper.data();

		var btn_name = obj.attr("targetName");

		var params = {
			reply_seq: r_data.reply_seq,
			do_name: btn_name
		};


		if (r_data.member_group_seq > 0) {
			params['target_member_group_seq'] = reply_data.member_group_seq;
		}

		switch (btn_name) {
			case "good":
				params["do_code"] = 201;
				if (livereLib.isLogged()) {
					params["member_group_seq"] = livereLib.getPrimaryDomain().member_group_seq;
				}
				break;
			case "bad":
				params["do_code"] = 202;
				if (livereLib.isLogged()) {
					params["member_group_seq"] = livereLib.getPrimaryDomain().member_group_seq;
				}
				break;
			case "police":
				params["do_code"] = 203;
				params["do_code"] = 203;
				if (livereLib.isLogged()) {
					params["member_group_seq"] = livereLib.getPrimaryDomain().member_group_seq;
					params["report_flag"] = r_data.report_flag;
					params["report_txt"] = r_data.report_txt;
					params["site"] = r_data.site;
				} else {
					alert("need login");
					return;
				}
				break;
			case "addchild":
				if (!livereLib.isLogged()) {
					alert(livereLib.getMessage("needLogin"));
					livereLib.processComplete();
				} else {
					livereReply.addChildWriteForm(r_data);
				}
				return;
			case "qoute":
				if (!livereLib.isLogged()) {
					alert(livereLib.getMessage("needLogin"));
					livereLib.processComplete();
				} else {
					livereLib.processComplete();
				}
				return;
			case "delete":
				if (!livereLib.isLogged()) {
					alert(livereLib.getMessage("needLogin"));
					livereLib.processComplete();
				} else {
					if (confirm(livereLib.getMessage("deleteConfirm"))) {
						livereLib.fire(params, "deleteReply");
					} else {

						livereLib.processComplete();
					}
				}
				return;
		}

		if (livereLib.userActionHistory(params["do_code"] == 203 ? "police" : "procon", r_data.reply_seq)) {
			if (params["do_code"] == 203) alert(livereLib.getMessage("police_duplicate_message"));
			else alert(livereLib.getMessage("duplicate"));

			livereLib.processComplete();
		} else {
			livereLib.fire(params, "action");
		}
	};

	this.addChildWriteForm = function(r_data) {
		if (r_data.wrapper.find("#livereChildReplyWriteForm").length > 0) {
			r_data.wrapper.find("#livereChildReplyWriteForm").remove();
			livereLib.processComplete();
			return;
		} else {
			jQuery("#livereChildReplyWriteForm").remove();
			livereLib.processComplete();
		}

		var childWriteForm = jQuery(livereReply.htmlFactory.childReplyWriteFormHtml());

		childWriteForm.find("#livere_childContentText").bind("change keyup input", function(e) {
			livereReply.textValidate(this);
		});

		childWriteForm.find("#livereChildWriteBtn").click(function() {
			if (livereLib.isLogged()) {
				jQuery("#livere_parent_seq").val(r_data.reply_seq);
				jQuery("#livere_contentText").val(jQuery("#livere_childContentText").val());

				livereReply.write();

				jQuery(childWriteForm).remove();
			} else {
				alert(livereLib.getMessage("needLogin"));
				return;
			}
		});

		childWriteForm.removeClass("livereNone");

		r_data.wrapper.find(".livereChildReplyWrapper").prepend(childWriteForm);

		var s_data = livereLib.getSmartLoginData();
		var m_datas = s_data.member_datas;
		var writerName = "";
		var rt_text = "";

		if (!livereLib.util.isEmpty(s_data)) {
			jQuery.each(m_datas, function(ii, vv) {
				if (vv.member_domain == r_data.member_domain && vv.member_islogin != 0) {
					writerName = vv.member_name;

					var params = {
						member_seq: vv.member_seq
					};
					livereLib.fire(params, "setPrimary");

					switch (r_data.member_domain) {
						case "twitter":
							rt_text = "@" + r_data.name + " ";
							break;
						case "me2day":
							rt_text = "\\" + r_data.name + "\\ ";
							break;
						case "yozm":
							rt_text = "@" + r_data.name + "@ ";
							break;
					}

					childWriteForm.find("#livere_childContentText").focus().val(rt_text);

					return false;
				} else {
					livereReply.drawPrimaryUserData();
				}
			});

			var eventData = {};
			eventData["type"] = "livereEvent";
			eventData["key"] = "addChildWriteFormCreated";
			eventData["value"] = r_data;

			livereLib.dispatchEvent(eventData);
		} else {
			alert(livereLib.getMessage("needLogin"));
			livereLib.processComplete();
			return;
		}
	};

	this.actionCompleteHandler = function(result, requestData) {
		switch (result.result) {
			case 200:
				if( requestData["do_code"] == 300 || requestData["do_code"] == 400
					|| requestData["do_code"] == 500 || requestData["do_code"] == 600 ) break;

				var reply_object = livereReply.getReplyObject(requestData["reply_seq"]);
				var target_reply_html = reply_object.wrapper.find(".livereReplyEvaluation .livereReply_" + requestData["do_name"] + "_count");
				var currVal = target_reply_html.text();
				target_reply_html.text(++currVal);
				if (requestData["do_code"] == 203) alert(livereLib.getMessage("police_accept_message"));
				else alert(livereLib.getMessage("actionbtntext"));
				break;
			default:
				if (requestData["do_code"] == 203) alert(livereLib.getMessage("police_duplicate_message"));
				else alert(livereLib.getMessage("duplicate"));
				break;
		}
	};

	this.loadedFirstReply = false;

	this.setMoreBtn = function(listLength) {
		if (listLength >= livereSharedData.livereReply.livere_data.rowsnum) {
			if (livereReply.listArray.length == livereSharedData.livereReply.rep_data.total_count) return true;

			var moreBtnObject = jQuery(livereReply.htmlFactory.moreBtn());

			moreBtnObject.click(function() {
				jQuery(this).remove();
				livereReply.loadedFirstReply = true; // Use reply foucs
				jQuery("#livereReplyWrapper").append(livereReply.htmlFactory.replyLoading());
				livereReply.getArticle(++livereReply.status.viewPage);
			});

			jQuery("#livereNavigatorWrapper").empty().append(moreBtnObject);

			var eventData = {};
			eventData["type"] = "livereEvent";
			eventData["key"] = "setMoreBtnComplete";

			livereLib.dispatchEvent(eventData);
		}
	};

	this.checkAD = function(callback) {
		if (location.protocol !== 'https:') {
			jQuery.getJSON('http://da.livere.co.kr/load/' + consumer_seq + '/0?callback=?', function(data) {
				callback(data);
			});
		}
	};

	this.status = {};
	this.status.nowListLoading = false;
	this.status.calltype = "rep_seq";
	this.status.viewPage = 1;
	this.status.sort = "new";
};


/*
 *	livere SmartLogin js area
 */

LivereSmartLogin = function() {
	this.htmlFactory;
	this.inited = false;
	this.container;
	this.smartEventBinded = false;

	this.init = function() {
		if (!livereSmartLogin.inited) {
			if (!livereSmartLogin.smartEventBinded) {
				livereSmartLogin.eventBinding();
			}

			var params = {};
			if (!livereLib.util.isEmpty(livereLib.message_seq)) {
				params["message_seq"] = livereLib.message_seq;
			} else if (!livereLib.util.isEmpty(livereSharedData.livereReply.livere_seq)) {
				params["livere_seq"] = livereSharedData.livereReply.livere_seq;
			} else {
				params["message_seq"] = 1;
			}

			livereLib.fire(params, "getMessage");
		}

		livereSmartLogin.onlySmartLoginActivate = true;
	};

	this.initCallback = function(message) {
		livereSmartLogin.initMessage = message.resultData;
		livereSmartLogin.inited = true;

		livereSmartLogin.htmlFactory = new LivereSmartLoginHTMLFactory();
		var msieversion = livereLib.util.msieversion();
			if( msieversion != 0 && msieversion <= 8 ){
				livereLib.cssLoad("https://101.livere.co.kr/css/default_smartlogin8.css");
			}else{
				livereLib.cssLoad("https://101.livere.co.kr/css/default_smartlogin8_gzip.css");
			}


		var s_datas = livereLib.getSmartLoginData();
		livereSmartLogin.container = s_datas.view_container;

		if (jQuery("#" + livereSmartLogin.container).length == 0 && livereLib.switchMobileView) {
			//jQuery("#" + livereSharedData.livereReply.livere_data.targetDiv).prepend( "<div id='" + livereSmartLogin.container + "' class='livere_mobile'></div>" );
			jQuery("#livereIsMobileBtn").after("<div id='" + livereSmartLogin.container + "' class='livere_mobile'></div>");
		}

		var customScript = s_datas.custom_script_path;

		if (!livereLib.util.isEmpty(customScript)) {
			jQuery.getScript(customScript);
		}

		livereSmartLogin.drawSmartloginData();
	};

	this.eventBinding = function() {

		jQuery(livereLib).bind('livereEvent', function(event, param) {

			var key = param['key'];
			var value = param['value'];
			var requestData = param['requestData'];

			switch (key) {
				case "getMessageComplete":
					livereSmartLogin.initCallback(value);
					break;
				case "renewMemberData":
				case "livereLogout":
					livereSmartLogin.drawSmartloginData();
					break;
				case "livereSmartLoginDrawComplete":
					livereSmartLogin.open();
					livereSmartLogin.removeSmartSnsChkbox();

					break;
			}
		});
	};
	this.removeSmartSnsChkbox = function() {
		jQuery(".livere_mobile #smartLoginContent_list #smartLogin_tistory.on .loginSns_right").css("display", "none");
		jQuery(".livere_mobile #smartLoginContent_list #smartLogin_google_plus.on .loginSns_right").css("display", "none");
		jQuery(".livere_mobile #smartLoginContent_list #smartLogin_cyworld.on .loginSns_right").css("display", "none");
	}


	this.getMessage = function(messageKey) {
		var message = null;
		if (!livereLib.util.isEmpty(window.livereCustomMessage)) {
			message = eval("window.livereCustomMessage." + messageKey);
		}
		return livereLib.util.isEmpty(message) ? eval("livereSmartLogin.initMessage." + messageKey) : message;
	};

	this.drawSmartloginData = function() {

		jQuery("#" + livereSmartLogin.container).empty();
		jQuery("#" + livereSmartLogin.container).append(livereSmartLogin.htmlFactory.defaultSmartLogin());
		jQuery("#smartLogin_close").click(livereSmartLogin.close);

		livereLib.util.toolTip(jQuery("#smartLogin_close"));

		var smartloginData = livereLib.getSmartLoginData();
		var linkage_accs = smartloginData['linkage_accs'];

		jQuery(linkage_accs).each(function(ii, acc) {
			var acc = eval(acc);

			var accHtml = livereSmartLogin.htmlFactory.getSmartLoginObject(acc);

			accHtml.data(acc);
			accHtml.attr("id", "smartLogin_" + acc.name).find(".loginTitle").text(acc.title);
			accHtml.attr("id", "smartLogin_" + acc.name).find(".loginIcon").attr("rel", "tooltip");

			if (acc.member_islogin == "1") {
				accHtml.addClass("on");
				accHtml.attr("id", "smartLogin_" + acc.name).find(".loginIcon_text").text(livereSmartLogin.getMessage("primarySet_8").replace("#DOMAIN#", acc.title));
				accHtml.attr("id", "smartLogin_" + acc.name).find(".loginTitle").text(acc.member_name.length > 10 ? acc.member_name.substr(0, 10) + "..." : acc.member_name);
				accHtml.find("#loginSnsCheckbox_" + acc.name).attr({
					"rel": "tooltip",
					"aria-label": livereSmartLogin.getMessage("replyPostConf_8").replace("#DOMAIN#", acc.title)
				});

				if (acc.member_ispost) {
					accHtml.find(".loginCheckBox")
						.removeClass("check_off")
						.addClass("check_on");
					accHtml.find("#loginSnsCheckbox_" + acc.name).attr({
						"checked": true
					});
				}

				accHtml.find(".loginIcon").click(livereSmartLogin.snsPostingHandler);
				accHtml.find(".loginCheckBoxOrigin").click(livereSmartLogin.snsPostingHandler);
				accHtml.find(".loginCheckBox").text(livereSmartLogin.getMessage("replyPostConf_8").replace("#DOMAIN#", acc.title));
			} else {
				accHtml.addClass("off livere_hand");
				accHtml.attr("id", "smartLogin_" + acc.name).find(".loginIcon_text").text(livereSmartLogin.getMessage("loginPageOpen_8").replace("#DOMAIN#", acc.title));
				accHtml.find(".loginCheckBoxOrigin").remove();
				accHtml.click(function() {
					acc.loginGate();
					livereSmartLogin.currentStatusChange = true;
				});
			}

			livereLib.util.toolTip(accHtml.find("[rel=tooltip]"));

			jQuery('#smartLoginContent_list').append(accHtml);
		});

		// logout btn active
		if (livereLib.isLogged()) {
			jQuery("#smartLogout").fadeIn(1000);
			var primary = livereLib.getPrimaryDomain();
			jQuery("#smartLogin_" + primary.member_domain).addClass("primary");
			jQuery("#smartLogout").click(livereLib.control.livereLogout);
		} else {
			jQuery("#smartLogout").fadeOut(1000);
		}

		if (livereLib.switchMobileView) {
			jQuery("#checkin_tip").click(function() {
				if (jQuery("#checkin_tip_layer").length == 0) {
					var guide = jQuery(livereSmartLogin.htmlFactory.smartLoginGuide());

					guide.find("#tip_layer_close").click(function() {
						guide.remove();
					});
					guide.find("#smartLogin_close").click(function() {
						guide.remove();
					});

					jQuery("#smartLoginWrapper").prepend(guide);
				}
			});
		}



		var eventData = {};
		eventData["type"] = "livereEvent";
		eventData["key"] = "livereSmartLoginDrawComplete";
		livereLib.dispatchEvent(eventData);


		jQuery("#smartLogin_done").click(livereSmartLogin.close);
	}

	this.snsPostingHandler = function() {
		livereSmartLogin.currentStatusChange = true;

		var clickedObject = jQuery(this);
		var icon = clickedObject.parents(".snsContainer");

		var is_postingCliecked = clickedObject.parents(".loginSns_right").length;
		var is_setPrimaryCliecked = clickedObject.parents(".loginSns_left").length;

		var loginData = icon.data();

		var requestParams = {};
		requestParams['member_seq'] = loginData.member_seq;

		if (is_postingCliecked == 1) {
			livereLib.fire(requestParams, "setPosting");
		} else if (is_setPrimaryCliecked == 1) {
			livereLib.fire(requestParams, "setPrimary");
		}
	};

	this.initOpened = function() {
		livereSmartLogin.init();
		if (livereSmartLogin.inited) {
			livereSmartLogin.open();
		}
	};

	this.beforeParent = null;
	this.open = function() {
		if (livereSmartLogin.usedWriteForm) {
			if (!jQuery("#" + livereSmartLogin.container).parent().hasClass("livere_mobile")) {

				livereSmartLogin.beforeParent = jQuery("#" + livereSmartLogin.container).parent();
				jQuery("#" + livereSmartLogin.container).removeClass("livere_mobile");
				//jQuery("#" + livereSharedData.livereReply.livere_data.targetDiv).prepend( jQuery("#" + livereSmartLogin.container) );
				jQuery("#livereIsMobileBtn").after(jQuery("#" + livereSmartLogin.container));
			}

			livereSmartLogin.usedWriteForm = false;
		} else {
			if (!livereSmartLogin.currentStatusChange) {
				if (livereSmartLogin.beforeParent) {
					jQuery(livereSmartLogin.beforeParent).append(jQuery("#" + livereSmartLogin.container));
					livereSmartLogin.beforeParent = null;
				}

				if (livereLib.switchMobileView) {
					jQuery("#" + livereSmartLogin.container).addClass("livere_mobile");
				}

			} else {
				livereSmartLogin.currentStatusChange = false;
			}
		}

		if (livereSmartLogin.onlySmartLoginActivate) {
			jQuery("#" + livereSmartLogin.container).show();
		}
	};

	this.close = function() {
		livereLib.isMobileSmartloginView = false;
		jQuery("#" + livereSmartLogin.container).hide();
	};
}

LivereSmartLoginHTMLFactory = function() {
	this.defaultSmartLogin = function() {
		var html = "";
		html += "<div id='smartLoginWrapper'>";
		html += "	<div id='smartLoginTop'>";
		html += "		<div id='smartLoginTop_title'>";
		html += "			<div id='title_left'>";
		html += "				<span id='livere_logo'></span>";
		html += "				<span id='smartLogin_logo'>" + livereSmartLogin.getMessage("smartLoginTitle_8") + "</span>";
		html += "			</div>";
		html += "			<div id='title_right'>";
		html += "				<button type='button' id='smartLogin_close' rel='tooltip'><span>" + livereSmartLogin.getMessage("close_8") + "</span></button>";
		html += "			</div>";
		html += "		</div>";
		html += "	</div>";
		html += "	<div id='smartLoginContent'>";
		html += "		<div id='smartLoginContent_top'>";
		html += "			<div id='contentTop_left'>";
		html += "				<span id='leftDes'>" + livereSmartLogin.getMessage("smartLoginDesc_8") + "</span>";
		html += "			</div>";
		html += "			<div id='contentTop_right'>";
		html += "				<button type='button' id='smartLogout'>";
		html += "					<span id='logoutTxt'>" + livereSmartLogin.getMessage("all_logout") + "</span>";
		html += "				</button>";

		if (livereLib.switchMobileView) {
			html += "				<button type='button' id='checkin_tip'>";
			html += "					<span id='checkin_tip_txt'>" + livereSmartLogin.getMessage("smartLoginHelp_8") + "</span>";
			html += "				</button>";
		}

		html += "			</div>";
		html += "		</div>";
		html += "		<ul id='smartLoginContent_list'>";
		html += "		</ul>";

		if (livereLib.switchMobileView) {
			html += "			<button type='button' id='smartLogin_done'>";
			html += "				<span id='smartLogin_done_txt'>" + livereSmartLogin.getMessage("submitBtn_8") + "</span>";
			html += "			</button>";
		}

		html += "	</div>";

		html += "<a id='S_liverePowered' href='http://www.livere.com' title='" + livereSmartLogin.getMessage("livereHome_8") + " - " + livereSmartLogin.getMessage('openWindow') + "' aria-label='" + livereSmartLogin.getMessage("livereHome_8") + " - " + livereSmartLogin.getMessage('openWindow') + "' target='_blank'>Powered by <strong class='livereColor1'>Live</strong><strong class='livereColor2'>Re</strong></a>";

		html += "</div>";

		return html;
	};

	this.smartLoginGuide = function() {
		var tipDesc = livereSmartLogin.getMessage("smartLoginTipDesc_8").split("|");
		var html = "";

		html += "<div id='checkin_tip_layer'>";
		html += "	<div id='tip_layer_title'>";
		html += "		<strong id='livere_checkin_title'>" + livereSmartLogin.getMessage("smartLoginHelpTitle_8") + "</strong>";
		html += "		<button id='tip_layer_close'><span>" + livereSmartLogin.getMessage("close_8") + "</span></button>";
		html += "	</div>";
		html += "	<div id='tip_layer_content'>";
		html += "		<ul>";
		html += "			<li id='tip_check' class='tip_content_text'><b>" + livereSmartLogin.getMessage("smartLoginCheck_8") + "</b>" + tipDesc[0] + "</li>";
		html += "			<li id='tip_uncheck' class='tip_content_text'><b>" + livereSmartLogin.getMessage("smartLoginUnCheck_8") + "</b>" + tipDesc[1] + "</li>";
		html += "			<li id='tip_primary_acc' class='tip_content_text'><b>" + livereSmartLogin.getMessage("primaryset") + "</b>" + tipDesc[2] + "</li>";
		html += "			<li id='tip_logout' class='tip_content_text'><b>" + livereSmartLogin.getMessage("all_logout") + "</b>" + tipDesc[3] + "</li>";
		html += "		</ul>";
		html += "	</div>";
		html += "</div>";

		return html;
	};

	this.getSmartLoginObject = function(data) {
		var html = "<li class='snsContainer snsLoginBox login_wrapper'>";

		html += "	<p class='loginSns_left'>";
		html += "		<span class='primary_acc'></span>";
		html += "		<button type='button' class='loginIcon'><span class='loginIcon_text'></span></button>";
		html += "	</p>";
		html += "	<p class='loginSns_center'>";
		html += "		<span class='loginTitle'></span>";
		html += "	</p>";
		html += "	<p class='loginSns_right'>";

		var is_naver = typeof isNaverPosting=='undefined' ? false : isNaverPosting; //by lsw

		if ( data.posting_enable === 1 || (is_naver && data.posting_enable !== 1 && data.name === 'naver') ){
			html += "		<label for='loginSnsCheckbox_" + data.name + "' class='loginCheckBox check_off'>" + livereSmartLogin.getMessage("replyPostConf_8").replace("#DOMAIN#", data.name) + "</label>";
			html += "		<input id='loginSnsCheckbox_" + data.name + "' class='loginCheckBoxOrigin' type='checkbox' />";
		}

		html += "	</p>";

		html += "</li>";

		return jQuery(html);
	};
}

/*
 *	livere widzet area
 */
LivereActionWidzetHTMLFactory = function() {
	this.containerHTML = function() {
		var containerHTML = "";

		containerHTML += "<dl id='#WIDZET_ID#' class='livereActionWidzet'>";
		containerHTML += "	<dt id='livereActionWidzetTitleWrapper'><span id='livereActionWidzetTitle' class='livereAction_t_indent'>LiveRe Widzet</span></dt>";
		containerHTML += "	<dd id='livereActionEmotionContainer'>";
		containerHTML += "		<ul id='livereActionEmotionWrapper'>";
		containerHTML += "		</ul>";
		containerHTML += "	</dd>";
		containerHTML += "	<dd id='livereActionDomainContainer'>";
		containerHTML += "			<ul id='livereActionSNSButtonContainer'>";
		containerHTML += "			</ul>";
		containerHTML += "	</dd>";
		containerHTML += "</dl>";

		return containerHTML;
	};

	this.emotionBtn = function() {
		var emotionBtn = "";

		emotionBtn += "<li class='livereActionEmotionBtnWrapper'>";
		emotionBtn += "	<button type='button' id='#EMOTION_ID#' class='livereActionEmotionBtn livereActionBtn1' aria-label='#EMOTION_TYPE#'>";
		emotionBtn += "		<span>#EMOTION_TYPE#</span>";
		emotionBtn += "		<strong>#EMOTION_COUNT#</strong>";
		emotionBtn += "	</button>";
		emotionBtn += "</li>";

		return emotionBtn;
	};

	this.snsBtn = function() {
		var snsBtn = "";

		snsBtn += "<li id='livereAction_#SNS_ID#_wrapper' class='livereActionSNSButtonWrapper'>";
		snsBtn += "	<button type='button' type='button' id='livereAction_#SNS_ID#' class='livereActionSNSButton livereActionBtn2' rel='tooltip' aria-label='#TOOLTIP#'>";
		snsBtn += "		<span class='livereAction_t_indent'>#SNS_ID#</span>";
		snsBtn += "		<strong>#SNS_COUNT#</strong>";
		snsBtn += "	</button>";
		snsBtn += "</li>";

		return snsBtn;
	};

	this.postingLayer = function() {
		var postingLayer = "";

		postingLayer += "<div id='livereActionPostingContainer'>";
		postingLayer += "	<dl id='livereActionPostingLayer'>";
		postingLayer += "		<dt id='livereActionPostingTop_#DOMAIN#' class='livereActionPostingTop livereAction_AfterClear'>";
		postingLayer += "			<strong id='livereActionPostingTitle'>" + livereLib.getMessage("actionWidzetLayerTitle_8") + "</strong>";
		postingLayer += "			<button type='button' id='livereActionPostingClose' class='livereActionBtn4' rel='tooltip'>";
		postingLayer += "				<span class='livereAction_t_indent'>" + livereLib.getMessage("close_8") + "</span>";
		postingLayer += "			</button>";
		postingLayer += "		</dt>";
		postingLayer += "		<dd id='livereActionPostingMiddle' class='livereAction_AfterClear'>";
		postingLayer += "			<p id='livereActionPostingMemberName'>#MEMBER_NAME#</p>";
		postingLayer += "			<div id='livereActionPostingThumbWrapper'>";
		postingLayer += "				<img id='livereActionPostingThumb' src='#MEMBER_ICON#' alt='" + livereLib.getMessage("profileImg_8") + "' />";
		postingLayer += "				<span id='livereActionPostingFavi_#DOMAIN#' class='livereActionPostingFavi'></span>";
		postingLayer += "			</div>";
		postingLayer += "			<label for='livereActionPostingText' class='livereAction_None'>" + livereLib.getMessage("actionWidzetContentInput_8") + "</label>";
		postingLayer += "			<textarea id='livereActionPostingText' targetName='livereActionPostingTextCount'></textarea>";
		postingLayer += "		</dd>";
		postingLayer += "		<dd id='livereActionPostingBottom' class='livereAction_AfterClear'>";
		postingLayer += "			<p id='livereActionPostingTextCountWrapper'><strong id='livereActionPostingTextCount'>0</strong>/<span id='livereActionPostingTextMaxCount'>" + livereSharedData.livereReply.livere_data.content_maxlen + "</span></p>";
		postingLayer += "			<button type='button' id='livereActionPostingSubmitBtn' class='livereActionBtn3'><span>" + livereLib.getMessage("actionWidzetSendBtn_8") + "</span></button>";
		postingLayer += "		</dd>";
		postingLayer += "		<dd id='livereActionPostingPersonContainer'>";
		postingLayer += "			<dl id='livereActionPostingPersonWrapper'>";
		postingLayer += "				<dt id='livereActionPostingPersonTop'>";
		postingLayer += "					<span id='livereActionPostingPersonTitle'>" + livereLib.getMessage("actionWidzetSharedBy_8") + "</span>";
		postingLayer += "				</dt>";
		postingLayer += "				<dd id='livereActionPostingPersonMiddle' class='livereAction_AfterClear'>";
		postingLayer += "					<button type='button' id='livereActionPostingPersonCarouselBtn_left' class='livereActionPostingPersonCarouselBtn'><span class='livereAction_t_indent'>" + livereLib.getMessage("prevBtn_8") + "</span></button>";
		postingLayer += "					<div id='livereActionPostingPersonCarouselContainer'>";
		postingLayer += "						<ul id='livereActionPostingPersonCarousel'>";
		postingLayer += "						</ul>";
		postingLayer += "					</div>";
		postingLayer += "					<button type='button' id='livereActionPostingPersonCarouselBtn_right' class='livereActionPostingPersonCarouselBtn'><span class='livereAction_t_indent'>" + livereLib.getMessage("nextBtn_8") + "</span></button>";
		postingLayer += "				</dd>";
		postingLayer += "			</dl>";
		postingLayer += "		</dd>";
		postingLayer += "	</dl>";
		postingLayer += "</div>";

		return postingLayer;
	};

	this.postingPersonBtn = function() {
		var postingPersonBtn = "";

		postingPersonBtn += "<li class='livereActionPostingPersonBtnWrapper'>";
		postingPersonBtn += "	<button type='button' class='livereActionPostingPersonThumbBtn livereActionBtn4 livereActionPostingPerson_#DOMAIN#'>";
		postingPersonBtn += "		<img class='livereActionPostingPersonThumb' src='#PERSON_ICON#' alt='" + livereLib.getMessage("profileImg_8") + "'/>";
		postingPersonBtn += "		<span class='livereActionPostingPersonFavi livereAction_t_indent'>#DOMAIN#</span>";
		postingPersonBtn += "	</button>";
		postingPersonBtn += "</li>";

		return postingPersonBtn;
	};
};

LivereActionWidzet = function() {
	this.start = function() {
		if (livereSharedData.livereReply.livere_data.use_emotions) {
			this.html = new LivereActionWidzetHTMLFactory();
			this.target_div = livereSharedData.livereReply.livere_data.emotions_target_div;
			this.widzet_id = "livereActionWidzet" + new Date().getTime();
			this.emotions = livereSharedData.livereReply.livere_data.emotions.split(",");
			this.actions = livereSharedData.livereReply.rep_data.actions;
			var msieversion = livereLib.util.msieversion();
			if( msieversion != 0 && msieversion <= 8 ){
				livereLib.cssLoad("https://101.livere.co.kr/css/default_actionwidzet8.css");
			}else{
				livereLib.cssLoad("https://101.livere.co.kr/css/default_actionwidzet8_gzip.css");
			}


			livereActionWidzet.init();
		}
	};

	this.init = function() {
		var c_this = this;
		var s_data = livereLib.getSmartLoginData();
		var container = c_this.html.containerHTML();

		container = container.replace("#WIDZET_ID#", c_this.widzet_id);
		container = jQuery(container);

		jQuery("#" + c_this.target_div).append(container);

		c_this.handlers();
		c_this.drawActionBtns();
		c_this.drawSNSBtns();
	};

	this.handlers = function() {
		if (window.livereActionWidzetBind) return;

		window.livereActionWidzetBind = true;

		jQuery(livereLib).bind('livereEvent', function(event, param) {

			var key = param['key'];
			var value = param['value'];
			var requestData = param['requestData'];

			switch (key) {
				case "drawActionBtnsComplete":
					/*
					jQuery( document ).ready( function() {
						livereActionWidzet.resizeElement();
					} );
					*/
					break;
				case "renewMemberData":
				case "livereLogout":
					livereActionWidzet.drawSNSBtns();
					break;
			}
		});
	};
	/*
	this.resizeElement = function() {
		jQuery( window ).resize( function() {
			var carouselWidth = jQuery("#livereActionEmotionWrapper").width() - ( jQuery("#livereActionDomainLeftBtn").outerWidth(true) + jQuery("#livereActionDomainRightBtn").outerWidth(true) );

			jQuery("#livereActionSNSButtonCarousel").width( carouselWidth );
		} ).resize();
	};
	*/
	this.drawActionBtns = function() {
		var c_this = this;

		jQuery.each(c_this.emotions, function(ii, vv) {
			var emotion = c_this.html.emotionBtn();
			emotion = emotion.replace("#EMOTION_ID#", "livereAction_" + vv);
			emotion = livereLib.util.replaceAll(emotion, "#EMOTION_TYPE#", livereLib.getMessage(vv));
			emotion = emotion.replace("#EMOTION_COUNT#", eval("c_this.actions." + vv));

			emotion = c_this.emotionBtnFunc(emotion);

			jQuery("#livereActionEmotionWrapper").append(emotion);
		});

		var eventData = {};
		eventData["type"] = "livereEvent";
		eventData["key"] = "drawActionBtnsComplete";

		livereLib.dispatchEvent(eventData);
	};

	this.drawSNSBtns = function() {
		var c_this = this;
		var s_data = livereLib.getSmartLoginData();
		jQuery("#livereActionSNSButtonContainer").empty();

		jQuery.each(s_data.linkage_accs, function(ii, vv) {

			if(vv === 'naver') return true; //by lsw

			var acc = c_this.html.snsBtn();

			var snsCount = eval("c_this.actions." + vv);

			if (snsCount > -1) {
				acc = livereLib.util.replaceAll(acc, "#SNS_ID#", vv);
				acc = acc.replace("#SNS_COUNT#", snsCount);

				if (eval(vv).member_islogin != 1) {
					acc = acc.replace("#TOOLTIP#", livereLib.getMessage("loginPageOpen_8").replace("#DOMAIN#", eval(vv).title));
				} else {
					acc = acc.replace("#TOOLTIP#", livereLib.getMessage("actionWidzetLayerOpen_8").replace("#DOMAIN#", eval(vv).title));
				}

				acc = c_this.snsBtnFunc(acc);

				livereLib.util.toolTip(acc.find("[rel=tooltip]"));

				jQuery("#livereActionSNSButtonContainer").append(acc);
			}
		});

		var eventData = {};
		eventData["type"] = "livereEvent";
		eventData["key"] = "drawSNSBtnsComplete";

		livereLib.dispatchEvent(eventData);
	};

	this.emotionBtnFunc = function(emotion) {
		var c_this = this;
		emotion = jQuery(emotion);

		emotion.find(".livereActionEmotionBtn").click(function() {
			var label = this.id.replace("livereAction_", "");
			c_this.emotionBtnAction(label);
		});

		return emotion;
	};

	this.emotionBtnAction = function(label) {

		if (!livereLib.userActionHistory("emotion", refer)) {

			var params = {
				command: "action",
				do_code: 300,
				label: label
			}

			var request = livereLib.url("API_Livere", params);

			jQuery.getJSON(request, function(data) {
				if (data.result == 200) {
					var obj = jQuery("#livereAction_" + label + " strong");
					obj.text(parseInt(obj.text()) + 1);
					alert(livereLib.getMessage('actionbtntext'));
				} else {
					alert(livereLib.getMessage('duplicate'));
				}
			});
		} else {
			alert(livereLib.getMessage('duplicate'));
		}

	};

	this.carouselFlag = false;
	this.snsBtnFunc = function(acc) {
		var c_this = this;
		acc = jQuery(acc);

		acc.find(".livereActionSNSButton").click(function() {
			var service = this.id.replace("livereAction_", "");
			var postingLayer = c_this.html.postingLayer();

			service = eval(service);
			if (service.name == "yozm") {
                alert("毂橈拷氘ゃ厯锟届數锟� 毂欖ī歆氺睒歆办毂橈拷氙撾厤锟届噭甓楈睓順鹅▓毂欙拷鈹§懄锟届斂锟� 毂欗亜锟届敵锟解敗锟�(Yozm) 毂欙拷鞕欕箔銉傠盁锟届櫁锟届锟� 毂欖锟解敋銉傦讥氘佳€锟诫秼锟� 毂橈拷鞌碴睒銉傡敳锟� 毂橅樁飑岇睓順鹅▓毂橃◢頋胳睒歆濎Л毂欙拷攵嬰▌褉锟届櫃锟� 毂欗亜锟届敵锟解敗锟� 毂楈▓锟斤拷锟� 歆㈧睒順澒 毂楈◢歆胳睒頌嬱 毂欖锟斤拷褉锟诫磾毹勶拷鞌诧拷 毂欖锟届儢銉拷氘ゃ壊銉傠▋銐诧拷鞎拷锟� 毂欙拷鈼戨锟� 歆氺睒锟届懇氩儌鈹戩嫓銉拷氙撾厤銉拷氘わ拷. \n- 毂橅樁飑岇睓順鹅▓毂橃◢頋胳睒歆濎Л 毂犿澑锟斤拷 -");
                return false;
            }else if( service.name == "me2day" ){
                alert("毂橃П歙嶌睜锟届Л毂橅槬歆胳睓順鹅▓(me2day) 毂欙拷鞕欕箔銉傠盁锟届櫁锟届锟� 毂欖锟解敋銉傦讥氘佳€锟诫秼锟� 毂橈拷鞌碴睒銉傡敳锟� 毂橅樁飑岇睓順鹅▓毂橃◢頋胳睒歆濎Л毂欙拷攵嬰▌褉锟届櫃锟� 毂橃П歙嶌睜锟届Л毂橅槬歆胳睓順鹅▓ 毂楈▓锟斤拷锟� 歆㈧睒順澒 毂楈◢歆胳睒頌嬱 毂欖锟斤拷褉锟诫磾毹勶拷鞌诧拷 毂欖锟届儢銉拷氘ゃ壊銉傠▋銐诧拷鞎拷锟� 毂欙拷鈼戨锟� 歆氺睒锟届懇氩儌鈹戩嫓銉拷氙撾厤銉拷氘わ拷. \n- 毂橅樁飑岇睓順鹅▓毂橃◢頋胳睒歆濎Л 毂犿澑锟斤拷 -");
                return false;
            }else if( service.name == "cyworld" ){
                alert("毂欙拷氘るА锟届敳電樠€锟诫窚锟届敵銉拷鞈╇箔锟届斂锟� C毂橃頋轨睏歙岇◢ 毂欙拷鞕欕箔銉傠盁锟届櫁锟届锟� 毂欖锟解敋銉傦讥氘佳€锟诫秼锟� 毂橈拷鞌碴睒銉傡敳锟� 毂橅樁飑岇睓順鹅▓毂橃◢頋胳睒歆濎Л毂欙拷攵嬰▌褉锟届櫃锟� C毂橃頋轨睏歙岇◢ 毂楈▓锟斤拷锟� 歆㈧睒順澒 毂楈◢歆胳睒頌嬱 毂欖锟斤拷褉锟诫磾毹勶拷鞌诧拷 毂欖锟届儢銉拷氘ゃ壊銉傠▋銐诧拷鞎拷锟� 毂欙拷鈼戨锟� 歆氺睒锟届懇氩儌鈹戩嫓銉拷氙撾厤銉拷氘わ拷. \n- 毂橅樁飑岇睓順鹅▓毂橃◢頋胳睒歆濎Л 毂犿澑锟斤拷 -");
                return false;
            }
			if (!livereLib.isLogged() || service.member_islogin != 1) {
				service.loginGate();
				return false;
			}

			jQuery("#livereActionPostingContainer").remove();

			postingLayer = postingLayer.replace("#DOMAIN_NAME#", service.title);
			postingLayer = livereLib.util.replaceAll(postingLayer, "#DOMAIN#", service.member_domain);
			postingLayer = postingLayer.replace("#MEMBER_NAME#", service.member_name);

			if (service.member_icon.indexOf("api.twitter.com/1/users") > -1) service.member_icon = "https://si0.twimg.com/sticky/default_profile_images/default_profile_1_normal.png";

			if (livereLib.isSecure) {
				if (service.member_domain == "twitter" || service.member_domain == "facebook") {
					postingLayer = postingLayer.replace("#MEMBER_ICON#", service.member_icon.replace("http://", "https://"));
				} else {
					postingLayer = postingLayer.replace("#MEMBER_ICON#", service.member_icon.replace("http://", "https://secure.livere.co.kr:8443/"));
				}
			} else {
				postingLayer = postingLayer.replace("#MEMBER_ICON#", service.member_icon);
			}

			postingLayer = jQuery(postingLayer);

			var postingPersonParams = {};
			postingPersonParams["command"] = "getArticleTableList";
			postingPersonParams["member_domain"] = service.name;

			var postingPersonUrl = livereLib.url("API_Livere", postingPersonParams);

			jQuery.getJSON(postingPersonUrl, function(data) {
				if (data.result == 200) {
					var personCount = data.resultData.count;
					var personData = data.resultData.list;

					if (personCount == 0) {
						postingLayer.find("#livereActionPostingPersonMiddle").addClass("livereActionPostingPersonEmpty").append("<p>" + livereLib.getMessage("actionWidzetSharedByMsg_8") + "</p>");
						return false;
					}

					jQuery.each(personData, function(ii, vv) {
						var postingPersonBtn = c_this.html.postingPersonBtn();

						if (vv.member_icon.indexOf("api.twitter.com/1/users") > -1) vv.member_icon = "https://si0.twimg.com/sticky/default_profile_images/default_profile_1_normal.png";

						if (livereLib.isSecure) {
							if (vv.member_domain == "twitter" || vv.member_domain == "facebook") {
								postingPersonBtn = postingPersonBtn.replace("#PERSON_ICON#", vv.member_icon.replace("http://", "https://"));
							} else {
								postingPersonBtn = postingPersonBtn.replace("#PERSON_ICON#", vv.member_icon.replace("http://", "https://secure.livere.co.kr:8443/"));
							}
						} else {
							postingPersonBtn = postingPersonBtn.replace("#PERSON_ICON#", vv.member_icon);
						}

						postingPersonBtn = livereLib.util.replaceAll(postingPersonBtn, "#DOMAIN#", vv.member_domain);

						postingPersonBtn = jQuery(postingPersonBtn);

						postingPersonBtn.find(".livereActionPostingPersonThumbBtn").click(function() {
							window.open(vv.member_url);
						});

						postingLayer.find("#livereActionPostingPersonCarousel").append(postingPersonBtn);

						var postingPersonBtnWidth = postingPersonBtn.outerWidth(true);
						if (personCount > 5) {
							postingLayer.find("#livereActionPostingPersonMiddle").addClass("livereActionPostingPersonCarouselActive");
							postingLayer.find("#livereActionPostingPersonCarousel").css("width", postingPersonBtnWidth * personCount);
						} else {
							postingLayer.find("#livereActionPostingPersonCarousel").css("width", postingPersonBtn.outerWidth(true) * 5);
						}
					});
				} else {
					postingLayer.find("#livereActionPostingPersonMiddle").addClass("livereActionPostingPersonEmpty").append("<p>" + livereLib.getMessage("actionWidzetSharedByMsg_8") + "</p>");
				}
			});

			c_this.carouselFlag = false;
			postingLayer.find(".livereActionPostingPersonCarouselBtn").click(function() {
				if (c_this.carouselFlag) return false;

				c_this.carouselFlag = true;

				var id = this.id.replace("livereActionPostingPersonCarouselBtn_", "");
				var marginLinear = postingLayer.find(".livereActionPostingPersonBtnWrapper").outerWidth(true);
				switch (id) {
					case "left":
						if (postingLayer.find("#livereActionPostingPersonCarousel").css("left").replace("px", "") == 0) {
							c_this.carouselFlag = false;
							return false;
						}

						postingLayer.find("#livereActionPostingPersonCarousel").animate({
							"left": "+=" + marginLinear
						}, 200, function() {
							c_this.carouselFlag = false;
						});
						break;
					case "right":
						postingLayer.find("#livereActionPostingPersonCarousel").animate({
							"left": "-=" + marginLinear
						}, 200, function() {
							c_this.carouselFlag = false;
						});
						break;
				}
			});

			livereLib.util.toolTip(postingLayer.find("[rel=tooltip]"));

			postingLayer.find("#livereActionPostingClose").click(function() {
				acc.find("#livereAction_" + service.member_domain).focus();
				postingLayer.remove();
			});

			postingLayer.find("#livereActionPostingText").bind("change keyup input", function() {
				livereActionWidzet.textValidate(this);
			});

			postingLayer.find("#livereActionPostingSubmitBtn").click(function() {
				var params = {
					service: service.member_domain,
					do_code: 600,
					content: postingLayer.find("#livereActionPostingText").val(),
					title: livereSharedData.livereReply.rep_data.title
				};

				// site check
				if (!livereLib.util.isEmpty(livereReply.site)) params["site"] = livereReply.site;

				// logo check
				var logo = "";
				var og_image = jQuery("meta[property='og:image']");
				if (og_image.length > 0 && !livereLib.util.isEmpty(og_image.attr("content"))) {
					logo = og_image.attr("content");
				}
				params['logo'] = logo;

				// descipriton check
				var description = "";
				if (!livereLib.util.isEmpty(livereActionWidzet.description)) {
					description = livereActionWidzet.description;
				} else if (!livereLib.util.isEmpty(livereReply.desc)) {
					description = livereReply.desc;
				} else if (!livereLib.util.isEmpty(livereReply.description)) {
					description = livereReply.description;
				} else {
					jQuery("meta").each(function(ii, vv) {
						var obj = jQuery(vv);
						obj.attr("name", (obj.attr("name") + "").toLowerCase());
					});

					var desc_meta = jQuery("meta[name='description']");
					if (desc_meta.length > 0 && !livereLib.util.isEmpty(desc_meta.attr("content"))) {
						description = desc_meta.attr("content");
					}
				}

				params['description'] = description;

				livereLib.fire(params, "action");

				acc.find("#livereAction_" + service.member_domain + " strong").text(parseInt(acc.find("#livereAction_" + service.member_domain + " strong").text()) + 1);
				acc.find("#livereAction_" + service.member_domain).focus();

				alert(livereLib.getMessage("actionWidzetSubmitMsg_8"));
				postingLayer.remove();
			});

			acc.append(postingLayer);

			var eventData = {};
			eventData["type"] = "livereEvent";
			eventData["key"] = "postingLayerCreated";

			livereLib.dispatchEvent(eventData);
		});

		return acc;
	};

	this.textValidate = function(obj) {
		var textareaObj = jQuery(obj);
		var max_len = livereSharedData.livereReply.livere_data.content_maxlen;
		var str_len = textareaObj.val().length;

		jQuery("#" + textareaObj.attr("targetName")).text(str_len);

		if (str_len > max_len) {
			alert(livereLib.getMessage("textCount_8").replace("#TEXTCOUNT#", max_len));
			textareaObj.val(textareaObj.val().substring(0, (max_len - 2))).focus();
			livereActionWidzet.textValidate(obj);
		}
	};
};


/*
 *	livere service area
 */

var yozm = {
	name: "yozm",
	title: "Yozm",
	openType: "window",
	loginGate: function() {
		window.open(livereLib.util.getLoginPageURL(yozm.name));
	},
	openUserPage: function(replyData) {
		window.open(replyData.member_url);
	}
};

var twitter = {
	name: "twitter",
	title: "Twitter",
	openType: "window",
	loginGate: function() {
		window.open(livereLib.util.getLoginPageURL(twitter.name));
	},
	openUserPage: function(replyData) {
		window.open(replyData.member_url);
	}
};

var me2day = {
	name: "me2day",
	title: "Me2day",
	openType: "window",
	loginGate: function() {
		window.open(livereLib.util.getLoginPageURL(me2day.name));
	},
	openUserPage: function(replyData) {
		window.open(replyData.member_url);
	}
};

var facebook = {
	name: "facebook",
	title: "Facebook",
	openType: "window",
	loginGate: function() {
		window.open(livereLib.util.getLoginPageURL(facebook.name));
	},
	openUserPage: function(replyData) {
		window.open(replyData.member_url);
	}
};

var facebook_gr = {
	name: "facebook_gr",
	title: "Facebook",
	openType: "window",
	loginGate: function() {
		window.open(livereLib.util.getLoginPageURL(facebook_gr.name));
	},
	openUserPage: function(replyData) {
		window.open(replyData.member_url);
	}
};

var cyworld = {
	name: "cyworld",
	title: "Cyworld",
	openType: "window",
	loginGate: function() {
		window.open(livereLib.util.getLoginPageURL(cyworld.name));
	},
	openUserPage: function(replyData) {
		window.open(replyData.member_url);
	}
};

var tistory = {
	name: "tistory",
	title: "Tistory",
	openType: "window",
	loginGate: function() {
		window.open(livereLib.util.getLoginPageURL(tistory.name));
	},
	openUserPage: function(replyData) {
		window.open(replyData.member_url);
	}
};

var open_y_jp = {
	name: "open_y_jp",
	title: "Yahoo Japan",
	loginGate: function() {
		window.open(livereLib.util.getLoginPageURL("openid") + "&name=" + open_y_jp.name);
	},
	openUserPage: function(replyData) {}
};

var open_y = {
	name: "open_y",
	title: "Yahoo",
	loginGate: function() {
		window.open(livereLib.util.getLoginPageURL("openid") + "&name=" + open_y.name);
	},
	openUserPage: function(replyData) {}
};

var mixi = {
	name: "mixi",
	title: "Mixi",
	loginGate: function() {
		window.open(livereLib.util.getLoginPageURL(mixi.name));
	},
	openUserPage: function(replyData) {
		window.open(replyData.member_url);
	}
};

var weibo_sina = {
	name: "weibo_sina",
	title: "Weibo",
	loginGate: function() {
		window.open(livereLib.util.getLoginPageURL(weibo_sina.name));
	},
	openUserPage: function(replyData) {
		window.open(replyData.member_url);
	}
};

var google_plus = {
	name: "google_plus",
	title: "GooglePlus",
	loginGate: function() {
		window.open(livereLib.util.getLoginPageURL(google_plus.name));
	},
	openUserPage: function(replyData) {
		window.open(replyData.member_url);
	}
};

var linkedIn = {
	name: "linkedIn",
	title: "LinkedIn",
	loginGate: function() {
		window.open(livereLib.util.getLoginPageURL(linkedIn.name));
	},
	openUserPage: function(replyData) {
		window.open(replyData.member_url);
	}
};

var naver = {
	name: "naver",
	title: "Naver",
	loginGate: function() {
		window.open(livereLib.util.getLoginPageURL(naver.name));
	},
	openUserPage: function(replyData) {
		window.open(replyData.member_url);
	}
};


if(typeof kakao === 'object'){
	kakao.name = "kakao";
	kakao.title = "Kakao";
	kakao.loginGate = function(){
		window.open(livereLib.util.getLoginPageURL(kakao.name));
	};
	kakao.openUserPage = function(replyData) {
		if ( replyData.member_url != "" ){
			window.open(replyData.member_url);
		}
	};
} else {
	var kakao = {
		name: "kakao",
		title: "Kakao",
		loginGate: function() {
			window.open(livereLib.util.getLoginPageURL(kakao.name));
		},
		openUserPage: function(replyData) {
			if ( replyData.member_url != "" ){
				window.open(replyData.member_url);
			}
		}
	};
}

var instagram = {
	name: "instagram",
	title: "Instagram",
	loginGate: function() {
		window.open(livereLib.util.getLoginPageURL(instagram.name));
	},
	openUserPage: function(replyData) {
		if ( replyData.member_url != "" ){
			window.open(replyData.member_url);
		}
	}
};

var livere = {
	name: "livere",
	title: "LiveRe",
	loginGate: function() {
		window.open(livereLib.util.getLoginPageURL(livere.name));
	},
	openUserPage: function(replyData) {}
};

var guest = {
	name: "guest",
	title: "Guest",
	loginGate: function() {},
	openUserPage: function() {}
};
var elle = {
	name: "elle",
	title: "Elle",
	loginGate: function() {},
	openUserPage: function() {}
};
var kyobobook = {
	name: "kyobobook",
	title: "Kyobobook",
	loginGate: function() {},
	openUserPage: function() {}
};
var sunfull = {
	name: "sunfull",
	title: "Sunfull",
	loginGate: function() {},
	openUserPage: function() {}
};
var kbs = {
	name: "kbs",
	title: "KBS",
	loginGate: function() {},
	openUserPage: function() {}
};
var bongjashop = {
	name: "bongjashop",
	title: "Bongjashop",
	loginGate: function() {},
	openUserPage: function() {}
};
var hopestart = {
	name: "hopestart",
	title: "Hopestart",
	loginGate: function() {},
	openUserPage: function() {}
};
var ilovepc = {
	name: "ilovepc",
	title: "ILovePC",
	loginGate: function() {},
	openUserPage: function() {}
};
var gsretail = {
	name: "gsretail",
	title: "GSretail",
	loginGate: function() {},
	openUserPage: function(replyData) {
		window.open('http://www.gsretail.com/');
	}
};
var mediainnews = {
	name: "mediainnews",
	title: "Mediainnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var dcmcafe = {
	name: "dcmcafe",
	title: "DCMCafe",
	loginGate: function() {},
	openUserPage: function() {}
};
var oclock = {
	name: "oclock",
	title: "OClock",
	loginGate: function() {},
	openUserPage: function() {}
};
var sangsanguniv = {
	name: "sangsanguniv",
	title: "Sangsanguniv",
	loginGate: function() {},
	openUserPage: function() {}
};
var fnnews = {
	name: "fnnews",
	title: "Fnnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var nocut = {
	name: "nocut",
	title: "nocut",
	loginGate: function() {},
	openUserPage: function() {}
};
var kbsworld_eng = {
	name: "kbsworld_eng",
	title: "KBS",
	loginGate: function() {},
	openUserPage: function() {}
};
var sba = {
	name: "sba",
	title: "sba",
	loginGate: function() {},
	openUserPage: function() {}
};
var ibk = {
	name: "ibk",
	title: "IBK",
	loginGate: function() {},
	openUserPage: function() {}
};
var busancityhall = {
	name: "busancityhall",
	title: "ToktokBusan",
	loginGate: function() {},
	openUserPage: function() {}
};
var cdnews = {
	name: "cdnews",
	title: "Cdnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var veritas = {
	name: "veritas",
	title: "Veritas",
	loginGate: function() {},
	openUserPage: function() {}
};
var incable = {
	name: "incable",
	title: "Incable",
	loginGate: function() {},
	openUserPage: function() {}
};
var etomedia = {
	name: "etomedia",
	title: "Etomedia",
	loginGate: function() {},
	openUserPage: function() {}
};
var ganghwa114 = {
	name: "ganghwa114",
	title: "Ganghwa114",
	loginGate: function() {},
	openUserPage: function() {}
};
var gjfocus = {
	name: "gjfocus",
	title: "Gjfocus",
	loginGate: function() {},
	openUserPage: function() {}
};
var thefact = {
	name: "thefact",
	title: "Thefact",
	loginGate: function() {},
	openUserPage: function() {}
};
var sportsseoul = {
	name: "sportsseoul",
	title: "sportsseoul",
	loginGate: function() {},
	openUserPage: function() {}
};
var mediawhy = {
	name: "mediawhy",
	title: "Mediawhy",
	loginGate: function() {},
	openUserPage: function() {}
};
var playit = {
	name: "playit",
	title: "Playit",
	loginGate: function() {},
	openUserPage: function() {}
};
var dailylog = {
	name: "dailylog",
	title: "Dailylog",
	loginGate: function() {},
	openUserPage: function() {}
};
var citinature = {
	name: "citinature",
	title: "Citinature",
	loginGate: function() {},
	openUserPage: function() {}
};
var jejuopens = {
	name: "jejuopens",
	title: "Jejuopens",
	loginGate: function() {},
	openUserPage: function() {}
};
var mbn = {
	name: "mbn",
	title: "MBN",
	loginGate: function() {},
	openUserPage: function() {}
};
var autoherald = {
	name: "autoherald",
	title: "Autoherald",
	loginGate: function() {},
	openUserPage: function() {}
};
var samsungseri = {
	name: "samsungseri",
	title: "seri",
	loginGate: function() {},
	openUserPage: function() {}
};
var changupcom = {
	name: "changupcom",
	title: "Changupcom",
	loginGate: function() {},
	openUserPage: function() {}
};
var headlinejeju = {
	name: "headlinejeju",
	title: "Headlinejeju",
	loginGate: function() {},
	openUserPage: function() {}
};
var kgnews = {
	name: "kgnews",
	title: "Kgnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var focusnews = {
	name: "focusnews",
	title: "FOCUS",
	loginGate: function() {},
	openUserPage: function() {}
};
var seoulsba = {
	name: "seoulsba",
	title: "Seoulsba",
	loginGate: function() {},
	openUserPage: function() {}
};
var kbmaeil = {
	name: "kbmaeil",
	title: "Kbmaeil",
	loginGate: function() {},
	openUserPage: function() {}
};
var geniepark = {
	name: "geniepark",
	title: "Geniepark",
	loginGate: function() {},
	openUserPage: function() {}
};
var veritas_a = {
	name: "veritas_a",
	title: "Veritas_a",
	loginGate: function() {},
	openUserPage: function() {}
};
var enterwa = {
	name: "enterwa",
	title: "Veritas_a",
	loginGate: function() {},
	openUserPage: function() {}
};
var firstlook = {
	name: "firstlook",
	title: "firstlook",
	loginGate: function() {},
	openUserPage: function() {}
};
var gndaily = {
	name: "gndaily",
	title: "Gndaily",
	loginGate: function() {},
	openUserPage: function() {}
};
var goodnewspress = {
	name: "goodnewspress",
	title: "Goodnewspress",
	loginGate: function() {},
	openUserPage: function() {}
};
var sentv = {
	name: "sentv",
	title: "SENTV",
	loginGate: function() {},
	openUserPage: function() {}
};
var newskorea = {
	name: "newskorea",
	title: "Newskorea",
	loginGate: function() {},
	openUserPage: function() {}
};
var asan = {
	name: "asan",
	title: "ASAN",
	loginGate: function() {},
	openUserPage: function() {}
};
var newtimes = {
	name: "newtimes",
	title: "Newtimes",
	loginGate: function() {},
	openUserPage: function() {}
};
var bundangnews = {
	name: "bundangnews",
	title: "Bundangnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var chungcheongtv = {
	name: "chungcheongtv",
	title: "Chungcheongtv",
	loginGate: function() {},
	openUserPage: function() {}
};
var foodnews = {
	name: "foodnews",
	title: "Foodnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var ngtv = {
	name: "ngtv",
	title: "Ngtv",
	loginGate: function() {},
	openUserPage: function() {}
};
var upkorea = {
	name: "upkorea",
	title: "Upkorea",
	loginGate: function() {},
	openUserPage: function() {}
};
var jnuri = {
	name: "jnuri",
	title: "Jnuri",
	loginGate: function() {},
	openUserPage: function() {}
};
var andongnews = {
	name: "andongnews",
	title: "Andongnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var kyobostory = {
	name: "kyobostory",
	title: "KyoboStory",
	loginGate: function() {},
	openUserPage: function() {}
};
var newshyu = {
	name: "newshyu",
	title: "Newshyu",
	loginGate: function() {},
	openUserPage: function() {}
};
var storyk = {
	name: "storyk",
	title: "Storyk",
	loginGate: function() {},
	openUserPage: function() {}
};
var campustoday = {
	name: "campustoday",
	title: "Campustoday",
	loginGate: function() {},
	openUserPage: function() {}
};
var weeklytoday = {
	name: "weeklytoday",
	title: "Weeklytoday",
	loginGate: function() {},
	openUserPage: function() {}
};
var kban = {
	name: "kban",
	title: "KBAN",
	loginGate: function() {},
	openUserPage: function() {}
};
var newsrise = {
	name: "newsrise",
	title: "Newsrise",
	loginGate: function() {},
	openUserPage: function() {}
};
var gimpoin = {
	name: "gimpoin",
	title: "Gimpoin",
	loginGate: function() {},
	openUserPage: function() {}
};
var gnewsdaily = {
	name: "gnewsdaily",
	title: "Gnewsdaily",
	loginGate: function() {},
	openUserPage: function() {}
};
var ittoday = {
	name: "ittoday",
	title: "Ittoday",
	loginGate: function() {},
	openUserPage: function() {}
};
var interfootball = {
	name: "interfootball",
	title: "Interfootball",
	loginGate: function() {},
	openUserPage: function() {}
};
var imaeil = {
	name: "imaeil",
	title: "Imaeil",
	loginGate: function() {},
	openUserPage: function() {}
};
var kyeongin = {
	name: "kyeongin",
	title: "Kyeongin",
	loginGate: function() {},
	openUserPage: function() {}
};
var daejeonnews = {
	name: "daejeonnews",
	title: "Daejeonnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var glebbangzip = {
	name: "glebbangzip",
	title: "Glebbangzip",
	loginGate: function() {},
	openUserPage: function() {}
};
var seongdongnews = {
	name: "seongdongnews",
	title: "Seongdongnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var hgtimes = {
	name: "hgtimes",
	title: "Hgtimes",
	loginGate: function() {},
	openUserPage: function() {}
};
var vop = {
	name: "vop",
	title: "Vop",
	loginGate: function() {},
	openUserPage: function() {}
};
var hankyung = {
	name: "hankyung",
	title: "Hankyung",
	loginGate: function() {},
	openUserPage: function() {}
};
var hk_biz = {
	name: "hk_biz",
	title: "Hankyung Magazine",
	loginGate: function() {},
	openUserPage: function() {}
};
var nahnews = {
	name: "nahnews",
	title: "Nahnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var ikoreanspirit = {
	name: "ikoreanspirit",
	title: "Ikoreanspirit",
	loginGate: function() {},
	openUserPage: function() {}
};
var iusm = {
	name: "iusm",
	title: "Iusm",
	loginGate: function() {},
	openUserPage: function() {}
};
var asiatoday = {
	name: "asiatoday",
	title: "Asiatoday",
	loginGate: function() {},
	openUserPage: function() {}
};
var kgnews2 = {
	name: "kgnews2",
	title: "Kgnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var fntoday = {
	name: "fntoday",
	title: "Fntoday",
	loginGate: function() {},
	openUserPage: function() {}
};
var jobnjoy = {
	name: "jobnjoy",
	title: "Job&Joy",
	loginGate: function() {},
	openUserPage: function() {}
};
var hankookilbo = {
	name: "hankookilbo",
	title: "Hankookilbo",
	loginGate: function() {},
	openUserPage: function() {}
};
var cowalknews = {
	name: "cowalknews",
	title: "Cowalknews",
	loginGate: function() {},
	openUserPage: function() {}
};
var domin = {
	name: "domin",
	title: "Domin",
	loginGate: function() {},
	openUserPage: function() {}
};
var seoulmuseum = {
	name: "seoulmuseum",
	title: "Seoulmuseum",
	loginGate: function() {},
	openUserPage: function() {}
};
var fundu = {
	name: "fundu",
	title: "Fundu",
	loginGate: function() {},
	openUserPage: function() {}
};
var mediatoday = {
	name: "mediatoday",
	title: "Mediatoday",
	loginGate: function() {},
	openUserPage: function() {}
};
var jjan = {
	name: "jjan",
	title: "Jjan",
	loginGate: function() {},
	openUserPage: function() {}
};
var doctorw = {
	name: "doctorw",
	title: "Doctorw",
	loginGate: function() {},
	openUserPage: function() {}
};
var munhwa = {
	name: "munhwa",
	title: "Munhwa",
	loginGate: function() {},
	openUserPage: function() {}
};
var kookje = {
	name: "kookje",
	title: "Kookje",
	loginGate: function() {},
	openUserPage: function() {}
};
var dangdangnews = {
	name: "dangdangnews",
	title: "Dangdangnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var metroseoul = {
	name: "metroseoul",
	title: "Metroseoul",
	loginGate: function() {},
	openUserPage: function() {}
};
var bucheontimes = {
	name: "bucheontimes",
	title: "bucheontimes",
	loginGate: function() {},
	openUserPage: function() {}
};
var pressian = {
	name: "pressian",
	title: "Pressian",
	loginGate: function() {},
	openUserPage: function() {}
};
var digitaltimes = {
	name: "digitaltimes",
	title: "Digitaltimes",
	loginGate: function() {},
	openUserPage: function() {}
};
var itmaeil = {
	name: "itmaeil",
	title: "Itmaeil",
	loginGate: function() {},
	openUserPage: function() {}
};
var inews24 = {
	name: "inews24",
	title: "Inews24",
	loginGate: function() {},
	openUserPage: function() {}
};
var yonhapnews = {
	name: "yonhapnews",
	title: "Yonhapnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var asiae = {
	name: "asiae",
	title: "Asiae",
	loginGate: function() {},
	openUserPage: function() {}
};
var ctjournal = {
	name: "ctjournal",
	title: "Ctjournal",
	loginGate: function() {},
	openUserPage: function() {}
};
var wownet = {
	name: "wownet",
	title: "Wownet",
	loginGate: function() {},
	openUserPage: function() {}
};
var mediajeju = {
	name: "mediajeju",
	title: "Mediajeju",
	loginGate: function() {},
	openUserPage: function() {}
};
var soulplay = {
	name: "soulplay",
	title: "Soulplay",
	loginGate: function() {},
	openUserPage: function() {}
};
var koreajn = {
	name: "koreajn",
	title: "Koreajn",
	loginGate: function() {},
	openUserPage: function() {}
};
var etude = {
	name: "etude",
	title: "ETUDE",
	loginGate: function() {},
	openUserPage: function() {}
};
var stoo = {
	name: "stoo",
	title: "STOO",
	loginGate: function() {},
	openUserPage: function() {}
};
var channelit = {
	name: "channelit",
	title: "Channelit",
	loginGate: function() {},
	openUserPage: function() {}
};
var bulkyo21 = {
	name: "bulkyo21",
	title: "Bulkyo21",
	loginGate: function() {},
	openUserPage: function() {}
};
var sisafocus = {
	name: "sisafocus",
	title: "Sisaocus",
	loginGate: function() {},
	openUserPage: function() {}
};
var industrysolutio = {
	name: "industrysolutio",
	title: "Industrysolutions",
	loginGate: function() {},
	openUserPage: function() {}
};
var iwet = {
	name: "iwet",
	title: "Iwet",
	loginGate: function() {},
	openUserPage: function() {}
};
var seoulshinmun = {
	name: "seoulshinmun",
	title: "Seoulshinmun",
	loginGate: function() {},
	openUserPage: function() {}
};
var sisain = {
	name: "sisain",
	title: "Sisain",
	loginGate: function() {},
	openUserPage: function() {}
};
var kolon = {
	name: "kolon",
	title: "Kolon",
	loginGate: function() {},
	openUserPage: function() {}
};
var daejonilbo = {
	name: "daejonilbo",
	title: "Daejonilbo",
	loginGate: function() {},
	openUserPage: function() {}
};
var YTmembership = {
	name: "YTmembership",
	title: "T membership",
	loginGate: function() {},
	openUserPage: function() {}
};
var reworks = {
	name: "reworks",
	title: "Reworks",
	loginGate: function() {},
	openUserPage: function() {}
};
var seoul = {
	name: "seoul",
	title: "Seoul",
	loginGate: function() {},
	openUserPage: function() {}
};
var happytoday = {
	name: "happytoday",
	title: "Happytoday",
	loginGate: function() {},
	openUserPage: function() {}
};
var shopportal = {
	name: "shopportal",
	title: "Shopportal",
	loginGate: function() {},
	openUserPage: function() {}
};
var channela = {
	name: "channela",
	title: "ChannelA",
	loginGate: function() {},
	openUserPage: function() {}
};
var actorbom = {
	name: "actorbom",
	title: "Actorbom",
	loginGate: function() {},
	openUserPage: function() {}
};
var kmjnews = {
	name: "kmjnews",
	title: "Kmjnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var joongbooilbo = {
	name: "joongbooilbo",
	title: "Joongbooilbo",
	loginGate: function() {},
	openUserPage: function() {}
};
var sisunews = {
	name: "sisunews",
	title: "Sisunews",
	loginGate: function() {},
	openUserPage: function() {}
};
var yeowooji = {
	name: "yeowooji",
	title: "Yeowooji",
	loginGate: function() {},
	openUserPage: function() {}
};
var sociallg = {
	name: "sociallg",
	title: "Sociallg",
	loginGate: function() {},
	openUserPage: function() {}
};
var ggfocus = {
	name: "ggfocus",
	title: "GGfocus",
	loginGate: function() {},
	openUserPage: function() {}
};
var gobalnews = {
	name: "gobalnews",
	title: "Gobalnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var newsnjoy = {
	name: "newsnjoy",
	title: "Newsnjoy",
	loginGate: function() {},
	openUserPage: function() {}
};
var workingilbo = {
	name: "workingilbo",
	title: "Workingilbo",
	loginGate: function() {},
	openUserPage: function() {}
};
var everynews = {
	name: "everynews",
	title: "Everynews",
	loginGate: function() {},
	openUserPage: function() {}
};
var mbs = {
	name: "mbs",
	title: "MBS",
	loginGate: function() {},
	openUserPage: function() {}
};
var han = {
	name: "han",
	title: "Hankyoreh",
	loginGate: function() {},
	openUserPage: function() {}
};
var newshankuk = {
	name: "newshankuk",
	title: "Newshankuk",
	loginGate: function() {},
	openUserPage: function() {}
};
var gnews = {
	name: "gnews",
	title: "Gnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var chtoday = {
	name: "chtoday",
	title: "Christian Today",
	loginGate: function() {},
	openUserPage: function() {}
};
var digue = {
	name: "digue",
	title: "Digue6",
	loginGate: function() {},
	openUserPage: function() {}
};
var bizwatch = {
	name: "bizwatch",
	title: "Bizwatch",
	loginGate: function() {},
	openUserPage: function() {}
};
var hknewstoday = {
	name: "hknewstoday",
	title: "Hknewstoday",
	loginGate: function() {},
	openUserPage: function() {}
};
var sejongpac = {
	name: "sejongpac",
	title: "sejongpac",
	loginGate: function() {},
	openUserPage: function() {}
};
var newdaily = {
	name: "newdaily",
	title: "newdaily",
	loginGate: function() {},
	openUserPage: function() {}
};
var starsian = {
	name: "starsian",
	title: "Starsian",
	loginGate: function() {},
	openUserPage: function() {}
};
var newstap = {
	name: "newstap",
	title: "Newstap",
	loginGate: function() {},
	openUserPage: function() {}
};
var mk = {
	name: "mk",
	title: "MK",
	loginGate: function() {},
	openUserPage: function() {}
};
var sbs = {
	name: "sbs",
	title: "SBS",
	loginGate: function() {},
	openUserPage: function() {}
};
var mrtong = {
	name: "mrtong",
	title: "MrTong",
	loginGate: function() {},
	openUserPage: function() {}
};
var yeongnamilbo = {
	name: "yeongnamilbo",
	title: "Yeongnamilbo",
	loginGate: function() {},
	openUserPage: function() {}
};
var boannews = {
	name: "boannews",
	title: "Boannews",
	loginGate: function() {},
	openUserPage: function() {}
};
var kukinews = {
	name: "kukinews",
	title: "Kukinews",
	loginGate: function() {},
	openUserPage: function() {}
};
var ytn = {
	name: "ytn",
	title: "YTN",
	loginGate: function() {},
	openUserPage: function() {}
};
var nonsannews = {
	name: "nonsannews",
	title: "Nonsan News",
	loginGate: function() {},
	openUserPage: function() {}
};
var babynews = {
	name: "babynews",
	title: "Babynews",
	loginGate: function() {},
	openUserPage: function() {}
};
var zkic = {
	name: "zkic",
	title: "zkic",
	loginGate: function() {},
	openUserPage: function() {}
};
var pressbyple = {
	name: "pressbyple",
	title: "Pressbyple",
	loginGate: function() {},
	openUserPage: function() {}
};
var dailian = {
	name: "dailian",
	title: "Dailian",
	loginGate: function() {},
	openUserPage: function() {}
};
var dhnews = {
	name: "dhnews",
	title: "Dhnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var bccard = {
	name: "bccard",
	title: "BCcard",
	loginGate: function() {},
	openUserPage: function() {}
};
var icross_family = {
	name: "icross_family",
	title: "icross_family",
	loginGate: function() {},
	openUserPage: function() {}
};
var icross_kcr = {
	name: "icross_kcr",
	title: "icross_kcr",
	loginGate: function() {},
	openUserPage: function() {}
};
var wolsero = {
	name: "wolsero",
	title: "wolsero",
	loginGate: function() {},
	openUserPage: function() {}
};
var thepr = {
	name: "thepr",
	title: "The-pr",
	loginGate: function() {},
	openUserPage: function() {}
};
var dailygrid = {
	name: "dailygrid",
	title: "Dailygrid",
	loginGate: function() {},
	openUserPage: function() {}
};
var khgames = {
	name: "khgames",
	title: "Khgames",
	loginGate: function() {},
	openUserPage: function() {}
};
var pifan = {
	name: "pifan",
	title: "PIFAN",
	loginGate: function() {},
	openUserPage: function() {}
};
var segyecom = {
	name: "segyecom",
	title: "Segyecom",
	loginGate: function() {},
	openUserPage: function() {}
};
var happybeangen = {
	name: "happybeangen",
	title: "Happybeangen",
	loginGate: function() {},
	openUserPage: function() {}
};
var busrugy = {
	name: "busrugy",
	title: "Dreamfull",
	loginGate: function() {},
	openUserPage: function() {}
};
var ohmynews = {
	name: "ohmynews",
	title: "Ohmynews",
	loginGate: function() {},
	openUserPage: function() {}
};
var jungle = {
	name: "jungle",
	title: "Jungle",
	loginGate: function() {},
	openUserPage: function() {}
};
var busan = {
	name: "busan",
	title: "Busan",
	loginGate: function() {},
	openUserPage: function() {}
};
var samsung_card = {
	name: "samsung_card",
	title: "Samsung_card",
	loginGate: function() {},
	openUserPage: function() {}
};
var cosmopolitan = {
	name: "cosmopolitan",
	title: "Cosmopolitan",
	loginGate: function() {},
	openUserPage: function() {}
};
var gaonchart = {
	name: "gaonchart",
	title: "Gaonchart",
	loginGate: function() {},
	openUserPage: function() {}
};
var childfund_seoul = {
	name: "childfund_seoul",
	title: "Childfund",
	loginGate: function() {},
	openUserPage: function() {}
};
var gamemeca = {
	name: "gamemeca",
	title: "Game Meca",
	loginGate: function() {},
	openUserPage: function() {}
};
var bpnews = {
	name: "bpnews",
	title: "Isisanews",
	loginGate: function() {},
	openUserPage: function() {}
};
var newscj = {
	name: "newscj",
	title: "Newscj",
	loginGate: function() {},
	openUserPage: function() {}
};
var dtnews = {
	name: "dtnews",
	title: "Dtnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var cchannel = {
	name: "cchannel",
	title: "Cchannel",
	loginGate: function() {},
	openUserPage: function() {}
};
var isori = {
	name: "isori",
	title: "Isori",
	loginGate: function() {},
	openUserPage: function() {}
};
var stckorea = {
	name: "stckorea",
	title: "Stckorea",
	loginGate: function() {},
	openUserPage: function() {}
};
var seongjuro = {
	name: "seongjuro",
	title: "Seongjuro",
	loginGate: function() {},
	openUserPage: function() {}
};
var egbsnews = {
	name: "egbsnews",
	title: "Egbsnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var redpiano = {
	name: "redpiano",
	title: "Redpiano",
	loginGate: function() {},
	openUserPage: function() {}
};
var mohaji = {
	name: "mohaji",
	title: "Mohazine",
	loginGate: function() {},
	openUserPage: function() {}
};
var onlinefair = {
	name: "onlinefair",
	title: "Onlinefair",
	loginGate: function() {},
	openUserPage: function() {}
};
var cledor = {
	name: "cledor",
	title: "Cledor",
	loginGate: function() {},
	openUserPage: function() {}
};
var ipnnews = {
	name: "ipnnews",
	title: "Ipnnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var edaily = {
	name: "edaily",
	title: "Edaily",
	loginGate: function() {},
	openUserPage: function() {}
};
var gsinews = {
	name: "gsinews",
	title: "Gsinews",
	loginGate: function() {},
	openUserPage: function() {}
};
var amstory = {
	name: "amstory",
	title: "Am-story",
	loginGate: function() {},
	openUserPage: function() {}
};
var yeongcheon = {
	name: "yeongcheon",
	title: "Yeongcheon",
	loginGate: function() {},
	openUserPage: function() {}
};
var ibk_give = {
	name: "ibk_give",
	title: "IBK-give",
	loginGate: function() {},
	openUserPage: function() {}
};
var gybnews = {
	name: "gybnews",
	title: "Gybnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var cwin = {
	name: "cwin",
	title: "Cwin",
	loginGate: function() {},
	openUserPage: function() {}
};
var gimpo = {
	name: "gimpo",
	title: "Gimpo",
	loginGate: function() {},
	openUserPage: function() {}
};
var livestarnews = {
	name: "livestarnews",
	title: "LiveStarnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var visualdivenews = {
	name: "visualdivenews",
	title: "Visualdivenews",
	loginGate: function() {},
	openUserPage: function() {}
};
var nongaek = {
	name: "nongaek",
	title: "Nongaek",
	loginGate: function() {},
	openUserPage: function() {}
};
var gynews = {
	name: "gynews",
	title: "Gynews",
	loginGate: function() {},
	openUserPage: function() {}
};
var ujbnews = {
	name: "ujbnews",
	title: "UJBnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var kgib = {
	name: "kgib",
	title: "Kyeonggi",
	loginGate: function() {},
	openUserPage: function() {}
};
var healthandpeople = {
	name: "healthandpeople",
	title: "Healthandpeople",
	loginGate: function() {},
	openUserPage: function() {}
};
var bluekoreadotcom = {
	name: "bluekoreadotcom",
	title: "Bluekoreadotcom",
	loginGate: function() {},
	openUserPage: function() {}
};
var yachtpia = {
	name: "yachtpia",
	title: "Yachtpia",
	loginGate: function() {},
	openUserPage: function() {}
};
var goodmorningcc = {
	name: "goodmorningcc",
	title: "Goodmorningcc",
	loginGate: function() {},
	openUserPage: function() {}
};
var tiptipnews = {
	name: "tiptipnews",
	title: "Tiptipnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var sklte = {
	name: "sklte",
	title: "Sklte",
	loginGate: function() {},
	openUserPage: function() {}
};
var busancity = {
	name: "busancity",
	title: "Busan",
	loginGate: function() {},
	openUserPage: function() {}
};
var badatv = {
	name: "badatv",
	title: "Badatv",
	loginGate: function() {},
	openUserPage: function() {}
};
var kimponews = {
	name: "kimponews",
	title: "Kimponews",
	loginGate: function() {},
	openUserPage: function() {}
};
var toonburi = {
	name: "toonburi",
	title: "Toonburi",
	loginGate: function() {},
	openUserPage: function() {}
};
var betanews = {
	name: "betanews",
	title: "Betanews",
	loginGate: function() {},
	openUserPage: function() {}
};
var newsbaro = {
	name: "newsbaro",
	title: "Newsbaro",
	loginGate: function() {},
	openUserPage: function() {}
};
var rapportian = {
	name: "rapportian",
	title: "Rapportian",
	loginGate: function() {},
	openUserPage: function() {}
};
var msf = {
	name: "msf",
	title: "Msf",
	loginGate: function() {},
	openUserPage: function() {}
};
var whysnews = {
	name: "whysnews",
	title: "Whysnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var plus_m = {
	name: "plus_m",
	title: "Plus-m",
	loginGate: function() {},
	openUserPage: function() {}
};
var m25 = {
	name: "m25",
	title: "m25",
	loginGate: function() {},
	openUserPage: function() {}
};
var doc3news = {
	name: "doc3news",
	title: "Doc3news",
	loginGate: function() {},
	openUserPage: function() {}
};
var topgear = {
	name: "topgear",
	title: "Topgear",
	loginGate: function() {},
	openUserPage: function() {}
};
var tenniskorea = {
	name: "tenniskorea",
	title: "Tennis Korea",
	loginGate: function() {},
	openUserPage: function() {}
};
var newsjeju = {
	name: "newsjeju",
	title: "Newsjeju",
	loginGate: function() {},
	openUserPage: function() {}
};
var dreamfull = {
	name: "dreamfull",
	title: "Dreamfull",
	loginGate: function() {},
	openUserPage: function() {}
};
var hyundaimnsoft = {
	name: "hyundaimnsoft",
	title: "hyundaimnsoft",
	loginGate: function() {},
	openUserPage: function() {}
};
var gijangnews = {
	name: "gijangnews",
	title: "Gijangnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var kceic = {
	name: "kceic",
	title: "Kceic",
	loginGate: function() {},
	openUserPage: function() {}
};
var kmedinews = {
	name: "kmedinews",
	title: "Kmedinews",
	loginGate: function() {},
	openUserPage: function() {}
};
var iincheon = {
	name: "iincheon",
	title: "Iincheon",
	loginGate: function() {},
	openUserPage: function() {}
};
var ebn = {
	name: "ebn",
	title: "Ebn",
	loginGate: function() {},
	openUserPage: function() {}
};
var sportworldi = {
	name: "sportworldi",
	title: "Sportworldi",
	loginGate: function() {},
	openUserPage: function() {}
};
var amnews = {
	name: "amnews",
	title: "Amnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var ipcs21 = {
	name: "ipcs21",
	title: "Ipcs21",
	loginGate: function() {},
	openUserPage: function() {}
};
var kferi = {
	name: "kferi",
	title: "Kferi",
	loginGate: function() {},
	openUserPage: function() {}
};
var shnews = {
	name: "shnews",
	title: "Shnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var iksannews = {
	name: "iksannews",
	title: "Iksannews",
	loginGate: function() {},
	openUserPage: function() {}
};
var habitatkorea = {
	name: "habitatkorea",
	title: "Habitatkorea",
	loginGate: function() {},
	openUserPage: function() {}
};
var vtimes = {
	name: "vtimes",
	title: "vtimes",
	loginGate: function() {},
	openUserPage: function() {}
};
var danceable = {
	name: "danceable",
	title: "Danceable",
	loginGate: function() {},
	openUserPage: function() {}
};
var youngsamsung2 = {
	name: "youngsamsung2",
	title: "Youngsamsung",
	loginGate: function() {},
	openUserPage: function() {}
};
var gg = {
	name: "gg",
	title: "gg",
	loginGate: function() {},
	openUserPage: function() {}
};
var seoulfuture = {
	name: "seoulfuture",
	title: "Seoulfuture",
	loginGate: function() {},
	openUserPage: function() {}
};
var samsunglife = {
	name: "samsunglife",
	title: "Samsunglife",
	loginGate: function() {},
	openUserPage: function() {}
};
var gonggamkr = {
	name: "gonggamkr",
	title: "Gonggamkr",
	loginGate: function() {},
	openUserPage: function() {}
};
var goodneighbors = {
	name: "goodneighbors",
	title: "Goodneighbors",
	loginGate: function() {},
	openUserPage: function() {}
};
var osan = {
	name: "osan",
	title: "Osan",
	loginGate: function() {},
	openUserPage: function() {}
};
var munhwanews = {
	name: "munhwanews",
	title: "Munhwanews",
	loginGate: function() {},
	openUserPage: function() {}
};
var namdoi = {
	name: "namdoi",
	title: "Namdoi",
	loginGate: function() {},
	openUserPage: function() {}
};
var tour2000 = {
	name: "tour2000",
	title: "Tour2000",
	loginGate: function() {},
	openUserPage: function() {}
};
var gjnewstong = {
	name: "gjnewstong",
	title: "Gjnewstong",
	loginGate: function() {},
	openUserPage: function() {}
};
var sisajournal = {
	name: "sisajournal",
	title: "Sisajournal",
	loginGate: function() {},
	openUserPage: function() {}
};
var sportsq = {
	name: "sportsq",
	title: "Sportsq",
	loginGate: function() {},
	openUserPage: function() {}
};
var woorizine = {
	name: "woorizine",
	title: "Woorizine",
	loginGate: function() {},
	openUserPage: function() {}
};
var adrnews = {
	name: "adrnews",
	title: "Adrnews",
	loginGate: function() {},
	openUserPage: function() {}
};
var cbsjapan = {
	name: "cbsjapan",
	title: "Cbsjapan",
	loginGate: function() {},
	openUserPage: function() {}
};
var newsmeka = {
	name: "newsmeka",
	title: "Newsmeka",
	loginGate: function() {},
	openUserPage: function() {}
};
var mbnmoney = {
	name: "mbnmoney",
	title: "Mbnmoney",
	loginGate: function() {},
	openUserPage: function() {}
};
var timenews = {
	name: "timenews",
	title: "Timenews",
	loginGate: function() {},
	openUserPage: function() {}
};

var bbangdat = {
	name: "bbangdat",
	title: "Bbangdat",
	loginGate: function() {},
	openUserPage: function() {}
};

var brcity = {
	name: "brcity",
	title: "brcity",
	loginGate: function() {},
	openUserPage: function() {}
};

var thefirstmedia = {
	name: "thefirstmedia",
	title: "Thefirstmedia",
	loginGate: function() {},
	openUserPage: function() {}
};

var thesejong = {
	name: "thesejong",
	title: "Thesejong",
	loginGate: function() {},
	openUserPage: function() {}
};

var lgcare = {
	name: "lgcare",
	title: "Lgcare",
	loginGate: function() {},
	openUserPage: function() {}
};

var globalnewsa = {
	name: "globalnewsa",
	title: "Globalnewsa",
	loginGate: function() {},
	openUserPage: function() {}
};

var healnews = {
	name: "healnews",
	title: "Healnews",
	loginGate: function() {},
	openUserPage: function() {}
};

var gonggamphoto = {
	name: "gonggamphoto",
	title: "I-PIN",
	loginGate: function() {},
	openUserPage: function() {}
};

var siheungjounal = {
	name: "siheungjounal",
	title: "Siheungjounal",
	loginGate: function() {},
	openUserPage: function() {}
};

var spi = {
	name: "spi",
	title: "the classy",
	loginGate: function() {},
	openUserPage: function() {}
};

var jungculture = {
	name: "jungculture",
	title: "Jungculture",
	loginGate: function() {},
	openUserPage: function() {}
};

var espoir = {
	name: "espoir",
	title: "Espoir",
	loginGate: function() {},
	openUserPage: function() {}
};

var mbc = {
	name: "mbc",
	title: "Mbc",
	loginGate: function() {},
	openUserPage: function() {}
};

var mainnews = {
	name: "mainnews",
	title: "Mainnews",
	loginGate: function() {},
	openUserPage: function() {}
};

var queen = {
	name: "queen",
	title: "Queen",
	loginGate: function() {},
	openUserPage: function() {}
};

var areyou = {
	name: "areyou",
	title: "Areyou",
	loginGate: function() {},
	openUserPage: function() {}
};

var ksngn = {
	name: "ksngn",
	title: "Ksngn",
	loginGate: function() {},
	openUserPage: function() {}
};

var gibnews = {
	name: "gibnews",
	title: "Gibnews",
	loginGate: function() {},
	openUserPage: function() {}
};

var khan = {
	name: "khan",
	title: "Khan",
	loginGate: function() {},
	openUserPage: function() {}
};

var cctoday = {
	name: "cctoday",
	title: "Cctoday",
	loginGate: function() {},
	openUserPage: function() {}
};

var medicalreport = {
	name: "medicalreport",
	title: "Medicalreport",
	loginGate: function() {},
	openUserPage: function() {}
};

var arte = {
	name: "arte",
	title: "Arte",
	loginGate: function() {},
	openUserPage: function() {}
};

var arte = {
	name: "arte",
	title: "Arte",
	loginGate: function() {},
	openUserPage: function() {}
};

var hanbeot = {
	name: "hanbeot",
	title: "Hanbeot",
	loginGate: function() {},
	openUserPage: function() {}
};

var dmtourmall = {
	name: "dmtourmall",
	title: "Dmtourmall",
	loginGate: function() {},
	openUserPage: function() {}
};

var wefmall = {
	name: "wefmall",
	title: "Wefmall",
	loginGate: function() {},
	openUserPage: function() {}
};

var ecotoday = {
	name: "ecotoday",
	title: "Ecotoday",
	loginGate: function() {},
	openUserPage: function() {}
};

var wbdaily = {
	name: "wbdaily",
	title: "Wbdaily",
	loginGate: function() {},
	openUserPage: function() {}
};

var suomi = {
	name: "suomi",
	title: "Suomi",
	loginGate: function() {},
	openUserPage: function() {}
};

var jeonbukin = {
	name: "jeonbukin",
	title: "Jeonbukin",
	loginGate: function() {},
	openUserPage: function() {}
};

var lafent = {
	name: "lafent",
	title: "Lafent",
	loginGate: function() {},
	openUserPage: function() {}
};

var themetn = {
	name: "themetn",
	title: "Themetn",
	loginGate: function() {},
	openUserPage: function() {}
};

var lnews = {
	name: "lnews",
	title: "Lnews",
	loginGate: function() {},
	openUserPage: function() {}
};

var worldkorean = {
	name: "worldkorean",
	title: "Worldkorean",
	loginGate: function() {},
	openUserPage: function() {}
};

var ccej = {
	name: "ccej",
	title: "Ccej",
	loginGate: function() {},
	openUserPage: function() {}
};

var fullrange = {
	name: "fullrange",
	title: "Fullrange",
	loginGate: function() {},
	openUserPage: function() {}
};

var ipopnews = {
	name: "ipopnews",
	title: "Ipopnews",
	loginGate: function() {},
	openUserPage: function() {}
};

var ntoday = {
	name: "ntoday",
	title: "Ntoday",
	loginGate: function() {},
	openUserPage: function() {}
};

var yureka = {
	name: "yureka",
	title: "Yureka",
	loginGate: function() {},
	openUserPage: function() {}
};

var teamandteam = {
	name: "teamandteam",
	title: "Teamandteam",
	loginGate: function() {},
	openUserPage: function() {}
};

var dailycosmetic = {
	name: "dailycosmetic",
	title: "Dailycosmetic",
	loginGate: function() {},
	openUserPage: function() {}
};

var csbtv = {
	name: "csbtv",
	title: "Csbtv",
	loginGate: function() {},
	openUserPage: function() {}
};

var viva100 = {
	name: "viva100",
	title: "Viva100",
	loginGate: function() {},
	openUserPage: function() {}
};

var kfhi = {
	name: "kfhi",
	title: "Kfhi",
	loginGate: function() {},
	openUserPage: function() {}
};


var wisdomhouse = {
	name: "wisdomhouse",
	title: "Wisdomhouse",
	loginGate: function() {},
	openUserPage: function() {}
};

var aaf = {
	name: "aaf",
	title: "Aaf",
	loginGate: function() {},
	openUserPage: function() {}
};

var kofac = {
	name: "kofac",
	title: "Kofac",
	loginGate: function() {},
	openUserPage: function() {}
};

var babyu = {
	name: "babyu",
	title: "Babyu",
	loginGate: function() {},
	openUserPage: function() {}
}

var socialdesign = {
	name: "socialdesign",
	title: "Socialdesign",
	loginGate: function() {},
	openUserPage: function() {}
}

var jbpost = {
	name: "jbpost",
	title: "Jbpost",
	loginGate: function() {},
	openUserPage: function() {}
}

var jbpost = {
	name: "jbpost",
	title: "Jbpost",
	loginGate: function() {},
	openUserPage: function() {}
}

var thepingpong = {
	name: "thepingpong",
	title: "Thepingpong",
	loginGate: function() {},
	openUserPage: function() {}
}

var soonsports = {
	name: "soonsports",
	title: "Soonsports",
	loginGate: function() {},
	openUserPage: function() {}
}

var miral = {
	name: "miral",
	title: "Miral",
	loginGate: function() {},
	openUserPage: function() {}
}

var sport_seoul = {
	name: "sport_seoul",
	title: "sportsseoul",
	loginGate: function() {},
	openUserPage: function() {}
}

var samsung_store = {
	name: "samsung_store",
	title: "Samsung_store",
	loginGate: function() {},
	openUserPage: function() {}
}

var theartist = {
	name: "theartist",
	title: "Theartist",
	loginGate: function() {},
	openUserPage: function() {}
}

var economictoday = {
	name: "economictoday",
	title: "Economictoday",
	loginGate: function() {},
	openUserPage: function() {}
}

var dailystage = {
	name: "dailystage",
	title: "Dailystage",
	loginGate: function() {},
	openUserPage: function() {}
}

var dailygaewon = {
	name: "dailygaewon",
	title: "Dailygaewon",
	loginGate: function() {},
	openUserPage: function() {}
}

var eco2day = {
	name: "eco2day",
	title: "Eco2day",
	loginGate: function() {},
	openUserPage: function() {}
}

var etoday = {
	name: "etoday",
	title: "Etoday",
	loginGate: function() {},
	openUserPage: function() {}
}

var womennet = {
	name: "womennet",
	title: "Womennet",
	loginGate: function() {},
	openUserPage: function() {}
}

var columning = {
	name: "columning",
	title: "Columning",
	loginGate: function() {},
	openUserPage: function() {}
}

var ywn25 = {
	name: "ywn25",
	title: "ywn25",
	loginGate: function() {},
	openUserPage: function() {}
}

var latimes = {
	name: "latimes",
	title: "latimes",
	loginGate: function() {},
	openUserPage: function() {}
}

var makeon = {
	name: "makeon",
	title: "makeon",
	loginGate: function() {},
	openUserPage: function() {}
}

var semaseoul = {
	name: "semaseoul",
	title: "semaseoul",
	loginGate: function() {},
	openUserPage: function() {}
}

var boa = {
	name: "boa",
	title: "boa",
	loginGate: function() {},
	openUserPage: function() {}
}

var lifeplanet = {
	name: "lifeplanet",
	title: "Lifeplanet",
	loginGate: function() {},
	openUserPage: function() {}
}

var cmni = {
	name: "cmni",
	title: "Cmni",
	loginGate: function() {},
	openUserPage: function() {}
}

var cctvnews = {
	name: "cctvnews",
	title: "Cctvnews",
	loginGate: function() {},
	openUserPage: function() {}
}

var epnc = {
	name: "epnc",
	title: "Epnc",
	loginGate: function() {},
	openUserPage: function() {}
}

var embeddedworld = {
	name: "embeddedworld",
	title: "Embeddedworld",
	loginGate: function() {},
	openUserPage: function() {}
}

var weddingtv = {
	name: "weddingtv",
	title: "Weddingtv",
	loginGate: function() {},
	openUserPage: function() {}
}

var medimap = {
	name: "medimap",
	title: "Medimap",
	loginGate: function() {},
	openUserPage: function() {}
}

var tvj = {
	name: "tvj",
	title: "Tvj",
	loginGate: function() {},
	openUserPage: function() {}
}

var thegoodinpeople = {
	name: "thegoodinpeople",
	title: "Thegoodinpeople",
	loginGate: function() {},
	openUserPage: function() {}
}

var ybtour = {
	name: "ybtour",
	title: "Ybtour",
	loginGate: function() {},
	openUserPage: function() {}
}

var goodfaith = {
	name: "goodfaith",
	title: "Goodfaith",
	loginGate: function() {},
	openUserPage: function() {}
}

var hynews = {
	name: "hynews",
	title: "Hynews",
	loginGate: function() {},
	openUserPage: function() {}
}

var pping = {
	name: "pping",
	title: "pping",
	loginGate: function() {},
	openUserPage: function() {}
}

var dongbujungang = {
	name: "dongbujungang",
	title: "Dongbujungang",
	loginGate: function() {},
	openUserPage: function() {}
}

var duolac = {
	name: "duolac",
	title: "Duolac",
	loginGate: function() {},
	openUserPage: function() {}
}

var jejuweekly = {
	name: "jejuweekly",
	title: "Jejuweekly",
	loginGate: function() {},
	openUserPage: function() {}
}

var tournews21 = {
	name: "tournews21",
	title: "TourKorea",
	loginGate: function() {},
	openUserPage: function() {}
}

var sportsin = {
	name: "sportsin",
	title: "Sportsin",
	loginGate: function() {},
	openUserPage: function() {}
}

var watsons = {
	name: "watsons",
	title: "Watsons",
	loginGate: function() {},
	openUserPage: function(replyData) {
		window.open('http://watsons.gsretail.com/');
	}
}

var gmaker = {
	name: "gmaker",
	title: "G-maker",
	loginGate: function() {},
	openUserPage: function() {}
}

var tourbaksa = {
	name: "tourbaksa",
	title: "Tourbaksa",
	loginGate: function() {},
	openUserPage: function() {}
}

var godpia = {
	name: "godpia",
	title: "Godpia",
	loginGate: function() {},
	openUserPage: function() {}
}

var catholicpress = {
	name: "catholicpress",
	title: "Catholicpress",
	loginGate: function() {},
	openUserPage: function() {}
}

var incheonilbo = {
	name: "incheonilbo",
	title: "incheonilbo",
	loginGate: function() {},
	openUserPage: function() {}
}

var unaeil = {
	name: "unaeil",
	title: "unaeil",
	loginGate: function() {},
	openUserPage: function() {}
}

var popcard = {
	name: "popcard",
	title: "popcard",
	loginGate: function() {},
	openUserPage: function(replyData) {
		window.open('http://www.popcard.co.kr/');
	}
}

var k_pots = {
	name: "k_pots",
	title: "Kpots",
	loginGate: function() {},
	openUserPage: function() {}
}

var h_dmc = {
	name: "h_dmc",
	title: "h_dmc",
	loginGate: function() {},
	openUserPage: function() {}
}

var spotvnews = {
	name: "spotvnews",
	title: "spotvnews",
	loginGate: function() {},
	openUserPage: function() {}
}

var megastudy = {
	name: "megastudy",
	title: "megastudy",
	loginGate: function() {},
	openUserPage: function() {}
}

var yonginilbo = {
	name: "yonginilbo",
	title: "Yonginilbo",
	loginGate: function() {},
	openUserPage: function() {}
}

var fpn119 = {
	name: "fpn119",
	title: "fpn119",
	loginGate: function() {},
	openUserPage: function() {}
}

var planetsports = {
	name: "planetsports",
	title: "Planetsports",
	loginGate: function() {},
	openUserPage: function() {}
}

var justmedia = {
	name: "justmedia",
	title: "justmedia",
	loginGate: function() {},
	openUserPage: function() {}
}

var boan24 = {
	name: "boan24",
	title: "boan24",
	loginGate: function() {},
	openUserPage: function() {}
}

var viewers = {
	name: "viewers",
	title: "viewers",
	loginGate: function() {},
	openUserPage: function() {}
}

var cjdonors = {
	name: "cjdonors",
	title: "cjdonors",
	loginGate: function() {},
	openUserPage: function() {}
}

var naon = {
	name: "naon",
	title: "naon",
	loginGate: function() {},
	openUserPage: function() {}
}

var geojetimes = {
	name: "geojetimes",
	title: "geojetimes",
	loginGate: function() {},
	openUserPage: function() {}
}

var ilpn = {
	name: "ilpn",
	title: "ilpn",
	loginGate: function() {},
	openUserPage: function() {}
}

var paichainews = {
	name: "paichainews",
	title: "paichainews",
	loginGate: function() {},
	openUserPage: function() {}
}

var tnttour = {
	name: "tnttour",
	title: "tnttour",
	loginGate: function() {},
	openUserPage: function() {}
}

var obsnews = {
	name: "obsnews",
	title: "obsnews",
	loginGate: function() {},
	openUserPage: function() {}
}

var serviceArray = [instagram, kakao, naver, linkedIn, google_plus, twitter, me2day, facebook, facebook_gr, yozm, cyworld, tistory, guest, open_y_jp, open_y, mixi, elle, kyobobook, sunfull, kbs, bongjashop, hopestart, ilovepc, gsretail, mediainnews, dcmcafe, oclock, sangsanguniv, fnnews, nocut, kbsworld_eng, sba, ibk, busancityhall, cdnews, veritas, incable, etomedia, ganghwa114, thefact, sportsseoul, gjfocus, mediawhy, playit, dailylog, citinature, jejuopens, mbn, autoherald, samsungseri, changupcom, headlinejeju, kgnews, focusnews, seoulsba, kbmaeil, geniepark, veritas_a, enterwa, firstlook, gndaily, goodnewspress, sentv, newskorea, asan, newtimes, bundangnews, chungcheongtv, foodnews, ngtv, upkorea, jnuri, andongnews, kyobostory, newshyu, storyk, campustoday, weeklytoday, kban, newsrise, gimpoin, ittoday, gnewsdaily, interfootball, imaeil, daejeonnews, kyeongin, glebbangzip, seongdongnews, hgtimes, vop, hankyung, hk_biz, nahnews, ikoreanspirit, iusm, asiatoday, kgnews2, fntoday, jobnjoy, hankookilbo, cowalknews, domin, seoulmuseum, fundu, jjan, mediatoday, doctorw, munhwa, kookje, dangdangnews, metroseoul, bucheontimes, pressian, digitaltimes, itmaeil, inews24, yonhapnews, asiae, ctjournal, wownet, mediajeju, soulplay, koreajn, etude, stoo, channelit, bulkyo21, sisafocus, industrysolutio, iwet, seoulshinmun, sisain, kolon, daejonilbo, YTmembership, reworks, seoul, happytoday, shopportal, channela, actorbom, kmjnews, joongbooilbo, sisunews, yeowooji, sociallg, ggfocus, gobalnews, newsnjoy, workingilbo, everynews, mbs, han, newshankuk, gnews, chtoday, digue, bizwatch, hknewstoday, sejongpac, newdaily, starsian, newstap, mk, sbs, mrtong, yeongnamilbo, boannews, kukinews, ytn, nonsannews, babynews, zkic, pressbyple, dailian, dhnews, bccard, icross_family, icross_kcr, wolsero, thepr, dailygrid, khgames, pifan, segyecom, happybeangen, busrugy, ohmynews, jungle, busan, samsung_card, cosmopolitan, childfund_seoul, gaonchart, gamemeca, bpnews, newscj, dtnews, cchannel, isori, stckorea, seongjuro, egbsnews, redpiano, mohaji, onlinefair, cledor, ipnnews, edaily, gsinews, amstory, yeongcheon, ibk_give, gybnews, cwin, gimpo, livestarnews, visualdivenews, nongaek, gynews, ujbnews, kgib, healthandpeople, bluekoreadotcom, yachtpia, goodmorningcc, sklte, busancity, badatv, kimponews, toonburi, betanews, newsbaro, rapportian, msf, whysnews, plus_m, m25, doc3news, topgear, tenniskorea, newsjeju, dreamfull, hyundaimnsoft, gijangnews, kceic, kmedinews, iincheon, ebn, sportworldi, amnews, ipcs21, kferi, shnews, iksannews, habitatkorea, vtimes, danceable, youngsamsung2, gg, seoulfuture, samsunglife, gonggamkr, goodneighbors, osan, munhwanews, namdoi, tour2000, gjnewstong, sisajournal, sportsq, woorizine, adrnews, cbsjapan, newsmeka, mbnmoney, timenews, bbangdat, brcity, thefirstmedia, thesejong, lgcare, globalnewsa, healnews, gonggamphoto, siheungjounal, spi, jungculture, espoir, mbc, mainnews, queen, areyou, ksngn, gibnews, khan, cctoday, medicalreport, arte, hanbeot, dmtourmall, wefmall, ecotoday, wbdaily, suomi, jeonbukin, lafent, themetn, lnews, worldkorean, ccej, fullrange, ipopnews, ntoday, yureka, teamandteam, dailycosmetic, csbtv, viva100, kfhi, wisdomhouse, aaf, kofac, babyu, socialdesign, jbpost, thepingpong, soonsports, miral, sport_seoul, samsung_store, economictoday, theartist, etoday, womennet, columning, ywn25, latimes, makeon, semaseoul, boa, lifeplanet, cmni, cctvnews, epnc, embeddedworld, weddingtv, medimap, tvj, thegoodinpeople, ybtour, goodfaith, hynews, pping, dongbujungang, duolac, jejuweekly, tournews21, sportsin, watsons, gmaker, tourbaksa, godpia, catholicpress, incheonilbo, unaeil, popcard, k_pots, spotvnews, megastudy, yonginilbo, fpn119, planetsports, justmedia, boan24, viewers, cjdonors, naon, geojetimes, ilpn, paichainews, tnttour, obsnews];

window.eventBinding = function() {

	window.binded = true;

	/*
	 *	event handlers
	 */
	jQuery(livereLib).bind('livereEvent', function(event, param) {

		if (livereReply == null) return;

		var key = param['key'];
		var value = param['value'];
		var requestData = param['requestData'];

		switch (key) {
			case "commitProperties":
				if (livereLib.util.isTouchDevice()) {
					livereLib.notUseTooltip = true;
					//livereLib.switchMobileView = true;
				}
				livereReply.init();
				break;
			case "livereDataInitComplete":
				// LivereAD
				window.livereAdFlag = false;
				window.liverePvFlag = false;

				livereReply.secondStep();
				livereActionWidzet.start();

				if(livereSharedData.livereReply.consumer_status==1){
					jQuery('#livereWriteForm').remove();
					jQuery('.livereReply_addchild').remove();
				}
				break;
			case "writeFormCreated":
				livereReply.isWriteForm = true;
				break;
			case "livereCreationComplete":
				//livereReply.removeSnsChkbox();
				if (livereReply.isWriteForm) {
					livereReply.drawPrimaryUserData();
				}

				if (!livereLib.util.isEmpty(syncManager.syncMembership) && eval(syncManager.syncMembership).member_islogin == 1 && !livereLib.util.isEmpty(eval(syncManager.syncMembership).member_seq)) {
					syncManager.tryLogin = false;
					syncManager.syncCheck();
				}

				if (window.livereAdFlag === false) {
					livereAD.init();
				}

				liveRePVLog.init();
				break;
			case "processComplete":
				livereLib.processing = false;
				break;
			case "renewMemberData":
				livereReply.setAccounts();
				livereReply.dynamicDeleteBtn();
				//if (livereLib.isLogged()){ jQuery(".livere_loggedSNS.livere_primary button").focus(); }
				break;
			case "livereLogout":
				livereReply.setAccounts();
				livereReply.dynamicDeleteBtn();
				break;
			case "writeDone":
				livereReply.writeDoneComplete(value);
				livereReply.setReply(value);
				break;
			case "getArticleComplete":
				livereReply.getArticleHandler(value);
				break;
			case "getArticleHandlerComplete":
				break;
			case "replyDeleteEvent":
				livereReply.deleteHandler(value);
				break;
			case "actionComplete":
				livereReply.actionCompleteHandler(value, requestData);
				/*jQuery('#livere_police_layer').slideUp(200);*/
				break;
			case "postingLayerCreated" :
				break;
			case "drawABSNSBtnsPrimaryUserDataComplete" :
				break;
			case "livereSmartLoginDrawComplete" :
				break;
			case "drawSNSBtnsComplete" :
				break;
		}
	});
};

var syncManager = new SyncManager();
var livereLib = new LivereLib();
var livereSmartLogin = new LivereSmartLogin();
var livereActionWidzet = new LivereActionWidzet();

var livereSharedData = {};
var livereReply = null;

livereSharedData.url = "//" + livereLib.baseServerURL;
livereSharedData.common = {};
livereSharedData.common.api_login_url = "//" + livereLib.baseServerURL + "/API_Service";
livereSharedData.smartLogin = {};
livereSharedData.livereReply = {};


LiveRePVLog = function() {
	this.init = function() {
		if (window.location.protocol == "https:") {
			return;
		}

		if(!liveRePVLog.isLoaded) {
			liveRePVLog.isLoaded = true;
			liveRePVLog.loaded();

			liveRePVLog.writeForm = jQuery("#livereWriteForm");
			if(liveRePVLog.writeForm.length > 0) {
				jQuery(window).scroll(function() {
					liveRePVLog.writeForm.borderline_top = liveRePVLog.writeForm.offset().top - jQuery(this).height();
					liveRePVLog.writeForm.borderline_bottom = liveRePVLog.writeForm.offset().top + liveRePVLog.writeForm.outerHeight();
					liveRePVLog.writeForm.targetScrollTop = liveRePVLog.writeForm.offset().top - 50;
					liveRePVLog.triggerScrollTop = jQuery(this).scrollTop();

					if(liveRePVLog.triggerScrollTop > liveRePVLog.writeForm.borderline_top
						&& liveRePVLog.triggerScrollTop < liveRePVLog.writeForm.borderline_bottom
						&& !liveRePVLog.isScrollViewChecked) {
							liveRePVLog.isScrollViewChecked = true;
							setTimeout(liveRePVLog.scrollView, 1000);
					}
				}).scroll();
			}
		}
	};

	this.getDevice = function() {
		var strUserAgent = navigator.userAgent.toLowerCase();
		var arrMatches = strUserAgent.match(/(iphone|ipod|ipad)/);
		var arrMatches2 = strUserAgent.match(/(android)/);

		if (arrMatches) {
			// IOS
			return "ios";
		} else if (arrMatches2) {
			// Android
			return "android";
		} else {
			// PC
			return "pc";
		}
	};

	this.loaded = function() {
		var params = {
			"consumer_seq"	: livereSharedData.common.consumer_seq,
			"livere_seq"	: livereSharedData.livereReply.livere_seq,
			"rep_seq"		: livereSharedData.livereReply.rep_data.rep_seq,
			"refer"			: livereSharedData.livereReply.rep_data.refer,
			"device"		: liveRePVLog.getDevice(),
			"target"		: "loaded"
		};

		var url = liveRePVLog.pvLogAPI(params);
		//jQuery.getJSON(url);
	};

	this.scrollView = function(){
		var params = {
			"consumer_seq"	: livereSharedData.common.consumer_seq,
			"livere_seq"	: livereSharedData.livereReply.livere_seq,
			"rep_seq"		: livereSharedData.livereReply.rep_data.rep_seq,
			"refer"			: livereSharedData.livereReply.rep_data.refer,
			"target"		: "scrollview"
		};

		var url = liveRePVLog.pvLogAPI(params);
		jQuery.getJSON(url);
	};

	this.pvLogAPI = function(params) {
		var pvLog_url = "http://121.78.90.104:8383/pv";
		var paramsString = "";

		if (params != null) {
			paramsString = livereLib.util.objectToParameters(params);
		}

		paramsString = paramsString == "" ? "?" : paramsString + "&";
		paramsString += "dummy=" + Math.random() + "&callback=?";

		if (paramsString.indexOf("?") == 0) {
			paramsString = paramsString.substring(1);
		}
		return pvLog_url + "?" + paramsString;
	};
};

var liveRePVLog = new LiveRePVLog();

LivereAD = function() {

	this.init = function(){
		if ( typeof livereSharedData.livereReply.livere_ad != 'undefined' && livereSharedData.livereReply.livere_ad.status == 0 ){

			var ad_data = livereSharedData.livereReply.livere_ad;

			/* GDN */
			if(ad_data.ad_type == 'gdn'){
				jQuery("#"+livereSharedData.livereReply.livere_data.targetDiv).before(livereAD.gdnAdFactory(ad_data));
			/* CRITEO */
			}else if(ad_data.ad_type == 'criteo'){
				jQuery("#"+livereSharedData.livereReply.livere_data.targetDiv).before(livereAD.criteoAdFactory(ad_data));
            /* TG */
			}else if(ad_data.ad_type == 'tg'){
				jQuery("#"+livereSharedData.livereReply.livere_data.targetDiv).before(livereAD.tgAdFactory(ad_data));
            /* REAL CLICK */
			}else if(ad_data.ad_type == 'rc'){
				jQuery("#"+livereSharedData.livereReply.livere_data.targetDiv).before(livereAD.rcAdFactory(ad_data));
			/* adop */
			}else if(ad_data.ad_type == 'adop'){
				jQuery("#"+livereSharedData.livereReply.livere_data.targetDiv).before(livereAD.adopFactory(ad_data));
			}
			window.livereAdFlag = true;
		}
	};

	this.tgAdFactory = function(ad_data) {
		var zoneid = ad_data.zone_id;
		if( livereLib.util.isTouchDevice() && ad_data.mobile_zone_id != '' ) {
			zoneid = ad_data.mobile_zone_id;
		}
		var tg_u = (location.protocol=='https:'?'https://adtg.widerplanet.com/delivery/wfr.php':'http://adtg.widerplanet.com/delivery/wfr.php');
		var tg_html = '<div id="livere_ad" style="width:100%; text-align:center; margin-bottom:5px; display:inline-block;">';
		tg_html += "<ifr" + "ame frameborder='0' scrolling='no' border='0' marginwidth='0' marginheight='0' width='100%' height='90' src='"+tg_u;
		tg_html += "?zoneid="+zoneid;
		tg_html += '&cb=' + Math.floor(Math.random()*99999999999);
		tg_html += (document.charset ? '&charset='+document.charset : (document.characterSet ? '&charset='+document.characterSet : ''));
		tg_html += "&loc=" + escape(window.location);
		if (document.referrer) tg_html += "&referer=" + escape(document.referrer);
		if (document.title) tg_html += "&title=" + escape(document.title);
		if (document.mmm_fo) tg_html += "&mmm_fo=1";
		tg_html += "'><\/ifr"+"ame></div>";
		return tg_html;
	};

	this.gdnAdFactory = function(ad_data) {
		var html = "";
		if( livereLib.util.isTouchDevice() ) {
			html += '<div id="livere_ad" style="width:100%; text-align:center; margin-bottom:5px; display:inline-block;""><script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script> <!-- ADCIZ_MO --> <ins class="adsbygoogle"style="display:inline-block;width:'+ad_data.width+'px;height:'+ad_data.height+'px"data-ad-client="'+ad_data.adunit_id+'"data-ad-slot="'+ad_data.mobile_zone_id+'"></ins> <script> (adsbygoogle = window.adsbygoogle || []).push({}); </script></div>';
		}else{
			html += '<div id="livere_ad" style="width:100%; text-align:center; margin-bottom:5px; display:inline-block;""><script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script> <!-- ADCIZ_PC --> <ins class="adsbygoogle"style="display:block"data-ad-client="'+ad_data.adunit_id+'"data-ad-slot="'+ad_data.zone_id+'"data-ad-format="horizontal"></ins> <script> (adsbygoogle = window.adsbygoogle || []).push({}); </script></div>';
		}
		return html;
	};

	this.criteoAdFactory = function(ad_data) {
		var html = "";
		if( livereLib.util.isTouchDevice() && ad_data.mobile_iframe_id != '' ) {
			html += "<div id='livere_ad' style='width:100%; text-align:center; margin-bottom:5px; display:inline-block;'><iframe id='" + ad_data.mobile_iframe_id + "' name='" + ad_data.mobile_iframe_id + "' src='http://cas.criteo.com/delivery/afr.php?zoneid=" + ad_data.mobile_zone_id + "&ct0=INSERT_CLICK_URL' framespacing='0' frameborder='no' scrolling='no' width='"+ad_data.width+"' height='"+ad_data.height+"'></iframe></div>";
		}else if(livereLib.util.isTouchDevice() && ad_data.mobile_iframe_id == ''){
			return html;
		}else{
			html += "<div id='livere_ad' style='width:100%; text-align:center; margin-bottom:5px; display:inline-block;'><iframe id='" + ad_data.iframe_id + "' name='" + ad_data.iframe_id + "' src='http://cas.criteo.com/delivery/afr.php?zoneid=" + ad_data.zone_id + "&ct0=INSERT_CLICK_URL' framespacing='0' frameborder='no' scrolling='no' width='"+ad_data.width_pc+"' height='"+ad_data.height_pc+"'></iframe></div>";
		}
		return html;
	};

	this.rcAdFactory = function(ad_data) {
		var html = "";
		if( livereLib.util.isTouchDevice()) {
			html += "<div id='livere_ad' style='width:100%; text-align:center; margin-bottom:5px; display:inline-block;'><iframe src='http://adv.realclick.co.kr/ad_headcopy/remon_czon" + ad_data.mobile_zone_id + "_iframe.html' width='"+ad_data.width+"' height='"+ad_data.height+"' frameborder='0' marginwidth='0' marginheight='0' topmargin='0' scrolling='no' align='center'></iframe></div>";
		}else{
			html += "<div id='livere_ad' style='width:100%; text-align:center; margin-bottom:5px; display:inline-block;'><iframe src='http://click.realclick.co.kr/ad_headcopy/czon" + ad_data.zone_id + "_iframe.html' width='"+ad_data.width_pc+"' height='"+ad_data.height_pc+"' frameborder='0' marginwidth='0' marginheight='0' topmargin='0' scrolling='no' align='center'></iframe></div>";
		}
		return html;
	};

	this.adopFactory = function(ad_data) {
		var html = "";
		if( livereLib.util.isTouchDevice()) {
			html += "<iframe id='" + ad_data.mobile_iframe_id+ "' name='" + ad_data.mobile_iframe_id + "' src='http://ads-optima.com/www/delivery/afr.php?zoneid=" + ad_data.mobile_zone_id + "&loc=" + encodeURIComponent(window.location.href) + "' frameborder='0' scrolling='no' width='" + ad_data.width + "' height='" + ad_data.height + "'><a href='http://ads-optima.com/www/delivery/ck.php?n=" + ad_data.adunit_id.split('|')[1] + "&amp;cb=INSERT_RANDOM_NUMBER_HERE' target='_blank'><img src='http://ads-optima.com/www/delivery/avw.php?zoneid=" + ad_data.mobile_zone_id + "&amp;cb=INSERT_RANDOM_NUMBER_HERE&amp;n=" + ad_data.adunit_id.split('|')[1] + "' border='0' alt='' /></a></iframe>";
		}else{
			html += "<iframe id='" + ad_data.iframe_id + "' name='" + ad_data.iframe_id + "' src='http://ads-optima.com/www/delivery/afr.php?zoneid=" + ad_data.zone_id + "&loc=" + encodeURIComponent(window.location.href) + "' frameborder='0' scrolling='no' width='" + ad_data.width_pc + "' height='"+ ad_data.height_pc +"'><a href='http://ads-optima.com/www/delivery/ck.php?n=" + ad_data.adunit_id.split('|')[0] + "&amp;cb=INSERT_RANDOM_NUMBER_HERE' target='_blank'><img src='http://ads-optima.com/www/delivery/avw.php?zoneid=" + ad_data.zone_id + "&amp;cb=INSERT_RANDOM_NUMBER_HERE&amp;n=" + ad_data.adunit_id.split('|')[0] + "' border='0' alt='' /></a></iframe>";
		}
		return html;
	};
};

var livereAD = new LivereAD();