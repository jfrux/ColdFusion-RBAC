<cfcomponent displayname="tenant" output="false">
	<!---
	PROPERTIES
	--->
	<cfset variables.instance = StructNew() />

	<!---
	INITIALIZATION / CONFIGURATION
	--->
	<cffunction name="init" access="public" returntype="rbac.tenant.tenant" output="false">
		<cfargument name="id" type="string" required="false" default="" />
		<cfargument name="name" type="string" required="false" default="" />
		<cfargument name="tenantkind_id" type="string" required="false" default="" />
		<cfargument name="address1" type="string" required="false" default="" />
		<cfargument name="address2" type="string" required="false" default="" />
		<cfargument name="address3" type="string" required="false" default="" />
		<cfargument name="city" type="string" required="false" default="" />
		<cfargument name="state" type="string" required="false" default="" />
		<cfargument name="postalcode" type="string" required="false" default="" />
		<cfargument name="country" type="string" required="false" default="" />
		<cfargument name="phone1" type="string" required="false" default="" />
		<cfargument name="phone2" type="string" required="false" default="" />
		<cfargument name="phone3" type="string" required="false" default="" />
		<cfargument name="fax1" type="string" required="false" default="" />
		<cfargument name="fax2" type="string" required="false" default="" />
		<cfargument name="uuid" type="string" required="false" default="" />
		<cfargument name="created" type="string" required="false" default="" />
		<cfargument name="createdby" type="string" required="false" default="" />
		<cfargument name="updated" type="string" required="false" default="" />
		<cfargument name="updatedby" type="string" required="false" default="" />
		<cfargument name="deleted" type="string" required="false" default="" />
		<cfargument name="deletedflag" type="string" required="false" default="" />
		<cfargument name="deletedby" type="string" required="false" default="" />
		
		<!--- run setters --->
		<cfset setid(arguments.id) />
		<cfset setname(arguments.name) />
		<cfset settenantkind_id(arguments.tenantkind_id) />
		<cfset setaddress1(arguments.address1) />
		<cfset setaddress2(arguments.address2) />
		<cfset setaddress3(arguments.address3) />
		<cfset setcity(arguments.city) />
		<cfset setstate(arguments.state) />
		<cfset setpostalcode(arguments.postalcode) />
		<cfset setcountry(arguments.country) />
		<cfset setphone1(arguments.phone1) />
		<cfset setphone2(arguments.phone2) />
		<cfset setphone3(arguments.phone3) />
		<cfset setfax1(arguments.fax1) />
		<cfset setfax2(arguments.fax2) />
		<cfset setuuid(arguments.uuid) />
		<cfset setcreated(arguments.created) />
		<cfset setcreatedby(arguments.createdby) />
		<cfset setupdated(arguments.updated) />
		<cfset setupdatedby(arguments.updatedby) />
		<cfset setdeleted(arguments.deleted) />
		<cfset setdeletedflag(arguments.deletedflag) />
		<cfset setdeletedby(arguments.deletedby) />
		
		<cfreturn this />
 	</cffunction>

	<!---
	PUBLIC FUNCTIONS
	--->
	<cffunction name="setMemento" access="public" returntype="rbac.tenant.tenant" output="false">
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
		<cfif (len(trim(getname())) GT 150)>
			<cfset thisError.field = "name" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "name is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- tenantkind_id --->
		<cfif (NOT len(trim(gettenantkind_id())))>
			<cfset thisError.field = "tenantkind_id" />
			<cfset thisError.type = "required" />
			<cfset thisError.message = "tenantkind_id is required" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(gettenantkind_id())) AND NOT isNumeric(trim(gettenantkind_id())))>
			<cfset thisError.field = "tenantkind_id" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "tenantkind_id is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- address1 --->
		<cfif (len(trim(getaddress1())) AND NOT IsSimpleValue(trim(getaddress1())))>
			<cfset thisError.field = "address1" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "address1 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getaddress1())) GT 150)>
			<cfset thisError.field = "address1" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "address1 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- address2 --->
		<cfif (len(trim(getaddress2())) AND NOT IsSimpleValue(trim(getaddress2())))>
			<cfset thisError.field = "address2" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "address2 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getaddress2())) GT 150)>
			<cfset thisError.field = "address2" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "address2 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- address3 --->
		<cfif (len(trim(getaddress3())) AND NOT IsSimpleValue(trim(getaddress3())))>
			<cfset thisError.field = "address3" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "address3 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getaddress3())) GT 150)>
			<cfset thisError.field = "address3" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "address3 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- city --->
		<cfif (len(trim(getcity())) AND NOT IsSimpleValue(trim(getcity())))>
			<cfset thisError.field = "city" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "city is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getcity())) GT 150)>
			<cfset thisError.field = "city" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "city is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- state --->
		<cfif (len(trim(getstate())) AND NOT IsSimpleValue(trim(getstate())))>
			<cfset thisError.field = "state" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "state is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getstate())) GT 255)>
			<cfset thisError.field = "state" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "state is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- postalcode --->
		<cfif (len(trim(getpostalcode())) AND NOT IsSimpleValue(trim(getpostalcode())))>
			<cfset thisError.field = "postalcode" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "postalcode is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getpostalcode())) GT 10)>
			<cfset thisError.field = "postalcode" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "postalcode is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- country --->
		<cfif (len(trim(getcountry())) AND NOT IsSimpleValue(trim(getcountry())))>
			<cfset thisError.field = "country" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "country is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getcountry())) GT 150)>
			<cfset thisError.field = "country" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "country is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- phone1 --->
		<cfif (len(trim(getphone1())) AND NOT IsSimpleValue(trim(getphone1())))>
			<cfset thisError.field = "phone1" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "phone1 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getphone1())) GT 50)>
			<cfset thisError.field = "phone1" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "phone1 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- phone2 --->
		<cfif (len(trim(getphone2())) AND NOT IsSimpleValue(trim(getphone2())))>
			<cfset thisError.field = "phone2" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "phone2 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getphone2())) GT 50)>
			<cfset thisError.field = "phone2" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "phone2 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- phone3 --->
		<cfif (len(trim(getphone3())) AND NOT IsSimpleValue(trim(getphone3())))>
			<cfset thisError.field = "phone3" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "phone3 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getphone3())) GT 50)>
			<cfset thisError.field = "phone3" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "phone3 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- fax1 --->
		<cfif (len(trim(getfax1())) AND NOT IsSimpleValue(trim(getfax1())))>
			<cfset thisError.field = "fax1" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "fax1 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getfax1())) GT 50)>
			<cfset thisError.field = "fax1" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "fax1 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- fax2 --->
		<cfif (len(trim(getfax2())) AND NOT IsSimpleValue(trim(getfax2())))>
			<cfset thisError.field = "fax2" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "fax2 is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getfax2())) GT 50)>
			<cfset thisError.field = "fax2" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "fax2 is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- uuid --->
		<cfif (len(trim(getuuid())) AND NOT IsSimpleValue(trim(getuuid())))>
			<cfset thisError.field = "uuid" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "uuid is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getuuid())) GT )>
			<cfset thisError.field = "uuid" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "uuid is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- created --->
		<cfif (len(trim(getcreated())) AND NOT isDate(trim(getcreated())))>
			<cfset thisError.field = "created" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "created is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- createdby --->
		<cfif (len(trim(getcreatedby())) AND NOT isNumeric(trim(getcreatedby())))>
			<cfset thisError.field = "createdby" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "createdby is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- updated --->
		<cfif (len(trim(getupdated())) AND NOT isDate(trim(getupdated())))>
			<cfset thisError.field = "updated" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "updated is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- updatedby --->
		<cfif (len(trim(getupdatedby())) AND NOT isNumeric(trim(getupdatedby())))>
			<cfset thisError.field = "updatedby" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "updatedby is not numeric" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- deleted --->
		<cfif (len(trim(getdeleted())) AND NOT isDate(trim(getdeleted())))>
			<cfset thisError.field = "deleted" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "deleted is not a date" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- deletedflag --->
		<cfif (len(trim(getdeletedflag())) AND NOT IsSimpleValue(trim(getdeletedflag())))>
			<cfset thisError.field = "deletedflag" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "deletedflag is not a string" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		<cfif (len(trim(getdeletedflag())) GT 1)>
			<cfset thisError.field = "deletedflag" />
			<cfset thisError.type = "tooLong" />
			<cfset thisError.message = "deletedflag is too long" />
			<cfset arrayAppend(errors,duplicate(thisError)) />
		</cfif>
		
		<!--- deletedby --->
		<cfif (len(trim(getdeletedby())) AND NOT isNumeric(trim(getdeletedby())))>
			<cfset thisError.field = "deletedby" />
			<cfset thisError.type = "invalidType" />
			<cfset thisError.message = "deletedby is not numeric" />
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

	<cffunction name="settenantkind_id" access="public" returntype="void" output="false">
		<cfargument name="tenantkind_id" type="string" required="true" />
		<cfset variables.instance.tenantkind_id = arguments.tenantkind_id />
	</cffunction>
	<cffunction name="gettenantkind_id" access="public" returntype="string" output="false">
		<cfreturn variables.instance.tenantkind_id />
	</cffunction>

	<cffunction name="setaddress1" access="public" returntype="void" output="false">
		<cfargument name="address1" type="string" required="true" />
		<cfset variables.instance.address1 = arguments.address1 />
	</cffunction>
	<cffunction name="getaddress1" access="public" returntype="string" output="false">
		<cfreturn variables.instance.address1 />
	</cffunction>

	<cffunction name="setaddress2" access="public" returntype="void" output="false">
		<cfargument name="address2" type="string" required="true" />
		<cfset variables.instance.address2 = arguments.address2 />
	</cffunction>
	<cffunction name="getaddress2" access="public" returntype="string" output="false">
		<cfreturn variables.instance.address2 />
	</cffunction>

	<cffunction name="setaddress3" access="public" returntype="void" output="false">
		<cfargument name="address3" type="string" required="true" />
		<cfset variables.instance.address3 = arguments.address3 />
	</cffunction>
	<cffunction name="getaddress3" access="public" returntype="string" output="false">
		<cfreturn variables.instance.address3 />
	</cffunction>

	<cffunction name="setcity" access="public" returntype="void" output="false">
		<cfargument name="city" type="string" required="true" />
		<cfset variables.instance.city = arguments.city />
	</cffunction>
	<cffunction name="getcity" access="public" returntype="string" output="false">
		<cfreturn variables.instance.city />
	</cffunction>

	<cffunction name="setstate" access="public" returntype="void" output="false">
		<cfargument name="state" type="string" required="true" />
		<cfset variables.instance.state = arguments.state />
	</cffunction>
	<cffunction name="getstate" access="public" returntype="string" output="false">
		<cfreturn variables.instance.state />
	</cffunction>

	<cffunction name="setpostalcode" access="public" returntype="void" output="false">
		<cfargument name="postalcode" type="string" required="true" />
		<cfset variables.instance.postalcode = arguments.postalcode />
	</cffunction>
	<cffunction name="getpostalcode" access="public" returntype="string" output="false">
		<cfreturn variables.instance.postalcode />
	</cffunction>

	<cffunction name="setcountry" access="public" returntype="void" output="false">
		<cfargument name="country" type="string" required="true" />
		<cfset variables.instance.country = arguments.country />
	</cffunction>
	<cffunction name="getcountry" access="public" returntype="string" output="false">
		<cfreturn variables.instance.country />
	</cffunction>

	<cffunction name="setphone1" access="public" returntype="void" output="false">
		<cfargument name="phone1" type="string" required="true" />
		<cfset variables.instance.phone1 = arguments.phone1 />
	</cffunction>
	<cffunction name="getphone1" access="public" returntype="string" output="false">
		<cfreturn variables.instance.phone1 />
	</cffunction>

	<cffunction name="setphone2" access="public" returntype="void" output="false">
		<cfargument name="phone2" type="string" required="true" />
		<cfset variables.instance.phone2 = arguments.phone2 />
	</cffunction>
	<cffunction name="getphone2" access="public" returntype="string" output="false">
		<cfreturn variables.instance.phone2 />
	</cffunction>

	<cffunction name="setphone3" access="public" returntype="void" output="false">
		<cfargument name="phone3" type="string" required="true" />
		<cfset variables.instance.phone3 = arguments.phone3 />
	</cffunction>
	<cffunction name="getphone3" access="public" returntype="string" output="false">
		<cfreturn variables.instance.phone3 />
	</cffunction>

	<cffunction name="setfax1" access="public" returntype="void" output="false">
		<cfargument name="fax1" type="string" required="true" />
		<cfset variables.instance.fax1 = arguments.fax1 />
	</cffunction>
	<cffunction name="getfax1" access="public" returntype="string" output="false">
		<cfreturn variables.instance.fax1 />
	</cffunction>

	<cffunction name="setfax2" access="public" returntype="void" output="false">
		<cfargument name="fax2" type="string" required="true" />
		<cfset variables.instance.fax2 = arguments.fax2 />
	</cffunction>
	<cffunction name="getfax2" access="public" returntype="string" output="false">
		<cfreturn variables.instance.fax2 />
	</cffunction>

	<cffunction name="setuuid" access="public" returntype="void" output="false">
		<cfargument name="uuid" type="string" required="true" />
		<cfset variables.instance.uuid = arguments.uuid />
	</cffunction>
	<cffunction name="getuuid" access="public" returntype="string" output="false">
		<cfreturn variables.instance.uuid />
	</cffunction>

	<cffunction name="setcreated" access="public" returntype="void" output="false">
		<cfargument name="created" type="string" required="true" />
		<cfset variables.instance.created = arguments.created />
	</cffunction>
	<cffunction name="getcreated" access="public" returntype="string" output="false">
		<cfreturn variables.instance.created />
	</cffunction>

	<cffunction name="setcreatedby" access="public" returntype="void" output="false">
		<cfargument name="createdby" type="string" required="true" />
		<cfset variables.instance.createdby = arguments.createdby />
	</cffunction>
	<cffunction name="getcreatedby" access="public" returntype="string" output="false">
		<cfreturn variables.instance.createdby />
	</cffunction>

	<cffunction name="setupdated" access="public" returntype="void" output="false">
		<cfargument name="updated" type="string" required="true" />
		<cfset variables.instance.updated = arguments.updated />
	</cffunction>
	<cffunction name="getupdated" access="public" returntype="string" output="false">
		<cfreturn variables.instance.updated />
	</cffunction>

	<cffunction name="setupdatedby" access="public" returntype="void" output="false">
		<cfargument name="updatedby" type="string" required="true" />
		<cfset variables.instance.updatedby = arguments.updatedby />
	</cffunction>
	<cffunction name="getupdatedby" access="public" returntype="string" output="false">
		<cfreturn variables.instance.updatedby />
	</cffunction>

	<cffunction name="setdeleted" access="public" returntype="void" output="false">
		<cfargument name="deleted" type="string" required="true" />
		<cfset variables.instance.deleted = arguments.deleted />
	</cffunction>
	<cffunction name="getdeleted" access="public" returntype="string" output="false">
		<cfreturn variables.instance.deleted />
	</cffunction>

	<cffunction name="setdeletedflag" access="public" returntype="void" output="false">
		<cfargument name="deletedflag" type="string" required="true" />
		<cfset variables.instance.deletedflag = arguments.deletedflag />
	</cffunction>
	<cffunction name="getdeletedflag" access="public" returntype="string" output="false">
		<cfreturn variables.instance.deletedflag />
	</cffunction>

	<cffunction name="setdeletedby" access="public" returntype="void" output="false">
		<cfargument name="deletedby" type="string" required="true" />
		<cfset variables.instance.deletedby = arguments.deletedby />
	</cffunction>
	<cffunction name="getdeletedby" access="public" returntype="string" output="false">
		<cfreturn variables.instance.deletedby />
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
