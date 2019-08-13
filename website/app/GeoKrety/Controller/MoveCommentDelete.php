<?php

namespace GeoKrety\Controller;

use GeoKrety\Service\Smarty;
use GeoKrety\Model\MoveComment;

class MoveCommentDelete extends Base {
    public function beforeRoute($f3) {
        parent::beforeRoute($f3);

        $comment = new MoveComment();
        $comment->load(array('id = ?', $f3->get('PARAMS.movecommentid')));
        if ($comment->dry()) {
            Smarty::render('dialog/alert_404.tpl');
            die();
        }
        if (!$comment->isAuthor()) {
            Smarty::render('dialog/alert_403.tpl');
            die();
        }
        $this->comment = $comment;
    }

    public function get(\Base $f3) {
        Smarty::assign('comment', $this->comment);
        Smarty::render('dialog/move_comment_delete.tpl');
    }

    public function post(\Base $f3) {
        $comment = $this->comment;
        $gkid = $comment->geokret->id;

        if ($comment->valid()) {
            $comment->erase();
            \Flash::instance()->addMessage(_('Comment removed.'), 'success');
        } else {
            \Flash::instance()->addMessage(_('Failed to delete comment.'), 'danger');
        }
        // TODO redirect to the right page/move/anchor…
        $f3->reroute("@geokret_details(@gkid=$gkid)");
    }
}
