<cfcomponent displayname="userSession" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="rbac.userSession.userSession" output="false">
		<cfargument name="user_id" type="string" required="false" default="" />
		<cfargument name="session_id" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setuser_id(arguments.user_id) />
		<cfset setsession_id(arguments.session_id) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="rbac.userSession.userSession" output="false">
		<cfargument name="memento" type="struct" required="yes"/>
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>
	<cffunction name="getMemento" access="public" returntype="struct" output="false" >
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="validate" access="public" returntype="array" output="false">
		<cfset var errors = arrayNew(1) />
		<cfset var thisError = structNew() />
		
		<!--- user_id --->
		<cfif (NOT len(trim(getuser_id())))>
			<cfset thisError.field = "user_id" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "user_id is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getuser_id())) AND NOT isNumeric(trim(getuser_id())))>
			<cfset thisError.field = "user_id" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "user_id is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- session_id --->
		<cfif (NOT len(trim(getsession_id())))>
			<cfset thisError.field = "session_id" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "session_id is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getsession_id())) AND NOT isNumeric(trim(getsession_id())))>
			<cfset thisError.field = "session_id" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "session_id is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setuser_id" access="public" returntype="void" output="false">
		<cfargument name="user_id" type="string" required="true" />
		<cfset variables.instance.user_id = arguments.user_id />
	</cffunction>
	<cffunction name="getuser_id" access="public" returntype="string" output="false">
		<cfreturn variables.instance.user_id />
	</cffunction>

	<cffunction name="setsession_id" access="public" returntype="void" output="false">
		<cfargument name="session_id" type="string" required="true" />
		<cfset variables.instance.session_id = arguments.session_id />
	</cffunction>
	<cffunction name="getsession_id" access="public" returntype="string" output="false">
		<cfreturn variables.instance.session_id />
	</cffunction>


	<!---
	DUMP
	--->
	<cffunction name="dump" access="public" output="true" return="void">
		<cfargument name="abort" type="boolean" default="false" />
		<cfdump var="#variables.instance#" />
		<cfif arguments.abort>
			<cfabort />
		</cfif>
	</cffunction>

</cfcomponent>
