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
ut_month_ago_date=$( date --date='12 month ago' +%s)
ut_week_ago_date=$( date --date='7 weeks ago' +%s)
ut_day_ago_date=$( date --date='7 days ago' +%s)


#---------------------------------------------------------------------------------------
#  action
#---------------------------------------------------------------------------------------
# clear
# find all hosts
for h in $( ls -1 $backup_dir )
do
  # dir?
  if [ ! -d $h ]
  then
    continue
  fi
  # find all backup dirs
  for d in $( ls -1 ${backup_dir}/${h} | grep '^[0-9]\{8,8\}$\?\(-\(month\)\?\(week\)\?\)\?$')
  do
    end_backup_dir=${backup_dir}/${h}/${d}
    # test dir 
    if [ -d $end_backup_dir ]
    then
      # month ?
      if echo $d | grep -q 'month'
      then
        # old ?
        if [ $( date -d ${d%%-month} +%s ) -lt $ut_month_ago_date ]
        then
          rm -rf $end_backup_dir
        fi
      # week ?
      elif echo $d | grep -q 'week'
      then
        # old ?
        if [ $( date -d ${d%%-week} +%s ) -lt $ut_week_ago_date ]
        then
          rm -rf $end_backup_dir
        fi
      # days old?
      elif [ $( date -d $d +%s) -lt $ut_day_ago_date ]
      then
        rm -rf $end_backup_dir
      fi
    fi
  done
done

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

