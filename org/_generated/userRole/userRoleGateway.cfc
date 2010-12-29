<cfcomponent displayname="userRoleGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="org.userRole.userRoleGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="user_id" type="numeric" required="false" />
		<cfargument name="role_id" type="numeric" required="false" />
		<cfargument name="tenant_id" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				user_id,
				role_id,
				tenant_id
			FROM	ac_user_role
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"user_id") and len(arguments.user_id)>
			AND	user_id = <cfqueryparam value="#arguments.user_id#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"role_id") and len(arguments.role_id)>
			AND	role_id = <cfqueryparam value="#arguments.role_id#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"tenant_id") and len(arguments.tenant_id)>
			AND	tenant_id = <cfqueryparam value="#arguments.tenant_id#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
