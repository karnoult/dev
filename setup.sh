#install homebrew https://brew.sh/
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#enable sublime text shortcut
ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl

brew install postgres
pg_ctl -D /usr/local/var/postgres start && brew services start postgresql
