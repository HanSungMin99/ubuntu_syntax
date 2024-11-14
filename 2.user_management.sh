#사용자 추가
useradd sungmin2

#비밀번호 지정
passwd sungmin2


#사용자 변경 : 변경하고자 하는 계정의 비밀번호(sudo는 현재 사용자의 비밀번호)
su - sungmin2
su - root

#chmod는 권한부여 : r(4)w(2)x(1)
chmod 644 파일명
chmod g+x 파일명
chmod o+r 파일명
chmod u-w 파일명
chmod g=r 파일명

#chown는 소유자, 그룹 변경
chown seongmin2:seongmin2 파일명
