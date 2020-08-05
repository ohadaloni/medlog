<br />
<div class="container">
	<form method="get" action="/medLog/insert">
		<table>
			<tr class="medLogHeaderRow">
				<td colspan="2">
					Add a medLog row
					<a href="/medlog" title="medlog"><img
						src="/images/drillup.png"
					/></a>
				</td>
			</tr>
			<tr class="medLogRow">
				<td>
					newDescription
				</td>
				<td>
					<input type="text" name="newDescription" />
				</td>
			</tr>
			<tr class="medLogRow">
				<td>
					Dosage
				</td>
				<td>
					{msuShowTpl file="selectString.tpl"  name="dosage" from=$dosages selected=1}
				</td>
			</tr>
			<tr class="medLogRow">
				<td>
					comments
				</td>
				<td>
					<textarea cols="80" rows="4" name="comments"></textarea>
				</td>
			</tr>
			{if $meds}
				<tr class="medLogRow">
					<td>
						Description
					</td>
					<td>
						{msuShowTpl file="selectString.tpl"  name="description" from=$meds selected=$description}
					</td>
				</tr>
			{/if}
			<tr class="medLogRow">
				<td colspan="2">
					<button class="btn btn-large btn-primary" type="submit">Add</button>
				</td>
			</tr>
		</table>
	</form>
</div>
