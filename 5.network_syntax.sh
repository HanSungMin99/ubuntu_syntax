프로세스 : 실행중인 프로그램
백그라운드 프로세스: 우리 눈에는 실행되고 있는지 보이지 않지만, 뒷단(백그라운드)에서 실행되며 작동하도록 도와주는 것들
프로세스 목록 조회: 실행중인 프로그램 목록 조회 ->필요 이유: 제공되고 있는 프로그램이 뭔가 비정상 -> 문제확인 -> 가장 먼저(프로세스)프로그램 확인

#프로세스 목록 조회
ps -ef (-> e: 모든 프로세스, f: full format)
ps -ef | grep "nginx" -> 진행되고 있는 많은 프로세스 목록 중에 nginx 들어가는 프로세스 찾는 방법
                      ->ps -ef 만 하면 너무 많기 때문에 grep을 함께 많이 씀
cf) 프로그램 하나에 여러가지 프로세스가 작동하기도 한다. 
    -master: 헤드(브레인)역할, 주요한 명령어를 내리는 프로세스 내에 하나의 프로그램
    -worker(slave): 실질적인 작업을 실행
                      


# 패키지
# yum은 레드헷계열 패키지 관리 도구
# apt-get(apt)은 데비안 계열의 패키지 관리 도구 -> 프로그램을 설치, 삭제할 때 사용하는 명령어(실행, 정지와 상관없음)
# 예시)
sudo apt-get update () ->패키지 목록을 최신화 해주는 것, 먼저 진행 후 프로그램 설치 진행
sudo apt update() -> 조금 더 최신(거의 유사함), 안되면 apt-get 사용
#nginx설치
sudo apt-get install nginx 
#systemctl : 프로그램 실행관리도구
sudo systemctl stop nginx -> 실행중인 nginx를 멈추는 것 
sudo systemctl start nginx -> nginx를 실행하는 것 
cf) localhost:80 -> nginx 프로그램 실행 되고있는지 확인 시 입력
#java 설치
sudo apt-get install openjdk-11-jdk (일반적으로 sudo 붙임, 설치과정에서 root 권한이 필요한 경우 있기 때문애)


#프로세스 강제 종료
kill -9 프로세스ID -> 리눅스 내부에서 부여한 프로세스 번호(ps -ef | grep nginx를 했을 때 앞쪽에 뜨는 번호 확인하면 됨)

----------------------------------------------------------------------------------------------------------------
cf) ip: 고유의 인터넷 주소, 포트(port): 한 ip의 프로그램을 구분하는 구분단위,프로그램이 부여받는 고유한 번호(프로그램 구분, 포트는 0~65535까지 번호 있음. 443:https, 80:http, 22:ssh(원격접속))
#네트워크 관련 명령어
#네트워크 설정 정보 조회
 -윈도우: ipconfig (단, 공인ip주소는 안나옴, 사설ip주소 나옴)
 -리눅스: ifconfig ->조회후 inet에 나오는 주소 확인하면 된다(broadcast 아님)
 #특정 도메인의 IP주소 정보 조회
 nslookup 도메인주소 ->도메인서버(네임서버)에 물어보는 것(도메인서버, 네임서버에 대한 개념 알고 있어야 함)
 nslookup www.naver.com
#네트워크 연결상태 조회(ip만 사용)
 ping <IP주소>  -> 일반적으로 ping은 보안상 막아두고 있음에 유의 
 ping 8.8.8.8
 ping 네이버IP
#네트워크 연결상태 조회(port까지 사용하여 조회)
 nc(넷캣) -zv <ip 또는 도메인> <포트> -> 그 아이피의 그 포트를 가지고 있는 것과 통신이 가능한지 확인
 nc -zv naver.com 443 -> succeed 결과 나옴

cf)DNS: 도메인 네임 서버
cf)http://naver.com ->자동으로 https://naver.com로 변경됨
   https://naver.com

   http:// -> (주의요함)이 뜬다. 안전하지 않음, 80포트가 할당되어 있음(반드시 기억)
   https:// -> 정상, 443포트가 할당되어 있음(반드시 기억)
   -->1개의 프로그램에 사용자가 들어오는 루트가 다른 것(루트가 다르니 다른 포트가 할당됨)

#원격접속: 22번 포트
ssh <username>@<host(내가 접속하려는 컴퓨터) IP주소> -> 원격조정 시 사용

#원격으로 파일 전소
scp <전송하고자하는 파일> <원격지 주소>

#현재 서버에 연결된 네트워크 정보 출력
netstat -> 문제 생길 시 connected, unconnected만 확인


