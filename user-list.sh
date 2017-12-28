#!/bin/bash
# 082210988552
echo ""
echo "-----------------MENGECEK SEMUA AKUN BY KERDUNET.TOP-----------------"
echo ""
echo "-------------------------------"
echo "USERNAME        TANGGAL EXPIRED"
echo "-------------------------------"
while read kerdunet
do
        AKUN="$(echo $kerdunet | cut -d: -f1)"
        ID="$(echo $kerdunet | grep -v nobody | cut -d: -f3)"
        exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
        if [[ $ID -ge 500 ]]; then
        printf "%-17s %2s\n" "$AKUN" "$exp"
		fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 500 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo "-------------------------------"
echo "Jumlah akun: $JUMLAH user"
echo "-------------------------------"
