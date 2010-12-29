<cfcomponent displayname="rolePermGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="org.rolePerm.rolePermGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="role_id" type="numeric" required="false" />
		<cfargument name="permission_id" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				role_id,
				permission_id
			FROM	ac_role_permission
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"role_id") and len(arguments.role_id)>
			AND	role_id = <cfqueryparam value="#arguments.role_id#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"permission_id") and len(arguments.permission_id)>
			AND	permission_id = <cfqueryparam value="#arguments.permission_id#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
