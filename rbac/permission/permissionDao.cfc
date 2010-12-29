<cfcomponent displayname="permissionDAO" hint="table ID column = id,name,object_id,operation_id">

	<cffunction name="init" access="public" output="false" returntype="rbac.permission.permissionDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="permission" type="rbac.permission.permission" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ac_permission
					(
					name,
					description,
					object_id,
					operation_id
					)
				VALUES
					(
					<cfqueryparam value="#arguments.permission.getname()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.permission.getdescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.permission.getdescription())#" />,
					<cfqueryparam value="#arguments.permission.getobject_id()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.permission.getoperation_id()#" CFSQLType="cf_sql_integer" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="rbac.permission.permission">
		<cfargument name="permission" type="rbac.permission.permission" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					id,
					name,
					description,
					object_id,
					operation_id
				FROM	ac_permission
				WHERE	id = <cfqueryparam value="#arguments.permission.getid()#" CFSQLType="cf_sql_integer" />
				AND	name = <cfqueryparam value="#arguments.permission.getname()#" CFSQLType="cf_sql_varchar" />
				AND	object_id = <cfqueryparam value="#arguments.permission.getobject_id()#" CFSQLType="cf_sql_integer" />
				AND	operation_id = <cfqueryparam value="#arguments.permission.getoperation_id()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset permissionBean = arguments.permission.init(argumentCollection=strReturn)>
			<cfreturn permissionBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="permission" type="rbac.permission.permission" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ac_permission
				SET
					description = <cfqueryparam value="#arguments.permission.getdescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.permission.getdescription())#" />
				WHERE	id = <cfqueryparam value="#arguments.permission.getid()#" CFSQLType="cf_sql_integer" />
				AND	name = <cfqueryparam value="#arguments.permission.getname()#" CFSQLType="cf_sql_varchar" />
				AND	object_id = <cfqueryparam value="#arguments.permission.getobject_id()#" CFSQLType="cf_sql_integer" />
				AND	operation_id = <cfqueryparam value="#arguments.permission.getoperation_id()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="permission" type="rbac.permission.permission" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ac_permission 
				WHERE	id = <cfqueryparam value="#arguments.permission.getid()#" CFSQLType="cf_sql_integer" />
				AND	name = <cfqueryparam value="#arguments.permission.getname()#" CFSQLType="cf_sql_varchar" />
				AND	object_id = <cfqueryparam value="#arguments.permission.getobject_id()#" CFSQLType="cf_sql_integer" />
				AND	operation_id = <cfqueryparam value="#arguments.permission.getoperation_id()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="permission" type="rbac.permission.permission" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ac_permission
			WHERE	id = <cfqueryparam value="#arguments.permission.getid()#" CFSQLType="cf_sql_integer" />
			AND	name = <cfqueryparam value="#arguments.permission.getname()#" CFSQLType="cf_sql_varchar" />
			AND	object_id = <cfqueryparam value="#arguments.permission.getobject_id()#" CFSQLType="cf_sql_integer" />
			AND	operation_id = <cfqueryparam value="#arguments.permission.getoperation_id()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="permission" type="rbac.permission.permission" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.permission)>
			<cfset success = update(arguments.permission) />
		<cfelse>
			<cfset success = create(arguments.permission) />
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
