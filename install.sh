#!/bin/bash

# Color
BLUE='\033[0;34m'       
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

# Display welcome message
display_welcome() {
  echo -e ""
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]                                                 [+]${NC}"
  echo -e "${BLUE}[+]                AUTO INSTALLER THEMA             [+]${NC}"
  echo -e "${BLUE}[+]                  © Nerox Skibidi                [+]${NC}"
  echo -e "${BLUE}[+]                                                 [+]${NC}"
  echo -e "${RED}[+] =============================================== [+]${NC}"
  echo -e ""
  echo -e "script ini di buat untuk mempermudah penginstalasian thema pterodactyle,"
  echo -e "dilarang keras untuk memperjual belikan."
  echo -e ""
  echo -e "𝗧𝗘𝗟𝗘𝗚𝗥𝗔𝗠 :"
  echo -e "@starxtools"
  echo -e "𝗖𝗥𝗘𝗗𝗜𝗧𝗦 :"
  echo -e "@kiraxnerox"
  sleep 4
  clear
}

install_jq() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]             UPDATE & INSTALL JQ                 [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  sudo apt-get update && sudo apt-get install -y jq
  if [ $? -eq 0 ]; then
    echo -e "                                                       "
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
    echo -e "${GREEN}[+]              INSTALL JQ BERHASIL                [+]${NC}"
    echo -e "${GREEN}[+] =============================================== [+]${NC}"
  else
    echo -e "                                                       "
    echo -e "${RED}[+] =============================================== [+]${NC}"
    echo -e "${RED}[+]              INSTALL JQ GAGAL                   [+]${NC}"
    echo -e "${RED}[+] =============================================== [+]${NC}"
    exit 1
  fi
  echo -e "                                                       "
  sleep 1
  clear
}

# Check user token
check_token() {
  echo -e "                                                       "
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "${BLUE}[+]               LICENSY FADHOST OFFC             [+]${NC}"
  echo -e "${BLUE}[+] =============================================== [+]${NC}"
  echo -e "                                                       "
  echo -e "${YELLOW}MASUKAN AKSES TOKEN :${NC}"
  read -r USER_TOKEN

  if [ "$USER_TOKEN" = "neroxskibidi" ]; then
    echo -e "${GREEN}AKSES BERHASIL${NC}"
  else
    echo -e "${RED}Beli Tokennya dulu bub..${NC}"
    echo -e "${YELLOW}TELEGRAM : @starxtools${NC}"
    echo -e "${YELLOW}WHATSAPP : 6283879792151${NC}"
    echo -e "${YELLOW}HARGA TOKEN : 10K FREE UPDATE JIKA ADA TOKEN BARU${NC}"
    echo -e "${YELLOW}©neroxkira${NC}"
    exit 1
  fi
  clear
}

