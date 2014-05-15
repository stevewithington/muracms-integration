# Instructions for app3

* Add the following method to the THEME `eventHandler.cfc`
```
public any function onApplicationLoad($) {
	var handler = new display_objects.app3.app3eventHandler();
	arguments.$.getBean('pluginManager').addEventHandler(handler, $.event('SiteID'));
}
```
* Reload Mura CMS
* You can now include any of the applications into Mura CMS using the following syntax:
	`#$.dspThemeInclude('display_objects/app3/index.cfm')#`
* If adding to a Mura content item's Body area via the HTML Editor (CKEditor), use:
	`[m]$.dspThemeInclude('display_objects/app3/index.cfm')[/m]`