<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>RBAC Dashboard</title>
</head>

<body>
	<cfset RBAC = createObject("component","rbac").init(datasource="CCPD_PROD",tableprefix="ac_",dbms="mssql",usertable="ce_person",username_col="email",password_col="password")>
	<cfdump var="#RBAC#">
</body>
</html>