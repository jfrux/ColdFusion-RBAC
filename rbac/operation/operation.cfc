<cfcomponent displayname="operation" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="rbac.operation.operation" output="false">
		<cfargument name="id" type="string" required="false" default="" />
		<cfargument name="name" type="string" required="false" default="" />
		<cfargument name="description" type="string" required="false" default="" />
		<cfargument name="_create" type="string" required="false" default="" />
		<cfargument name="_read" type="string" required="false" default="" />
		<cfargument name="_update" type="string" required="false" default="" />
		<cfargument name="_delete" type="string" required="false" default="" />
		<cfargument name="locked" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setid(arguments.id) />
		<cfset setname(arguments.name) />
		<cfset setdescription(arguments.description) />
		<cfset set_create(arguments._create) />
		<cfset set_read(arguments._read) />
		<cfset set_update(arguments._update) />
		<cfset set_delete(arguments._delete) />
		<cfset setlocked(arguments.locked) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="rbac.operation.operation" output="false">
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
		<cfif (len(trim(getname())) GT 50)>
			<cfset thisError.field = "name" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "name is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- description --->
		<cfif (len(trim(getdescription())) AND NOT IsSimpleValue(trim(getdescription())))>
			<cfset thisError.field = "description" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "description is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getdescription())) GT 63000)>
			<cfset thisError.field = "description" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "description is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- _create --->
		<cfif (len(trim(get_create())) AND NOT isNumeric(trim(get_create())))>
			<cfset thisError.field = "_create" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "_create is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- _read --->
		<cfif (len(trim(get_read())) AND NOT isNumeric(trim(get_read())))>
			<cfset thisError.field = "_read" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "_read is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- _update --->
		<cfif (len(trim(get_update())) AND NOT isNumeric(trim(get_update())))>
			<cfset thisError.field = "_update" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "_update is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- _delete --->
		<cfif (len(trim(get_delete())) AND NOT isNumeric(trim(get_delete())))>
			<cfset thisError.field = "_delete" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "_delete is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- locked --->
		<cfif (len(trim(getlocked())) AND NOT isNumeric(trim(getlocked())))>
			<cfset thisError.field = "locked" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "locked is not numeric" />
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

	<cffunction name="setdescription" access="public" returntype="void" output="false">
		<cfargument name="description" type="string" required="true" />
		<cfset variables.instance.description = arguments.description />
	</cffunction>
	<cffunction name="getdescription" access="public" returntype="string" output="false">
		<cfreturn variables.instance.description />
	</cffunction>

	<cffunction name="set_create" access="public" returntype="void" output="false">
		<cfargument name="_create" type="string" required="true" />
		<cfset variables.instance._create = arguments._create />
	</cffunction>
	<cffunction name="get_create" access="public" returntype="string" output="false">
		<cfreturn variables.instance._create />
	</cffunction>

	<cffunction name="set_read" access="public" returntype="void" output="false">
		<cfargument name="_read" type="string" required="true" />
		<cfset variables.instance._read = arguments._read />
	</cffunction>
	<cffunction name="get_read" access="public" returntype="string" output="false">
		<cfreturn variables.instance._read />
	</cffunction>

	<cffunction name="set_update" access="public" returntype="void" output="false">
		<cfargument name="_update" type="string" required="true" />
		<cfset variables.instance._update = arguments._update />
	</cffunction>
	<cffunction name="get_update" access="public" returntype="string" output="false">
		<cfreturn variables.instance._update />
	</cffunction>

	<cffunction name="set_delete" access="public" returntype="void" output="false">
		<cfargument name="_delete" type="string" required="true" />
		<cfset variables.instance._delete = arguments._delete />
	</cffunction>
	<cffunction name="get_delete" access="public" returntype="string" output="false">
		<cfreturn variables.instance._delete />
	</cffunction>

	<cffunction name="setlocked" access="public" returntype="void" output="false">
		<cfargument name="locked" type="string" required="true" />
		<cfset variables.instance.locked = arguments.locked />
	</cffunction>
	<cffunction name="getlocked" access="public" returntype="string" output="false">
		<cfreturn variables.instance.locked />
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
