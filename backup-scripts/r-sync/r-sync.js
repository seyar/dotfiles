var path = require('path');
var shelljs = require('shelljs');
var fs = require('fs');

// источник
SOURCEDIR = "/Users/seyar/media/";
//Бекапный винт
//DESTINATIONDIR = "/Users/seyar/Downloads/FAT/";
DESTINATIONDIR = "/Volumes/FAT/";
// в какой папке мы запустили скрипт, такую же создадим на бекапном и положим файлы
var DESTINATIONFOLDER = DESTINATIONDIR + path.basename(SOURCEDIR);

fs.exists(DESTINATIONDIR, function (exist) {
    if (!exist) {
        return log('Винт не подключен.');
    }

    if (shelljs.ls(SOURCEDIR).length === 0) {
        return log('Синхронизировать нечего. Папка ' + SOURCEDIR + ' пуста.');
    }

    if (shelljs.ls(DESTINATIONFOLDER).length === 0) {
        try {
            shelljs.mkdir('-p', DESTINATIONFOLDER);
            log('Создана папка ' + DESTINATIONFOLDER);
        } catch (e) {
            log('========== Ошибка ==========');
            log(e);
            return log('========== Ошибка ==========');
        }
    }

    try {
        shelljs.cp('-fR', SOURCEDIR + "*", DESTINATIONFOLDER + '/');
        log('Скопировано ' + SOURCEDIR + "*" + ' -> ' + DESTINATIONFOLDER);
    } catch (e) {
        log('========== Ошибка ==========');
        log(e);
        return log('========== Ошибка ==========');
    }

    try {
        shelljs.rm('-r', SOURCEDIR + "*");
        log('Удалено ' + SOURCEDIR + "*");
    } catch (e) {
        log('========== Ошибка ==========');
        log(e);
        return log('========== Ошибка ==========');
    }
    log('Синхронизировано.');
    log('');
    log('');
});

/**
 * Пишет сообщение в консоль
 *
 * @param {String} message
 * @returns {Boolean}
 */
function log(message) {
    console.log(getDate() + ' ' + message);
    return true;
}

/**
 * Формирует дату
 *
 * @returns {String}
 */
function getDate() {
    var date = new Date();
    return "DD.MM.YY HH:II"
        .replace('DD', String(date.getDate()).replace(/^(\d)$/, '0$1'))
        .replace('MM', String(date.getMonth() + 1).replace(/^(\d)$/, '0$1'))
        .replace('YY', date.getFullYear())
        .replace('HH', String(date.getHours()).replace(/^(\d)$/, '0$1'))
        .replace('II', String(date.getMinutes()).replace(/^(\d)$/, '0$1'));
}
