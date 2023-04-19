/// Each Test Method is a Scenario
/// Syntax to Run this Test case --w ##class(ELFT.TIE.Test.TestSuite.Operation.ExtLookup).RunTests()
/// Above command will invoke all Methods in this class that begins with the word "Test"
/// Example : 
/// TestNumberEquals() {
/// Set x=y=1
/// do $$$AssertEquals(x,y,"x equals y")
/// 	}
/// 
Class ELFT.TIE.Test.TestSuite.Operation.ExtLookup Extends ELFT.TIE.Test.Base.TestCase
{

/*
// Check Visit Number

Method TestPositiveCheckVisitNumber() As %Status
{
	Set tStatus = $$$OK
	
	// Construct your Test Data
	 
	// Populate the Request Class
	Set tRequest = ..CheckVisitNumberRequestPositiveForOperation()
	// Invoke the Operation 
	Set tStatus = ..SendRequestToEnsemble("Interfaces_SQL_Lookup",tRequest,.tSessionId,.tResponse)

	Do $$$AssertTrue(tStatus)
	Do $$$AssertEquals(1,tResponse.VisitNumberPresent)
	Do $$$AssertEquals("VisitNumber Found",tResponse.QueryResult.Text)
	Quit tStatus
}

Method TestNegativeCheckVisitNumber() As %Status
{
	Set tStatus = $$$OK
	
	// Construct your Test Data
	 
	// Populate the Request Class
	Set tRequest = ..CheckVisitNumberRequestNegativeForOperation()
	// Invoke the Operation 
	Set tStatus = ..SendRequestToEnsemble("Interfaces_SQL_Lookup",tRequest,.tSessionId,.tResponse)

	Do $$$AssertTrue(tStatus)
	Do $$$AssertEquals(0,tResponse.VisitNumberPresent)
	Do $$$AssertEquals("VisitNumber Not Found",tResponse.QueryResult.Text)
	Quit tStatus
}

/// This method with add new entry in database
Method TestPositiveUpdateVisitNumber() As %Status
{
	Set tStatus = $$$OK
	
	// Populate the Request Class
	Set tRequest = ..UpdateVisitNumberRequestPositiveForOperation()
	// Invoke the Operation 
	Set tStatus = ..SendRequestToEnsemble("Interfaces_SQL_Lookup",tRequest,.tSessionId,.tResponse)


	Do $$$AssertTrue(tStatus)
	Do $$$AssertEquals(0,tResponse.QueryResult.IsError)
	Do $$$AssertEquals("1 row(s) affected",tResponse.QueryResult.Text)

	Quit tStatus
}

// Check NHS Number

Method TestPositiveCheckNHSNumber() As %Status
{
	Set tStatus = $$$OK
	
	// Construct your Test Data
	 
	// Populate the Request Class
	Set tRequest = ..CheckNHSNumberRequestPositiveForOperation()
	// Invoke the Operation 
	Set tStatus = ..SendRequestToEnsemble("Interfaces_SQL_Lookup",tRequest,.tSessionId,.tResponse)

	Do $$$AssertTrue(tStatus)
	Do $$$AssertEquals(1,tResponse.NHSNumberPresent)
	Do $$$AssertEquals("NHSNumber Found",tResponse.QueryResult.Text)
	Quit tStatus
}

Method TestNegativeCheckNHSNumber() As %Status
{
	Set tStatus = $$$OK
	
	// Construct your Test Data
	 
	// Populate the Request Class
	Set tRequest = ..CheckNHSNumberRequestNegativeForOperation()
	// Invoke the Operation 
	Set tStatus = ..SendRequestToEnsemble("Interfaces_SQL_Lookup",tRequest,.tSessionId,.tResponse)

	Do $$$AssertTrue(tStatus)
	Do $$$AssertEquals(0,tResponse.NHSNumberPresent)
	Do $$$AssertEquals("NHSNumber Not Found",tResponse.QueryResult.Text)
	Quit tStatus
}

/// This method with add new entry in database
Method TestPositiveUpdateNHSNumber() As %Status
{
	Set tStatus = $$$OK
	
	// Populate the Request Class
	Set tRequest = ..UpdateNHSNumberRequestPositiveForOperation()
	// Invoke the Operation 
	Set tStatus = ..SendRequestToEnsemble("Interfaces_SQL_Lookup",tRequest,.tSessionId,.tResponse)


	Do $$$AssertTrue(tStatus)
	Do $$$AssertEquals(0,tResponse.QueryResult.IsError)
	Do $$$AssertEquals("1 row(s) affected",tResponse.QueryResult.Text)

	Quit tStatus
}

Method TestPositiveGetNHSNumber() As %Status
{
	Set tStatus = $$$OK
	
	// Populate the Request Class
	Set tRequest = ..GetNHSNumberRequestPositiveForOperation()
	// Invoke the Operation 
	Set tStatus = ..SendRequestToEnsemble("Interfaces_SQL_Lookup",tRequest,.tSessionId,.tResponse)


	Do $$$AssertTrue(tStatus)
	Do $$$AssertEquals("426649609 ",tResponse.NHSNumber)
	Do $$$AssertEquals(0,tResponse.QueryResult.IsError)
	Do $$$AssertEquals("NHSNumber Found",tResponse.QueryResult.Text)

	Quit tStatus
}

Method TestNegativeGetNHSNumber() As %Status
{
	Set tStatus = $$$OK
	
	// Populate the Request Class
	Set tRequest = ..GetNHSNumberRequestNegativeForOperation()
	// Invoke the Operation 
	Set tStatus = ..SendRequestToEnsemble("Interfaces_SQL_Lookup",tRequest,.tSessionId,.tResponse)


	Do $$$AssertTrue(tStatus)
	Do $$$AssertEquals("",tResponse.NHSNumber)
	Do $$$AssertEquals(0,tResponse.QueryResult.IsError)
	Do $$$AssertEquals("NHSNumber Not Found",tResponse.QueryResult.Text)

	Quit tStatus
}
*/
}
