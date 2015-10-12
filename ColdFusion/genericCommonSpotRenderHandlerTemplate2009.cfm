<!---
Author: Gary L. Clark, II (GLC2)
Name: {use file name here!}
Purporse / Summary:
    This will render the default layout for any Service element page.

Input Parameters:
    /* list any input parameters that might be required for this script to work. */

Action:
    /* describe what type of action there is when this script runs */

Needs Work:
    /* add any items that "needs to be done" in this file */

Copyright 2009, Seton Hall University. All Rights Reserved.
--->

<!--- set the standard element variables and utilize the revised render handler --->
<cfset rhObj = request.csUtils.rhObj.init(attributes.elementinfo)>
<cfset items = rhObj.getElementData("custom")> <!--- returns an array of items --->
 
<!--- Dump the object to get the field names: --->
<!--- <cfdump var="#items#" expand="false" name="Item Structure" /> --->

<!--- set the ghost caption for new content --->
<cfset attributes.elementdata.ghostcaption = "<br /><span class='CS_Default_GhostText'>Use the &quot;Edit&quot; icon to enter the service information for this page.</span>">


<!--- this will provide a line break so the controls are easier to get to in author and edit modes. --->
<cfif #request.renderState.renderMode# is not "read">
    <cfoutput><br style="line-height:5px" /></cfoutput>
</cfif>

<!--- set the default variables that we will use in our template/render handler/script --->



￼{ Insert your code here… }



<!--- If we are not in read mode, dump out the variables & values for the element --->
<!---
<cfparam name="url.debug" default="0">
<cfif (#request.renderState.renderMode# is not "read") and (#session.user.groupList# contains 7)>
    <cfswitch expression="#url.debug#">
        <cfcase value="serviceDefault">
	    <cfoutput><br /></cfoutput>
			<!-- - <cfdump var="#elementData#" expand="false" label="Element Data"> - -->
			<!-- - <cfdump var="#elementInfo.renderHandlerMetaData#" expand="no" label="Render Handler Meta Data"> - -->
			<cfdump var="#rhObj#" expand="false" label="Element Info">
			<cfdump var="#request#" expand="false" label="Request Information">
        </cfcase>
        <cfdefaultcase>
		    <cfoutput><br /><em style="color:##f00">To see debug information for this element, add the url parameter "debug=serviceDefault"</em>
            </cfoutput>
        </cfdefaultcase>
    </cfswitch>
</cfif>
--->
