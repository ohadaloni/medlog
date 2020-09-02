<br />
<div class="container">
	<table>
		<tr class="medLogHeaderRow">
			<td colspan="8">{$description} - history</td>
		</tr>
		<tr class="medLogHeaderRow">
			<td>#</td>
			<td>quantity</td>
			<td colspan="2">datetime</td>
			<td>comments</td>
			<td colspan="3"></td>
		<tr>
		{assign var=numRows value=$rows|@count}
		{foreach from=$rows key=key item=row}
			{assign var=No value=`$numRows-$key`}
			<tr class="medLogRow">
				<td>{$No}</td>
				<td>{$row.quantity}</td>
				<td>{$row.weekday}</td>
				<td>{$row.datetime|substr:0:16}</td>
				<td>{$row.comments|nl2br}</td>
				<td>
					<a href="/medLog/insert?description={$row.description}&quantity={$row.quantity}"><img
						src="/images/go.png"
						title="Taking {$row.quantity} Now"
					/></a>
				</td>
				<td>
					<a href="/medLog/insert?date={$row.date}&datetime={$row.date}+12:00&description={$row.description}&quantity={$row.quantity}"><img
						src="/images/duplicate.png"
						title="Duplicate (12pm same day & edit it)"
					/></a>
				</td>
				<td>
					<a href="/medLog/edit?description={$description}&id={$row.id}"><img
						src="/images/edit.png"
						title="Edit"
					/></a>
				</td>
				<td>
					<form action="/medLog/remove">
						<input type ="checkbox" name="ok" />
						<input type ="hidden" name="id" value="{$row.id}" />
						<input type ="hidden" name="description" value="{$description}" />
						<input type="image" src="/images/delete.png" title="check the box to confirm deletion" />
					</form>
				</td>
			</tr>
		{/foreach}
	</table>
</div>
<br />
