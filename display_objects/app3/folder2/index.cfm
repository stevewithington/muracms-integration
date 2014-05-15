<cfoutput>
	<cfinclude template="../inc/header.cfm" />

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

	<cfinclude template="../inc/footer.cfm" />
</cfoutput>