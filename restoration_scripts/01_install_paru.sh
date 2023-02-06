# if [ "$EUID" -eq 0 ]
#   then
#     echo "Running as root"
#     root=true
#   else
#     echo "Running as non-root"
#     root=false
# fi

# # if root is true, then install paru
# if [ "$root" = true ]
#   then
#     echo "Installing paru"
#     # Install paru
#     git clone https://aur.archlinux.org/paru.git /tmp/paru
#     cd /tmp/paru
#     makepkg -si
#     cd ..
#     rm -rf paru
#   else
#     # If root is false, run script as root
#     echo "Running script as root"
#     sudo bash $0

# fi