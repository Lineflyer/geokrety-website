<?php

/*
 * Smarty plugin
 * -------------------------------------------------------------
 * File:     function.newslink.php
 * Type:     function
 * Name:     newslink
 * Purpose:  outputs a news link
 * -------------------------------------------------------------
 */
function smarty_function_newslink(array $params, Smarty_Internal_Template $template) {
    if (!in_array('news', array_keys($params)) || !is_a($params['news'], '\Geokrety\Domain\News')) {
        trigger_error("newslink: empty 'news' parameter");

        return;
    }
    $news = $params['news'];
    if (empty($news->id)) {
        trigger_error("newslink: 'news' has no 'id' parameter");

        return;
    }
    $badge = '<span class="badge">'.$news->commentsCount.'</span>';

    return $badge.' <a href="/newscomments.php?newsid='.$news->id.'">'._('Comments').'</a>';
}
