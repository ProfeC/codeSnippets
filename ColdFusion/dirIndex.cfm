<!---
Project Name: 
File Name: dirIndex.cfm

Created by Gary L. Clark, II on 9/25/08 at 4:13 PM.
Copyright (c) 2008 Seton Hall University. All rights reserved.

Author: Gary L. Clark, II
Name: dirIndex.cfm
Purporse / Summary:
	

Input Parameters:
/* list any input parameters that might be required for this script to work. */

Action:
/* describe what type of action there is when this script runs */

Needs Work:
/* add any items that "needs to be done" in this file */

History:
	9/25/08 at 4:13 PM - clarkgar - Created

Copyright 2008, Seton Hall University. All Rights Reserved.
--->

<!--- Set Variables --->


<!--- Your Code Here --->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title><cfoutput>#Replace(cgi.script_name, "dirIndex.cfm", "")#</cfoutput></title>
		<style type="text/css">
			body,td { font-family: verdana; padding: 2px 0px 2px 0px; color:silver;  } 
			th { border-bottom: 1px solid silver;text-align:left;margin-bottom: 2px; color:black; }
			a.sort { text-decoration: none;	color: silver; }
			a:hover { background-color: blue; color: white;	}
			p { font-size: x-small; }
		</style>
	</head>
	
	<body>
		<cfparam name="url.sort" default="datelastmodified desc">
		<cfdirectory directory="#ExpandPath("./")#" action="list" name="dir" sort="#url.sort#">

		<table width="100%" cellpadding="0" cellspacing="0">
			<tr>
				<th>Name <a href="?sort=name" class="sort" title="Sort By Name">∨</a></th>
				<th>Size (bytes) <a href="?sort=size" class="sort" title="Sort By Size">∨</a></th>
				<th>Last Modified <a href="?sort=datelastmodified+desc" class="sort" title="Sort By Date">∨</a></th>
			</tr>
			<cfoutput query="dir">
			<cfif dir.name IS NOT "index.cfm">
			<tr>
				<td><a href="#dir.name#">#dir.name#</a></td>
				<td>#dir.size#</td>
				<td>#dir.datelastmodified#</td>
			</tr>
			</cfif>
			</cfoutput>
		</table>
		<p>Directory Browser by <a href="http://www.petefreitag.com/">Pete Freitag</a></p>
	</body>
</html>