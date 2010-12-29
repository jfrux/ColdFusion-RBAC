<cfcomponent displayname="sessionRoleGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="org.sessionRole.sessionRoleGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="session_id" type="numeric" required="false" />
		<cfargument name="role_id" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				session_id,
				role_id
			FROM	ac_session_role
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"session_id") and len(arguments.session_id)>
			AND	session_id = <cfqueryparam value="#arguments.session_id#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"role_id") and len(arguments.role_id)>
			AND	role_id = <cfqueryparam value="#arguments.role_id#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
