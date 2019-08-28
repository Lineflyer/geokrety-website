<?php

namespace GeoKrety\Controller;

use GeoKrety\Service\Smarty;

class GeokretEdit extends BaseGeokret {
    public function get($f3) {
        Smarty::render('pages/geokret_create.tpl');
    }

    public function post($f3) {
        $geokret = $this->geokret;
        $geokret->copyFrom('POST');

        if ($geokret->validate()) {
            $geokret->save();

            if ($f3->get('ERROR')) {
                \Flash::instance()->addMessage(_('Failed to create the GeoKret.'), 'danger');
            } else {
                \Flash::instance()->addMessage(_('Your GeoKret has been updated.'), 'success');
                \Event::instance()->emit('geokret.updated', $geokret);
                $f3->reroute('@geokret_details(@gkid='.$geokret->gkid.')');
            }
        }

        $this->get($f3);
    }
}
