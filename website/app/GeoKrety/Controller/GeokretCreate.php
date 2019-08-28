<?php

namespace GeoKrety\Controller;

use GeoKrety\Service\Smarty;
use GeoKrety\Model\Geokret;
use GeoKrety\Model\Move;
use GeoKrety\LogType;

class GeokretCreate extends BaseCurrentUser {
    public function get($f3) {
        Smarty::render('pages/geokret_create.tpl');
    }

    public function post($f3) {
        $f3->get('DB')->begin();
        $geokret = new Geokret();
        Smarty::assign('geokret', $geokret);
        $geokret->name = $f3->get('POST.name');
        $geokret->type = $f3->get('POST.type');
        $geokret->mission = $f3->get('POST.mission');
        $geokret->owner = $f3->get('SESSION.CURRENT_USER');
        $geokret->holder = $f3->get('SESSION.CURRENT_USER');

        if ($geokret->validate()) {
            $geokret->save();

            if ($this->user->hasHomeCoordinates() && filter_var($f3->get('POST.log_at_home'), FILTER_VALIDATE_BOOLEAN)) {
                $move = new Move();
                $move->geokret = $geokret;
                $move->author = $f3->get('SESSION.CURRENT_USER');
                $move->logtype = LogType::LOG_TYPE_DIPPED;
                $move->moved_on_datetime = $geokret->created_on_datetime->format('Y-m-d H:i:s');
                $move->lat = $this->user->home_latitude;
                $move->lon = $this->user->home_longitude;
                $move->comment = _('Born here');
                // TODO alt
                // TODO country
                $move->app = GK_APP_NAME;
                $move->app_ver = GK_APP_VERSION;
                if ($move->validate()) {
                    $move->save();
                } else {
                    \Flash::instance()->addMessage(_('Failed to create the GeoKret initial move.'), 'danger');
                    $f3->get('DB')->rollback();
                    $geokret->resetFields(array('gkid'));  // https://github.com/ikkez/f3-cortex/issues/90
                    $this->get($f3);
                    die();
                }
            }
            $f3->get('DB')->commit();

            if ($f3->get('ERROR')) {
                \Flash::instance()->addMessage(_('Failed to create the GeoKret.'), 'danger');
            } else {
                \Flash::instance()->addMessage(sprintf(_('Your GeoKret has been created. You may now wish to <a href="%s">print</a> it a great label…'), $f3->alias('geokret_label_generator', '@gkid='.$geokret->gkid)), 'success');
                \Event::instance()->emit('geokret.new', $geokret);
                $f3->reroute('@geokret_details(@gkid='.$geokret->gkid.')');
            }
        }

        $this->get($f3);
    }
}
