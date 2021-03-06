 genPatch(){
  ~/Projects/moz-git-tools/git-patch-to-hg-patch $1
  echo $1
  mv $1 ~/Projects/hg_patch/
}

git2hg()
{
  git patch-to-hg-patch $1
}

hgQueuePurge()
{
  hg qq --purge $1
}

dumpPatchwithHGFormat()
{
  gitpatch=$(git format-patch $1 -kp -U8)
  git2hg $gitpatch
}
hgupdate()
{
  hg qpop -a
  hg qq patches
  hg pull -u
}

  hg pull -u
}

sc()
{
  grep -i -r  --include='*' $1 .
}

scxin()
{
  grep -i -r  --include=$2 $1 .
}

scxinpath()
{
  grep -i -r  --include='*' "$1" $2
}

ff()
{
  find . -name $1
}

ffilefrom()
{
  find $2 -name $1
}

alias updatemaster='git checkout master && git fetch mozilla master && git merge mozilla/master'
alias hgpatch=dumpPatchwithHGFormat
alias patch_g2h=genPatch
alias b2go='export MOZCONFIG=`pwd`/.mozconfig-b2g-opt'
alias b2gd='export MOZCONFIG=`pwd`/.mozconfig-b2g-dbg'
alias ffd='export MOZCONFIG=`pwd`/.mozconfig-ff-dbg'
alias ffo='export MOZCONFIG=`pwd`/.mozconfig-ff-dbg'
#alias git=hub
alias g2h=git2hg
alias pushtry='hg push -f -rtip try'
alias tryb2g='hg qnew try -m  "try: -b do -p emulator,emulator-jb,emulator-kk,emulator-l,linux32_gecko,linux64_gecko,macosx64_gecko,win32_gecko -u all -t none"'
alias tryall='hg qnew try -m "try: -b do -p all -u all -t none"'
alias popall='hg qpop -a'
alias hgpurge=hgQueuePurge
alias ptt='luit -encoding big5 telnet ptt.cc'
alias cleanbuild='rm -rf out && rm -rf objdir-gecko && ./build.sh 2>error.log'
