# New CMS & Legacy Apps; Don't Re-Write — Integrate!
_Presented by:_ [Steve Withington](http://stephenwithington.com)

## Session Description
When adding a new CMS to your website or intranet, you might think you need to rewrite your legacy applications. With Mura CMS, it's simple and fast to integrate with existing applications - we'll show you how.

### In this session:
* A short overview of Mura CMS
* Programming options for integrating with your legacy applications
* Quick-start plugins for your next application

## Repository Info
This repository contains code examples used throughout the presentation. Please feel free to submit any questions via the [Issues area](https://github.com/stevewithington/cfobjective-2014/issues).

## Folders & Files
* app1
	* An uber simple example of a `page1.cfm` to `page2.cfm` type of application

* app2
	* A slightly more structured example of an application that uses directories to segregate content (e.g., `/books/index.cfm`, `/products/index.cfm`, etc.)

* app3
	* This application uses an `Application.cfc` file

* display_objects
	* These are integration examples at a *theme* level
	* Copy the folders located under `display_objects` and paste into theme's `display_objects` directory
	* Add the following method to the THEME `eventHandler.cfc`
	```
	public any function onApplicationLoad($) {
		var handler = new display_objects.app3.app3eventHandler();
		arguments.$.getBean('pluginManager').addEventHandler(handler, $.event('SiteID'));
	}
	```
	* Reload Mura CMS
	* You can now include any of the applications into Mura CMS using the following syntax:
		`#$.dspThemeInclude('display_objects/app1/index.cfm')#`
	* If adding to a Mura content item's Body area via the HTML Editor (CKEditor), use:
		`[m]$.dspThemeInclude('display_objects/app1/index.cfm')[/m]`

## Quick Start Plugins
Detailed below are some Mura CMS plugins that you can use to get your next application off the ground fast and easy.

### MuraPlugin
Simple starter plugin to jumpstart your next Mura CMS plugin.

* [https://github.com/stevewithington/MuraPlugin](https://github.com/stevewithington/MuraPlugin)
* Features:
	* Uses an `Application.cfc`
	* Provides simple access control to the plugin's admin area
	* Automatically makes the **Mura $cope** and **pluginConfig** available throughout the application
	* `EventHandler.cfc` pre-wired, so you can simply drop your eventHooks in
	* `contentRenderer.cfc` methods are automatically available via `$.pluginName.yourMethod()`
	* Example display objects, including one using a 'configurator'

### MuraFW1
This Mura CMS plugin uses [FW/1 - Framework One](https://github.com/framework-one/fw1) as its application framework.

* [https://github.com/stevewithington/MuraFW1](https://github.com/stevewithington/MuraFW1)
* Intended to be used by experienced CFML developers and those familiar with FW/1.

### Slatwall
A flexible, open-source eCommerce platform. Use as a Mura CMS plugin, or even standalone.

* [Slatwall site](http://www.getslatwall.com)
* [Github repository](https://github.com/ten24/Slatwall)

### Other Plugins
A number of popular plugins can be found at [http://www.getmura.com/downloads/mura-cms-plugins/](http://www.getmura.com/downloads/mura-cms-plugins/) or by searching [Github.com](https://github.com/search?q=Mura&type=Repositories&ref=advsearch&l=ColdFusion). Several of the more popular/useful plugins are highlighted below.

* [MuraUserBridge](https://github.com/blueriver/MuraUserBridge)
	* Simple plugin template for authenticating users against an external user repository (e.g., Active Directory)
* [MuraTranslations](https://github.com/blueriver/MuraTranslations)
	* Manages translations between multiple Mura CMS sites and locales
* [MuraSolr](https://github.com/blueriver/MuraSolr)
	* Enhances the default Mura CMS site search using built in CFML SOLR support
* [MuraElasticSearch](https://github.com/nsollecito/MuraElasticSearch)
	* Written by Nick Sollecito from Scientific American
	* Built on top of Apache Lucene, Elasticsearch is a flexible and powerful open source, distributed, real-time search and analytics engine. Ability to move easily beyond simple full-text search.
* [MuraLocations](https://github.com/stevewithington/MuraLocations)
	* Allows content managers to add/edit Locations which can then be displayed on a Google Map.
	* Allows end-users to either use their current location or enter their address to obtain a list of the 'closest' locations.
* [MuraGist](https://github.com/stevewithington/MuraGist)
	* Enables content managers to create, manage, and display Gists within their content.
* [MuraDisqus](https://github.com/stevewithington/MuraDisqus)
	* Adds [Disqus](http://disqus.com/) comments to your site.
* [MuraGoogleCalendar](https://github.com/stevewithington/MuraGoogleCalendar)
	* Displays events from a public Google Calendar.
	* Leverages the FullCalendar jQuery plugin
* [MuraPlayer](https://github.com/stevewithington/MuraPlayer)
	* Wraps the JW Player (v5) for Flash and HTML5 to enable embedding video in a Mura site quickly and easily.