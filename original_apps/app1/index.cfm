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
	<title>App1 : Home</title>
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

					<h3>Home.cfm</h3>
					<p><em>Home.cfm stuff goes here</em></p>

					<p><strong>This is <em>index.cfm</em></strong>. This is a <em>page1.cfm to page2.cfm</em> example. No subfolders here.</p>

					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec at augue semper, tempor tortor ac, aliquet nunc. Aenean ut ligula risus. Aliquam at tortor gravida, consequat nulla nec, lacinia dolor. Cras congue, dui vitae suscipit dignissim, nisi augue sodales velit, eu sodales neque neque placerat enim. Quisque vulputate lorem in sem viverra vestibulum ut in dui. Sed enim orci, gravida a egestas eu, consequat sit amet orci. Suspendisse potenti.</p>

					<p>Nunc ac ullamcorper lacus. Vestibulum et nisl porta, scelerisque nisl ut, consequat lacus. In vehicula, neque vitae posuere venenatis, nisi dui dapibus eros, in ultrices dui tortor ac enim. Integer quis purus sit amet urna rutrum laoreet. Duis dictum, leo sit amet feugiat vehicula, ipsum lacus pharetra lorem, in vehicula libero nisi sit amet sem. Fusce scelerisque tincidunt consequat. Praesent quis pulvinar magna. Pellentesque pharetra ornare lacus, vitae faucibus elit rutrum in. Proin ornare augue tortor, ut congue lectus faucibus ac. Vestibulum eget ligula vel massa ullamcorper aliquet sit amet non velit. Aliquam a mi elementum, posuere tellus ac, molestie velit. Duis rhoncus adipiscing faucibus.</p>

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