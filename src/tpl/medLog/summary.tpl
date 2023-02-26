<br />
<div class="container">
	<table>
		<tr class="medLogHeaderRow">
			<td align="center" colspan="3"><h3>{$row0.description}</h3></td>
			<td></td>
			<td align="center" colspan="5" id="stopWatch">{$row0.datetime|strtotime}</td>
		</tr>
		<tr class="medLogHeaderRow">
			<td>description</td>
			<td colspan="2">Last Taken</td>
			<td>Quantity</td>
			<td>Taking</td>
			<td colspan="2">History</td>
		<tr>
		{foreach from=$rows key=key item=row}
			<tr class="medLogRow">
				<td>
					<a title="{$row.historyText}" style="color:black;">{$row.description}</a>
				</td>
				<td>{$row.weekday}</td>
				<td>{$row.datetime|substr:0:16}</td>
				<td>{$row.quantity}</td>
				<td>
					<a href="/medLog/insert?description={$row.description|urlencode}&quantity={$row.quantity|urlencode}"><img
						src="/images/go.png"
						title="Taking Now"
					/></a>
				</td>
				<td>
					<a href="/medLog/history?description={$row.description|urlencode}"><img
						src="/images/list.png"
						title="History"
					/></a>
				</td>
				<td align="right">
					({$row.cnt})
				</td>
			</tr>
		{/foreach}
	</table>
</div>
<br />
