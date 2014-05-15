<cfsilent><cfscript>
	request.uri = GetPageContext().GetRequest().GetRequestURI();
	request.template = ListLast(request.uri, '/');

	thenav = {
		1: { name: 'Home', link: '/index.cfm' }
		, 2: { name: 'Page 1', link: '/folder1/index.cfm' }
		, 3: { name: 'Page 2', link: '/folder2/index.cfm' }
	};

	navitems = StructSort(thenav, 'textnocase', 'asc', 'name');
</cfscript></cfsilent>
<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>App2 : Folder2/index.cfm</title>
	<meta name="description" content="">
	<meta name="keywords" content="">

	<!--- IE SHIM - for IE6-8 support of HTML5 elements --->
	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">

	<!-- Optional theme -->
	<link rel="stylesheet" href="/assets/bootstrap/css/bootstrap-theme.min.css">

	<!-- Latest compiled and minified JavaScript -->
	<script src="/assets/bootstrap/js/bootstrap.min.js"></script>

	<!-- Custom Overrides -->
	<link rel="stylesheet" href="/assets/css/simple.css">
	<script src="/assets/js/simple.js"></script>

</head>
<body>
	<div class="app2">

		<!-- HEADER -->
			<header>
				<h1>App2</h1>
				<h2>With Subfolders</h2>

				<!-- NAV -->
					<nav>
						<ul class="nav nav-tabs">
							<cfloop array="#navitems#" index="navindex">
								<cfsilent><cfscript>
									// class assignment
									thisclass = request.uri == thenav[navindex]['link']
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

					<h3>Folder2/index.cfm</h3>
					<p><em>Folder2/index.cfm stuff goes here</em></p>

					<div class="alert alert-info">
						<form action="./index.cfm" method="post" role="form">
							<div class="form-group">
								<input type="text" name="somefield" value="" placeholder="Enter something..." class="form-control">
							</div>
							<input type="submit" value="Submit" class="btn">
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
	<!-- // app2 // -->
</body>
</html>
</cfoutput>