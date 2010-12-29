<cfcomponent displayname="tenantDAO" hint="table ID column = id">

	<cffunction name="init" access="public" output="false" returntype="rbac.tenant.tenantDAO">
		<cfargument name="dsn" type="string" required="true">
		<cfset variables.dsn = arguments.dsn>
		<cfreturn this>
	</cffunction>
	
	<cffunction name="create" access="public" output="false" returntype="boolean">
		<cfargument name="tenant" type="rbac.tenant.tenant" required="true" />

		<cfset var qCreate = "" />
		<cftry>
			<cfquery name="qCreate" datasource="#variables.dsn#" result="CreateResult">
				INSERT INTO ac_tenant
					(
					name,
					tenantkind_id,
					address1,
					address2,
					address3,
					city,
					state,
					postalcode,
					country,
					phone1,
					phone2,
					phone3,
					fax1,
					fax2,
					uuid,
					created,
					createdby,
					updated,
					updatedby,
					deleted,
					deletedflag,
					deletedby
					)
				VALUES
					(
					<cfqueryparam value="#arguments.tenant.getname()#" CFSQLType="cf_sql_varchar" />,
					<cfqueryparam value="#arguments.tenant.gettenantkind_id()#" CFSQLType="cf_sql_integer" />,
					<cfqueryparam value="#arguments.tenant.getaddress1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getaddress1())#" />,
					<cfqueryparam value="#arguments.tenant.getaddress2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getaddress2())#" />,
					<cfqueryparam value="#arguments.tenant.getaddress3()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getaddress3())#" />,
					<cfqueryparam value="#arguments.tenant.getcity()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getcity())#" />,
					<cfqueryparam value="#arguments.tenant.getstate()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getstate())#" />,
					<cfqueryparam value="#arguments.tenant.getpostalcode()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getpostalcode())#" />,
					<cfqueryparam value="#arguments.tenant.getcountry()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getcountry())#" />,
					<cfqueryparam value="#arguments.tenant.getphone1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getphone1())#" />,
					<cfqueryparam value="#arguments.tenant.getphone2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getphone2())#" />,
					<cfqueryparam value="#arguments.tenant.getphone3()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getphone3())#" />,
					<cfqueryparam value="#arguments.tenant.getfax1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getfax1())#" />,
					<cfqueryparam value="#arguments.tenant.getfax2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getfax2())#" />,
					<cfqueryparam value="#arguments.tenant.getuuid()#" CFSQLType="cf_sql_idstamp" null="#not len(arguments.tenant.getuuid())#" />,
					<cfqueryparam value="#arguments.tenant.getcreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.tenant.getcreated())#" />,
					<cfqueryparam value="#arguments.tenant.getcreatedby()#" CFSQLType="cf_sql_integer" null="#not len(arguments.tenant.getcreatedby())#" />,
					<cfqueryparam value="#arguments.tenant.getupdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.tenant.getupdated())#" />,
					<cfqueryparam value="#arguments.tenant.getupdatedby()#" CFSQLType="cf_sql_integer" null="#not len(arguments.tenant.getupdatedby())#" />,
					<cfqueryparam value="#arguments.tenant.getdeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.tenant.getdeleted())#" />,
					<cfqueryparam value="#arguments.tenant.getdeletedflag()#" CFSQLType="cf_sql_char" null="#not len(arguments.tenant.getdeletedflag())#" />,
					<cfqueryparam value="#arguments.tenant.getdeletedby()#" CFSQLType="cf_sql_integer" null="#not len(arguments.tenant.getdeletedby())#" />
					)
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn CreateResult.IDENTITYCOL />
	</cffunction>

	<cffunction name="read" access="public" output="false" returntype="rbac.tenant.tenant">
		<cfargument name="tenant" type="rbac.tenant.tenant" required="true" />

		<cfset var qRead = "" />
		<cfset var strReturn = structNew() />
		<cftry>
			<cfquery name="qRead" datasource="#variables.dsn#">
				SELECT
					id,
					name,
					tenantkind_id,
					address1,
					address2,
					address3,
					city,
					state,
					postalcode,
					country,
					phone1,
					phone2,
					phone3,
					fax1,
					fax2,
					uuid,
					created,
					createdby,
					updated,
					updatedby,
					deleted,
					deletedflag,
					deletedby
				FROM	ac_tenant
				WHERE	id = <cfqueryparam value="#arguments.tenant.getid()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<!--- leave the bean as is --->
			</cfcatch>
		</cftry>
		<cfif qRead.recordCount>
			<cfset strReturn = queryRowToStruct(qRead)>
			<cfset tenantBean = arguments.tenant.init(argumentCollection=strReturn)>
			<cfreturn tenantBean>
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" output="false" returntype="boolean">
		<cfargument name="tenant" type="rbac.tenant.tenant" required="true" />

		<cfset var qUpdate = "" />
		<cftry>
			<cfquery name="qUpdate" datasource="#variables.dsn#">
				UPDATE	ac_tenant
				SET
					name = <cfqueryparam value="#arguments.tenant.getname()#" CFSQLType="cf_sql_varchar" />,
					tenantkind_id = <cfqueryparam value="#arguments.tenant.gettenantkind_id()#" CFSQLType="cf_sql_integer" />,
					address1 = <cfqueryparam value="#arguments.tenant.getaddress1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getaddress1())#" />,
					address2 = <cfqueryparam value="#arguments.tenant.getaddress2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getaddress2())#" />,
					address3 = <cfqueryparam value="#arguments.tenant.getaddress3()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getaddress3())#" />,
					city = <cfqueryparam value="#arguments.tenant.getcity()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getcity())#" />,
					state = <cfqueryparam value="#arguments.tenant.getstate()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getstate())#" />,
					postalcode = <cfqueryparam value="#arguments.tenant.getpostalcode()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getpostalcode())#" />,
					country = <cfqueryparam value="#arguments.tenant.getcountry()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getcountry())#" />,
					phone1 = <cfqueryparam value="#arguments.tenant.getphone1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getphone1())#" />,
					phone2 = <cfqueryparam value="#arguments.tenant.getphone2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getphone2())#" />,
					phone3 = <cfqueryparam value="#arguments.tenant.getphone3()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getphone3())#" />,
					fax1 = <cfqueryparam value="#arguments.tenant.getfax1()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getfax1())#" />,
					fax2 = <cfqueryparam value="#arguments.tenant.getfax2()#" CFSQLType="cf_sql_varchar" null="#not len(arguments.tenant.getfax2())#" />,
					uuid = <cfqueryparam value="#arguments.tenant.getuuid()#" CFSQLType="cf_sql_idstamp" null="#not len(arguments.tenant.getuuid())#" />,
					created = <cfqueryparam value="#arguments.tenant.getcreated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.tenant.getcreated())#" />,
					createdby = <cfqueryparam value="#arguments.tenant.getcreatedby()#" CFSQLType="cf_sql_integer" null="#not len(arguments.tenant.getcreatedby())#" />,
					updated = <cfqueryparam value="#arguments.tenant.getupdated()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.tenant.getupdated())#" />,
					updatedby = <cfqueryparam value="#arguments.tenant.getupdatedby()#" CFSQLType="cf_sql_integer" null="#not len(arguments.tenant.getupdatedby())#" />,
					deleted = <cfqueryparam value="#arguments.tenant.getdeleted()#" CFSQLType="cf_sql_timestamp" null="#not len(arguments.tenant.getdeleted())#" />,
					deletedflag = <cfqueryparam value="#arguments.tenant.getdeletedflag()#" CFSQLType="cf_sql_char" null="#not len(arguments.tenant.getdeletedflag())#" />,
					deletedby = <cfqueryparam value="#arguments.tenant.getdeletedby()#" CFSQLType="cf_sql_integer" null="#not len(arguments.tenant.getdeletedby())#" />
				WHERE	id = <cfqueryparam value="#arguments.tenant.getid()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="delete" access="public" output="false" returntype="boolean">
		<cfargument name="tenant" type="rbac.tenant.tenant" required="true" />

		<cfset var qDelete = "">
		<cftry>
			<cfquery name="qDelete" datasource="#variables.dsn#">
				DELETE FROM	ac_tenant 
				WHERE	id = <cfqueryparam value="#arguments.tenant.getid()#" CFSQLType="cf_sql_integer" />
			</cfquery>
			<cfcatch type="database">
				<cfreturn false />
			</cfcatch>
		</cftry>
		<cfreturn true />
	</cffunction>

	<cffunction name="exists" access="public" output="false" returntype="boolean">
		<cfargument name="tenant" type="rbac.tenant.tenant" required="true" />

		<cfset var qExists = "">
		<cfquery name="qExists" datasource="#variables.dsn#" maxrows="1">
			SELECT count(1) as idexists
			FROM	ac_tenant
			WHERE	id = <cfqueryparam value="#arguments.tenant.getid()#" CFSQLType="cf_sql_integer" />
		</cfquery>

		<cfif qExists.idexists>
			<cfreturn true />
		<cfelse>
			<cfreturn false />
		</cfif>
	</cffunction>

	<cffunction name="save" access="public" output="false" returntype="boolean">
		<cfargument name="tenant" type="rbac.tenant.tenant" required="true" />
		
		<cfset var success = false />
		<cfif exists(arguments.tenant)>
			<cfset success = update(arguments.tenant) />
		<cfelse>
			<cfset success = create(arguments.tenant) />
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
