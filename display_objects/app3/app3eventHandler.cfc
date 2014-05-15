component extends='mura.cfobject' output=false {

	public any function onSiteRequestStart($) {
		// StopNodes : Mura nodes where we have placed our display object
		request.listStopNodes = 'app2,app3';

		request.requestURI = GetPageContext().GetRequest().GetRequestURI();
		request.uri = Right(request.requestURI, 1) == '/' 
			? request.requestURI & 'index.cfm' 
			: request.requestURI;
		request.template = ListLast(request.uri, '/');
	}

  public any function onRenderStart($) {
  	param name='url.debug' default='false';

  	request.thenav = {
			1: { name: 'Home', link: '#$.content('url')#index.cfm' }
			, 2: { name: 'Page 1', link: '#$.content('url')#folder1/index.cfm' }
			, 3: { name: 'Page 2', link: '#$.content('url')#folder2/index.cfm' }
		};

		request.navitems = StructSort(request.thenav, 'textnocase', 'asc', 'name');
  }

  public any function onSite404($, event) {
		var local = {};
		local.stopNodes = StructKeyExists(request, 'listStopNodes') ? request.listStopNodes : '';
		request.appPath = '';

		if ( 
			StructKeyExists(request, 'currentfilenameadjusted') 
			&& Len(request.currentfilenameadjusted) 
		) {
			local.list = request.currentfilenameadjusted;

			// Does the URL contain a stopNode? 
			local.common = ListCommon(local.list, ListChangeDelims(local.stopNodes, '/'), '/');

			if ( Len(local.common) ) {
				local.listindex = ListFindNoCase(local.list, local.common, '/');

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

			} // @endif Len(local.common)

		} // @endif request.currentfilenameadjusted

	} // @end onSite404


	// Helpers ********************************************************************

	/**
	* Returns 'list1' items ALSO found in 'list2'
	*/
	public any function listCommon(string list1='', string list2='', string delim=',') {
		var arr1 = ListToArray(arguments.list1, arguments.delim);
		var arr2 = ListToArray(arguments.list2, arguments.delim);

		arr1.retainAll(arr2);

		return ArrayToList(arr1, arguments.delim);
	}

	/**
	* Returns 'list1' items NOT found in 'list2'
	*/
	public any function listUncommon(string list1='', string list2='', string delim=',') {
		var arr1 = ListToArray(arguments.list1, arguments.delim);
		var arr2 = ListToArray(arguments.list2, arguments.delim);

		arr1.removeAll(arr2);

		return ArrayToList(arr1, arguments.delim);
	}
 
}