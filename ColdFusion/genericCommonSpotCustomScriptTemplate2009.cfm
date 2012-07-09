<!---
Author: Gary L. Clark, II (GLC2)
Name: {use the file name here!}
Purporse / Summary:
    {describe the purpose/summary for this file}

Input Parameters:
    /* list any input parameters that might be required for this script to work. */

Action:
    /* describe what type of action there is when this script runs */

Needs Work:
    /* add any items that "needs to be done" in this file */

Copyright 2009, Seton Hall University. All Rights Reserved.
--->

<!--- Set Variables --->
<cfparam name="attributes.x" default="">
<cfparam name="attributes.y" default="">
<cfparam name="attributes.z" default="">



{ Insert Your Code Here... }
￼


<!---cfdump var="#attributes#" expand="false" /--->
<!--- If we are not in read mode, dump out the variables & values for the element --->
<!---
<cfparam name="url.debug" default="0">
<cfif (#request.renderState.renderMode# is not "read") and (#session.user.groupList# contains 7)>
    <cfswitch expression="#url.debug#">
        <cfcase value="{some value}">
	    <cfoutput><br /></cfoutput>
			<!-- - <cfdump var="#elementData#" expand="false" label="Element Data"> - -->
			<!-- - <cfdump var="#elementInfo.renderHandlerMetaData#" expand="no" label="Render Handler Meta Data"> - -->
			<cfdump var="#rhObj#" expand="false" label="Element Info">
			<cfdump var="#request#" expand="false" label="Request Information">
        </cfcase>
        <cfdefaultcase>
		    <cfoutput><br /><em style="color:##f00">To see debug information for this element, add the url parameter "debug={some value}"</em>
            </cfoutput>
        </cfdefaultcase>
    </cfswitch>
</cfif>
--->