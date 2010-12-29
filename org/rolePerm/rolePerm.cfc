<cfcomponent displayname="rolePerm" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="org.rolePerm.rolePerm" output="false">
		<cfargument name="role_id" type="string" required="false" default="" />
		<cfargument name="permission_id" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setrole_id(arguments.role_id) />
		<cfset setpermission_id(arguments.permission_id) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="org.rolePerm.rolePerm" output="false">
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
		
		<!--- permission_id --->
		<cfif (NOT len(trim(getpermission_id())))>
			<cfset thisError.field = "permission_id" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "permission_id is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getpermission_id())) AND NOT isNumeric(trim(getpermission_id())))>
			<cfset thisError.field = "permission_id" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "permission_id is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setrole_id" access="public" returntype="void" output="false">
		<cfargument name="role_id" type="string" required="true" />
		<cfset variables.instance.role_id = arguments.role_id />
	</cffunction>
	<cffunction name="getrole_id" access="public" returntype="string" output="false">
		<cfreturn variables.instance.role_id />
	</cffunction>

	<cffunction name="setpermission_id" access="public" returntype="void" output="false">
		<cfargument name="permission_id" type="string" required="true" />
		<cfset variables.instance.permission_id = arguments.permission_id />
	</cffunction>
	<cffunction name="getpermission_id" access="public" returntype="string" output="false">
		<cfreturn variables.instance.permission_id />
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
