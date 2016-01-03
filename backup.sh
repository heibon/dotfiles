echo "The Start Create Backup Files"
echo ""

# karabiner
echo "karabiner backup..."
/Applications/Karabiner.app/Contents/Library/bin/karabiner export > ./files/karabiner.sh

echo "pip backup..."
pip freeze > ./files/pip_packages.txt

echo ""
echo "The End Create Backup Files"
echo "Done"
