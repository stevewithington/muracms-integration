<cfsilent><cfscript>
	request.uri = GetPageContext().GetRequest().GetRequestURI();
	request.template = ListLast(request.uri, '/');

	thenav = {
		1: { name: 'Home', link: '/app2/index.cfm' }
		, 2: { name: 'Page 1', link: '/app2/folder1/index.cfm' }
		, 3: { name: 'Page 2', link: '/app2/folder2/index.cfm' }
	};

	navitems = StructSort(thenav, 'textnocase', 'asc', 'name');
</cfscript></cfsilent>
<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>App2 : Folder1/index.cfm</title>
	<meta name="description" content="">
	<meta name="keywords" content="">

	<!--- IE SHIM - for IE6-8 support of HTML5 elements --->
	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="/app2/assets/bootstrap/css/bootstrap.min.css">

	<!-- Optional theme -->
	<link rel="stylesheet" href="/app2/assets/bootstrap/css/bootstrap-theme.min.css">

	<!-- Latest compiled and minified JavaScript -->
	<script src="/app2/assets/bootstrap/js/bootstrap.min.js"></script>

	<!-- Custom Overrides -->
	<link rel="stylesheet" href="/app2/assets/css/simple.css">
	<script src="/app2/assets/js/simple.js"></script>

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

					<h3>Folder1/index.cfm</h3>
					<p><em>Folder1/index.cfm stuff goes here</em></p>

					<p>Donec dignissim eget velit ut imperdiet. Curabitur condimentum, orci at tincidunt consequat, orci eros interdum felis, non convallis purus orci id felis. Vivamus odio neque, condimentum et commodo non, consectetur sed augue. Nunc adipiscing, quam in semper facilisis, nibh erat tempor est, ac dignissim diam purus quis mauris. Mauris eu congue neque. Cras nec sodales odio. Pellentesque hendrerit orci nulla, eu lobortis odio gravida et. Aliquam interdum blandit ante, nec imperdiet nulla venenatis id.</p>

					<p>Integer vitae venenatis dui. Mauris euismod adipiscing nibh eu dapibus. Nulla pellentesque leo id erat porttitor gravida. Integer rhoncus felis tellus. Duis quis sodales purus. Morbi ornare massa sed nunc pretium pharetra. Etiam posuere dolor vitae velit eleifend suscipit.</p>

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