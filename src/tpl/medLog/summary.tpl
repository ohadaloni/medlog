<br />
<div class="container">
	<table>
		<tr class="medLogHeaderRow">
			<td>description</td>
			<td>Last Taken</td>
			<td>Dosage</td>
			<td>Taking Now</td>
			<td>History</td>
			<td>Calendar</td>
		<tr>
		{foreach from=$rows key=key item=row}
			<tr class="medLogRow">
				<td>{$row.description}</td>
				<td>{$row.datetime|substr:0:16}</td>
				<td>{$row.dosage}</td>
				<td>
					<a href="/medLog/insert?description={$row.description}&dosage={$row.dosage}"><img
						src="/images/go.png"
						title="Taking Now"
					/></a>
				</td>
				<td align="right">
					<a href="/medLog/history?description={$row.description}"><img
						src="/images/list.png"
						title="History"
					/></a>
					({$row.cnt})
				</td>
				<td>
					<a href="/cal?eventType=medLog&singleMed={$row.description}&datetime={$row.datetime}"><img
						src="/images/calendar.png"
					/></a>
				</td>
			</tr>
		{/foreach}
	</table>
</div>
<br />
