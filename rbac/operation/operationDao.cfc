<cfcomponent displayname="operationDAO" hint="table ID column = id">

	<cffunction name="init" access="public" output="false" returntype="rbac.operation.operationDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="operation" type="rbac.operation.operation" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ac_operation
					(
					name,
					description,
					_create,
					_read,
					_update,
					_delete,
					locked
					)
				VALUES
					(
					<cfqueryparam value="#arguments.operation.getname()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.operation.getdescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.operation.getdescription())#" />,
					<cfqueryparam value="#arguments.operation.get_create()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.operation.get_create())#" />,
					<cfqueryparam value="#arguments.operation.get_read()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.operation.get_read())#" />,
					<cfqueryparam value="#arguments.operation.get_update()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.operation.get_update())#" />,
					<cfqueryparam value="#arguments.operation.get_delete()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.operation.get_delete())#" />,
					<cfqueryparam value="#arguments.operation.getlocked()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.operation.getlocked())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="rbac.operation.operation">
		<cfargument name="operation" type="rbac.operation.operation" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
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
				WHERE	id = <cfqueryparam value="#arguments.operation.getid()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset operationBean = arguments.operation.init(argumentCollection=strReturn)>
			<cfreturn operationBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="operation" type="rbac.operation.operation" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ac_operation
				SET
					name = <cfqueryparam value="#arguments.operation.getname()#" CFSQLType="cf_sql_varchar" />,
					description = <cfqueryparam value="#arguments.operation.getdescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.operation.getdescription())#" />,
					_create = <cfqueryparam value="#arguments.operation.get_create()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.operation.get_create())#" />,
					_read = <cfqueryparam value="#arguments.operation.get_read()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.operation.get_read())#" />,
					_update = <cfqueryparam value="#arguments.operation.get_update()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.operation.get_update())#" />,
					_delete = <cfqueryparam value="#arguments.operation.get_delete()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.operation.get_delete())#" />,
					locked = <cfqueryparam value="#arguments.operation.getlocked()#" CFSQLType="cf_sql_tinyint" null="#not len(arguments.operation.getlocked())#" />
				WHERE	id = <cfqueryparam value="#arguments.operation.getid()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="operation" type="rbac.operation.operation" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ac_operation 
				WHERE	id = <cfqueryparam value="#arguments.operation.getid()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="operation" type="rbac.operation.operation" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ac_operation
			WHERE	id = <cfqueryparam value="#arguments.operation.getid()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="operation" type="rbac.operation.operation" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.operation)>
			<cfset success = update(arguments.operation) />
		<cfelse>
			<cfset success = create(arguments.operation) />
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
