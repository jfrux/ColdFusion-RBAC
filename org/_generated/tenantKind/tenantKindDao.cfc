<cfcomponent displayname="tenantKindDAO" hint="table ID column = id">

	<cffunction name="init" access="public" output="false" returntype="org.tenantKind.tenantKindDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="tenantKind" type="org.tenantKind.tenantKind" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ac_tenantkind
					(
					name,
					description,
					created
					)
				VALUES
					(
					<cfqueryparam value="#arguments.tenantKind.getname()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.tenantKind.getdescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenantKind.getdescription())#" />,
					<cfqueryparam value="#arguments.tenantKind.getcreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.tenantKind.getcreated())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="org.tenantKind.tenantKind">
		<cfargument name="tenantKind" type="org.tenantKind.tenantKind" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					id,
					name,
					description,
					created
				FROM	ac_tenantkind
				WHERE	id = <cfqueryparam value="#arguments.tenantKind.getid()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset tenantKindBean = arguments.tenantKind.init(argumentCollection=strReturn)>
			<cfreturn tenantKindBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="tenantKind" type="org.tenantKind.tenantKind" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ac_tenantkind
				SET
					name = <cfqueryparam value="#arguments.tenantKind.getname()#" CFSQLType="cf_sql_varchar" />,
					description = <cfqueryparam value="#arguments.tenantKind.getdescription()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenantKind.getdescription())#" />,
					created = <cfqueryparam value="#arguments.tenantKind.getcreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.tenantKind.getcreated())#" />
				WHERE	id = <cfqueryparam value="#arguments.tenantKind.getid()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="tenantKind" type="org.tenantKind.tenantKind" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ac_tenantkind 
				WHERE	id = <cfqueryparam value="#arguments.tenantKind.getid()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="tenantKind" type="org.tenantKind.tenantKind" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ac_tenantkind
			WHERE	id = <cfqueryparam value="#arguments.tenantKind.getid()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="tenantKind" type="org.tenantKind.tenantKind" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.tenantKind)>
			<cfset success = update(arguments.tenantKind) />
		<cfelse>
			<cfset success = create(arguments.tenantKind) />
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
