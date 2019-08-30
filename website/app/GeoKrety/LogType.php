<?php

namespace GeoKrety;

class LogType {
    const LOG_TYPE_DROPPED = 0;
    const LOG_TYPE_GRABBED = 1;
    const LOG_TYPE_COMMENT = 2;
    const LOG_TYPE_SEEN = 3;
    const LOG_TYPE_ARCHIVED = 4;
    const LOG_TYPE_DIPPED = 5;

    const LOG_TYPES = array(
        self::LOG_TYPE_DROPPED,
        self::LOG_TYPE_GRABBED,
        self::LOG_TYPE_COMMENT,
        self::LOG_TYPE_SEEN,
        self::LOG_TYPE_ARCHIVED,
        self::LOG_TYPE_DIPPED,
    );

    const LOG_TYPES_ALIVE = array(
        self::LOG_TYPE_DROPPED,
        self::LOG_TYPE_GRABBED,
        self::LOG_TYPE_SEEN,
        self::LOG_TYPE_DIPPED,
    );

    const LOG_TYPES_REQUIRING_COORDINATES = array(
        self::LOG_TYPE_DROPPED,
        self::LOG_TYPE_SEEN,
        self::LOG_TYPE_DIPPED,
    );

    const LOG_TYPES_COUNT_KILOMETERS = array(
        self::LOG_TYPE_DROPPED,
        self::LOG_TYPE_SEEN,
        self::LOG_TYPE_DIPPED,
    );

    const LOG_TYPES_THEORICALLY_IN_CACHE = array(
        self::LOG_TYPE_DROPPED,
        self::LOG_TYPE_SEEN,
    );

    const LOG_TYPES_LAST_POSITION = array(
        self::LOG_TYPE_DROPPED,
        self::LOG_TYPE_GRABBED,
        self::LOG_TYPE_SEEN,
        self::LOG_TYPE_DIPPED,
    );

    const LOG_TYPES_USER_TOUCHED = array(
        self::LOG_TYPE_DROPPED,
        self::LOG_TYPE_GRABBED,
        self::LOG_TYPE_SEEN,
        self::LOG_TYPE_DIPPED,
    );

    private $logtype;

    public function __construct($logtype = null) {
        if (!is_null($logtype)) {
            $this->logtype = (int) $logtype;
        }
    }

    public function getLogTypeId() {
        return $this->logtype;
    }

    public function isType($logtype) {
        if (is_null($this->logtype)) {
            return false;
        }

        return $logtype == $this->logtype;
    }

    public static function isValid($logtype) {
        return in_array($logtype, self::LOG_TYPES, true);
    }

    public function isAlive() {
        return in_array($this->logtype, self::LOG_TYPES_ALIVE, true);
    }

    public function isCoordinatesRequired() {
        return in_array($this->logtype, self::LOG_TYPES_REQUIRING_COORDINATES, true);
    }

    public function isCountingKilometers() {
        return in_array($this->logtype, self::LOG_TYPES_COUNT_KILOMETERS, true);
    }

    public function isTheoricallyInCache() {
        return !is_null($this->logtype) && in_array($this->logtype, self::LOG_TYPES_THEORICALLY_IN_CACHE);
    }

    public function getLogTypeString() {
        switch ($this->logtype) {
            case 0: return _('drop');
            case 1: return _('grab');
            case 2: return _('comment');
            case 3: return _('met');
            case 4: return _('archive');
            case 5: return _('dip');
            case 9: return _('Born');
        }

        return null;
    }
}
