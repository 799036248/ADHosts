#!/bin/bash
cd /opt/adguardhome/dns_hosts          #脚本的路径
# 下载广告规则源
wget -O i1.txt https://anti-ad.net/easylist.txt
wget -O i2.txt https://gitee.com/halflife/list/raw/master/ad.txt
wget -O i3.txt https://www.kbsml.com/wp-content/uploads/adblock/adguard/adg-kall-dns.txt
wget -O i4.txt https://www.kbsml.com/wp-content/uploads/adblock/adguard/ADgk.txt
wget -O i5.txt https://cats-team.coding.net/p/adguard/d/AdRules/git/raw/main/dns.txt
wget -O i6.txt https://neodev.team/adblocker
wget -O i7.txt https://hblock.molinero.dev/hosts_adblock.txt
wget -O i8.txt https://abp.oisd.nl/
# 合并与删除重复项
cat i*.txt > mergd.txt
cat mergd.txt | grep '^|' > block.txt
cat mergd.txt | grep '^@' > allow.txt
cat mergd.txt | grep '^/' > test1.txt
cat test1.txt block.txt allow.txt > tmpp.txt
sort -n tmpp.txt | uniq > tmp.txt
 
# 计数规则
num=`cat tmp.txt | wc -l`
# 添加标题与日期
echo "! Version: `date +"%Y-%m-%d %H:%M:%S" `" >> tpdate.txt
echo "! Total count: $num" >> tpdate.txt
cat file_header.name tpdate.txt tmp.txt > final.txt
 
mv final.txt ../../dns.txt
rm *.txt
cd ../../
exit
