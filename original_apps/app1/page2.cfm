<cfsilent><cfscript>
	request.uri = GetPageContext().GetRequest().GetRequestURI();
	request.template = ListLast(request.uri, '/');

	thenav = {
		1: { name: 'Home', link: 'index.cfm' }
		, 2: { name: 'Page 1', link: 'page1.cfm' }
		, 3: { name: 'Page 2', link: 'page2.cfm' }
	};

	navitems = StructSort(thenav, 'textnocase', 'asc', 'name');
</cfscript></cfsilent>
<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>App1 : Page2.cfm</title>
	<meta name="description" content="">
	<meta name="keywords" content="">

	<link rel="stylesheet" href="app1.css">

	<!--- IE SHIM - for IE6-8 support of HTML5 elements --->
	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

</head>
<body>
	<div class="app1">

		<!-- HEADER -->
			<header>
				<h1>App1</h1>
				<h2>Uber Simple</h2>

				<!-- NAV -->
					<nav>
						<ul class="nav nav-tabs">
							<cfloop array="#navitems#" index="navindex">
								<cfsilent><cfscript>
									// class assignment
									thisclass = request.template == thenav[navindex]['link']
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

				<article>

					<h3>Page2.cfm</h3>
					<p><em>Page2.cfm stuff goes here</em></p>

					<div class="alert alert-info">
						<form action="./page2.cfm" method="post">
							<input type="text" name="somefield" value="" placeholder="Enter something...">
							<input type="submit" value="Submit">
						</form>
					</div>

					<cfif !StructIsEmpty(form)>
						<div class="alert alert-success">
							<h4>Form Results</h4>
							<cfdump var="#form#" />
						</div>
					</cfif>

					<p>Cras interdum turpis non cursus placerat. Etiam et massa diam. Suspendisse ut dapibus nibh. Cras at condimentum arcu, pharetra dignissim lorem. Aenean nec molestie massa. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Suspendisse nec enim lobortis, fringilla dui eu, fermentum lorem. Nulla fringilla, elit ut vehicula ultrices, diam mauris euismod arcu, sed elementum metus nisi nec orci. Nullam mollis mi felis, quis auctor nisi hendrerit nec. Phasellus varius, nibh et feugiat tempus, risus leo fermentum dolor, sed convallis diam tortor vel erat. Maecenas dolor nisl, rhoncus sed facilisis quis, sodales vel urna. Mauris ut velit sagittis, condimentum ligula quis, ullamcorper lorem.</p>

				</article>

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
</body>
</html>
</cfoutput>