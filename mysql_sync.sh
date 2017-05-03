#!/bin/bash
set -x
mysqldump -h bd1.medbooking.com -uroot -pAkFedavtim2 --all-databases --add-drop-database |mysql -f -h 127.0.0.1 -P 3307 -uroot -pAkFedavtim2
mysqldump -h bd2.medbooking.com -uroot -pCygaigubyes4 --all-databases --add-drop-database |mysql -f -h 127.0.0.1 -P 3308 -uroot -pCygaigubyes4
