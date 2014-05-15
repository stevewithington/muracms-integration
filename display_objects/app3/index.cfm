<cfoutput>
	<!--- Check to see if we're on the application's Home page or not --->
	<cfif !StructKeyExists(request, 'appPath')>
		<cfinclude template="home.cfm" />
	<cfelse>
		<!--- NOT on App Home Page --->
		<cftry>
			<cfinclude template="#request.appPath#/#request.template#" />
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
</cfoutput>