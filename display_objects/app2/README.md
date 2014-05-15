# Instructions for app2

* Copy the following method and paste into the SITE `eventHandler.cfc`
```
public any function onSite404($, event) {
	var local = {};
	local.stopNode = 'app2';
	request.appPath = '';

	if ( 
		StructKeyExists(request, 'currentfilenameadjusted') 
		&& Len(request.currentfilenameadjusted) 
	) {
		local.list = request.currentfilenameadjusted;

		// does the currentfilenameadjusted contain the stopNode?
		local.listindex = ListFindNoCase(local.list, local.stopNode, '/');

		// identify how long the list is _after_ the stopNode
		if ( local.listindex ) {
			local.listlen = ListLen(local.list, '/');

			// if true, then we're actually trying to get content from our app
			// so, set a variable that's accessible in our app
			if ( local.listlen > local.listindex ) {

				local.newfilename = '';
				for ( i=1; i<=local.listindex; i++ ) {
					local.newfilename = ListAppend(local.newfilename, ListGetAt(local.list, i, '/'), '/');
				}

				for ( i=local.listindex+1; i <= local.listlen; i++ ) {
					request.appPath = ListAppend(request.appPath, ListGetAt(local.list, i, '/'), '/');
				}

				local.newcontentbean = $.getBean('content').loadBy(filename=local.newfilename);

				if ( !local.newcontentbean.getIsNew() ) {
					event.setValue('contentBean', local.newcontentbean);
				}

			} // @endif app.listlen > app.listindex

		} // @endif local.listindex

	} // @endif request.currentfilenameadjusted
} // @end onSite404
```

* You can now include the application into Mura CMS using the following syntax:
	`#$.dspThemeInclude('display_objects/app2/index.cfm')#`

* If adding to a Mura content item's Body area via the HTML Editor (CKEditor), use:
	`[m]$.dspThemeInclude('display_objects/app2/index.cfm')[/m]`