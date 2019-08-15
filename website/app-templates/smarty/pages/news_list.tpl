{include file='macros/pagination.tpl'}
{extends file='base.tpl'}

{block name=content}
<a class="anchor" id="news"></a>

{call pagination pg=$pg anchor='news'}

{foreach from=$news.subset item=item}
{include file='elements/news.tpl'}
{/foreach}

{call pagination pg=$pg anchor='news'}
{/block}

{block name=javascript}
{if $f3->get('SESSION.IS_LOGGED_IN')}
    // Bind modal
    {include 'js/dialog_news_subscription.js.tpl'}
{/if}
{/block}