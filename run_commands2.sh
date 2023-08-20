# cd lemeng && git pull && cd ../ && bash run_commands2.sh lemeng/jobs/lemeng/0111_2
echo $1

dirlist=$(find $1/np -mindepth 1 -maxdepth 1 -type f)

for dir in $dirlist
do
  (
  echo $dir
  first="/"
  second="_"
  name=${dir//$first/_}
  name=${name//.yaml/""}
  echo $name
  amlt run -y -d exp --no-preemptible $dir $name
  )
done

dirlist=$(find $1/p -mindepth 1 -maxdepth 1 -type f)

echo $dirlist

for dir in $dirlist
do
  (
  echo $dir
  first="/"
  second="_"
  name=${dir//$first/_}
  name=${name//.yaml/""}
  echo $name
  amlt run -y -d exp --preemptible $dir $name
  )
done