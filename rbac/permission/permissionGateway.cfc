<cfcomponent displayname="permissionGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="rbac.permission.permissionGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="id" type="numeric" required="false" />
		<cfargument name="name" type="string" required="false" />
		<cfargument name="description" type="string" required="false" />
		<cfargument name="object_id" type="numeric" required="false" />
		<cfargument name="operation_id" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				id,
				name,
				description,
				object_id,
				operation_id
			FROM	ac_permission
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"id") and len(arguments.id)>
			AND	id = <cfqueryparam value="#arguments.id#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"name") and len(arguments.name)>
			AND	name = <cfqueryparam value="#arguments.name#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"description") and len(arguments.description)>
			AND	description = <cfqueryparam value="#arguments.description#" CFSQLType="cf_sql_varchar" />
		</cfif>
		<cfif structKeyExists(arguments,"object_id") and len(arguments.object_id)>
			AND	object_id = <cfqueryparam value="#arguments.object_id#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"operation_id") and len(arguments.operation_id)>
			AND	operation_id = <cfqueryparam value="#arguments.operation_id#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
