#!/bin/bash
source "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )/sources.sh"

# SQL-PLUS settings
STMTS=""
STMTS="${STMTS}\n SET SERVEROUTPUT ON;"

# --------------------------------------
# STYLING
# --------------------------------------
STMTS="${STMTS}\n start ./sql/sqlplus-settings.sql"

# --------------------------------------
# EXEXUTE SOLUTIONS
# --------------------------------------
if [ -z ${FOLDER+x} ]; then
  for FILE in `ls ./sql/uebung_*/* | egrep '^.*[0-9]{2}[a-z]?.[pl]?sql$'`; do
    STMTS="${STMTS}\n start ${FILE}"
  done
else
  for FILE in `ls ./sql/${FOLDER}/* | egrep '^.*[0-9]{2}[a-z]?.[pl]?sql$'`; do
    STMTS="${STMTS}\n start ${FILE}"
  done
fi


STMTS="${STMTS}\n EXIT;"


################## !DO NOT CHANGE ANYTHING BELOW THIS LINE! ##################
sleep 1

echo -e "+----------------------------------------------------------+"
echo -e "| EXECUTE SOLUTIONS                                        |"
echo -e "+----------------------------------------------------------+"

echo -e ${STMTS}


# Execute SQL-STMTS
${SQLPLUS} -S ${DB_USER}/${DB_PASS}@${DB_HOST} << HERE
  $(echo -e ${STMTS})
HERE