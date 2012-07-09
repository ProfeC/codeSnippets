/*
* OHSU Font Changer and JavaScripts (???)
* Clipped on 20110701 @ 11:46.
*/

jQuery(document).ready(function () {
	var cookieSize = readCookie('ohsutextsize');
	//alert('cookie size is ' + cookieSize);
	if (cookieSize > 1) {
		if (cookieSize > 1.4) {
			//alert('cookie size is max - ' + cookieSize);
			jQuery('span#fontersize a.textmax').addClass("active");
			}
		else {
			//alert('cookie size is medium - ' + cookieSize);
			jQuery('span#fontersize a.textmed').addClass("active");
		}
	}
	else {
		//alert('cookie size is regular - ' + cookieSize);
		jQuery('span#fontersize a.textreg').addClass("active");
	}
	
      	jQuery("span#fontersize a").bind('click', function() {
  		jQuery("span#fontersize a").removeClass("active");
  		jQuery(this).addClass("active");
  		return false;
  		});
  	});

function goToPage(page) {
	window.location = page;
}

function readCookie(name) {
	var nameEQ = name + '=';
	var ca = document.cookie.split(';');
	for(var i=0;i < ca.length;i++) {
		var c = ca[i];
		while (c.charAt(0)==' ') c = c.substring(1,c.length);
		if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
	}
	return null;
}

function fsize(size,line,unit,id,id2,label,trackIt){
	var wturl = '/xd/about/services/technology/webstrategies/knowledgebase/faq/browser-accessibility.cfm';
	var wttitle = 'Web Browser Accessibility Controls';
	var section = document.getElementById(id);
	var othersection = document.getElementById(id2);
	if(section){
		section.style.fontSize = size + unit;
		section.style.lineHeight = line + unit;
	}
	if(othersection){
		othersection.style.fontSize = size + unit;
		othersection.style.lineHeight = line + unit;
	}
	if(trackIt) {
		_tag.dcsMultiTrack('DCSext.textsize',label,'DCS.dcsuri',wturl,'WT.ti',wttitle);
	}
	makeCookies(size,line);
}

function makeCookies(size,line){
	createCookie('ohsutextsize', size, 365);
	createCookie('ohsulinesize', line, 365);
}

function createCookie(name,value,days) {
	if(days) {
		var date = new Date();
		date.setTime(date.getTime()+(days*24*60*60*1000));
		var expires = '; expires='+date.toGMTString();
	}
	else var expires = '';
	document.cookie = name+'='+value+expires+'; path=/';
}