# Install theme
install_theme() {
  while true; do
    echo -e "                                                       "
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "${BLUE}[+]                   SELECT THEME                  [+]${NC}"
    echo -e "${BLUE}[+] =============================================== [+]${NC}"
    echo -e "                                                       "
    echo -e "PILIH THEME YANG INGIN DI INSTALL"
    echo "1. stellar"
    echo "2. billing"
    echo "3. enigma"
    echo "x. kembali"
    echo -e "masukan pilihan (1/2/3/x) :"
    read -r SELECT_THEME
    case "$SELECT_THEME" in
      1)
        THEME_URL="https://github.com/gitfdil1248/thema/raw/main/C2.zip"
        break
        ;;
      2)
        THEME_URL="https://github.com/gitfdil1248/thema/raw/main/C1.zip"
        break
        ;;
      3)
        THEME_URL="https://github.com/gitfdil1248/thema/raw/main/C3.zip"
        break
        ;;
      x)
        return
        ;;
      *)
        echo -e "${RED}Pilihan tidak valid, silahkan coba lagi.${NC}"
        ;;
    esac
  done
  
  if [ -e /root/pterodactyl ]; then
    sudo rm -rf /root/pterodactyl
  fi
  wget -q "$THEME_URL" -O /root/theme.zip
  sudo unzip -o /root/theme.zip -d /root/pterodactyl
  
  case "$SELECT_THEME" in
    1)
      echo -e "                                                       "
      echo -e "${BLUE}[+] =============================================== [+]${NC}"
      echo -e "${BLUE}[+]                  INSTALLASI THEMA               [+]${NC}"
      echo -e "${BLUE}[+] =============================================== [+]${NC}"
      echo -e "                                                                   "
      sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
      curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
      sudo apt install -y nodejs
      sudo npm i -g yarn
      cd /var/www/pterodactyl
      yarn add react-feather
      php artisan migrate
      yarn build:production
      php artisan view:clear
      sudo rm /root/theme.zip
      sudo rm -rf /root/pterodactyl

      echo -e "                                                       "
      echo -e "${GREEN}[+] =============================================== [+]${NC}"
      echo -e "${GREEN}[+]                   INSTALL SUCCESS               [+]${NC}"
      echo -e "${GREEN}[+] =============================================== [+]${NC}"
      echo -e ""
      sleep 2
      clear
      exit 0
      ;;
    2)
      echo -e "                                                       "
      echo -e "${BLUE}[+] =============================================== [+]${NC}"
      echo -e "${BLUE}[+]                  INSTALLASI THEMA               [+]${NC}"
      echo -e "${BLUE}[+] =============================================== [+]${NC}"
      echo -e "                                                       "
      sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
      curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
      sudo apt install -y nodejs
      npm i -g yarn
      cd /var/www/pterodactyl
      yarn add react-feather
      php artisan billing:install stable
      php artisan migrate
      yarn build:production
      php artisan view:clear
      sudo rm /root/theme.zip
      sudo rm -rf /root/pterodactyl

      echo -e "                                                       "
      echo -e "${GREEN}[+] =============================================== [+]${NC}"
      echo -e "${GREEN}[+]                  INSTALL SUCCESS                [+]${NC}"
      echo -e "${GREEN}[+] =============================================== [+]${NC}"
      echo -e "                                                       "
      sleep 2
      clear
      return
      ;;
    3)
      echo -e "                                                       "
      echo -e "${BLUE}[+] =============================================== [+]${NC}"
      echo -e "${BLUE}[+]                  INSTALLASI THEMA               [+]${NC}"
      echo -e "${BLUE}[+] =============================================== [+]${NC} "
      echo -e "                                                                   "

      # Ask for user input for Enigma theme
      echo -e "${YELLOW}Masukkan link wa (https://wa.me...) : ${NC}"
      read LINK_WA
      echo -e "${YELLOW}Masukkan link group (https://.....) : ${NC}"
      read LINK_GROUP
      echo -e "${YELLOW}Masukkan link channel (https://...) : ${NC}"
      read LINK_CHNL

      # Replace placeholders in Enigma theme files
      sudo sed -i "s|LINK_WA|$LINK_WA|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
      sudo sed -i "s|LINK_GROUP|$LINK_GROUP|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx
      sudo sed -i "s|LINK_CHNL|$LINK_CHNL|g" /root/pterodactyl/resources/scripts/components/dashboard/DashboardContainer.tsx

      sudo cp -rfT /root/pterodactyl /var/www/pterodactyl
      curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
      sudo apt install -y nodejs
      npm i -g yarn
      cd /var/www/pterodactyl
      yarn add react-feather
      php artisan migrate
      yarn build:production
      php artisan view:clear
      sudo rm /root/theme.zip
      sudo rm -rf /root/pterodactyl

      echo -e "                                                       "
      echo -e "${GREEN}[+] =============================================== [+]${NC}"
      echo -e "${GREEN}[+]                  INSTALL SUCCESS                [+]${NC}"
      echo -e "${GREEN}[+] =============================================== [+]${NC}"
      echo -e "                                                       "
      sleep 2
      clear
      return
      ;;
  esac
}

# Execute functions
display_welcome
install_jq
check_token
install_theme
