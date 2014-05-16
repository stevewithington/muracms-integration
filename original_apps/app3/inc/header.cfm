<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>App3 : Home</title>
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
	<div class="app3">

		<!-- HEADER -->
			<header>
				<h1>App3</h1>
				<h2>With Subfolders &amp; Application.cfc</h2>

				<!-- NAV -->
					<nav>
						<ul class="nav nav-tabs">
							<cfloop array="#request.navitems#" index="navindex">
								<cfsilent><cfscript>
									// class assignment
									thisclass = request.uri == request.thenav[navindex]['link']
										? 'active'
										: '';
								</cfscript></cfsilent>
								<li class="#thisclass#">
									<a href="#request.thenav[navindex]['link']#">
										#request.thenav[navindex]['name']#
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

					<cfif StructKeyExists(url, 'dump')>
						<cfdump var="#application#" label="APPLICATION SCOPE" />
						<cfdump var="#request#" label="REQUEST SCOPE" />
					</cfif>
</cfoutput>