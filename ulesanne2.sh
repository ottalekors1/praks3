#!/bin/bash
# Eesmärk: Arvutada küpsisetordi jaoks vajaminevate küpsisepakkide arv

# Küsime kasutajalt sisendandmed
read -p "Sisesta aluskandiku pikkus (cm): " pikkus
read -p "Sisesta aluskandiku laius (cm): " laius
read -p "Sisesta küpsise suurus (cm): " kypsis
read -p "Sisesta tordi kihtide arv: " kihid
read -p "Sisesta küpsiste arv ühes pakis: " pakis

# Arvutame, mitu küpsist mahub pikkusesse ja laiusesse
mahub_pikkusesse=$(expr $pikkus / $kypsis)
mahub_laiusesse=$(expr $laius / $kypsis)

# Küpsiste koguarv tordil (korrutamisel tuleb kasutada \*)
yhele_kihile=$(expr $mahub_pikkusesse \* $mahub_laiusesse)
kokku_kypsiseid=$(expr $yhele_kihile \* $kihid)

# Vajalike pakkide arv (valem lisab 'pakis - 1', et tulemus ümardataks alati ülespoole)
vajalikud_pakid=$(expr \( $kokku_kypsiseid + $pakis - 1 \) / $pakis)

# Väljastame tulemuse
echo "Poest tuleb osta $vajalikud_pakid pakki küpsiseid."
