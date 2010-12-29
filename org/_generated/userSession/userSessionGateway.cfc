<cfcomponent displayname="userSessionGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="org.userSession.userSessionGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="user_id" type="numeric" required="false" />
		<cfargument name="session_id" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				user_id,
				session_id
			FROM	ac_user_session
			WHERE	0=0
		
		<cfif structKeyExists(arguments,"user_id") and len(arguments.user_id)>
			AND	user_id = <cfqueryparam value="#arguments.user_id#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments,"session_id") and len(arguments.session_id)>
			AND	session_id = <cfqueryparam value="#arguments.session_id#" CFSQLType="cf_sql_integer" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
