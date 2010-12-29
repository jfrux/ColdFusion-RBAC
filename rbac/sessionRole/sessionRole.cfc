<cfcomponent displayname="sessionRole" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="rbac.sessionRole.sessionRole" output="false">
		<cfargument name="session_id" type="string" required="false" default="" />
		<cfargument name="role_id" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setsession_id(arguments.session_id) />
		<cfset setrole_id(arguments.role_id) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="rbac.sessionRole.sessionRole" output="false">
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
		
		<!--- role_id --->
		<cfif (NOT len(trim(getrole_id())))>
			<cfset thisError.field = "role_id" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "role_id is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getrole_id())) AND NOT isNumeric(trim(getrole_id())))>
			<cfset thisError.field = "role_id" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "role_id is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setsession_id" access="public" returntype="void" output="false">
		<cfargument name="session_id" type="string" required="true" />
		<cfset variables.instance.session_id = arguments.session_id />
	</cffunction>
	<cffunction name="getsession_id" access="public" returntype="string" output="false">
		<cfreturn variables.instance.session_id />
	</cffunction>

	<cffunction name="setrole_id" access="public" returntype="void" output="false">
		<cfargument name="role_id" type="string" required="true" />
		<cfset variables.instance.role_id = arguments.role_id />
	</cffunction>
	<cffunction name="getrole_id" access="public" returntype="string" output="false">
		<cfreturn variables.instance.role_id />
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
