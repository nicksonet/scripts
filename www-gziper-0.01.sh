#!/bin/bash -
#===============================================================================
#
#          FILE: cleaner.sh
# 
#         USAGE: ./cleaner.sh 
# 
#   DESCRIPTION: Clear old backup. WARNING! All that is coming to a regular expression - is removed!
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Volodin Constantine                              
#  ORGANIZATION: Medbooking
#       CREATED: 05.08.2016 02:12
#      REVISION:  ---
#===============================================================================

#---------------------------------------------------------------------------------------
#  variables
#---------------------------------------------------------------------------------------
backup_dir=/backups

current_date=$(date  +%Y%m%d )
current_day_week=$( date +%u )
current_day_month=$( date +%d )

current_date_plus=$(date  +%Y%m%d --date='+1 days')
current_day_week_plus=$( date +%u --date='+1 days')
current_day_month_plus=$( date +%d --date='+1 days')


#---------------------------------------------------------------------------------------
#  action
#---------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------
#  action
#---------------------------------------------------------------------------------------
# end_backup_dir
if [ $current_day_month_plus == '01' ]
then
  cur_backup_dir=${current_date}-month
  new_backup_dir=${current_date_plus}-month
  # one day of week
elif [ $current_day_week_plus == '1' ]
then
  cur_backup_dir=${current_date}-week
  new_backup_dir=${current_date_plus}-week
else
  cur_backup_dir=${current_date}
  new_backup_dir=${current_date_plus}
fi

find /backups/*/www/${cur_backup_dir}/ -maxdepth 1 -type d -name www -prune -exec cp -Rp {}/../ {}/../../$new_backup_dir \; -exec tar czpf {}/../www.tar.gz -C {} . \; -exec rm -rf {} \; >word 2>&1

#---------------------------------------------------------------------------------------
#  end action section
#---------------------------------------------------------------------------------------

#=======================================================================================
# ChangeLOG                                                                            |
#=======================================================================================
# Version | Date           | Change                           | Author                 |
#---------------------------------------------------------------------------------------
#  0.01   | 05.08.2016     | Create Scripts                   | Volodin Constantine    |
#---------------------------------------------------------------------------------------

