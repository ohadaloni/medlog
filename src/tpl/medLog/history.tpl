<br />
<div class="container">
	<table>
		<tr class="medLogHeaderRow">
			<td colspan="9">{$description} - history</td>
		</tr>
		<tr class="medLogHeaderRow">
			<td>#</td>
			<td>dosage</td>
			<td>mg</td>
			<td>datetime</td>
			<td>comments</td>
			<td colspan="5"></td>
		<tr>
		{assign var=numRows value=$rows|@count}
		{foreach from=$rows key=key item=row}
			{assign var=No value=`$numRows-$key`}
			<tr class="medLogRow">
				<td>{$No}</td>
				<td>{$row.dosage}</td>
				<td>{$row.mg}</td>
				<td>{$row.datetime|substr:0:16}</td>
				<td>{$row.comments|nl2br}</td>
				<td>
					{if $key == 0}
						<a href="/medLog/insert?description={$row.description}&dosage={$row.dosage}"><img
							src="/images/go.png"
							title="Taking Now"
						/></a>
					{else}
						<a href="/medLog/insert?date={$row.date}&datetime={$row.date}+12:00&description={$row.description}&dosage={$row.dosage}"><img
							src="/images/duplicate.png"
							title="Duplicate"
						/></a>
					{/if}
				</td>
				<td>
					<a href="/cal?eventType=medLog&singleMed={$description}&datetime={$row.datetime}"><img
						src="/images/calendar.png"
					/></a>
				</td>
				<td>
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
