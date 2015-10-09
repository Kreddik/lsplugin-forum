{foreach from=$aTopics item=oTopic}
	{assign var='oUser' value=$oTopic->getUser()}
	{assign var='oPost' value=$oTopic->getPost()}
	{assign var='oPoster' value=$oPost->getUser()}
	<li id="topic-{$oTopic->getId()}"{if !$oTopic->getRead()} class="unread"{/if}>
		<a class="topic-icon{if $oTopic->getPinned()} pinned{/if}{if $oTopic->getState()} close{/if}" href="{$oTopic->getUrlFull()}"  title="{if $oTopic->getRead()}{$aLang.plugin.forum.topic_read}{else}{$aLang.plugin.forum.topic_unread}{/if}"></a>
		<h3>
			{if $oTopic->getPinned()==1}
				<span class="badge">{$aLang.plugin.forum.topic_pinned|upper}</span>
			{/if}
			<a href="{$oTopic->getUrlFull()}">{$oTopic->getTitle()|escape:'html'}</a>
			{include file="$sTemplatePathForum/paging_post.tpl" aPaging=$oTopic->getPaging()}
		</h3>
		<p>
			{$oTopic->getCountPost()|number_format:0:'.':$oConfig->Get('plugin.forum.number_format')}</strong> {$oTopic->getCountPost()|declension:$aLang.plugin.forum.posts_declension:'russian'|lower}
			{$oTopic->getViews()|number_format:0:'.':$oConfig->Get('plugin.forum.number_format')}</strong> {$oTopic->getViews()|declension:$aLang.plugin.forum.views_declension:'russian'|lower}
		</p>
		{if $oPost}
		<p>
			{$aLang.plugin.forum.post_last}:
			{if $oPoster}
				<a href="{$oPoster->getUserWebPath()}">{$oPoster->getLogin()|escape:'html'}</a>,
			{else}
				<a href="{$oTopic->getUrlFull()}lastpost">{$aLang.plugin.forum.guest_prefix}{$oPost->getGuestName()|escape:'html'}</a>,
			{/if}
			<a class="date" title="{$aLang.plugin.forum.post_last_view}" href="{$oTopic->getUrlFull()}lastpost">
				<time datetime="{date_format date=$oPost->getDateAdd() format='c'}" title="{date_format date=$oPost->getDateAdd() format='j F Y, H:i'}">
					{date_format date=$oPost->getDateAdd() format="j F Y, H:i"}
				</time>
			</a>
		</p>
		{/if}
	</li>
{/foreach}