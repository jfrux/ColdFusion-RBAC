<cfcomponent displayname="session" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="org.session.session" output="false">
		<cfargument name="id" type="string" required="false" default="" />
		<cfargument name="name" type="string" required="false" default="" />
		<cfargument name="created" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setid(arguments.id) />
		<cfset setname(arguments.name) />
		<cfset setcreated(arguments.created) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="org.session.session" output="false">
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
		
		<!--- id --->
		<cfif (len(trim(getid())) AND NOT isNumeric(trim(getid())))>
			<cfset thisError.field = "id" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "id is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- name --->
		<cfif (NOT len(trim(getname())))>
			<cfset thisError.field = "name" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "name is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getname())) AND NOT IsSimpleValue(trim(getname())))>
			<cfset thisError.field = "name" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "name is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getname())) GT 255)>
			<cfset thisError.field = "name" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "name is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- created --->
		<cfif (len(trim(getcreated())) AND NOT isDate(trim(getcreated())))>
			<cfset thisError.field = "created" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "created is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<cfreturn errors />
	</cffunction>

	<!---
	ACCESSORS
	--->
	<cffunction name="setid" access="public" returntype="void" output="false">
		<cfargument name="id" type="string" required="true" />
		<cfset variables.instance.id = arguments.id />
	</cffunction>
	<cffunction name="getid" access="public" returntype="string" output="false">
		<cfreturn variables.instance.id />
	</cffunction>

	<cffunction name="setname" access="public" returntype="void" output="false">
		<cfargument name="name" type="string" required="true" />
		<cfset variables.instance.name = arguments.name />
	</cffunction>
	<cffunction name="getname" access="public" returntype="string" output="false">
		<cfreturn variables.instance.name />
	</cffunction>

	<cffunction name="setcreated" access="public" returntype="void" output="false">
		<cfargument name="created" type="string" required="true" />
		<cfset variables.instance.created = arguments.created />
	</cffunction>
	<cffunction name="getcreated" access="public" returntype="string" output="false">
		<cfreturn variables.instance.created />
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
