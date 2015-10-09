{assign var="noSidebar" value=true}
{include file='header.tpl'}

<h2 class="page-header"><a href="{router page='forum'}admin">{$aLang.plugin.forum.acp}</a> <span>&raquo;</span> {$aLang.plugin.forum.perms}</h2>

{include file="$sTemplatePathForum/menu.forum.admin.tpl"}

<div class="forums">
	<div class="fBox forum-acp">
		<header class="forums-header">
			<h3>{$aLang.plugin.forum.perms}</h3>
		</header>

		<div class="forums-content">
			<div class="fContainer">
				<table class="table table-forum-admin">
					<tr>
						<th class="cell-half cell-subtitle">
							<h3>{$aLang.plugin.forum.perms_mask_name}</h3>
						</th>
						<th class="cell-half cell-subtitle">
							<h3>{$aLang.plugin.forum.perms_used}</h3>
						</th>
					</tr>
					{foreach from=$aPerms item=oPerm}
					<tr>
						<td>
							<strong>{$oPerm->getName()|escape:'html'}</strong>
						</td>
						<td>
							{$aLang.plugin.forum.in_progress}
						</td>
					</tr>
					{/foreach}
				</table>
			</div>
		</div>
	</div>
</div>

{include file='footer.tpl'}