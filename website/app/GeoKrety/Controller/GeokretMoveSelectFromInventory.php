<?php

namespace GeoKrety\Controller;

use GeoKrety\Model\Geokret;
use GeoKrety\Service\Smarty;

class GeokretMoveSelectFromInventory extends Base {
    public function get($f3) {
        // Load owned GeoKrety
        $geokret = new Geokret();
        $filter = array('holder = ?', $f3->get('SESSION.CURRENT_USER'));
        $option = array('order' => 'name ASC');
        $geokrety = $geokret->find($filter, $option);
        Smarty::assign('geokrety', $geokrety);

        Smarty::render('dialog/geokret_move_select_from_inventory.tpl');
    }
}
