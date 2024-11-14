#쉘 스크립트 작성 : 반드시 확장자 .sh로 끝나야 함
touch myscript.sh
#스크립트문 nano편집기에서 작성
nano myscript.sh
#스크립트 실행 : ./ 를 붙여줘야함에 유의
./myscript.sh

#if문
if [ 1 -gt(1이 2보다크면/greater than의 약어) 2 (양사이드 무조건 띄어쓰기 되어있어야 함)]; then
     echo "hello world1"    
else
     echo "hello world2"
fi(->마지막에 반드시 있어야 한다)

#if문과 변수, 파일(-f), 디렉토리(-d) 존재여부 확인
file_name="text.txt"
if [ -f "$file_name" ] ;  then -> "text.txt"파일이 있다면, 변수사용 시 $ 표기해야 함
   [ -f "text.txt" ] ; then -> 
 echo "$file_name file exists"
else
 echo "$file_name file does no exist"
fi

#for문
for a in {1..100}
do
    echo "hello world$a"
done


#for문과 count값
count=0
for a in {1..100}
do
    ((count++))
done
echo "count value is $count"

#for문과 파일/디렉토리 목록조회
for a in *
do
    echo "$a"
done

*예제 풀이
file_count=0
dir_count=0
other_count=0
for a in *
do
 if [ -f "$a" ];then
   ((file_count++))
 elif [ -d "$a" ]; then
   ((dir_count++))
 else 
   ((other_count++))
 fi
done
echo "file count is $file_count"
echo "dir count is $dir_count"
echo "other count is $other_count"