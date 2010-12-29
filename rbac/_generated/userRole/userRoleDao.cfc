<cfcomponent displayname="userRoleDAO" hint="table ID column = user_id,role_id,tenant_id">

	<cffunction name="init" access="public" output="false" returntype="rbac.userRole.userRoleDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="userRole" type="rbac.userRole.userRole" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ac_user_role
					(
					user_id,
					role_id,
					tenant_id
					)
				VALUES
					(
					<cfqueryparam value="#arguments.userRole.getuser_id()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.userRole.getrole_id()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.userRole.gettenant_id()#" CFSQLType="cf_sql_integer" null="#not len(arguments.userRole.gettenant_id())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="rbac.userRole.userRole">
		<cfargument name="userRole" type="rbac.userRole.userRole" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					user_id,
					role_id,
					tenant_id
				FROM	ac_user_role
				WHERE	user_id = <cfqueryparam value="#arguments.userRole.getuser_id()#" CFSQLType="cf_sql_integer" />
				AND	role_id = <cfqueryparam value="#arguments.userRole.getrole_id()#" CFSQLType="cf_sql_integer" />
				AND	tenant_id = <cfqueryparam value="#arguments.userRole.gettenant_id()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset userRoleBean = arguments.userRole.init(argumentCollection=strReturn)>
			<cfreturn userRoleBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="userRole" type="rbac.userRole.userRole" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ac_user_role
				SET
					
				WHERE	user_id = <cfqueryparam value="#arguments.userRole.getuser_id()#" CFSQLType="cf_sql_integer" />
				AND	role_id = <cfqueryparam value="#arguments.userRole.getrole_id()#" CFSQLType="cf_sql_integer" />
				AND	tenant_id = <cfqueryparam value="#arguments.userRole.gettenant_id()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="userRole" type="rbac.userRole.userRole" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ac_user_role 
				WHERE	user_id = <cfqueryparam value="#arguments.userRole.getuser_id()#" CFSQLType="cf_sql_integer" />
				AND	role_id = <cfqueryparam value="#arguments.userRole.getrole_id()#" CFSQLType="cf_sql_integer" />
				AND	tenant_id = <cfqueryparam value="#arguments.userRole.gettenant_id()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="userRole" type="rbac.userRole.userRole" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ac_user_role
			WHERE	user_id = <cfqueryparam value="#arguments.userRole.getuser_id()#" CFSQLType="cf_sql_integer" />
			AND	role_id = <cfqueryparam value="#arguments.userRole.getrole_id()#" CFSQLType="cf_sql_integer" />
			AND	tenant_id = <cfqueryparam value="#arguments.userRole.gettenant_id()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="userRole" type="rbac.userRole.userRole" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.userRole)>
			<cfset success = update(arguments.userRole) />
		<cfelse>
			<cfset success = create(arguments.userRole) />
		</cfif>
		
		<cfreturn success />
	</cffunction>

	<cffunction name="queryRowToStruct" access="private" output="false" returntype="struct">
		<cfargument name="qry" type="query" required="true">
		
		<cfscript>
			/**
			 * Makes a row of a query into a structure.
			 * 
			 * @param query 	 The query to work with. 
			 * @param row 	 Row number to check. Defaults to row 1. 
			 * @return Returns a structure. 
			 * @author Nathan Dintenfass (nathan@changemedia.com) 
			 * @version 1, December 11, 2001 
			 */
			//by default, do this to the first row of the query
			var row = 1;
			//a var for looping
			var ii = 1;
			//the cols to loop over
			var cols = listToArray(qry.columnList);
			//the struct to return
			var stReturn = structnew();
			//if there is a second argument, use that for the row number
			if(arrayLen(arguments) GT 1)
				row = arguments[2];
			//loop over the cols and build the struct from the query row
			for(ii = 1; ii lte arraylen(cols); ii = ii + 1){
				stReturn[cols[ii]] = qry[cols[ii]][row];
			}		
			//return the struct
			return stReturn;
		</cfscript>
	</cffunction>

</cfcomponent>
