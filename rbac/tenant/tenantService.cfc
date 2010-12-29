<cfcomponent name="tenantService" output="false">

	<cffunction name="init" access="public" output="false" returntype="rbac.tenant.tenantService">
		<cfargument name="tenantDAO" type="rbac.tenant.tenantDAO" required="true" />
		<cfargument name="tenantGateway" type="rbac.tenant.tenantGateway" required="true" />

		<cfset variables.tenantDAO = arguments.tenantDAO />
		<cfset variables.tenantGateway = arguments.tenantGateway />

		<cfreturn this/>
	</cffunction>

	<cffunction name="gettenant" access="public" output="false" returntype="tenant">
		<cfargument name="id" type="numeric" required="true" />
		
		<cfset var tenant = createObject("component","rbac.tenant.tenant").init(argumentCollection=arguments) />
		<cfif tenant.gettenantID() eq 0>
			<cfreturn tenant />
		<cfelse>
			<cfreturn variables.tenantDAO.read(tenant) />
		</cfif>
	</cffunction>

	<cffunction name="gettenants" access="public" output="false" returntype="query">
		<cfargument name="id" type="numeric" required="false" />
		<cfargument name="name" type="string" required="false" />
		<cfargument name="tenantkind_id" type="numeric" required="false" />
		<cfargument name="address1" type="string" required="false" />
		<cfargument name="address2" type="string" required="false" />
		<cfargument name="address3" type="string" required="false" />
		<cfargument name="city" type="string" required="false" />
		<cfargument name="state" type="string" required="false" />
		<cfargument name="postalcode" type="string" required="false" />
		<cfargument name="country" type="string" required="false" />
		<cfargument name="phone1" type="string" required="false" />
		<cfargument name="phone2" type="string" required="false" />
		<cfargument name="phone3" type="string" required="false" />
		<cfargument name="fax1" type="string" required="false" />
		<cfargument name="fax2" type="string" required="false" />
		<cfargument name="uuid" type="string" required="false" />
		<cfargument name="created" type="date" required="false" />
		<cfargument name="createdby" type="numeric" required="false" />
		<cfargument name="updated" type="date" required="false" />
		<cfargument name="updatedby" type="numeric" required="false" />
		<cfargument name="deleted" type="date" required="false" />
		<cfargument name="deletedflag" type="string" required="false" />
		<cfargument name="deletedby" type="numeric" required="false" />
		
		<cfreturn variables.tenantGateway.getByAttributes(argumentCollection=arguments) />
	</cffunction>

	<cffunction name="savetenant" access="public" output="false" returntype="boolean">
		<cfargument name="id" type="numeric" required="true" />
		<cfargument name="name" type="string" required="true" />
		<cfargument name="tenantkind_id" type="numeric" required="true" />
		<cfargument name="address1" type="string" required="false" />
		<cfargument name="address2" type="string" required="false" />
		<cfargument name="address3" type="string" required="false" />
		<cfargument name="city" type="string" required="false" />
		<cfargument name="state" type="string" required="false" />
		<cfargument name="postalcode" type="string" required="false" />
		<cfargument name="country" type="string" required="false" />
		<cfargument name="phone1" type="string" required="false" />
		<cfargument name="phone2" type="string" required="false" />
		<cfargument name="phone3" type="string" required="false" />
		<cfargument name="fax1" type="string" required="false" />
		<cfargument name="fax2" type="string" required="false" />
		<cfargument name="uuid" type="string" required="false" />
		<cfargument name="created" type="date" required="false" />
		<cfargument name="createdby" type="numeric" required="false" />
		<cfargument name="updated" type="date" required="false" />
		<cfargument name="updatedby" type="numeric" required="false" />
		<cfargument name="deleted" type="date" required="false" />
		<cfargument name="deletedflag" type="string" required="false" />
		<cfargument name="deletedby" type="numeric" required="false" />
		
		
		<cfset var tenant = gettenant(arguments.id) />
		<cfset tenant.setid(arguments.id) />
		<cfset tenant.setname(arguments.name) />
		<cfset tenant.settenantkind_id(arguments.tenantkind_id) />
		<cfif structKeyExists(arguments,"address1")>
			<cfset tenant.setaddress1(arguments.address1) />
		</cfif>
		<cfif structKeyExists(arguments,"address2")>
			<cfset tenant.setaddress2(arguments.address2) />
		</cfif>
		<cfif structKeyExists(arguments,"address3")>
			<cfset tenant.setaddress3(arguments.address3) />
		</cfif>
		<cfif structKeyExists(arguments,"city")>
			<cfset tenant.setcity(arguments.city) />
		</cfif>
		<cfif structKeyExists(arguments,"state")>
			<cfset tenant.setstate(arguments.state) />
		</cfif>
		<cfif structKeyExists(arguments,"postalcode")>
			<cfset tenant.setpostalcode(arguments.postalcode) />
		</cfif>
		<cfif structKeyExists(arguments,"country")>
			<cfset tenant.setcountry(arguments.country) />
		</cfif>
		<cfif structKeyExists(arguments,"phone1")>
			<cfset tenant.setphone1(arguments.phone1) />
		</cfif>
		<cfif structKeyExists(arguments,"phone2")>
			<cfset tenant.setphone2(arguments.phone2) />
		</cfif>
		<cfif structKeyExists(arguments,"phone3")>
			<cfset tenant.setphone3(arguments.phone3) />
		</cfif>
		<cfif structKeyExists(arguments,"fax1")>
			<cfset tenant.setfax1(arguments.fax1) />
		</cfif>
		<cfif structKeyExists(arguments,"fax2")>
			<cfset tenant.setfax2(arguments.fax2) />
		</cfif>
		<cfif structKeyExists(arguments,"uuid")>
			<cfset tenant.setuuid(arguments.uuid) />
		</cfif>
		<cfif structKeyExists(arguments,"created")>
			<cfset tenant.setcreated(arguments.created) />
		</cfif>
		<cfif structKeyExists(arguments,"createdby")>
			<cfset tenant.setcreatedby(arguments.createdby) />
		</cfif>
		<cfif structKeyExists(arguments,"updated")>
			<cfset tenant.setupdated(arguments.updated) />
		</cfif>
		<cfif structKeyExists(arguments,"updatedby")>
			<cfset tenant.setupdatedby(arguments.updatedby) />
		</cfif>
		<cfif structKeyExists(arguments,"deleted")>
			<cfset tenant.setdeleted(arguments.deleted) />
		</cfif>
		<cfif structKeyExists(arguments,"deletedflag")>
			<cfset tenant.setdeletedflag(arguments.deletedflag) />
		</cfif>
		<cfif structKeyExists(arguments,"deletedby")>
			<cfset tenant.setdeletedby(arguments.deletedby) />
		</cfif>
		<cfreturn variables.tenantDAO.save(tenant) />
	</cffunction>

	<cffunction name="deletetenant" access="public" output="false" returntype="boolean">
		<cfargument name="id" type="numeric" required="true" />
		
		<cfset var tenant = createObject("component","rbac.tenant.tenant").init(argumentCollection=arguments) />
		<cfreturn variables.tenantDAO.delete(tenant) />
	</cffunction>
</cfcomponent>
