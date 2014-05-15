component output=false {

	this.name = 'App3';

	public any function onApplicationStart() {
		return true;
	}

	public any function onRequestStart(required string targetPage) {

		if ( StructKeyExists(url, 'init') ) {
			onApplicationStart();
		}

		request.uri = GetPageContext().GetRequest().GetRequestURI();
		request.template = ListLast(request.uri, '/');

		request.thenav = {
			1: { name: 'Home', link: '/app3/index.cfm' }
			, 2: { name: 'Page 1', link: '/app3/folder1/index.cfm' }
			, 3: { name: 'Page 2', link: '/app3/folder2/index.cfm' }
		};

		request.navitems = StructSort(request.thenav, 'textnocase', 'asc', 'name');

		return true;
	}

}