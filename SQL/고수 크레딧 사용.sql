-- 견적서 보낼 때마다 고수가 사용하는 코인
update toti.toti_mentor set tor_coin = (tor_coin - 1) where mento_idx =3 and tor_coin>=1;
