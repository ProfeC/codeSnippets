<cfcomponent displayname="reCAPTCHA CFC" hint="I help you use & consume the reCAPTCHA service">
	<cfscript>
		// constants
		this.CHALLENGE_URL = "http://api.recaptcha.net";
		this.SSL_CHALLENGE_URL = "https://api-secure.recaptcha.net";
		this.VERIFY_URL = "http://api-verify.recaptcha.net/verify";
		
		// vars
		VARIABLES.privateKey = "";
		VARIABLES.publicKey = "";
	</cfscript>
	
	<cffunction name="init" hint="I initialize the reCAPTCHA service" returntype="reCaptcha">
		<cfargument name="privateKey" type="string" required="true" />
		<cfargument name="publicKey" type="string" required="true" />
		
		<cfset VARIABLES.privateKey = ARGUMENTS.privateKey />
		<cfset VARIABLES.publicKey = ARGUMENTS.publicKey />
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="render" hint="I display the reCAPTCHA form" output="true" returntype="void">
		<cfargument name="ssl" type="boolean" default="false" required="true" hint="Set true if form on ssl page to use secured version of reCAPTCHA API and avoid browser complaints. default false" />
		<cfargument name="theme" type="string" default="red" required="true" hint="red|white|blackgrass default red.  Changes look of reCAPTCHA form field." />
		<cfargument name="tabIndex" type="numeric" required="false" />
		
		<cfif ARGUMENTS.ssl>
			<cfset VARIABLES.apiURL = this.SSL_CHALLENGE_URL />
		<cfelse>
			<cfset VARIABLES.apiURL = this.CHALLENGE_URL />
		</cfif>
		
		<cfoutput>
		<script type="text/javascript">
		<!--
			var RecaptchaOptions = {
			   theme : '#ARGUMENTS.theme#'
			   <cfif isDefined("ARGUMENTS.tabIndex")>,tabindex : #ARGUMENTS.tabIndex#</cfif>
			};
		//-->
		</script>
		<script type="text/javascript"
		   src="#VARIABLES.apiURL#/challenge?k=#VARIABLES.publicKey#">
		</script>
		<noscript>
		   <iframe src="#VARIABLES.apiURL#/noscript?k=#VARIABLES.publicKey#"
		       height="300" width="500" frameborder="0"></iframe><br>
		   <textarea name="recaptcha_challenge_field" rows="3" cols="40">
		   </textarea>
		   <input type="hidden" name="recaptcha_response_field"
		       value="manual_challenge">
		</noscript>
		</cfoutput>
	</cffunction>
	
	<cffunction name="check" returntype="boolean" hint="I check the captcha">
		<cfargument name="recaptcha_challenge_field" type="string" hint="Pass me the value of FORM.recaptcha_challenge_field" />
		<cfargument name="recaptcha_response_field" type="string" hint="Pass me the value of FORM.recaptcha_response_field" />
		
		<cftry>
			<cfhttp url="#this.VERIFY_URL#" method="post" timeout="5" throwonerror="true">
				<cfhttpparam type="formfield" name="privatekey" value="#VARIABLES.privateKey#">
				<cfhttpparam type="formfield" name="remoteip" value="#cgi.REMOTE_ADDR#">
				<cfhttpparam type="formfield" name="challenge" value="#ARGUMENTS.recaptcha_challenge_field#">
				<cfhttpparam type="formfield" name="response" value="#ARGUMENTS.recaptcha_response_field#">
			</cfhttp>
		<cfcatch>
			<cfthrow  type="RECAPTCHA_NO_SERVICE"
				message="recaptcha: unable to contact recaptcha verification service on url '#this.VERIFY_URL#'">
		</cfcatch>
		</cftry>
	
		<cfset VARIABLES.aResponse = listToArray(cfhttp.fileContent, chr(10))>
	
		<cfif VARIABLES.aResponse[1] eq "false" and VARIABLES.aResponse[2] neq "incorrect-captcha-sol">
			<cfthrow type="RECAPTCHA_VERIFICATION_FAILURE"
				message="recaptcha: the verification service responded with error '#aResponse[2]#'. See http://recaptcha.net/apidocs/captcha/ for error meanings.">
		</cfif>
		
		<cfreturn VARIABLES.aResponse[1] />
	</cffunction>
</cfcomponent>