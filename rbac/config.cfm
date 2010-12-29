<cfscript>
request.rbacConfig = {

	/* DSN in CFML Engine Admin */
	DATASOURCE="CCPD_PROD",
	
	/* 
	A prefix to attached to the beginning of 
	database table names and procedures 
	*/
	TABLEPREFIX="ac_",
	
	/* 
	What type of database are you using?
		- MSSQL
		- MYSQL
	*/
	DBMS="mssql",
	
	/* 
	Table name for your users 
	if you already have a users table with username/password 
	*/
	USERTABLE="ce_person",
	
	/* 
	Only change if USERTABLE above is NOT "ac_user" 
	
	Name of your "username" field (some systems use 'Email' or 'Usrname' or 'USER_NAME', etc.)
	*/
	USERNAME_COL="email",
	
	/* same for password field */
	PASSWORD_COL="password"
};
</cfscript>