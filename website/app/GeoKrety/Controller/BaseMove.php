<?php

namespace GeoKrety\Controller;

use GeoKrety\Service\Smarty;
use GeoKrety\Model\Move;

class BaseMove extends Base {
    public function beforeRoute($f3) {
        parent::beforeRoute($f3);

        $move = new Move();
        $this->move = $move;
        Smarty::assign('move', $this->move);

        if (!$f3->exists('PARAMS.moveid')) {
            return;
        }

        $this->move->load(array('id = ?', $f3->get('PARAMS.moveid')));
        if ($this->move->dry()) {
            Smarty::render('dialog/alert_404.tpl');
            die();
        }

        if (!$this->move->isAuthor()) {
            Smarty::render('dialog/alert_403.tpl');
            die();
        }
    }
}
