<cfcomponent displayname="userRole" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="rbac.userRole.userRole" output="false">
		<cfargument name="user_id" type="string" required="false" default="" />
		<cfargument name="role_id" type="string" required="false" default="" />
		<cfargument name="tenant_id" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setuser_id(arguments.user_id) />
		<cfset setrole_id(arguments.role_id) />
		<cfset settenant_id(arguments.tenant_id) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="rbac.userRole.userRole" output="false">
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
		
		<!--- tenant_id --->
		<cfif (len(trim(gettenant_id())) AND NOT isNumeric(trim(gettenant_id())))>
			<cfset thisError.field = "tenant_id" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "tenant_id is not numeric" />
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

	<cffunction name="setrole_id" access="public" returntype="void" output="false">
		<cfargument name="role_id" type="string" required="true" />
		<cfset variables.instance.role_id = arguments.role_id />
	</cffunction>
	<cffunction name="getrole_id" access="public" returntype="string" output="false">
		<cfreturn variables.instance.role_id />
	</cffunction>

	<cffunction name="settenant_id" access="public" returntype="void" output="false">
		<cfargument name="tenant_id" type="string" required="true" />
		<cfset variables.instance.tenant_id = arguments.tenant_id />
	</cffunction>
	<cffunction name="gettenant_id" access="public" returntype="string" output="false">
		<cfreturn variables.instance.tenant_id />
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
