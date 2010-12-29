<cfcomponent displayname="operationGateway" output="false">
	<cffunction name="init" access="public" output="false" returntype="rbac.operation.operationGateway">
		<cfargument name="dsn" type="string" required="true" />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="getByAttributes" access="public" output="false" returntype="query">
		<cfargument name="id" type="numeric" required="false" />
		<cfargument name="name" type="string" required="false" />
		<cfargument name="description" type="string" required="false" />
		<cfargument name="_create" type="numeric" required="false" />
		<cfargument name="_read" type="numeric" required="false" />
		<cfargument name="_update" type="numeric" required="false" />
		<cfargument name="_delete" type="numeric" required="false" />
		<cfargument name="locked" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" />
		
		<cfset var qList = "" />		
		<cfquery name="qList" datasource="#variables.dsn#">
			SELECT
				id,
				name,
				description,
				_create,
				_read,
				_update,
				_delete,
				locked
			FROM	ac_operation
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
		<cfif structKeyExists(arguments,"_create") and len(arguments._create)>
			AND	_create = <cfqueryparam value="#arguments._create#" CFSQLType="cf_sql_tinyint" />
		</cfif>
		<cfif structKeyExists(arguments,"_read") and len(arguments._read)>
			AND	_read = <cfqueryparam value="#arguments._read#" CFSQLType="cf_sql_tinyint" />
		</cfif>
		<cfif structKeyExists(arguments,"_update") and len(arguments._update)>
			AND	_update = <cfqueryparam value="#arguments._update#" CFSQLType="cf_sql_tinyint" />
		</cfif>
		<cfif structKeyExists(arguments,"_delete") and len(arguments._delete)>
			AND	_delete = <cfqueryparam value="#arguments._delete#" CFSQLType="cf_sql_tinyint" />
		</cfif>
		<cfif structKeyExists(arguments,"locked") and len(arguments.locked)>
			AND	locked = <cfqueryparam value="#arguments.locked#" CFSQLType="cf_sql_tinyint" />
		</cfif>
		<cfif structKeyExists(arguments, "orderby") and len(arguments.orderBy)>
			ORDER BY #arguments.orderby#
		</cfif>
		</cfquery>
		
		<cfreturn qList />
	</cffunction>

</cfcomponent>
