<cfsilent><cfscript>
	// Since this will be included in the context of a front-end request, 
	// we'll have access to the Mura $cope!

	param name='url.debug' default=false;

	request.requestURI = GetPageContext().GetRequest().GetRequestURI();
		request.uri = Right(request.requestURI, 1) == '/' 
			? request.requestURI & 'index.cfm' 
			: request.requestURI;
		request.template = ListLast(request.uri, '/');

	thenav = {
		1: { name: 'Home', link: $.content('url') & 'index.cfm' }
		, 2: { name: 'Page 1', link: $.content('url') & 'page1.cfm' }
		, 3: { name: 'Page 2', link: $.content('url') & 'page2.cfm' }
	};

	navitems = StructSort(thenav, 'textnocase', 'asc', 'name');
</cfscript></cfsilent>
<cfoutput>
	<div class="app1">

		<!-- HEADER -->
			<header>
				<h2>Uber Simple</h2>

				<!-- NAV -->
					<nav>
						<ul class="nav nav-tabs">
							<cfloop array="#navitems#" index="navindex">
								<cfsilent><cfscript>
									// class assignment
									thisclass = request.uri == thenav[navindex]['link']
										|| ( request.template == 'app1' && thenav[navindex]['name'] == 'Home' )
										? 'active'
										: '';
								</cfscript></cfsilent>
								<li class="#thisclass#">
									<a href="#thenav[navindex]['link']#">
										#thenav[navindex]['name']#
									</a>
								</li>
							</cfloop>
						</ul>
					</nav>
				<!-- // NAV // -->

			</header>
		<!-- // HEADER // -->

		<!-- PAGE/BODY OUTPUT -->
			<section>
				<!--- Check to see if we're on the application's Home page or not --->
				<cfif ListFindNoCase('app1,index.cfm', request.template)>
					<cfinclude template="home.cfm" />
				<cfelse>

					<!--- NOT on App Home Page --->
					<cftry>
						<cfinclude template="#request.template#" />
						<cfcatch>
							<!--- you could log the uri, requested template, etc. here --->
							<cfif url.debug>
								<cfdump var="#cfcatch#" />
							<cfelse>
								<cftry>
									<cfinclude template="404.cfm" />
									<cfcatch>
										<h1>404</h1>
									</cfcatch>
								</cftry>
							</cfif>
						</cfcatch>
					</cftry>

				</cfif>

			</section>
		<!-- // PAGE/BODY OUTPUT -->

		<!-- FOOTER -->
			<footer>
				<hr>
				<p><small>&copy; #Year(Now())# Stephen J. Withington, Jr.</small></p>
			</footer>
		<!-- // FOOTER // -->

	</div>
	<!-- // app1 // -->
</cfoutput>