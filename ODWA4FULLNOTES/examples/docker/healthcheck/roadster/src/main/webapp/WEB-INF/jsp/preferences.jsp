<!DOCTYPE html>
<%@page isELIgnored="false" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Preferences</title>
<style>
table {
	border-collapse: collapse;
	width: 80%;
	border: 1px solid black;
	margin: auto;
}

th, td {
	text-align: left;
	padding: 8px;
	border: 1px solid black;
}

tr:nth-child(even) {
	background-color: #D6EEEE;
}
</style>
</head>
<body>
	<h2>preferences</h2>
	<table>
		<tr>
			<th>Preference</th>
			<th>Configured Value</th>
		</tr>
		<tr>
			<td>Origin Country</td>
			<td>${preferences.originCountry}</td>
		</tr>
		<tr>
			<td>City</td>
			<td>${preferences.city}</td>
		</tr>
		<tr>
			<td>International Places</td>
			<td>${preferences.internationalPlaces}</td>
		</tr>
		<tr>
			<td>Age</td>
			<td>${preferences.age}</td>
		</tr>
		<tr>
			<td>Gender</td>
			<td>${preferences.gender}</td>
		</tr>
	</table>
</body>
</html>















