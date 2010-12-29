<cfcomponent
	displayname="Application"
	output="true"
	hint="This is for testing the RBAC API, you would use your own MVC or application framework for this.">
 
	<cfset THIS.Name = "RBAC CFC Example System" />
	<cfset THIS.ApplicationTimeout = CreateTimeSpan( 0, 0, 1, 0 ) />
	<cfset THIS.SessionManagement = true />
	<cfset THIS.SetClientCookies = false />
 
	<cfsetting
		requesttimeout="20"
		showdebugoutput="false"
		enablecfoutputonly="false"
		/>
 
 
	<cffunction
		name="OnApplicationStart"
		access="public"
		returntype="boolean"
		output="false"
		hint="Fires when the application is first created.">
 
		<!--- Return out. --->
		<cfreturn true />
	</cffunction>
 
 
	<cffunction
		name="OnSessionStart"
		access="public"
		returntype="void"
		output="false"
		hint="Fires when the session is first created.">
 
		<!--- Return out. --->
		<cfreturn />
	</cffunction>
 
 
	<cffunction
		name="OnRequestStart"
		access="public"
		returntype="boolean"
		output="false"
		hint="Fires at first part of page processing.">
 
		<!--- Define arguments. --->
		<cfargument
			name="TargetPage"
			type="string"
			required="true"
			/>
 
		<!--- Return out. --->
		<cfreturn true />
	</cffunction>
 
 
	<cffunction
		name="OnRequest"
		access="public"
		returntype="void"
		output="true"
		hint="Fires after pre page processing is complete.">
 
		<cfargument
			name="TargetPage"
			type="string"
			required="true"
			/>
 
		<cfinclude template="#ARGUMENTS.TargetPage#" />
 
		<cfreturn />
	</cffunction>
 
 
	<cffunction name="OnRequestEnd" access="public" returntype="void"
		output="true"
		hint="Fires after the page processing is complete.">
 
		<cfreturn />
	</cffunction>
 
 
	<cffunction name="OnSessionEnd"	access="public"	returntype="void" output="false" hint="Fires when the session is terminated.">
		<cfargument name="SessionScope" type="struct" required="true" />
 
		<cfargument name="ApplicationScope" type="struct" required="false" default="#StructNew()#" />
 
		<cfreturn />
	</cffunction>
 
 
	<cffunction
		name="OnApplicationEnd"
		access="public"
		returntype="void"
		output="false"
		hint="Fires when the application is terminated.">
 
		<cfargument
			name="ApplicationScope"
			type="struct"
			required="false"
			default="#StructNew()#"
			/>
 
		<cfreturn />
	</cffunction>
 
 
	<cffunction
		name="OnError"
		access="public"
		returntype="void"
		output="true"
		hint="Fires when an exception occures that is not caught by a try/catch.">
 
		<cfargument
			name="Exception"
			type="any"
			required="true"
			/>
 
		<cfargument
			name="EventName"
			type="string"
			required="false"
			default=""
			/>
 
		<cfreturn />
	</cffunction>
 
</cfcomponent>