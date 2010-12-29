<cfcomponent displayname="tenantGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="rbac.tenant.tenantGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
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
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				id,
				name,
				tenantkind_id,
				address1,
				address2,
				address3,
				city,
				state,
				postalcode,
				country,
				phone1,
				phone2,
				phone3,
				fax1,
				fax2,
				uuid,
				created,
				createdby,
				updated,
				updatedby,
				deleted,
				deletedflag,
				deletedby
			FROM	ac_tenant
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"id") and len(arguments.id)>
			AND	id = <cfqueryparam value="#arguments.id#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"name") and len(arguments.name)>
			AND	name = <cfqueryparam value="#arguments.name#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"tenantkind_id") and len(arguments.tenantkind_id)>
			AND	tenantkind_id = <cfqueryparam value="#arguments.tenantkind_id#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"address1") and len(arguments.address1)>
			AND	address1 = <cfqueryparam value="#arguments.address1#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"address2") and len(arguments.address2)>
			AND	address2 = <cfqueryparam value="#arguments.address2#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"address3") and len(arguments.address3)>
			AND	address3 = <cfqueryparam value="#arguments.address3#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"city") and len(arguments.city)>
			AND	city = <cfqueryparam value="#arguments.city#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"state") and len(arguments.state)>
			AND	state = <cfqueryparam value="#arguments.state#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"postalcode") and len(arguments.postalcode)>
			AND	postalcode = <cfqueryparam value="#arguments.postalcode#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"country") and len(arguments.country)>
			AND	country = <cfqueryparam value="#arguments.country#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"phone1") and len(arguments.phone1)>
			AND	phone1 = <cfqueryparam value="#arguments.phone1#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"phone2") and len(arguments.phone2)>
			AND	phone2 = <cfqueryparam value="#arguments.phone2#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"phone3") and len(arguments.phone3)>
			AND	phone3 = <cfqueryparam value="#arguments.phone3#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"fax1") and len(arguments.fax1)>
			AND	fax1 = <cfqueryparam value="#arguments.fax1#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"fax2") and len(arguments.fax2)>
			AND	fax2 = <cfqueryparam value="#arguments.fax2#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"uuid") and len(arguments.uuid)>
			AND	uuid = <cfqueryparam value="#arguments.uuid#" CFSQLType="cf_sql_idstamp" />
		</cfif>
		<cfif structKeyExists(arguments,"created") and len(arguments.created)>
			AND	created = <cfqueryparam value="#arguments.created#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"createdby") and len(arguments.createdby)>
			AND	createdby = <cfqueryparam value="#arguments.createdby#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"updated") and len(arguments.updated)>
			AND	updated = <cfqueryparam value="#arguments.updated#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"updatedby") and len(arguments.updatedby)>
			AND	updatedby = <cfqueryparam value="#arguments.updatedby#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"deleted") and len(arguments.deleted)>
			AND	deleted = <cfqueryparam value="#arguments.deleted#" CFSQLType="cf_sql_timestamp" />
		</cfif>
		<cfif structKeyExists(arguments,"deletedflag") and len(arguments.deletedflag)>
			AND	deletedflag = <cfqueryparam value="#arguments.deletedflag#" CFSQLType="cf_sql_char" />
		</cfif>
		<cfif structKeyExists(arguments,"deletedby") and len(arguments.deletedby)>
			AND	deletedby = <cfqueryparam value="#arguments.deletedby#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
